# YANMSS (Yet Another New Mac Setup Script)

## About

YANMSS is a comprehensive setup script for automating the configuration of a new Mac. It optimizes default system settings, installs essential command-line tools and applications, and performs system checks for processor compatibility, making it ideal for users who want a quick and efficient setup process.

### Features

- **Strict Safety Measures**: Uses strict mode (set -euo pipefail) to ensure safety and reliability throughout the setup process.
- **Processor Compatibility Check**: Automatically detects M1/M2/M3 and Intel processors, adjusting installations as needed.
- **Homebrew Installation and Updates**: Installs and updates Homebrew, a package manager for macOS, with retry logic to handle network-related failures.
- **Finder Configuration**: Customizes Finder settings, such as showing hidden files, displaying the Library folder, and enabling useful Finder options.
- **Terminal Enhancements**: Installs iTerm2 and Oh My Zsh with the agnoster theme, plus popular plugins including zsh-autosuggestions, zsh-syntax-highlighting, and more for an enhanced terminal experience.
- **Command-Line Tools**: Installs powerful CLI tools including:
  - `z` - Smart directory jumping (replaces cd)
  - `bat` - Better cat with syntax highlighting
  - `tree` - Directory structure visualization
  - `tldr` - Simplified man pages
  - `ripgrep`, `fd` - Fast search tools
  - `jq` - JSON processor
  - `htop` - Interactive process viewer
- **Powerline Fonts**: Adds Powerline fonts for enhanced terminal aesthetics with agnoster theme support.
- **Python and pip**: Installs the latest version of Python and pip, ensuring your development environment is ready.
- **Essential Applications**: Installs core applications like Alfred, Visual Studio Code, Slack, and 1Password for a productivity-boosting setup.
- **Logging**: Logs all actions to a timestamped log file for easy troubleshooting.
- **Retry Logic**: Implements retry mechanisms for network-dependent commands to improve reliability.
- **Backup Configurations**: Backs up important files, such as .zshrc, before making changes to avoid data loss.
- **Interactive Prompts**: Offers prompts to confirm certain actions, allowing customization during the setup process.

### Installation with Curl

To install this script on a new Mac, run the following command in the terminal:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mikeprivette/yanmss/master/setup.sh)"
```

**Note**: If you do not have [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_) installed, they will be automatically installed.

### Usage

After running the installation command, the script will request administrator access (`sudo`). It will then proceed with the setup process, providing updates in the terminal for each step. Logging is performed in real-time, with logs written to a timestamped file in the user's home directory for easy reference. No further interaction is required unless prompted for specific configurations.

#### Post-Installation

After the script completes, you'll need to:

1. **Configure iTerm2 Font**: Open iTerm2 Preferences (⌘,) → Profiles → Text → Change Font and select a Powerline font (e.g., "Meslo LG M for Powerline")
2. **Restart your terminal** or run `source ~/.zshrc` to apply the new shell configuration
3. **Enjoy** your fully configured development environment!

#### New Commands Available

- **`z [directory]`** - Jump to frequently used directories (learns from your cd usage)
  - Example: `z proj` might jump to `/Users/you/projects`
- **`cat [file]`** - Now uses `bat` with syntax highlighting
  - Use `ocat` if you need the original cat
- **`tldr [command]`** - Get quick command examples instead of man pages
- **`tree`** - View directory structure in tree format

### Contributions

Contributions are always welcome! Feel free to fork this repository, submit issues, or open PRs to help improve the script for the community. Any enhancements, fixes, or suggestions are greatly appreciated.

### Disclaimer

Use this script at your own risk. While it has been tested on multiple systems, configurations can vary, and some customization may be required to suit your specific needs.
