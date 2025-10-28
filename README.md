# 🏠 Luis's Dotfiles# 🏠 Luis's Dotfiles# 🏠 Luis's Dotfiles# dotfiles



My personal dotfiles for setting up a new macOS development environment quickly and consistently.



## 🚀 Quick InstallMy personal dotfiles for setting up a new macOS development environment quickly and consistently.



```bash

git clone https://github.com/LCDCLUITAR/dotfiles.git ~/dev/Code/dotfiles

cd ~/dev/Code/dotfiles## 🚀 Quick InstallMy personal dotfiles for setting up a new macOS development environment quickly and consistently.

make install

```



**Alternative installation methods:**```bash

```bash

# Traditional waygit clone https://github.com/LCDCLUITAR/dotfiles.git ~/dev/Code/dotfiles

chmod +x install.sh && ./install.sh

cd ~/dev/Code/dotfiles## 🚀 Quick Install## Getting started

# Test before installing (safe dry-run)

make testmake install



# Or use individual components```

make brew-install    # Install only Homebrew packages

make node-install    # Install only Node.js environment

make vscode-install  # Install only VS Code extensions

make link           # Create symlinks only**Alternative installation methods:**```bashTo make it easy for you to get started with GitLab, here's a list of recommended next steps.

```

```bash

## 📋 Available Commands

# Traditional waygit clone https://github.com/LCDCLUITAR/dotfiles.git ~/dev/Code/dotfiles

Run `make help` to see all available commands:

chmod +x install.sh && ./install.sh

```bash

make help           # Show all available commandscd ~/dev/Code/dotfilesAlready a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

make install        # Full installation on new machine

make test           # Test installation in dry-run mode (safe)# Or use individual components

make test-verbose   # Test with verbose output showing all commands

make update         # Update dotfiles from current systemmake brew-install    # Install only Homebrew packageschmod +x install.sh

make backup         # Create backup of current configs

make status         # Check dotfiles vs system configmake node-install    # Install only Node.js environment

make doctor         # Check system dependencies

make git-push       # Update and push to git repositorymake vscode-install  # Install only VS Code extensions./install.sh## Add your files

```

make link           # Create symlinks only

## ✅ Testing Before Installation

``````

**Always test first!** Run `make test` to see what would be installed without making any changes:



```bash

make test  # Safe dry-run showing what would be done## 📋 Available Commands- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files

```



This shows you exactly what the installation would do without actually changing anything on your system.

Run `make help` to see all available commands:## 📋 What's Included- [ ] [Add files using the command line](https://docs.gitlab.com/topics/git/add_files/#add-files-to-a-git-repository) or push an existing Git repository with the following command:

## 📋 What's Included



### Shell Configuration

- **Zsh** with Oh My Zsh```bash

- **Spaceship** prompt theme

- Useful plugins: `git`, `z`, `zsh-nvm`, `macos`make help           # Show all available commands

- Enhanced command line with autosuggestions and syntax highlighting

- **thefuck** for command correctionmake install        # Full installation on new machine### Shell Configuration```



### Development Toolsmake update         # Update dotfiles from current system

- **Node.js** via NVM with latest LTS

- **Go** programming languagemake backup         # Create backup of current configs- **Zsh** with Oh My Zshcd existing_repo

- **Python 3.11**

- **Git** with personal configurationmake status         # Check dotfiles vs system config

- **Docker** and **Rancher Desktop**

- **PostgreSQL** and **Redis**make doctor         # Check system dependencies- **Spaceship** prompt themegit remote add origin https://github.com/LCDCLUITAR/dotfiles.git



### Applicationsmake git-push       # Update and push to git repository

- **Visual Studio Code** with all your current extensions (89 total)

- **Postman** for API testing```- Useful plugins: `git`, `z`, `zsh-nvm`, `macos`git branch -M main

- **Raycast** launcher (productivity tool)

- **iTerm2** terminal (advanced terminal replacement)

- **Firefox** and **Chrome**

- **Obsidian** for note-taking## 📋 What's Included- Enhanced command line with autosuggestions and syntax highlightinggit push -uf origin main

- **pgAdmin4** for PostgreSQL management



### Command Line Enhancements

- `bat` (better cat with syntax highlighting and Git integration)### Shell Configuration- **thefuck** for command correction```

- `exa` (modern replacement for ls with color and icons)

- `ripgrep` (line-oriented search tool, faster grep)- **Zsh** with Oh My Zsh

