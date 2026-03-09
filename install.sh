#!/bin/bash

# Set up an AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install necessary packages
sudo pacman -S waybar fuzzel mako thunar thunar-archive-plugin fastfetch
paru -S matugen-bin sunsetr-bin

# Transfer configs
cp -r .config/fastfetch .config/fuzzel .config/kitty .config/mako .config/matugen .config/sunsetr .config/waybar ~/.config/

mkdir -r ~/.cache/minimalist_dotfiles/backups
zip -rm ~/.cache/minimalist_dotfiles/backups/old_hyprland_configs.zip ~/.config/hypr/*
cp .config/hypr/* ~/.config/hypr/

echo "Reboot your system."
