#!/usr/bin/env bash

set -x

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# In order to use this build of bash as your login shell, it must be added to /etc/shells
brew install bash
brew install bash-completion

# brew install mobile-shell
# brew install csshx

brew cask install --appdir="/Applications" iterm2

# Install command-line fuzzy finder
# https://github.com/junegunn/fzf
brew install fzf
/usr/local/opt/fzf/install --all

brew install autoenv

# Install GNU core utilities (those that come with OS X are outdated).
# https://en.wikipedia.org/wiki/GNU_Core_Utilities
brew install coreutils
# https://www.gnu.org/software/binutils/binutils.html
brew install binutils
# https://www.gnu.org/software/diffutils/
brew install diffutils
# http://www.gnu.org/software/findutils/
brew install findutils

brew install wget
brew install gnu-sed
brew install grep
brew install gnu-which

brew install zlib
brew install gzip
brew install gnu-tar


# Git
brew install git
# https://github.com/github/git-lfs
brew install git-lfs

# https://www.ivarch.com/programs/pv.shtml
brew install pv

brew install tree

# http://www.jacobtomlinson.co.uk/2013/01/24/ssh-copy-id-os-x/
brew install ssh-copy-id

# https://openssl.org/
brew install openssl

brew install --cask --appdir="/Applications" jumpcut
brew install --cask --appdir="/Applications" caffeine
brew install --cask --appdir="/Applications" spectacle
brew install --cask --appdir="/Applications" rectangle

# brew install --cask --appdir="/Applications" filezilla

# brew install --cask --appdir="/Applications" vmware-fusion
# brew install --cask --appdir="/Applications" virtualbox
# brew install --cask --appdir="/Applications" vagrant
# brew install --cask --appdir="/Applications" vagrant-manager

# brew install docker

brew install --cask --appdir="/Applications" slack

# brew cask install --appdir="/Applications" atom
brew install --cask --appdir="/Applications" sublime-text
# brew cask install --appdir="/Applications" intellij-idea
# brew cask install --appdir="/Applications" eclipse-java
brew install --cask --appdir="/Applications" pycharm

brew install --cask --appdir="/Applications" vlc

# brew cask install --appdir="/Applications" gopro-studio

brew install --cask --appdir="/Applications" adobe-reader

# brew cask install --appdir="/Applications" p4v
brew install --cask --appdir="/Applications" sourcetree

# Python
brew install pyenv
brew install jupyterlab

# Java
brew install Caskroom/cask/java
# https://github.com/gcuisinier/jenv
brew tap jenv/jenv
brew install jenv

# NodeJS
brew install node

# brew install mysql
brew install postgresql
brew install --cask --appdir="/Applications" dbeaver-community

# brew install redis
# brew install zookeeper
# brew install kafka
# brew install kafkacat

brew install apache-spark
# brew install mesos

# brew install elasticsearch
# brew install kibana
# brew install logstash

# Remove outdated versions from the cellar.
brew cleanup
