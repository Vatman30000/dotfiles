#!/bin/bash

# Arch Linux package installation script
# For development, media, gaming on Intel CPU
# Run: bash install-packages.sh

set -e # Exit on error

echo "======================================="
echo "Arch Linux Package Installation Script"
echo "======================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running on Arch
if [ ! -f /etc/arch-release ]; then
  echo -e "${YELLOW}Warning: This script is optimized for Arch Linux${NC}"
  read -p "Continue anyway? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Update system
echo -e "${GREEN}[1/4] Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Official repositories packages
echo -e "${GREEN}[2/4] Installing packages from official repos...${NC}"

PACMAN_PACKAGES=(
  # Development
  "neovim"
  "git"
  "base-devel"
  "rustup"
  "nodejs"
  "python"
  "shellcheck"
  "sqlite"

  # Utilities
  "btop"
  "fd"
  "fzf"
  "jq"
  "ripgrep"
  "stow"
  "bat"
  "eza"
  "zoxide"
  "zsh"
  "tree"
  "curl"
  "wget"
  "openssh"
  "vim"

  # Media/Graphics/Fonts
  "ffmpeg"
  "imagemagick"
  "pandoc"
  "tesseract"
  "ttf-jetbrains-mono-nerd"
  "noto-fonts"
  "noto-fonts-cjk"

  # Intel GPU drivers
  "intel-media-driver"
  "libva-intel-driver"
  "vulkan-intel"
  "intel-compute-runtime"

  # X11/Display
  "xorg-server"
  "xorg-xinit"
  "xorg-xev"
  "picom"
  "rofi"
  "nitrogen"

  # Audio/System
  "pulseaudio"
  "pavucontrol"
  "alsa-utils"
  "networkmanager"

  # Archive tools
  "unzip"
  "p7zip"
  "unrar"
  "tar"

  # Other
  "firefox"
  "vlc"
  "transmission-qt"
  "syncthing"
  "htop"
  "lsof"
  "strace"
)

sudo pacman -S --noconfirm "${PACMAN_PACKAGES[@]}"

# AUR packages via paru
echo -e "${GREEN}[3/4] Installing AUR helper (paru)...${NC}"

if ! command -v paru &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd ..
  rm -rf paru
else
  echo "paru is already installed"
fi
echo "Installing uv (Python package manager)..."
curl -LsSf https://astral.sh/uv/install.sh | env INSTALLER_NO_MODIFY_PATH=1 sh

# Добавим ~/.local/bin в PATH, если его там нет
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >>"$HOME/.zshenv"
fi

# AUR packages
echo -e "${GREEN}[4/4] Installing packages from AUR...${NC}"

AUR_PACKAGES=(
  "lazygit"
  "starship"
  "thefuck"
  "yazi"
  "zellij"
  "visual-studio-code-bin"
  "telegram-desktop"
  "copyq"
  "flameshot"
)

for pkg in "${AUR_PACKAGES[@]}"; do
  echo "Installing $pkg..."
  paru -S --noconfirm "$pkg" || echo "Failed to install $pkg, skipping..."
done

# Optional: Enable services
echo -e "${GREEN}Enabling system services...${NC}"
sudo systemctl enable --now syncthing@$USER

# Shell setup
echo -e "${GREEN}Setting up shell...${NC}"
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "Changed default shell to zsh (restart terminal to apply)"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Installation complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Next steps:"
echo "1. Restart your terminal to apply shell changes"
echo "2. Setup rustup: rustup install stable"
echo "3. Install npm packages globally if needed"
echo "4. Configure your .zshrc for shell customization"
echo ""
echo "To use Docker without sudo:"
echo "  log out and log back in, or: newgrp docker"
echo ""
