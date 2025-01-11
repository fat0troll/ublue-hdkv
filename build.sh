#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install docker
dnf -y install docker-ce \
        docker-ce-cli \
        docker-buildx-plugin \
        docker-compose-plugin \
        containerd.io


# Install zsh and utilites for it
dnf -y install zsh \
        zsh-autosuggestions

# Install flatpak builder
dnf -y install flatpak-builder

# Install dependencies for Toshy
dnf -y install cairo-devel \
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
dnf -y install rsms-inter-fonts

# Install goverlay
dnf -y install goverlay

# Enable docker socket
systemctl enable docker.socket

# Install ZSH configuration
cd /usr/share
git clone https://code.pztrn.name/hdkv/zsh-config.git
cd zsh-config
git checkout hdkv/ublue-hdkv

# Cleanup (taken from achillobator)
# shellcheck disable=SC2115
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)
rm -rf /var/tmp
dnf clean all
