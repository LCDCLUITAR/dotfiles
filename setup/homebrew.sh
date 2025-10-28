#!/bin/bash

# Homebrew packages installation script

print_status() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

# Essential development tools with detailed descriptions
HOMEBREW_PACKAGES=(
    # Shell enhancements
    "zsh-autosuggestions"       # Fish-like autosuggestions for zsh
    "zsh-syntax-highlighting"   # Fish-like syntax highlighting for zsh
    "spaceship"                 # Minimalistic zsh prompt theme

    # Command line tools
    "thefuck"                   # Corrects errors in previous console commands
    "git"                       # Distributed version control system
    "curl"                      # Command line tool for transferring data with URLs
    "wget"                      # Internet file retriever
    "tree"                      # Display directories as trees (with optional color/HTML output)
    "htop"                      # Improved top (interactive process viewer)
    "jq"                        # Lightweight and flexible command-line JSON processor
    "fzf"                       # Command-line fuzzy finder

    # Development environments and languages
    "node"                      # Platform for JavaScript runtime
    "nvm"                       # Node Version Manager
    "go"                        # Go programming language
    "python@3.11"              # Python 3.11 interpreter

    # Databases and caching
    "postgresql"                # Object-relational database system
    "redis"                     # In-memory data structure store

    # Package managers and build tools
    "yarn"                      # JavaScript package manager

    # Terminal and editor tools
    # "tmux"                      # Terminal multiplexer (uncomment this line if using tmux)
    "neovim"                    # Ambitious Vim-fork focused on extensibility and agility

    # Enhanced command line utilities (better versions of standard tools)
    "bat"                       # Clone of cat with syntax highlighting and Git integration
    "exa"                       # Modern replacement for ls (with color and icons)
    "ripgrep"                   # Line-oriented search tool (faster grep)
    "fd"                        # Simple, fast alternative to find
    "dust"                      # More intuitive version of du (disk usage)
    "delta"                     # Syntax-highlighting pager for git and diff output
)

# Homebrew Casks (GUI applications) with detailed descriptions
HOMEBREW_CASKS=(
    # Development tools
    "visual-studio-code"        # Microsoft's code editor with extensive extension ecosystem
    "docker"                    # Containerization platform for developers
    "rancher-desktop"           # Container management and Kubernetes on desktop
    "postman"                   # API development environment for testing REST/GraphQL APIs

    # Web browsers
    "firefox"                   # Mozilla's web browser with privacy focus
    "google-chrome"             # Google's web browser

    # Terminal and productivity
    "iterm2"                    # Replacement for Terminal with advanced features
    "raycast"                   # Productivity tool that replaces Spotlight (launcher/calculator/etc)

    # Note-taking and documentation
    "obsidian"                  # Knowledge management and note-taking application

    # Communication and collaboration
    "slack"                     # Team communication and collaboration
    "zoom"                      # Video conferencing software
)

print_status "Installing Homebrew packages..."

# Install packages
for package in "${HOMEBREW_PACKAGES[@]}"; do
    if brew list "$package" &>/dev/null; then
        print_success "$package is already installed"
    else
        print_status "Installing $package..."
        brew install "$package"
    fi
done

print_status "Installing Homebrew casks..."

# Install casks
for cask in "${HOMEBREW_CASKS[@]}"; do
    if brew list --cask "$cask" &>/dev/null; then
        print_success "$cask is already installed"
    else
        print_status "Installing $cask..."
        brew install --cask "$cask"
    fi
done

# Install fzf key bindings and fuzzy completion
if command -v fzf &> /dev/null; then
    print_status "Setting up fzf key bindings..."
    $(brew --prefix)/opt/fzf/install --all
fi

print_success "Homebrew packages installation completed!"