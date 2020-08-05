# YANMSS (Yet Another New Mac Setup Script)

## About

This setup script is for modifying some default settings on Mac OS X, installing some of my preferred Terminal tools, and a few applications.

Please feel free to fork and/or add issues/PRs to help make this work better for everyone.

### Installation with Curl

To install this script from a brand new Mac (fresh out of the box!) run the following command in terminal:

``` shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mikeprivette/new-mac-setup/master/setup.sh)"
```

**Want to know what ```curl -fsSL``` stands for? Checkout this [link](https://explainshell.com/explain?cmd=curl+-fsSL+example.org#).**

If you do not already have Xcode Command Line Tools installed, you will be prompted to install them after being prompted for ```sudo``` access.

### Why ask for sudo access?

You'll need ```sudo``` access to do the initial Finder modifications, but it is not required to install Homebrew or associated packages.

If you're not comfortable allowing this script to prompt you for ```sudo``` access, feel free to copy/paste the commands you want out of this script into the Terminal as you see fit.

## Mac OS X Modifications

All of the following are commands that you can enter directly into Terminal or let the script run for you.

### Modify Finder Preferences

#### Show Library Folder in Finder

``` shell
chflags nohidden ~/Library
```

#### Show Hidden Files in Finder

``` shell
defaults write com.apple.finder AppleShowAllFiles YES
```

#### Show Path Bar in Finder

``` shell
defaults write com.apple.finder ShowPathbar -bool true
```

#### Show Status Bar in Finder

``` shell
defaults write com.apple.finder ShowStatusBar -bool true
```

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

If you're familiar with Xcode or Homebrew, you probably realized that the commands above do not directly install Xcode Command Line Tools, but rather just prompt you for installation of said tools.

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

[Alfred](https://www.alfredapp.com/)

``` shell
brew cask install --appdir="/Applications" alfred
```

[Visual Studio Code](https://code.visualstudio.com/)

``` shell
brew cask install --appdir="/Applications" visual-studio-code
```

[Firefox](https://www.mozilla.org/en-US/firefox/new/)

``` shell
brew cask install --appdir="/Applications" firefox
```

[Slack](https://slack.com/)

``` shell
brew cask install --appdir="/Applications" slack
```

[1Password](https://1password.com/)

``` shell
brew cask install --appdir="/Applications" 1password
```

Caffeine (Keeps your screen on)

``` shell
brew cask install --appdir="/Applications" caffeine
```

### Clean Up

Run the ``` brew ``` cleanup script and remove old or unneeded casks

``` shell
brew cleanup
```

### Post Script Actions

I have not yet figured out to automate the post script actions for some of these installations, so there are a few more steps to manually complete.

#### Enable Any Oh My Zsh Plugins

Oh My Zsh comes with a ton of plugins you can take advantage of. Here is the [wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) page.

Open your ``` ~/.zshrc ``` file via Terminal

``` shell
open ~/.zshrc
```

Find and edit the plugins section to add the ones you want

``` shell
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew ruby osx)
```

#### Set the Oh My Zsh Theme

Open your ``` ~/.zshrc ``` file via Terminal

``` shell
open ~/.zshrc
```

Modify the theme. You can find a list of the themes [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes.) I personally like the [agnoster](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster) theme.

``` shell
ZSH_THEME="agnoster"
```

Make sure to save and close the file after editing. You may have quit and reopen iTerm2 for the theme to take effect.

To make the Agnoster theme look the way it does on the wiki page you have to go to:

- Open iTerm2
- Select Preferences
- Click Profile
- Click Colors
- Change "Color Presets" to "Solarized Dark"
- While still in the same window as above, click "Text"
- Click on the dropdown under Font and select any font with "Powerline" in it. I chose "Meslo LG DZ for Powerline"
