#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install docker
rpm-ostree install docker-ce \
        docker-ce-cli \
        docker-buildx-plugin \
        docker-compose-plugin \
        containerd.io


# Install zsh and utilites for it
rpm-ostree install zsh \
        zsh-autosuggestions

# Install flatpak builder
rpm-ostree install flatpak-builder

# Install dependencies for Toshy
rpm-ostree install cairo-devel \
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
rpm-ostree install rsms-inter-fonts

# Install goverlay (why it doesn't ship with bazzite?!)
rpm-ostree install goverlay

# Enable docker socket
systemctl enable docker.socket

# Install ZSH configuration
cd /usr/share
git clone https://code.pztrn.name/hdkv/zsh-config.git
cd zsh-config
git checkout hdkv/ublue-hdkv
