# YANMSS (Yet Another New Mac Setup Script)

## About

This setup script is designed for automating the configuration of a new Mac. It adjusts default settings, installs essential Terminal tools, applications, and performs system checks for processor compatibility. Ideal for a quick and efficient setup process, this script is constantly evolving with community contributions.

### Features

- **Processor Compatibility Check**: Automatically detects M1/M2/M3 and Intel processors, adjusting installations as needed.
- **Homebrew Installation**: Installs and updates Homebrew, a package manager for macOS.
- **Finder Configuration**: Customizes Finder settings such as showing hidden files and Library folder.
- **Terminal Enhancements**: Installs iTerm2 and Oh My Zsh for an improved terminal experience.
- **Powerline Fonts**: Adds Powerline fonts for better aesthetics in the terminal.
- **Python and pip**: Ensures the latest Python version, along with pip, is installed.
- **Essential Applications**: Installs core applications like Alfred, Visual Studio Code, Slack, and 1Password.

### Installation with Curl

To install this script on a new Mac, run the following command in the terminal:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/username/new-mac-setup/master/setup.sh)"
```

**Note**: If you do not have [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_) installed, they will be automatically installed.

### Usage

After running the installation command, the script will request administrator access (`sudo`). It will then proceed with the setup process, providing updates in the terminal for each step. No further interaction is required.

### Contributions

Feel free to fork, submit issues, or PRs to help improve the script for the community.

## License

[MIT License](https://opensource.org/licenses/MIT)