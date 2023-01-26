#!/bin/sh
DOTFILES="$HOME/Developer/.dotfiles"
MACOS="$HOME/Developer/.dotfiles/.macos"

echo "Setting up your Mac..."

# Sign in App Store first and install Xcode
if [[ "$(xcode-select --print-path > /dev/null 2>&1; echo $?)" -ne 0 ]]; then
  echo "Xcode not found... installing it!"
  echo "Re-run this script after Xcode installation is complete"
  xcode-select --install  >/dev/null 2>&1
  exit 1
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  #echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  #eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $MACOS/install/Brewfile
brew bundle --file $MACOS/install/Masfile

# Clone Github repositories
$MACOS/clone.sh

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
