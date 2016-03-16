#!/bin/sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install cask tap
brew tap caskroom/cask

# install cask command
brew install brew-cask

# install vagrant and virtualbox
brew cask install vagrant virtualbox