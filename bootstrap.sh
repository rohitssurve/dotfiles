#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
	# rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
	# 	--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	ln -s dotfiles/.bash_profile ~/.bash_profile
	ln -s dotfiles/.bashrc ~/.bashrc
	ln -s dotfiles/.bash_prompt ~/.bash_prompt
	ln -s dotfiles/.path ~/.path
	ln -s dotfiles/.exports ~/.exports
	ln -s dotfiles/.aliases ~/.aliases
	# source ~/.bash_profile;

	# Install Command Line Tools
	# xcode-select --install
	# Install the latest XCode and Accept License
	# sudo xcodebuild -license accept
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;