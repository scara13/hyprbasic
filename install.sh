#!/bin/bash

# Set up an AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install necessary packages
sudo pacman -S waybar fuzzel mako thunar thunar-archive-plugin
paru -S matugen-bin

# Starship
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"

# Manual or user configurations
"source = manual.conf" >> hyprland.conf

# Transfer configs
cp .config/* ~/.config/

# Initiate matugen
matugen -i wallpaper/7mSSR7w.png
