#!/usr/bin/bash
stow -R configs

# Fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && rm ~/.config/fish/functions/fisher.fish && fisher install jorgebucaran/fisher'
fish -c 'fisher install catppuccin/fish'
sudo pacman -S starship

# Neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git ~/.config/nvim/.gitignore
