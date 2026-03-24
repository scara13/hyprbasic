#!/bin/bash

# Set up an AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install necessary packages
sudo pacman -S waybar fuzzel mako thunar thunar-archive-plugin fastfetch alacritty
paru -S matugen-bin sunsetr-bin

# Transfer configs
cp -r .config/fastfetch .config/fuzzel .config/alacritty .config/mako .config/matugen .config/sunsetr .config/waybar ~/.config/

mkdir -r ~/.cache/hyprbasic/backups
zip -rm ~/.cache/hyprbasics/backups/old_hyprland_configs.zip ~/.config/hypr/*
cp .config/hypr/* ~/.config/hypr/

echo "Reboot your system."
