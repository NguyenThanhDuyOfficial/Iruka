abbr --add gs git status
abbr --add gb git branch
abbr --add gc git checkout
abbr --add ga git add
abbr --add gcm git commit -m
abbr --add gp git push

set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim

source ~/.config/theme/fish.fish
starship init fish | source