- `fd` (simple, fast alternative to find)

- `fzf` (command-line fuzzy finder)- **Spaceship** prompt theme

- `htop` (improved top process viewer)

- `tree`, `jq`, `delta`, `dust`, `gh`- Useful plugins: `git`, `z`, `zsh-nvm`, `macos`



## 📁 Repository Structure- Enhanced command line with autosuggestions and syntax highlighting### Development Tools## Integrate with your tools



```- **thefuck** for command correction

dotfiles/

├── Makefile                # Easy command management with help- **Node.js** via NVM with latest LTS

├── install.sh              # Main installation script (supports --dry-run)

├── update.sh               # Update dotfiles from system### Development Tools

├── setup/                  # Installation scripts

│   ├── homebrew.sh         # Homebrew packages (with detailed descriptions)- **Node.js** via NVM with latest LTS- **Go** programming language- [ ] [Set up project integrations](https://gitlab.com/LXC3592/dotfiles/-/settings/integrations)

│   ├── ohmyzsh.sh          # Oh My Zsh plugins

│   ├── nodejs.sh           # Node.js environment- **Go** programming language

│   └── vscode.sh           # VS Code setup

├── shell/                  # Shell configurations- **Python 3.11**- **Python 3.11**

│   ├── .zshrc              # Your current Zsh configuration

│   ├── .zprofile- **Git** with personal configuration

│   ├── .bashrc

│   └── .bash_profile- **Docker** and **Rancher Desktop**- **Git** with personal configuration## Collaborate with your team

├── git/                    # Git configuration

│   └── .gitconfig          # Your current Git settings- **PostgreSQL** and **Redis**

├── config/                 # Application configs

│   ├── thefuck/settings.py # Your thefuck configuration- **Docker** and **Rancher Desktop**

│   └── fish/config.fish    # Your Fish shell config

├── vscode/                 # VS Code settings (your current setup)### Applications

│   ├── settings.json       # Your current VS Code settings

│   ├── keybindings.json    # Your current keybindings- **Visual Studio Code** with all your current extensions- **PostgreSQL** and **Redis**- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)

│   └── extensions.txt      # All 89 currently installed extensions

└── .gitignore             # Excludes sensitive files- **Postman** for API testing

```

- **Raycast** launcher- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)

## 🛠 Manual Setup Steps

- **iTerm2** terminal

After running the install script, you may want to:

- **Firefox** and **Chrome**### Applications- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)

1. **Configure Git** with your personal information:

   ```bash- **Obsidian** for notes

   git config --global user.name "Your Name"

   git config --global user.email "your.email@example.com"- **pgAdmin4** for PostgreSQL- **Visual Studio Code** with extensions- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)

   ```



2. **Set up SSH keys** for GitHub/GitLab:

   ```bash### Command Line Enhancements- **Postman** for API testing- [ ] [Set auto-merge](https://docs.gitlab.com/user/project/merge_requests/auto_merge/)

   ssh-keygen -t ed25519 -C "your.email@example.com"

   ```- `bat` (better cat with syntax highlighting)



3. **Configure AWS CLI** (if needed):- `exa` (better ls with color and icons)- **Raycast** launcher

   ```bash

   aws configure- `ripgrep` (faster grep)

   ```

- `fd` (better find)- **iTerm2** terminal## Test and Deploy

4. **Restart your terminal** or run:

   ```bash- `fzf` (fuzzy finder)

   source ~/.zshrc

   ```- `htop`, `tree`, `jq`- **Firefox** and **Chrome**



## 🔧 Customization- `delta` (better git diff)



### Adding New Homebrew Packages- `dust` (better du)- **Obsidian** for notesUse the built-in continuous integration in GitLab.

Edit `setup/homebrew.sh` and add packages to the arrays. Each package includes detailed comments explaining what it does:

- `HOMEBREW_PACKAGES` for command-line tools

- `HOMEBREW_CASKS` for GUI applications

## 📁 Repository Structure- **pgAdmin4** for PostgreSQL

### Adding Zsh Plugins

Edit `setup/ohmyzsh.sh` to install additional Oh My Zsh plugins.



### VS Code Extensions```- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/)

Your current extensions are automatically exported. To update after installing new extensions:

```bashdotfiles/

make update  # or: code --list-extensions > vscode/extensions.txt

```├── Makefile                # Easy command management### Command Line Enhancements- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing (SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)



