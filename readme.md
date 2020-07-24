# Setup.sh

## About

This setup script is for modifying some default settings on Mac OS X, installing some of my preferred Terminal tools, and a few applications.

### Installation with Curl

To install this script from a brand new Mac (fresh out of the box!) run the following command in terminal:

``` sh -c "$(curl -fsSL https://raw.githubusercontent.com/mikeprivette/new-mac-setup/master/setup.sh)" ```

If you do not already have Xcode Command Line Tools installed, you will be prompted to install them after being prompted for ``` sudo ``` access.

### Why ask for sudo access?

You'll need ``` sudo``` access to do the initial Finder modifications, but it is not required to install Homebrew or associated packages. 

If you're not comfortable allowing this script to prompt you for ``` sudo ``` access, feel free to copy/paste the commands you want out of this script into the Terminal as you see fit.

## Mac OS X Modifications

All of the following are commands that you can enter directly into Terminal or let the script run for you.

### Modify Finder Preferences

#### Show Library Folder in Finder

``` chflags nohidden ~/Library ```

#### Show Hidden Files in Finder

``` defaults write com.apple.finder AppleShowAllFiles YES ```

#### Show Path Bar in Finder

``` defaults write com.apple.finder ShowPathbar -bool true ```

#### Show Status Bar in Finder

``` defaults write com.apple.finder ShowStatusBar -bool true ``` 

### Terminal Tools

All of the following are commands that you can enter directly into Terminal or let the script run for you. 

Install the following terminal tools:

[Homebrew](https://brew.sh/)

  ``` shell
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
  ```

[Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-WHAT_IS_THE_COMMAND_LINE_TOOLS_PACKAGE_)

``` shell
brew config
brew update
brew upgrade
```

[iTerm2](https://www.iterm2.com/)

  ``` shell
  brew cask install iterm2 
  ```
  
[oh-my-zsh](https://ohmyz.sh/)

  ``` shell
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
  ```

Git

``` shell
brew install git
```

[Powerline fonts](https://github.com/powerline/fonts)

``` shell
git clone https://github.com/powerline/fonts.git
cd fonts
sh -c ./install.sh
```

Ruby

``` shell
brew install ruby
echo "Adding the brew ruby path to shell config..."
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >>~/.bash_profile
```

[Nmap](https://nmap.org/)

``` shell
brew install nmap
```

[Speedtest-cli](https://github.com/sivel/speedtest-cli)

``` shell
brew install speedtest_cli
```

### Additional Applications

All of the following are commands that you can enter directly into Terminal or let the script run for you.

Install the following applications:

- [Alfred](https://www.alfredapp.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [1Password](https://1password.com/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- Caffeine (Keeps your screen on)
