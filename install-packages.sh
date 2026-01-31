#!/usr/bin/env bash
set -e

# оф. репы
if [[ -f pkglist.txt ]]; then
  sudo pacman -S --needed - <pkglist.txt
fi

# AUR
if [[ -f pkglist-aur.txt ]]; then
  paru -S --needed - <pkglist-aur.txt
fi
