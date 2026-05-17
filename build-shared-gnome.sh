#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install docker
dnf5 -y install docker-ce \
        docker-ce-cli \
        docker-buildx-plugin \
        docker-compose-plugin \
        containerd.io

# Install flatpak builder
dnf5 -y install flatpak-builder

# Install Inter font
dnf5 -y install rsms-inter-fonts

# Install VS Code
dnf5 -y install code

# Enable services
systemctl enable docker.socket
systemctl enable podman.socket

# Load iptable_nat module for docker-in-docker.
# See:
#   - https://github.com/ublue-os/bluefin/issues/2365
#   - https://github.com/devcontainers/features/issues/1235
mkdir -p /etc/modules-load.d && cat >>/etc/modules-load.d/ip_tables.conf <<EOF
iptable_nat
EOF
