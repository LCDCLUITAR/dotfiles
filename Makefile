# Dotfiles Makefile
# Provides convenient commands for managing dotfiles

.DEFAULT_GOAL := help
.PHONY: help install update backup clean test

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[1;33m
RED := \033[0;31m
NC := \033[0m

define print_status
	@printf "$(BLUE)[INFO]$(NC) %s\n" "$(1)"
endef

define print_success
	@printf "$(GREEN)[SUCCESS]$(NC) %s\n" "$(1)"
endef

define print_warning
	@printf "$(YELLOW)[WARNING]$(NC) %s\n" "$(1)"
endef

define print_error
	@printf "$(RED)[ERROR]$(NC) %s\n" "$(1)"
endef

help: ## Show this help message
	@echo "$(GREEN)Dotfiles Management Commands$(NC)"
	@echo ""
	@echo "$(BLUE)Usage:$(NC)"
	@echo "  make <command>"
	@echo ""
	@echo "$(BLUE)Available commands:$(NC)"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(BLUE)Examples:$(NC)"
	@echo "  make install     # Install dotfiles on a new machine"
	@echo "  make test        # Test installation in dry-run mode"
	@echo "  make update      # Update dotfiles from current system"
	@echo "  make backup      # Create backup of current config files"
	@echo "  make doctor      # Check system dependencies"

install: ## Install dotfiles and dependencies on a new machine
	$(call print_status,Starting full dotfiles installation...)
	@chmod +x install.sh setup/*.sh
	@./install.sh
	$(call print_success,Installation completed!)

update: ## Update dotfiles repository from current system configuration
	$(call print_status,Updating dotfiles from current system...)
	@chmod +x update.sh
	@./update.sh
	$(call print_success,Dotfiles updated! Review with 'git diff')

backup: ## Create backup of current configuration files
	$(call print_status,Creating backup of current configuration...)
	@mkdir -p backups/$(shell date +%Y%m%d_%H%M%S)
	@cp ~/.zshrc backups/$(shell date +%Y%m%d_%H%M%S)/.zshrc.backup 2>/dev/null || true
	@cp ~/.gitconfig backups/$(shell date +%Y%m%d_%H%M%S)/.gitconfig.backup 2>/dev/null || true
	@cp -r ~/.config/thefuck backups/$(shell date +%Y%m%d_%H%M%S)/thefuck.backup 2>/dev/null || true
	@cp -r ~/.config/fish backups/$(shell date +%Y%m%d_%H%M%S)/fish.backup 2>/dev/null || true
	$(call print_success,Backup created in backups/ directory)

clean: ## Remove backup files and temporary files
	$(call print_status,Cleaning up backup and temporary files...)
	@rm -rf backups/
	@find . -name "*.backup" -delete 2>/dev/null || true
	@find . -name "*.tmp" -delete 2>/dev/null || true
	$(call print_success,Cleanup completed!)

test: ## Test dotfiles installation in dry-run mode
	$(call print_status,Testing dotfiles installation (dry-run)...)
	@chmod +x install.sh
	@DRY_RUN=true ./install.sh
	$(call print_success,Dry-run test completed! Review output above)

test-verbose: ## Test with verbose output showing all commands
	$(call print_status,Testing dotfiles installation with verbose dry-run...)
	@chmod +x install.sh
	@DRY_RUN=true bash -x ./install.sh
	$(call print_success,Verbose dry-run test completed!)

brew-install: ## Install only Homebrew packages
	$(call print_status,Installing Homebrew packages...)
	@chmod +x setup/homebrew.sh
	@./setup/homebrew.sh
	$(call print_success,Homebrew packages installed!)

node-install: ## Install only Node.js environment
	$(call print_status,Setting up Node.js environment...)
	@chmod +x setup/nodejs.sh
	@./setup/nodejs.sh
	$(call print_success,Node.js environment ready!)

vscode-install: ## Install VS Code extensions and settings
	$(call print_status,Setting up VS Code...)
	@chmod +x setup/vscode.sh
	@./setup/vscode.sh
	$(call print_success,VS Code setup completed!)

link: ## Create symlinks for dotfiles (without installing dependencies)
	$(call print_status,Creating symlinks for configuration files...)
	@ln -sf $(PWD)/shell/.zshrc ~/.zshrc
	@ln -sf $(PWD)/git/.gitconfig ~/.gitconfig
	@mkdir -p ~/.config/thefuck && ln -sf $(PWD)/config/thefuck/settings.py ~/.config/thefuck/settings.py
	@mkdir -p ~/.config/fish && ln -sf $(PWD)/config/fish/config.fish ~/.config/fish/config.fish
	@ln -sf $(PWD)/.yarnrc ~/.yarnrc 2>/dev/null || true
	$(call print_success,Symlinks created!)

unlink: ## Remove symlinks (restore original files if backups exist)
	$(call print_status,Removing dotfiles symlinks...)
	@rm -f ~/.zshrc && mv ~/.zshrc.backup ~/.zshrc 2>/dev/null || true
	@rm -f ~/.gitconfig && mv ~/.gitconfig.backup ~/.gitconfig 2>/dev/null || true
	@rm -f ~/.config/thefuck/settings.py 2>/dev/null || true
	@rm -f ~/.config/fish/config.fish 2>/dev/null || true
	@rm -f ~/.yarnrc && mv ~/.yarnrc.backup ~/.yarnrc 2>/dev/null || true
	$(call print_success,Symlinks removed!)

status: ## Show status of dotfiles vs system configuration
	$(call print_status,Checking dotfiles status...)
	@echo "$(BLUE)Dotfiles vs System Configuration:$(NC)"
	@echo "=================================="
	@diff -q shell/.zshrc ~/.zshrc 2>/dev/null && echo "✅ .zshrc matches" || echo "❌ .zshrc differs"
	@diff -q git/.gitconfig ~/.gitconfig 2>/dev/null && echo "✅ .gitconfig matches" || echo "❌ .gitconfig differs"
	@diff -q config/thefuck/settings.py ~/.config/thefuck/settings.py 2>/dev/null && echo "✅ thefuck settings match" || echo "❌ thefuck settings differ"
	@diff -q config/fish/config.fish ~/.config/fish/config.fish 2>/dev/null && echo "✅ fish config matches" || echo "❌ fish config differs"

git-push: update ## Update dotfiles and push to git repository
	$(call print_status,Updating dotfiles and pushing to repository...)
	@make update
	@git add .
	@git commit -m "Update dotfiles - $(shell date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"
	@git push
	$(call print_success,Dotfiles updated and pushed to repository!)

doctor: ## Check system dependencies and configuration
	$(call print_status,Running dotfiles doctor...)
	@echo "$(BLUE)System Check:$(NC)"
	@echo "============="
	@command -v brew >/dev/null 2>&1 && echo "✅ Homebrew installed" || echo "❌ Homebrew not found"
	@command -v git >/dev/null 2>&1 && echo "✅ Git installed" || echo "❌ Git not found"
	@command -v code >/dev/null 2>&1 && echo "✅ VS Code installed" || echo "❌ VS Code not found"
	@command -v node >/dev/null 2>&1 && echo "✅ Node.js installed" || echo "❌ Node.js not found"
	@command -v nvm >/dev/null 2>&1 && echo "✅ NVM available" || echo "❌ NVM not found"
	@[ -d ~/.oh-my-zsh ] && echo "✅ Oh My Zsh installed" || echo "❌ Oh My Zsh not found"
	@echo ""
	@echo "$(BLUE)Configuration Files:$(NC)"
	@echo "==================="
	@[ -f ~/.zshrc ] && echo "✅ .zshrc exists" || echo "❌ .zshrc missing"
	@[ -f ~/.gitconfig ] && echo "✅ .gitconfig exists" || echo "❌ .gitconfig missing"
	@[ -f ~/.config/thefuck/settings.py ] && echo "✅ thefuck configured" || echo "❌ thefuck not configured"