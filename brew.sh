#!/usr/bin/env bash

set -x

# Install the latest XCode and Accept License
sudo xcodebuild -license accept

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# In order to use this build of bash as your login shell, it must be added to /etc/shells
brew install bash
brew install bash-completion

brew install mobile-shell
brew install csshx

brew cask install --appdir="/Applications" iterm2

# Install command-line fuzzy finder
# https://github.com/junegunn/fzf
brew install fzf
/usr/local/opt/fzf/install -all

brew install autoenv

# Install GNU core utilities (those that come with OS X are outdated).
# https://en.wikipedia.org/wiki/GNU_Core_Utilities
brew install coreutils
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
# https://www.gnu.org/software/binutils/binutils.html
brew install binutils
# https://www.gnu.org/software/diffutils/
brew install diffutils
# http://www.gnu.org/software/findutils/
brew install findutils

brew install gnu-sed
brew install gnu-tar
brew install gnu-which
brew install grep
brew install gzip
brew install wget

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install Network tools.
brew install nmap
# http://www.dest-unreach.org/socat/doc/socat.html
brew install socat
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install httpstat

# Git
brew install git
# https://github.com/github/git-lfs
brew install git-lfs


# https://github.com/sindresorhus/dark-mode
brew install dark-mode

# https://www.ivarch.com/programs/pv.shtml
brew install pv

# https://github.com/sivel/speedtest-cli
brew install speedtest_cli

brew install tree

# http://www.jacobtomlinson.co.uk/2013/01/24/ssh-copy-id-os-x/
brew install ssh-copy-id

# brew install phantomjs
# http://iamsteve.me/blog/entry/using-webkit2png-to-generate-responsive-screenshots
brew install webkit2png

# https://openssl.org/
brew install openssl

brew cask install --appdir="/Applications" cheatsheet

brew cask install --appdir="/Applications" caffeine

brew cask install --appdir="/Applications" spectacle

brew cask install --appdir="/Applications" jumpcut

brew cask install --appdir="/Applications" lastpass
# brew cask install --appdir="/Applications" 1password

# brew cask install --appdir="/Applications" evernote

brew cask install --appdir="/Applications" filezilla

# brew cask install --appdir="/Applications" vmware-fusion
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" vagrant-manager

brew install docker

# brew cask install --appdir="/Applications" google-chrome
# brew cask install --appdir="/Applications" firefox

# brew cask install --appdir="/Applications" google-drive
# brew cask install --appdir="/Applications" dropbox

# brew cask install --appdir="/Applications" google-hangouts
# brew cask install --appdir="/Applications" skype

brew cask install --appdir="/Applications" slack
# brew cask install --appdir="/Applications" adium

# brew cask install --appdir="/Applications" teamviewer

# brew install graphviz
# brew cask install --appdir="/Applications" doxygen

# brew cask install --appdir="/Applications" lightpaper

# brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" sublime-text
# brew cask install --appdir="/Applications" intellij-idea
# brew cask install --appdir="/Applications" eclipse-java
# brew cask install --appdir="/Applications" webstorm
brew cask install --appdir="/Applications" pycharm
# brew cask install --appdir="/Applications" phpstorm
# brew cask install --appdir="/Applications" rstudio

# brew cask install --appdir="/Applications" skitch

# brew cask install --appdir="/Applications" picasa

brew cask install --appdir="/Applications" vlc

# brew cask install --appdir="/Applications" wireshark

# brew cask install --appdir="/Applications" transmission
# brew cask install --appdir="/Applications" utorrent

# brew cask install --appdir="/Applications" gopro-studio


brew cask install --appdir="/Applications" adobe-reader


# brew cask install --appdir="/Applications" elasticwolf


# brew cask install --appdir="/Applications" p4v
brew cask install --appdir="/Applications" sourcetree

# Python
brew install pyenv
# pyenv install 3.7
# pip3 install virtualenvwrapper

# Java
brew install Caskroom/cask/java
# https://github.com/gcuisinier/jenv
brew tap jenv/jenv
brew install jenv

# brew install maven

# sbt is a build tool for Scala, Java, and more
# brew install sbt

# Go
# brew install go

# NodeJS
# brew install nvm
# brew install node
# brew install npm

# brew cask install --appdir="/Applications" xampp

# brew install mysql
brew install postgresql
# brew cask install --appdir="/Applications" mysqlworkbench
brew cask install --appdir="/Applications" dbeaver-community
# brew install mongodb
# brew cask install --appdir="/Applications" robomongo
brew install redis
# brew install cassandra

# brew install mesos

# brew install nginx

# brew install zookeeper

# brew install kafka
# brew install kafkacat

brew install apache-spark

# brew install elasticsearch
# brew install kibana
# brew install logstash

# Remove outdated versions from the cellar.
brew cleanup
