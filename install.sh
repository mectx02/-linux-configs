#!/bin/sh
# Mostly just copy commands, so I'm okay with using /bin/sh

# 
# Variables
# 

# User identification for home folder
user="$(id -u 1000 -n)"

# Directories
fontdir=/usr/share/fonts/
homedir=/home/$user
configdir=$homedir/.config/


# Check for root status
[ "$UID" -eq 0 ] || exec sudo /bin/sh "$0" "$@"

# Copy commands
echo "Copying sway directory to $configdir..."
cp -r sway $configdir
echo "Copying waybar directory to $configdir..."
cp -r waybar $configdir
echo "Copying SFMono font directory to $fontdir..."
cp -r SFMono $fontdir
echo "Copying SFUIDisplay font directory to $fontdir..."
cp -r SFUIDisplay $fontdir
echo "Copying SFUIText font directory to $fontdir..."
cp -r SFUIText $fontdir
echo "Copying .zshrc file to $homedir..."
cp .zshrc $homedir/.zshrc
echo "Done!"
