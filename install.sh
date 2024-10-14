#!/usr/bin/bash
# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

# Install packages.
yay -S pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse hyprland-git ttf-cascadia-code-nerd stow sudo alacritty fish starship neovim wl-clipboard rofi-wayland qutebrowser

stow -R configs

# Fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && rm ~/.config/fish/functions/fisher.fish && fisher install jorgebucaran/fisher'
fish -c 'fisher install catppuccin/fish'
sudo pacman -S starship
