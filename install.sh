#!/bin/sh
# Mostly just copy commands, so I'm okay with using /bin/sh

# First check for sudo privilages
fontdir=/usr/share/fonts/
configdir=$HOME/.config/

echo -e "This script requires sudo privilages in order to correctly install fonts"
[ "$UID" -eq 0 ] || exec sudo /bin/sh "$0" "$@"


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
echo "Copying .zshrc file to home directory..."
cp .zshrc ~/.zshrc
