#!/bin/sh
# Mostly just copy commands, so I'm okay with using /bin/sh


# User identification for home folder
user="$(id -u 1000 -n)"

# Directories
fontdir=/usr/share/fonts/
homedir=/home/$user
configdir=$homedir/.config/
desktopdir=$homedir/.local/share


# Check for root status
[ "$UID" -eq 0 ] || exec sudo /bin/sh "$0" "$@"


# Check for existence of sway, waybar, and alacritty config directories
# If they don't exist, make them (and save some trouble later)
[ ! -d "$configdir/sway" ] && mkdir -p $configdir/sway && echo "Made directory for sway config at $configdir/sway"
[ ! -d "$configdir/waybar" ] && mkdir -p $configdir/waybar && echo "Made directory for waybar config at $configdir/waybar"
[ ! -d "$configdir/alacritty" ] && mkdir -p $configdir/alacritty && echo "Made directory for alacritty config at $configdir/alacritty"
[ ! -d "$desktopdir" ] && mkdir -p $desktopdir && echo "Made local desktop directory at $desktopdir"


# Copy over the configuration directories to their new homes
echo "Copying sway directory to $configdir..."
cp -r sway $configdir

echo "Copying waybar directory to $configdir..."
cp -r waybar $configdir

echo "Copying applications directory to $desktopdir..."
cp -r applications $desktopdir

echo "Copying SFMono font directory to $fontdir..."
cp -r SFMono $fontdir

echo "Copying SFUIDisplay font directory to $fontdir..."
cp -r SFUIDisplay $fontdir

echo "Copying SFUIText font directory to $fontdir..."
cp -r SFUIText $fontdir

echo "Copying .zshrc file to $homedir..."
cp .zshrc $homedir/.zshrc

echo "Done!"
