#!/bin/bash
# Install ajpkim dotfiles (bash, emacs, ranger) for working on servers.
# Assumes that the dotfiles repo is cloned at $HOME/.

cd $HOME/dotfiles

backup_file() {
    local file=$1
    if [ -e "$file" ]; then
        mv "$file" "$file.bak"
        echo "Backed up $file to $file.bak"
    fi
}
# Back up files if they exist
backup_file "$HOME/.bashrc"
backup_file "$HOME/.bash_profile"
backup_file "$HOME/.bash_aliases"

# Check if GNU stow is installed
if ! [ -x "$(command -v stow)" ]; then
    echo 'Error: GNU stow is not installed.'
    echo 'Please install GNU stow and then rerun the script.'
    exit 1
fi
# Using GNU stow to stow folders
stow emacs ranger bash

echo "Dotfiles installed."
