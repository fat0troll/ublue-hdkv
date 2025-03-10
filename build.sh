#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install docker
dnf5 -y install docker-ce \
        docker-ce-cli \
        docker-buildx-plugin \
        docker-compose-plugin \
        containerd.io


# Install zsh and utilites for it
dnf5 -y install zsh \
        zsh-autosuggestions

# Install flatpak builder
dnf5 -y install flatpak-builder

# Install dependencies for Toshy
dnf5 -y install cairo-devel \
        cairo-gobject-devel \
        dbus-devel \
        evtest \
        git \
        gobject-introspection-devel \
        python3-devel \
        python3-tkinter \
        systemd-devel \
        wayland-devel \
        xset

# Install Inter font
dnf5 -y install rsms-inter-fonts

# Install goverlay
dnf5 -y install goverlay

# Install VS Code
dnf5 -y install code

# Install Kleopatra natively
dnf5 -y install kleopatra

# Install konsole
# TODO: unmask it
dnf5 -y install konsole

# Install useful CLI tools
dnf5 -y install telnet

# Install darkly and klasy
dnf5 -y install darkly # klassy is not ready for Plasma 6.3 yet

# Install mingw64-gcc for Nikke
dnf5 -y install mingw64-gcc mingw32-gcc

# Enable docker socket
systemctl enable docker.socket

# Install ZSH configuration
cd /usr/share
git clone https://code.pztrn.name/hdkv/zsh-config.git
cd zsh-config
git checkout hdkv/ublue-hdkv
