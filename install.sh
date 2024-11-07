#!/usr/bin/bash
# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

# Install packages.
<<<<<<< HEAD
yay -S pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse hyprland-git ttf-cascadia-code-nerd papirus-icon-theme-git stow sudo alacritty fish starship neovim wl-clipboard rofi-wayland qutebrowser
=======

yay -S pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse hyprland-git ttf-cascadia-code-nerd stow sudo alacritty fish starship neovim wl-clipboard rofi-wayland qutebrowser jq socat bluez bluez-utils brightnessctl pamixer
>>>>>>> feat/Eww

stow -R configs

# Fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && rm ~/.config/fish/functions/fisher.fish && fisher install jorgebucaran/fisher'
fish -c 'fisher install catppuccin/fish'
sudo pacman -S starship

<<<<<<< HEAD
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
=======
# Neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git ~/.config/nvim/.gitignore
>>>>>>> feat/Neovim
