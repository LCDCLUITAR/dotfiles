#!/bin/bash

# Dotfiles Installation Script
# This script sets up a new macOS machine with all the necessary tools and configurations

set -e  # Exit on any error

# Check for dry-run mode
DRY_RUN=${DRY_RUN:-false}
if [[ "$1" == "--dry-run" ]] || [[ "$1" == "-n" ]] || [[ "$DRY_RUN" == "true" ]]; then
    DRY_RUN=true
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Helper functions
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_dry_run() {
    echo -e "${PURPLE}[DRY-RUN]${NC} Would execute: $1"
}

# Execute command or show dry-run
execute_or_dry_run() {
    if [[ "$DRY_RUN" == "true" ]]; then
        print_dry_run "$1"
    else
        eval "$1"
    fi
}

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$DRY_RUN" == "true" ]]; then
    print_warning "DRY-RUN MODE: No actual changes will be made"
    echo ""
fi

print_status "Starting dotfiles installation..."
print_status "Dotfiles directory: $DOTFILES_DIR"

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only!"
    exit 1
fi

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    execute_or_dry_run '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        execute_or_dry_run 'echo '\''eval "$(/opt/homebrew/bin/brew shellenv)"'\'' >> ~/.zprofile'
        if [[ "$DRY_RUN" != "true" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi
    
    print_success "Homebrew installed!"
else
    print_success "Homebrew is already installed"
fi

# Update Homebrew
print_status "Updating Homebrew..."
execute_or_dry_run "brew update"# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Installing Oh My Zsh..."
    execute_or_dry_run 'sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'
    print_success "Oh My Zsh installed!"
else
    print_success "Oh My Zsh is already installed"
fi

# Run setup scripts
print_status "Installing Homebrew packages..."
if [[ "$DRY_RUN" == "true" ]]; then
    print_dry_run "source $DOTFILES_DIR/setup/homebrew.sh"
else
    source "$DOTFILES_DIR/setup/homebrew.sh"
fi

print_status "Setting up Oh My Zsh plugins..."
if [[ "$DRY_RUN" == "true" ]]; then
    print_dry_run "source $DOTFILES_DIR/setup/ohmyzsh.sh"
else
    source "$DOTFILES_DIR/setup/ohmyzsh.sh"
fi

print_status "Setting up Node.js environment..."
if [[ "$DRY_RUN" == "true" ]]; then
    print_dry_run "source $DOTFILES_DIR/setup/nodejs.sh"
else
    source "$DOTFILES_DIR/setup/nodejs.sh"
fi

# Create symlinks for dotfiles
print_status "Creating symlinks for dotfiles..."

# Backup existing files
backup_and_link() {
    local source_file="$1"
    local target_file="$2"
    
    if [[ "$DRY_RUN" == "true" ]]; then
        if [ -f "$target_file" ] || [ -L "$target_file" ]; then
            print_dry_run "Would backup $target_file to $target_file.backup"
        fi
        print_dry_run "Would link $source_file -> $target_file"
        return
    fi
    
    if [ -f "$target_file" ] || [ -L "$target_file" ]; then
        print_warning "Backing up existing $target_file to $target_file.backup"
        mv "$target_file" "$target_file.backup"
    fi
    
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$target_file")"
    
    print_status "Linking $source_file -> $target_file"
    ln -sf "$source_file" "$target_file"
}

# Link shell files
backup_and_link "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES_DIR/shell/.zprofile" ] && backup_and_link "$DOTFILES_DIR/shell/.zprofile" "$HOME/.zprofile"
[ -f "$DOTFILES_DIR/shell/.bashrc" ] && backup_and_link "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"
[ -f "$DOTFILES_DIR/shell/.bash_profile" ] && backup_and_link "$DOTFILES_DIR/shell/.bash_profile" "$HOME/.bash_profile"

# Link git config
backup_and_link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# Link application configs
backup_and_link "$DOTFILES_DIR/config/thefuck/settings.py" "$HOME/.config/thefuck/settings.py"
backup_and_link "$DOTFILES_DIR/config/fish/config.fish" "$HOME/.config/fish/config.fish"

# Link other config files
[ -f "$DOTFILES_DIR/.yarnrc" ] && backup_and_link "$DOTFILES_DIR/.yarnrc" "$HOME/.yarnrc"

print_status "Setting up VS Code..."
if [[ "$DRY_RUN" == "true" ]]; then
    print_dry_run "source $DOTFILES_DIR/setup/vscode.sh"
else
    source "$DOTFILES_DIR/setup/vscode.sh"
fi

# Set Zsh as default shell if not already
if [ "$SHELL" != "$(which zsh)" ]; then
    print_status "Setting Zsh as default shell..."
    execute_or_dry_run "chsh -s $(which zsh)"
    print_success "Default shell changed to Zsh"
fi

print_success "Dotfiles installation completed!"
if [[ "$DRY_RUN" == "true" ]]; then
    print_warning "This was a dry-run. No actual changes were made."
    print_status "Run without --dry-run flag to perform actual installation"
else
    print_status "Please restart your terminal or run 'source ~/.zshrc' to apply changes"
    print_status "You may need to restart your terminal for all changes to take effect"
fi