#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf5 install --enable-repo="copr:copr.fedorainfracloud.org:ublue-os:packages" -y \
    ublue-setup-services

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

# Install useful CLI tools
dnf5 -y install telnet

# Install darkly and klassy
dnf5 -y install darkly # klassy is still broken

# Install mingw64-gcc for Nikke
dnf5 -y install mingw64-gcc mingw32-gcc

# Enable services
systemctl enable docker.socket
systemctl enable podman.socket
systemctl enable ublue-system-setup.service
systemctl --global enable ublue-user-setup.service

# Install ZSH configuration
cd /usr/share
git clone https://code.pztrn.name/hdkv/zsh-config.git
cd zsh-config
git checkout hdkv/ublue-hdkv

# Load iptable_nat module for docker-in-docker.
# See:
#   - https://github.com/ublue-os/bluefin/issues/2365
#   - https://github.com/devcontainers/features/issues/1235
mkdir -p /etc/modules-load.d && cat >>/etc/modules-load.d/ip_tables.conf <<EOF
iptable_nat
EOF
