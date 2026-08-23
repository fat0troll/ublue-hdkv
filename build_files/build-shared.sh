#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf5 install -y \
    --enable-repo="copr:copr.fedorainfracloud.org:ublue-os:packages" \
    ublue-setup-services

# Install docker
dnf5 config-manager addrepo --from-repofile="https://download.docker.com/linux/fedora/docker-ce.repo"
dnf5 config-manager setopt docker-ce-stable.enabled=0
dnf5 install -y \
    --enable-repo="docker-ce-stable" \
    docker-ce \
    docker-ce-cli \
    docker-buildx-plugin \
    docker-compose-plugin \
    containerd.io

# Install zsh and utilites for it
dnf5 -y install \
    zsh \
    zsh-autosuggestions

# Install flatpak builder
dnf5 -y install flatpak-builder

# Install Inter font
dnf5 -y install rsms-inter-fonts

# Install goverlay
dnf5 -y install goverlay

# Install VS Code
dnf5 config-manager addrepo --from-repofile="https://packages.microsoft.com/yumrepos/vscode/config.repo"
dnf5 config-manager setopt vscode-yum.enabled=0
dnf5 install -y \
    --enable-repo="vscode-yum" \
    code

# Install useful CLI tools
dnf5 -y install telnet

# Install ventoy
dnf5 -y copr enable karlisk/ventoy
dnf5 -y install ventoy
dnf5 -y copr disable karlisk/ventoy

# Enable services
systemctl enable docker.socket
systemctl enable podman.socket
systemctl enable ublue-system-setup.service
systemctl --global enable ublue-user-setup.service
systemctl enable ublue-hdkv-groups.service

# Install virtualization packages
dnf5 -y --setopt=install_weak_deps=False install \
    qemu \
    libvirt \
    qemu-kvm \
    virt-manager \
    edk2-ovmf \
    guestfs-tools


# Install ZSH configuration
cd /usr/share
git clone https://github.com/fat0troll/zsh-config.git
cd zsh-config
git checkout hdkv/ublue-hdkv

# Load iptable_nat module for docker-in-docker.
# See:
#   - https://github.com/ublue-os/bluefin/issues/2365
#   - https://github.com/devcontainers/features/issues/1235
mkdir -p /etc/modules-load.d && cat >>/etc/modules-load.d/ip_tables.conf <<EOF
iptable_nat
EOF
