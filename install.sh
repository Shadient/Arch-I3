#!/usr/bin/env bash

cd ~
sudo pacman -Sy


#-------------------------------------------------------------------------
# DEPENDENCIES
#-------------------------------------------------------------------------

echo
echo "INSTALLING DEPENDENCIES"
echo

PKGSDEP=(
  'base-devel'
  'glfw-x11'
  'phonon-qt5-gstreamer'
)

for PKGDEP in "${PKGSDEP[@]}"; do
  echo
  echo "INSTALLING: ${PKGDEP}"
  echo
  sudo pacman -S "$PKGDEP" --needed --noconfirm
done

# Install Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts
source ~/.bashrc


#-------------------------------------------------------------------------
# INSTALLING PACKAGES
#-------------------------------------------------------------------------

echo
echo "INSTALLING PACKAGES"
echo

PKGS=(

  # -- AUDIO --
  'alsa-utils'
  'alsa-plugins'
  'alsa-firmware'
  'pavucontrol'
  'pulseaudio'
  'pulseaudio-alsa'

  # -- GPARTED & DEPENDENCIES --
  'gparted'
  'btrfs-progs'   # for btrfs partitions
  'dosfstools'    # for FAT16 and FAT32 partitions
  'exfatprogs'    # for exFAT partitions
  'f2fs-tools'    # Flash-Friendly File System
  'gpart'         # for recovering corrupt partiton tables
  'jfsutils'      # for jfs partitions
  'mtools'        # utilities to access MS-DOS disks
  'nilfs-utils'   # for nilfs2 support
  'ntfs-3g'       # for ntfs partitions
  'reiserfsprogs' # for reiser partitions
  'udftools'      # for UDF file system support
  'xfsprogs'      # for xfs partitions
  
  # -- MISC --
  'acpi'
  'alacritty'
  'bitwarden'
  'blender'
  'brightnessctl'
  'btop'
  'chromium'
  'curl'
  'cmatrix'  
  'discord'
  'firefox'
  'flameshot'
  'git'
  'gtop'
  'htop'
  'kate'
  'less'
  # 'linux419-virtualbox-host-modules'
  'man-db'
  'meson'
  'neofetch'
  'neovim'
  'networkmanager'
  'obsidian'
  'okular'
  'perl'
  'polkit'
  'python-pip'
  'qbittorrent'
  'qt5-base'
  'qt6-base'
  'redshift'
  'ripgrep'
  'rust'
  'tectonic'
  'telegram-desktop'
  'ttf-jetbrains-mono-nerd'
  'thunar'
  # 'virtualbox'
  'vlc'
  'wget'
  'xdg-user-dirs'
  'zathura'
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING: ${PKG}"
  echo
  sudo pacman -S "$PKG" --needed --noconfirm
done

source ~/.bashrc


#-------------------------------------------------------------------------
# AUR PACKAGES
#-------------------------------------------------------------------------

echo
echo 'INSTALLING AUR PACKAGES'
echo

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~
source ~/.bashrc

paru -S etcher-bin
paru -S vscodium-bin
paru -S waterfox-bin
paru -S bitwig-studio

#-------------------------------------------------------------------------
# ADDITIONAL
#-------------------------------------------------------------------------

echo
echo "Done!"
echo
