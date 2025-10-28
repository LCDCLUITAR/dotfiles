#!/bin/bash

# VS Code setup script

print_status() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

print_warning() {
    echo -e "\033[1;33m[WARNING]\033[0m $1"
}

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

# Check if VS Code is installed
if ! command -v code &> /dev/null; then
    print_warning "VS Code is not installed or not in PATH"
    print_status "Please install VS Code first, or make sure it's in your PATH"
    exit 1
fi

# Install VS Code extensions
if [ -f "$DOTFILES_DIR/vscode/extensions.txt" ]; then
    print_status "Installing VS Code extensions..."

    while IFS= read -r line; do
        # Skip comments and empty lines
        if [[ "$line" =~ ^[[:space:]]*# ]] || [[ -z "${line// }" ]]; then
            continue
        fi
        
        extension=$(echo "$line" | sed 's/[[:space:]]*#.*//')  # Remove inline comments
        extension=$(echo "$extension" | xargs)  # Trim whitespace
        
        if [ -n "$extension" ]; then
            print_status "Installing extension: $extension"
            code --install-extension "$extension"
        fi
    done < "$DOTFILES_DIR/vscode/extensions.txt"

    print_success "VS Code extensions installation completed!"
else
    print_warning "extensions.txt not found, skipping extension installation"
fi

# Copy VS Code settings if they exist
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

if [ -f "$DOTFILES_DIR/vscode/settings.json" ]; then
    print_status "Copying VS Code settings..."
    cp "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/"
    print_success "VS Code settings copied!"
else
    print_warning "settings.json not found in dotfiles"
fi

if [ -f "$DOTFILES_DIR/vscode/keybindings.json" ]; then
    print_status "Copying VS Code keybindings..."
    cp "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/"
    print_success "VS Code keybindings copied!"
else
    print_warning "keybindings.json not found in dotfiles"
fi

# Copy snippets if they exist
if [ -d "$DOTFILES_DIR/vscode/snippets" ]; then
    print_status "Copying VS Code snippets..."
    cp -r "$DOTFILES_DIR/vscode/snippets/"* "$VSCODE_USER_DIR/snippets/" 2>/dev/null || true
    print_success "VS Code snippets copied!"
fi

print_success "VS Code setup completed!"
print_status "Please restart VS Code for all settings to take effect"