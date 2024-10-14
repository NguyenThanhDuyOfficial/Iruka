#!/usr/bin/bash
stow -R configs

# Fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && rm ~/.config/fish/functions/fisher.fish && fisher install jorgebucaran/fisher'



