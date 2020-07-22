#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Setup Finder Commands
# Show Library Folder in Finder
chflags nohidden ~/Library

# Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Check for Homebrew, and then install it 
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installed successfully"
else
    echo "Homebrew already installed!"
fi

# Install XCode Command Line Tools
echo 'Checking to see if XCode Command Line Tools are installed...'
brew config

# Updating Homebrew.
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae.
echo "Upgrading Homebrew..."
brew upgrade

# Install iTerm2
echo "Installing iTerm2..."
brew cask install iterm2

# Update the Terminal
# Check for ZSH then change shells
if test ! $(zsh --version); then
    echo "Installing ZSH..."
    brew install zsh
    echo "Changing shells"
    chsh -s /bin/zsh
    echo "Check shell change"
    echo $SHELL
else
    echo "ZSH already installed!"
fi

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install ZSH Syntax Highlighting
echo "Installing ZSH Syntax Highlighting..."
brew install zsh-syntax-highlighting

# Install Git
echo "Installing Git..."
brew install git

# Install Powerline fonts
echo "Installing Powerline fonts..."
git clone https://github.com/powerline/fonts.git
cd fonts
sh -c ./install.sh


# Install ruby
if test ! $(which ruby); then
    echo "Installing Ruby..."
    brew install ruby
    echo "Adding the brew ruby path to shell config..."
    echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >>~/.bash_profile
else
    echo "Ruby already installed!"
fi

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install speedtest_cli

# Core casks
brew cask install --appdir="/Applications" alfred

# Development tool casks
brew cask install --appdir="/Applications" visual-studio-code

# Misc casks
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" 1password

# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
brew cleanup
echo "You're done!"
