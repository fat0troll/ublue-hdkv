#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install additional packages
dnf5 -y install dmg2img \
    python3-vkbasalt-cli \
    dotool \
    dwarfs \
    fsearch \
    qdirstat \
    git-lfs \
    binutils \
    perf \
    sysprof \
    virt-viewer \
    uv

# TODO: follow ngrok releases from AUR
wget --hsts-file /tmp/.wget-hsts -O /tmp/ngrok.tar.gz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*

# TODO: make sure these packages are also auto-updated!!
# maybe let dependabot handle those?
# amdgpu_top
dnf5 -y install https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.11.0/amdgpu_top-0.11.0-1.x86_64.rpm

# LSFG-VK
dnf5 -y install https://github.com/PancakeTAS/lsfg-vk/releases/download/v1.0.0/lsfg-vk-1.0.0.x86_64.rpm

# XPipe - TODO: Fix, yet another app that needs /opt/
# dnf5 -y install https://github.com/xpipe-io/xpipe/releases/latest/download/xpipe-installer-linux-x86_64.rpm
