#!/usr/bin/env bash

# Automated Mac Setup Script - Updated Oct 2024
# This script installs essential command-line tools and applications using Homebrew.

# Enable strict mode for safety
set -euo pipefail

# Log the start of the script execution
echo "[$(date)] Starting Mac setup..."

# Request and keep the administrator password active.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check the system processor: M1/M2/M3 (ARM) or Intel.
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    echo "[$(date)] M1/M2/M3 Processor detected. Proceeding with compatible installations."
else
    echo "[$(date)] Intel Processor detected. Proceeding with installations."
fi

# Homebrew Installation: Install Homebrew if not already installed.
echo "[$(date)] Checking for Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
    echo "[$(date)] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH
    echo "[$(date)] Adding Homebrew to PATH..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "[$(date)] Homebrew already installed."
fi

# Update and Upgrade Homebrew: Ensure Homebrew is up-to-date.
echo "[$(date)] Updating and Upgrading Homebrew..."
brew update
brew upgrade

# XCode Command Line Tools: Install if not already present.
echo "[$(date)] Checking for Xcode Command Line Tools..."
if ! xcode-select -p >/dev/null 2>&1; then
    echo "[$(date)] Installing Xcode Command Line Tools..."
    xcode-select --install
else
    echo "[$(date)] Xcode Command Line Tools already installed."
fi

# Finder Configuration: Set up Finder preferences like showing hidden files.
echo "[$(date)] Configuring Finder settings..."
chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Restart Finder to apply changes using AppleScript.
osascript -e 'tell application "Finder" to quit'
osascript -e 'tell application "Finder" to launch'

# Terminal and Shell Setup: Install iTerm2 and Oh My Zsh.
echo "[$(date)] Installing iTerm2..."
brew install --cask --appdir="/Applications" iterm2
echo "[$(date)] Installing oh-my-zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure .zshrc for Oh My Zsh
echo "[$(date)] Configuring .zshrc for Oh My Zsh..."
sed -i '' 's/^ZSH_THEME=".*"$/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i '' 's/^plugins=(.*)$/plugins=(brew macos)/' ~/.zshrc
echo 'ZSH_DISABLE_COMPFIX="true"' >> ~/.zshrc
echo '# Disabling compfix to prevent the "insecure directories" warning when starting zsh' >> ~/.zshrc
cat << 'EOF' >> ~/.zshrc

# Add my custom functions and settings here.
preexec() {
  timer=$(gdate +%s.%N)
}

precmd() {
  if [ -n "$timer" ]; then
    now=$(gdate +%s.%N)
    elapsed=$(echo "$now - $timer" | bc)
    timer_show=$(printf "%.2f" $elapsed)
    echo "Execution time: ${timer_show}s"
    unset timer
  fi
}
EOF

# Powerline Fonts Installation: Clone and install Powerline fonts.
echo "[$(date)] Installing Powerline fonts..."
if [ ! -d "$HOME/fonts" ]; then
    git clone https://github.com/powerline/fonts.git "$HOME/fonts"
    pushd "$HOME/fonts" && ./install.sh && popd
else
    echo "[$(date)] Powerline fonts already installed."
fi

# Python and pip Installation: Install Python and pip (pip is included with Python).
echo "[$(date)] Checking for Python..."
if ! command -v python3 >/dev/null 2>&1; then
    echo "[$(date)] Installing Python..."
    brew install python
else
    echo "[$(date)] Python already installed."
fi

# Core Applications Installation: Install essential applications using Homebrew.
echo "[$(date)] Installing core applications..."
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" 1password

# Clean up: Remove outdated versions from the cellar.
echo "[$(date)] Running brew cleanup..."
brew cleanup

# Ensure successful completion
echo "[$(date)] Mac setup script completed successfully."
exit 0
