#!/bin/sh

sudo pacman -S rofi alacritty polybar neovim maim firefox feh adobe-source-code-pro-fonts

if [ ! -f /usr/bin/yay ]; then
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si
	cd -
fi

yay -S --noconfirm nerd-fonts-complete i3lock-color

cp -r ./config/* ~/.config
cp i3/config ~/.i3/config
cp Xresources ~/.Xresources
echo "export TERMINAL=/usr/bin/alacritty" >> ~/.profile
echo "export BROWSER=/usr/bin/firefox" >> ~/.profile
