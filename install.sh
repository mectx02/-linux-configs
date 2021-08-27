#!/bin/sh


# User identification for home fulder
user="$(id -u 1000 -n)"

# Directories
fontdir=/usr/share/fonts
homedir=/home/$user
configdir=$homedir/.config
desktopdir=$homedir/.local/share


# Check for root status
if [ "$UID" -eq 0 ]; then
	echo "Not run as root; may have some issues copying files..."
fi

# Check for existence of desired programs
if [ -e "/usr/bin/sway" ]; then
	if [ ! -d "$configdir/sway" ]; then
		mkdir -p $configdir/sway
		echo "Made directory for detected swaywm"
	fi
fi


if [ -e "/usr/bin/waybar" ]; then
	if [ ! -d "$configdir/waybar" ]; then
		mkdir -p $configdir/waybar
		echo "Made directory for detected waybar"
	fi
fi


if [ -e "/usr/bin/alacritty" ]; then
	if [ ! -d "$configdir/alacritty" ]; then
		mkdir -p $configdir/alacritty
		echo "Made directory for detected alacritty"
	fi
fi


if [ -e "/usr/bin/firefox" ]; then
	if [ ! -d "$desktopdir/applications" ]; then
		mkdir -p $desktopdir/applications
		echo "Made directory for applications"
	fi
fi


# Copy over files to their intended directories (if they exist)
if [ -e "$configdir/sway" ]; then
	echo "Copying sway directory..."
	cp -r sway-wm/sway $configdir/
fi

if [ -e "$configdir/waybar" ]; then
	echo "Copying waybar directory..."
	cp -r sway-wm/waybar $configdir/
fi

if [ -e "$configdir/i3" ]; then
	echo "Copying i3 directory..."
	cp -r i3-wm/* $configdir/
fi

if [ -e "$configdir/alacritty" ]; then
	echo "Copying alacritty directory..."
	cp -r alacritty $configdir/
fi

if [ -e "/usr/bin/firefox" ] && [ -e "/usr/bin/Xwayland" ]; then
	echo "Copying firefox.desktop file..."
	cp applications/firefox.desktop $desktopdir/applications/firefox.desktop
fi

if [ -e "/usr/share/fonts/SF*" ]; then
	echo "WARNING: THIS MIGHT FAIL!"
	echo "Copying SF fonts..."
	cp -r fonts/* /usr/share/fonts/
fi

echo "Copying .zshrc file to home directory..."
cp .zshrc $homedir/.zshrc

echo "Done!"
