#!/bin/bash

# Git configuration setup script

print_status() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

print_warning() {
    echo -e "\033[1;33m[WARNING]\033[0m $1"
}

print_error() {
    echo -e "\033[0;31m[ERROR]\033[0m $1"
}

# Check if running in dry-run mode
DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    print_warning "Running in DRY-RUN mode - no changes will be made"
fi

print_status "Setting up Git configuration..."

# Get current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
GIT_CONFIG_TEMPLATE="$DOTFILES_DIR/git/.gitconfig"
GIT_CONFIG_TARGET="$HOME/.gitconfig"

# Check if template exists
if [[ ! -f "$GIT_CONFIG_TEMPLATE" ]]; then
    print_status "Creating $GIT_CONFIG_TEMPLATE"
    mkdir -p "$(dirname "$GIT_CONFIG_TEMPLATE")"
    touch "$GIT_CONFIG_TEMPLATE"
fi

# Interactive configuration
echo ""
print_status "Please provide your Git configuration details:"
echo ""

# Get user name
while true; do
    read -p "Enter your full name: " USER_NAME
    if [[ -n "$USER_NAME" ]]; then
        break
    fi
    print_warning "Name cannot be empty. Please try again."
done

# Get user email
while true; do
    read -p "Enter your email address: " USER_EMAIL
    if [[ "$USER_EMAIL" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
        break
    fi
    print_warning "Please enter a valid email address."
done

# Get GitLab username (optional)
read -p "Enter your GitLab username (optional, press Enter to skip): " GITLAB_USERNAME

# Get GitLab token (optional)
GITLAB_TOKEN=""
if [[ -n "$GITLAB_USERNAME" ]]; then
    echo ""
    print_status "GitLab Personal Access Token setup:"
    echo "  1. Go to https://gitlab.com/-/profile/personal_access_tokens"
    echo "  2. Create a token with 'read_repository' and 'write_repository' scopes"
    echo "  3. Copy the token and paste it below"
    echo ""
    read -s -p "Enter your GitLab Personal Access Token (hidden input, optional): " GITLAB_TOKEN
    echo ""
fi

# Create the personalized config
if [[ "$DRY_RUN" == "true" ]]; then
    print_status "Would create Git config with the following settings:"
    echo "  Name: $USER_NAME"
    echo "  Email: $USER_EMAIL"
    if [[ -n "$GITLAB_USERNAME" ]]; then
        echo "  GitLab Username: $GITLAB_USERNAME"
        echo "  GitLab Token: [HIDDEN]"
    fi
    echo "  Target: $GIT_CONFIG_TARGET"
else
    # Create temporary config file
    TEMP_CONFIG=$(mktemp)
    
    # Copy template and replace placeholders
    cp "$GIT_CONFIG_TEMPLATE" "$TEMP_CONFIG"
    
    # Replace user information
    sed -i '' "s/YOUR_NAME/$USER_NAME/g" "$TEMP_CONFIG"
    sed -i '' "s/YOUR_EMAIL/$USER_EMAIL/g" "$TEMP_CONFIG"
    
    if [[ -n "$GITLAB_USERNAME" && -n "$GITLAB_TOKEN" ]]; then
        # Replace GitLab credentials
        sed -i '' "s/YOUR_GITLAB_USERNAME:YOUR_GITLAB_TOKEN/$GITLAB_USERNAME:$GITLAB_TOKEN/g" "$TEMP_CONFIG"
    else
        # Remove GitLab URL rewriting if no credentials provided
        sed -i '' '/\[url "YOUR_GITLAB_USERNAME:YOUR_GITLAB_TOKEN@gitlab.com"\]/,/insteadOf = https:\/\/gitlab.com/d' "$TEMP_CONFIG"
    fi
    
    # Backup existing config if it exists
    if [[ -f "$GIT_CONFIG_TARGET" ]]; then
        print_status "Backing up existing Git config to $GIT_CONFIG_TARGET.backup"
        cp "$GIT_CONFIG_TARGET" "$GIT_CONFIG_TARGET.backup"
    fi
    
    # Install the new config
    cp "$TEMP_CONFIG" "$GIT_CONFIG_TARGET"
    rm "$TEMP_CONFIG"
    
    print_success "Git configuration installed successfully!"
    echo ""
    print_status "Configuration summary:"
    echo "  Name: $USER_NAME"
    echo "  Email: $USER_EMAIL"
    if [[ -n "$GITLAB_USERNAME" && -n "$GITLAB_TOKEN" ]]; then
        echo "  GitLab authentication: Configured"
    else
        echo "  GitLab authentication: Skipped"
    fi
    echo ""
    print_status "You can verify your configuration with: git config --global --list"
fi