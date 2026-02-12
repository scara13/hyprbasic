#!/bin/bash

if [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]] && grep -qi "arch" /etc/os-release; then

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

	# Transfer configs
	cp -r .config/fuzzel .config/kitty .config/mako .config/matugen .config/sunsetr .config/waybar ~/.config/
	mkdir -r ~/.cache/minimalist_dotfiles/backups
	zip ~/.cache/minimalist_dotfiles/backups/old_hyprland_configs.zip ~/.config/hypr/*
	cp .config/hypr/* ~/.config/hypr/

	# Initiate matugen
	matugen -i wallpaper/7mSSR7w.png

elif [ "$XDG_CURRENT_DESKTOP" == "Sway" ] && grep -qi "debian|ubuntu" /etc/os-release; then 

	# Install necessary packages
	sudo apt install waybar fuzzel mako thunar thunar-archive-plugin
	curl https://sh.rustup.rs -sSf | sh
	cargo install matugen

	# Starship
	curl -sS https://starship.rs/install.sh | sh
	eval "$(starship init bash)"
	
	# Transfer configs
	cp -r .config/fuzzel .config/kitty .config/mako .config/matugen .config/sunsetr .config/waybar ~/.config/

	# Initiate matugen
	matugen -i wallpaper/7mSSR7w.png

else

echo "Not supported"

fi
