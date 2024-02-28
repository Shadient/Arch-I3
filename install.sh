#!/usr/bin/env bash

cd ~
sudo pacman -Sy


#-------------------------------------------------------------------------
# DEPENDENCIES
#-------------------------------------------------------------------------

echo
echo "INSTALLING DEPENDENCIES"
echo

PKGSAUR=(
  'base-devel'
  'curl'
  'less'
  'ripgrep'
  'wget'
)

for PKGAUR in "${PKGSAUR[@]}"; do
  echo "INSTALLING: ${PKGAUR}"
  sudo pacman -S "$PKGAUR" --needed
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

  # -- AUDIO -- #

  'alsa-utils'
  'alsa-plugins'
  'pulseaudio'
  'pulseaudio-alsa'
  'pavucontrol'

  # -- COMMUNICATIONS --

  'discord'
  'telegram-desktop'

  # -- GPARTED --

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

  'alacritty'
  'bitwarden'
  'blender'
  'cmatrix'
  'flameshot'
  'kate'
  'man-db'
  'meson'
  'networkmanager'
  'obsidian'
  'okular'
  'polkit'
  'python-pip'
  'qbittorrent'
  'redshift'
  'rust'
  'tectonic'
  'thunar'
  'vlc'
  'zathura'

  # -- TERMINAL UTILITIES --

  'btop'
  'brightnessctl'
  'gtop'
  'htop'
  'neofetch'

)

for PKG in "${PKGS[@]}"; do
  echo "INSTALLING: ${PKG}"
  sudo pacman -S "$PKG" --needed
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
paru -S eww
paru -S bitwig-studio

#-------------------------------------------------------------------------
# ADDITIONAL
#-------------------------------------------------------------------------

echo
echo "Done!"
echo
