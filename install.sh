#!/bin/bash

# Set up an AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install necessary packages
sudo pacman -S waybar fuzzel mako thunar thunar-archive-plugin fastfetch alacritty hyprshot
paru -S matugen-bin sunsetr-bin

# Transfer configs
cp -r .config/fastfetch .config/fuzzel .config/alacritty .config/mako .config/matugen .config/sunsetr .config/waybar ~/.config/

mkdir -r ~/.cache/hyprbasic/backups
zip -rm ~/.cache/hyprbasics/backups/old_hyprland_configs.zip ~/.config/hypr/*
cp .config/hypr/* ~/.config/hypr/

read -p "Include .bashrc? (y/n): " bashrc
read -p "Include .vimrc? (y/n): " vimrc

if [ "$bashrc" = "y" ]; then
	cp -i .bashrc ~/
fi

if [ "$vimrc" = "y" ]; then
	cp -i .vimrc ~/
fi

echo "Reboot your system."
