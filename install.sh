#!/bin/bash

echo << EOF
Ensure that you have navigated into hyprbasic folder before executing install.sh.

This will overwrite your existing configurations.

EOF

read -p "Proceed to installation? [y/n]: " proceed

if [ "$proceed" = 'y' ]; then

	# Set up an AUR helper
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si

	# Install necessary packages
	sudo pacman -S waybar fuzzel mako thunar thunar-archive-plugin alacritty hyprshot firefox
	paru -S matugen-bin sunsetr-bin python-pywalfox awww-bin

	# Transfer configs
	cp -r .config/* ~/.config/

	read -p "Include .bashrc? [y/n]: " bashrc
	read -p "Include .vimrc? [y/n]: " vimrc

	if [ "$bashrc" = 'y' ]; then
		cp -i .bashrc ~/
	fi

	if [ "$vimrc" = 'y' ]; then
		cp -i .vimrc ~/
	fi

	cat << 'EOF' 
	Post-installation instructions:
	1. Reboot your system.
	2. If you are using Firefox, add Pywalfox extension and run `pywalfox update` afterwards.

EOF
else 
	echo "Exiting..."
fi
