This repo contains my minimal config files for working on random servers for the following programs:
- bash
- emacs

I use [GNU stow](https://www.gnu.org/software/stow/) to manage my config files. GNU Stow works by creating symlinks and thus placing config files in the locations that each application specifies for configuration files. For example running `stow emacs` when in the root folder of this repo will create a symlink of the `.emacs.d` directory in the home directory by default, meaning all of the eamcs configuration with the `dotfiles/emacs/` directory are now accessible where Emacs expects to find them such as ~/.emacs.d./init.el`.
