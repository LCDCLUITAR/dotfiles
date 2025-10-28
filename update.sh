#!/bin/bash

# Update script for dotfiles
# This script updates the dotfiles from the current system configuration

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

print_status "Updating dotfiles from current system configuration..."

# Update shell configurations
print_status "Updating shell configurations..."
cp ~/.zshrc "$DOTFILES_DIR/shell/.zshrc" 2>/dev/null || echo "Could not copy .zshrc"
cp ~/.zprofile "$DOTFILES_DIR/shell/.zprofile" 2>/dev/null || echo "Could not copy .zprofile"
cp ~/.bashrc "$DOTFILES_DIR/shell/.bashrc" 2>/dev/null || echo "Could not copy .bashrc"
cp ~/.bash_profile "$DOTFILES_DIR/shell/.bash_profile" 2>/dev/null || echo "Could not copy .bash_profile"

# Update git configuration
print_status "Updating git configuration..."
cp ~/.gitconfig "$DOTFILES_DIR/git/.gitconfig" 2>/dev/null || echo "Could not copy .gitconfig"

# Update application configs
print_status "Updating application configurations..."
cp ~/.config/thefuck/settings.py "$DOTFILES_DIR/config/thefuck/settings.py" 2>/dev/null || echo "Could not copy thefuck settings"
cp ~/.config/fish/config.fish "$DOTFILES_DIR/config/fish/config.fish" 2>/dev/null || echo "Could not copy fish config"
cp ~/.yarnrc "$DOTFILES_DIR/.yarnrc" 2>/dev/null || echo "Could not copy .yarnrc"

# Update VS Code settings
print_status "Updating VS Code settings..."
code --list-extensions > "$DOTFILES_DIR/vscode/extensions.txt" 2>/dev/null || echo "Could not export VS Code extensions"
cp "$HOME/Library/Application Support/Code/User/settings.json" "$DOTFILES_DIR/vscode/settings.json" 2>/dev/null || echo "Could not copy VS Code settings"
cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$DOTFILES_DIR/vscode/keybindings.json" 2>/dev/null || echo "Could not copy VS Code keybindings"

print_success "Dotfiles updated successfully!"
print_status "Review changes with 'git diff' before committing"