## 🔒 Security Notes├── install.sh              # Main installation script



This repository excludes sensitive files like:├── update.sh               # Update dotfiles from system- `bat` (better cat)- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)

- AWS credentials (`.aws/credentials`)

- SSH private keys (`.ssh/id_*`)├── setup/                  # Installation scripts

- Any files containing passwords or API keys

│   ├── homebrew.sh         # Homebrew packages (with descriptions)- `exa` (better ls)- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)

Always review files before committing and never commit sensitive information.

│   ├── ohmyzsh.sh          # Oh My Zsh plugins

## 🆘 Troubleshooting

│   ├── nodejs.sh           # Node.js environment- `ripgrep` (better grep)- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

### Test First

```bash│   └── vscode.sh           # VS Code setup

make test     # Always test before installing

make doctor   # Check system dependencies├── shell/                  # Shell configurations- `fd` (better find)

```

│   ├── .zshrc

### Permissions Issues

```bash│   ├── .zprofile- `fzf` (fuzzy finder)***

chmod +x install.sh setup/*.sh

```│   ├── .bashrc



### Homebrew Path Issues (Apple Silicon)│   └── .bash_profile- `htop`, `tree`, `jq`

```bash

eval "$(/opt/homebrew/bin/brew shellenv)"├── git/                    # Git configuration

```

│   └── .gitconfig# Editing this README

### Check Configuration Status

```bash├── config/                 # Application configs

make status  # Compare dotfiles with system config

```│   ├── thefuck/## 📁 Repository Structure



## 📱 What's Currently Configured│   └── fish/



### Your VS Code Extensions (89 total)├── vscode/                 # VS Code settingsWhen you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thanks to [makeareadme.com](https://www.makeareadme.com/) for this template.

Your `extensions.txt` contains all your currently installed extensions including:

- **Angular development**: Angular Language Service, Angular Files, Angular Beast Code│   ├── settings.json       # Your current VS Code settings

- **Git & GitHub**: GitLens, GitHub Copilot, GitLab Workflow

- **Languages**: Python, Go, Java, C#, TypeScript, Dart/Flutter│   ├── keybindings.json    # Your current keybindings```

- **Database tools**: PostgreSQL client, JDBC client

- **Documentation**: Confluence markup, PlantUML, Mermaid│   └── extensions.txt      # All currently installed extensions

- **Productivity**: Scratchpads, CodeStream, Material Icon Theme

- **And many more...** (see `vscode/extensions.txt` for complete list)└── .gitignore             # Excludes sensitive filesdotfiles/## Suggestions for a good README



### Git Configuration```

- User: Luis Chaparro (luis.chaparro@pizzahut.com)

- Pull strategy: fast-forward only├── install.sh              # Main installation script

- Editor: VS Code

- GitLab URL rewriting for authentication## 🛠 Manual Setup Steps

- Fetch prune enabled

├── setup/                  # Installation scriptsEvery project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

### Zsh Configuration

- Oh My Zsh with custom pluginsAfter running the install script, you may want to:

- Spaceship theme

- NVM integration with auto-use│   ├── homebrew.sh         # Homebrew packages

- Go workspace configuration

- Rancher Desktop PATH integration1. **Configure Git** with your personal information:

- thefuck command correction

   ```bash│   ├── ohmyzsh.sh          # Oh My Zsh plugins## Name

## 🔄 Updating

   git config --global user.name "Your Name"

To update your dotfiles:

```bash   git config --global user.email "your.email@example.com"│   ├── nodejs.sh           # Node.js environmentChoose a self-explaining name for your project.

make update     # Update from current system

make git-push   # Update and push to repository   ```

```

│   └── vscode.sh           # VS Code setup

---

2. **Set up SSH keys** for GitHub/GitLab:

*Last updated: October 2025*
   ```bash├── shell/                  # Shell configurations## Description

   ssh-keygen -t ed25519 -C "your.email@example.com"

   ```│   ├── .zshrcLet people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.



3. **Configure AWS CLI** (if needed):│   ├── .zprofile

   ```bash

   aws configure│   ├── .bashrc## Badges

   ```

│   └── .bash_profileOn some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

4. **Restart your terminal** or run:

   ```bash├── git/                    # Git configuration

   source ~/.zshrc

   ```│   └── .gitconfig## Visuals



## 🔧 Customization├── config/                 # Application configsDepending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.



### Adding New Homebrew Packages│   ├── thefuck/

Edit `setup/homebrew.sh` and add packages to the arrays:

- `HOMEBREW_PACKAGES` for command-line tools│   └── fish/## Installation

- `HOMEBREW_CASKS` for GUI applications

├── vscode/                 # VS Code settingsWithin a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

### Adding Zsh Plugins

Edit `setup/ohmyzsh.sh` to install additional Oh My Zsh plugins.│   ├── settings.json



### VS Code Extensions│   ├── keybindings.json## Usage

Your current extensions are automatically exported. To update:

```bash│   └── extensions.txtUse examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

