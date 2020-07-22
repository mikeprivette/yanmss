# Setup.sh

## About

This setup script is for modifying some default settings on Mac OS X, installing some of my preferred Terminal tools, and a few applications.

## Mac OS X Modifications

----------------------------------------------------------------

### Modify Finder Preferences

#### Show Library Folder in Finder

``` chflags nohidden ~/Library ```

#### Show Hidden Files in Finder

``` defaults write com.apple.finder AppleShowAllFiles YES ```

#### Show Path Bar in Finder

``` defaults write com.apple.finder ShowPathbar -bool true ```

### Show Status Bar in Finder

``` defaults write com.apple.finder ShowStatusBar -bool true ``` 

----------------------------------------------------------------

### Terminal Tools

Install the following terminal tools:

- [Homebrew](https://brew.sh/)
- [iTerm2](https://www.iterm2.com/)
- ZSH (via Homebrew)
- [oh-my-zsh](https://ohmyz.sh/)
- [Powerline fonts](https://github.com/powerline/fonts)
- Git
- Ruby
- [Speedtest-cli](https://github.com/sivel/speedtest-cli)
- [Nmap](https://nmap.org/)

----------------------------------------------------------------

### Additional Applications

Install the following applications:

- [Alfred](https://www.alfredapp.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [1Password](https://1password.com/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)