#!/usr/bin/env bash

function print_help () {
	echo Look inside for available stuff
}

function base () {
	xbps-install -S base-system refind udisks2
}

function wm () {
	xbps-install -S \
		Waybar \
		alacritty \
		breeze-snow-cursor-theme \
		brightnessctl \
		fzf \
		git \
		go \
		grim \
		jq \
		liberation-fonts-ttf \
		redshift \
		slurp \
		sway \
		swayidle \
		swaylock \
		wl-clipboard \
		wofi
}

function term () {
	xbps-install -S \
		bat \
		bmon \
		fish-shell \
		htop \
		mdcat \
		neovim \
		python3 \
		ripgrep \
		starship \
		stow \
		tmux
}

function kicad () {
	xbps-install -S \
		kicad \
		kicad-footprints \
		kicad-library \
		kicad-packages3D \
		kicad-symbols \
		kicad-templates
}

function dev () {
	xbps-install -S \
		arduino-cli \
		clang \
		go
}

function emacs () {
	xbps-install -S \
		emacs-gtk2 \
		hunspell \
		hunspell-en_US \
		hunspell-pt_BR
}

function intel () {
	xbps-install -S \
		intel-gpu-tools \
		iwd \
		libva-intel-driver \
		intel-media-driver \
		mesa-intel-dri
}

function fonts () {
	xbps-install -S noto-fonts-ttf noto-fonts-emoji
}

function qt5 () {
	xbps-install -S qt5-wayland qt5ct
}

function qute () {
	qt5
	xbps-install -S qutebrowser pdf.js
}

function mozilla () {
	xbps-install -S firefox thunderbird
}

function libreoffice () {
	xbps-install -S \
		libreoffice \
		libreoffice-i18n-en-US \
		libreoffice-i18n-pt-BR
}

function pdf () {
	xbps-install -S zathura zathura-pdf-poppler
}

# Run function from script:
# https://stackoverflow.com/questions/8818119/how-can-i-run-a-function-from-a-script-in-command-line
# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  print_help
  exit 1
fi
