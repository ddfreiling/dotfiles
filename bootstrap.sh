#!/usr/bin/env bash

SRC_PATH=$(realpath "${BASH_SOURCE}")
SRC_DIR=$(dirname "${BASH_SOURCE}")

cd "$SRC_DIR";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "cfg/" \
		--exclude "init/" \
		--exclude "scripts/" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
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

# Make symbolic links for files we change often

cd ~
echo $SRC_DIR/.bashrc
ln -sf $SRC_DIR/.bashrc .bashrc
ln -sf $SRC_DIR/.zshrc .zshrc
ln -sf $SRC_DIR/.wgetrc .wgetrc
ln -sf $SRC_DIR/.exports .exports
ln -sf $SRC_DIR/.aliases .aliases
ln -sf $SRC_DIR/.functions .functions
ln -sf $SRC_DIR/.extra .extra
ln -sf $SRC_DIR/.path .path