make update  # or code --list-extensions > vscode/extensions.txt

```└── .gitignore             # Excludes sensitive files



## 🔒 Security Notes```## Support



This repository excludes sensitive files like:Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

- AWS credentials (`.aws/credentials`)

- SSH private keys (`.ssh/id_*`)## 🛠 Manual Setup Steps

- Any files containing passwords or API keys

## Roadmap

Always review files before committing and never commit sensitive information.

After running the install script, you may want to:If you have ideas for releases in the future, it is a good idea to list them in the README.

## 🆘 Troubleshooting



### Permissions Issues

```bash1. **Configure Git** with your personal information:## Contributing

make doctor  # Check system dependencies

chmod +x install.sh setup/*.sh   ```bashState if you are open to contributions and what your requirements are for accepting them.

```

   git config --global user.name "Your Name"

### Homebrew Path Issues (Apple Silicon)

```bash   git config --global user.email "your.email@example.com"For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

eval "$(/opt/homebrew/bin/brew shellenv)"

```   ```



### Check Configuration StatusYou can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

```bash

make status  # Compare dotfiles with system config2. **Set up SSH keys** for GitHub/GitLab:

```

   ```bash## Authors and acknowledgment

## 📱 What's Currently Configured

   ssh-keygen -t ed25519 -C "your.email@example.com"Show your appreciation to those who have contributed to the project.

### Your VS Code Extensions (89 total)

Your `extensions.txt` contains all your currently installed VS Code extensions including:   ```

- **Angular development**: Angular Language Service, Angular Files, Angular Beast Code

- **Git & GitHub**: GitLens, GitHub Copilot, GitLab Workflow## License

- **Languages**: Python, Go, Java, C#, TypeScript, Dart/Flutter

- **Database tools**: PostgreSQL client, JDBC client3. **Configure AWS CLI** (if needed):For open source projects, say how it is licensed.

- **Documentation**: Confluence markup, PlantUML, Mermaid

- **Productivity**: Scratchpads, CodeStream, Material Icon Theme   ```bash

- **And many more...** (see `vscode/extensions.txt` for complete list)

   aws configure## Project status

### Git Configuration

- User name and email (currently set to Luis Chaparro / luis.chaparro@pizzahut.com)   ```If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.

- Pull strategy set to fast-forward only

- VS Code as default editor

- GitLab URL rewriting for authentication4. **Restart your terminal** or run:

- Fetch prune enabled   ```bash

   source ~/.zshrc

### Zsh Configuration   ```

- Oh My Zsh with custom plugins

- Spaceship theme## 🔧 Customization

- NVM integration with auto-use

- Go workspace configuration### Adding New Homebrew Packages

- Rancher Desktop PATH integrationEdit `setup/homebrew.sh` and add packages to the arrays:

- thefuck command correction- `HOMEBREW_PACKAGES` for command-line tools

- `HOMEBREW_CASKS` for GUI applications

## 🔄 Updating

### Adding Zsh Plugins

To update your dotfiles:Edit `setup/ohmyzsh.sh` to install additional Oh My Zsh plugins.

```bash

make update     # Update from current system### VS Code Extensions

make git-push   # Update and push to repositoryRun this command to update the extensions list:

``````bash

code --list-extensions > vscode/extensions.txt

---```



*Last updated: October 2025*## 🔒 Security Notes

This repository excludes sensitive files like:
- AWS credentials (`.aws/credentials`)
- SSH private keys (`.ssh/id_*`)
- Any files containing passwords or API keys

Always review files before committing and never commit sensitive information.

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
- All your current extensions
- Personal settings and keybindings
- Snippets (if any)

## 🔄 Updating

To update your dotfiles:
1. Make changes to the files in this repository
2. Commit and push changes
3. On other machines, pull changes and re-run `install.sh`

---

*Last updated: October 2025*