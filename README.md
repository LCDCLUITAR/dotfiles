# 🏠 Luis's Dotfiles

My personal dotfiles for setting up a new macOS development environment quickly and consistently.

## 🚀 Quick Install

```bash
git clone https://github.com/LCDCLUITAR/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
make install
```

**Alternative installation methods:**

```bash
# Traditional way
chmod +x install.sh && ./install.sh

# Test before installing (safe dry-run)
make test

# Or use individual components
make brew-install    # Install only Homebrew packages
make node-install    # Install only Node.js environment
make vscode-install  # Install only VS Code extensions
```

## 📋 Available Commands

Run `make help` to see all available commands:

```bash
make help           # Show all available commands
make install        # Full installation on new machine
make test           # Test installation in dry-run mode (safe)
make test-verbose   # Test with verbose output showing all commands
make update         # Update dotfiles from current system
make backup         # Create backup of current configs
make status         # Check dotfiles vs system config
make doctor         # Check system dependencies
make git-config     # Interactively configure Git with personal information
make git-push       # Update and push to git repository
```

## ✅ Testing Before Installation

**Always test first!** Run `make test` to see what would be installed without making any changes:

```bash
make test  # Safe dry-run showing what would be done
```

This shows you exactly what the installation would do without actually changing anything on your system.

## 📋 What's Included

### Shell Configuration
- **Zsh** with Oh My Zsh
- **Spaceship** prompt theme
- Useful plugins: `git`, `z`, `zsh-nvm`, `macos`
- Enhanced command line with autosuggestions and syntax highlighting
- **thefuck** for command correction

### Development Tools
- **Node.js** via NVM with latest LTS
- **Go** programming language
- **Python 3.11**
- **Git**
- **Docker** and **Rancher Desktop**
- **PostgreSQL** and **Redis**

### Applications
- **Visual Studio Code** with curated extensions
- **Postman** for API testing
- **Raycast** launcher (productivity tool)
- **iTerm2** terminal (advanced terminal replacement)
- **Firefox** and **Chrome**
- **Obsidian** for note-taking
- **pgAdmin4** for PostgreSQL management

### Command Line Enhancements
- `bat` (better cat with syntax highlighting and Git integration)
- `exa` (modern replacement for ls with color and icons)
- `ripgrep` (line-oriented search tool, faster grep)
- `fd` (simple, fast alternative to find)
- `fzf` (command-line fuzzy finder)
- `htop` (improved top process viewer)
- `tree`, `jq`, `delta`, `dust`, `gh`

## 📁 Repository Structure

```
dotfiles/
├── Makefile                # Easy command management with help
├── install.sh              # Main installation script (supports --dry-run)
├── update.sh               # Update dotfiles from system
├── setup/                  # Installation scripts
│   ├── homebrew.sh         # Homebrew packages (with detailed descriptions)
│   ├── ohmyzsh.sh          # Oh My Zsh plugins
│   ├── nodejs.sh           # Node.js environment
│   └── vscode.sh           # VS Code setup
├── config/                 # Configuration files
│   └── thefuck/           # The Fuck configuration
├── git/                   # Git configuration
├── shell/                 # Shell configuration files
└── vscode/                # VS Code configuration
    ├── extensions.txt     # List of VS Code extensions
    ├── settings.json      # VS Code settings
    └── keybindings.json   # VS Code keybindings
```

## 🔧 How It Works

### Installation Process
1. **Homebrew Setup**: Installs Homebrew (if not present) and all development tools
2. **Shell Configuration**: Sets up Zsh with Oh My Zsh and useful plugins
3. **Node.js Environment**: Installs NVM and latest Node.js LTS
4. **Git Configuration**: Interactively sets up Git with your personal information
5. **VS Code Setup**: Installs extensions and copies settings
6. **Configuration Linking**: Creates symlinks for configuration files

### Git Configuration Setup
Your Git configuration is kept secure by using a template system:

- **Template**: `git/.gitconfig` contains placeholders (YOUR_NAME, YOUR_EMAIL, etc.)
- **Interactive Setup**: Run `make git-config` to personalize your Git configuration
- **Secure**: Personal information (name, email, tokens) are never committed to the repository

```bash
# Configure Git interactively
make git-config

# This will prompt for:
# - Your full name
# - Your email address  
# - GitLab username (optional)
# - GitLab personal access token (optional)
```

The script will create a personalized `~/.gitconfig` file with your information.

### Extension Installation
Your VS Code extensions are stored in `vscode/extensions.txt`. To install them:

```bash
# Using the setup script (recommended)
./setup/vscode.sh

# Or manually with VS Code CLI
cat vscode/extensions.txt | xargs -I {} code --install-extension {}
```

## ✅ Testing Before Installation

**Always test first!** Run `make test` to see what would be installed without making any changes:

```bash
make test  # Safe dry-run showing what would be done
```

This shows you exactly what the installation would do without actually changing anything on your system.

## 🆘 Troubleshooting

### Permissions Issues
If you get permission errors, run:
```bash
chmod +x install.sh setup/*.sh
```

### Homebrew Path Issues (Apple Silicon)
If Homebrew commands aren't found, add to your shell profile:
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Oh My Zsh Installation
If Oh My Zsh installation hangs, run manually:
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### VS Code Extensions Not Installing
Make sure VS Code CLI is available:
```bash
# Install VS Code CLI if not available
code --version
```

## 📱 What's Configured

### Git
- User name and email
- Pull strategy set to fast-forward only
- VS Code as default editor
- GitLab URL rewriting for authentication
- Fetch prune enabled

### Zsh
- Oh My Zsh with custom plugins
- Spaceship theme
- NVM integration
- Auto-use NVM based on `.nvmrc`
- Go workspace configuration
- Rancher Desktop PATH integration

### VS Code
- All your current extensions (see `vscode/extensions.txt`)
- Personal settings and keybindings
- Consistent development environment

## 🔄 Updating

To update your dotfiles:

1. **Update from your current system**:
   ```bash
   make update  # Pulls current configs into dotfiles
   ```

2. **Update on other machines**:
   ```bash
   git pull
   make install  # Re-run installation
   ```

3. **Add new extensions**:
   ```bash
   # Export current extensions
   code --list-extensions > vscode/extensions.txt
   ```

## 📝 Customization

### Adding New Homebrew Packages
Edit `setup/homebrew.sh` and add packages to the `HOMEBREW_PACKAGES` array.

### Adding New VS Code Extensions
Add extension IDs to `vscode/extensions.txt`, one per line.

### Modifying Shell Configuration
Edit files in the `shell/` directory and update the linking in `install.sh`.

---

*Last updated: October 2025*