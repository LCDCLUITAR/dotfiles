#!/bin/bash

# Node.js and NVM setup script

print_status() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

# Set up NVM directory
export NVM_DIR="$HOME/.nvm"

# Source NVM if it exists
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install NVM if not installed (and not using Homebrew version)
if ! command -v nvm &> /dev/null && [ ! -s "$NVM_DIR/nvm.sh" ]; then
    print_status "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

    # Source NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    print_success "NVM installed!"
else
    print_success "NVM is already available"
fi

# Install latest LTS Node.js
if command -v nvm &> /dev/null; then
    print_status "Installing latest LTS Node.js..."
    nvm install --lts
    nvm use --lts
    nvm alias default lts/*
    print_success "Node.js LTS installed and set as default!"
fi

# Install global npm packages
if command -v npm &> /dev/null; then
    print_status "Installing global npm packages..."

    GLOBAL_PACKAGES=(
        "yarn"
        "typescript"
        "ts-node"
        "eslint"
        "prettier"
    )

    for package in "${GLOBAL_PACKAGES[@]}"; do
        if npm list -g "$package" &>/dev/null; then
            print_success "$package is already installed globally"
        else
            print_status "Installing $package globally..."
            npm install -g "$package"
        fi
    done

    print_success "Global npm packages installation completed!"
fi

print_success "Node.js environment setup completed!"