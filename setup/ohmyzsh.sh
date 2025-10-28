#!/bin/bash

# Oh My Zsh plugins and themes setup

print_status() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install zsh-nvm plugin for Oh My Zsh
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-nvm" ]; then
    print_status "Installing zsh-nvm plugin..."
    git clone https://github.com/lukechilds/zsh-nvm "$ZSH_CUSTOM/plugins/zsh-nvm"
    print_success "zsh-nvm plugin installed!"
else
    print_success "zsh-nvm plugin is already installed"
fi

# Install zsh-autosuggestions plugin (if not using Homebrew version)
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    print_status "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    print_success "zsh-autosuggestions plugin installed!"
else
    print_success "zsh-autosuggestions plugin is already installed"
fi

# Install zsh-syntax-highlighting plugin (if not using Homebrew version)
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    print_status "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    print_success "zsh-syntax-highlighting plugin installed!"
else
    print_success "zsh-syntax-highlighting plugin is already installed"
fi

# Install Powerlevel10k theme (optional alternative to spaceship)
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    print_status "Installing Powerlevel10k theme (alternative to spaceship)..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
    print_success "Powerlevel10k theme installed!"
else
    print_success "Powerlevel10k theme is already installed"
fi

print_success "Oh My Zsh plugins and themes setup completed!"