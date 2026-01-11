#!/bin/bash

# Set up an AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install necessary packages
sudo pacman -S waybar fuzzel mako
paru -S matugen-bin

# Starship
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"

# Configure colors
cp matugen .config/

# Manual or user configurations
"source = manual.conf" >> hyprland.conf
