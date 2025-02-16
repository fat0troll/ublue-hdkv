#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install docker
rpm-ostree -y install docker-ce \
        docker-ce-cli \
        docker-buildx-plugin \
        docker-compose-plugin \
        containerd.io


# Install zsh and utilites for it
rpm-ostree -y install zsh \
        zsh-autosuggestions

# Install flatpak builder
rpm-ostree -y install flatpak-builder

# Install dependencies for Toshy
rpm-ostree -y install cairo-devel \
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
rpm-ostree -y install rsms-inter-fonts

# Install goverlay
rpm-ostree -y install goverlay

# Install VS Code
rpm-ostree -y install code

# Install Kleopatra natively
rpm-ostree -y install kleopatra

# Install konsole
# TODO: unmask it
rpm-ostree -y install konsole

# Install useful CLI tools
rpm-ostree -y install telnet

# Install darkly and klasy
rpm-ostree -y install darkly \
    klassy

# Install mingw64-gcc for Nikke
rpm-ostree -y install mingw64-gcc

# Enable docker socket
systemctl enable docker.socket

# Install ZSH configuration
cd /usr/share
git clone https://code.pztrn.name/hdkv/zsh-config.git
cd zsh-config
git checkout hdkv/ublue-hdkv
