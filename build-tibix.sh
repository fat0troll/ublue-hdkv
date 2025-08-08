#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install additional packages
dnf5 -y install dmg2img \
    python3-vkbasalt-cli \
    dotool \
    dwarfs \
    fsearch \
    ksysguard6 \
    qdirstat \
    git-lfs \
    binutils \
    perf

# TODO: follow ngrok releases from AUR
wget --hsts-file /tmp/.wget-hsts -O /tmp/ngrok.tar.gz https://bin.equinox.io/a/9VU6NY9RyvK/ngrok-v3-3.19.1-linux-amd64.tar.gz
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*

# TODO: make sure these packages are also auto-updated!!
# maybe let dependabot handle those?
# amdgpu_top
dnf5 -y install https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.10.4/amdgpu_top-0.10.4-1.x86_64.rpm

# HowToConvert
dnf5 -y install https://static.tibix.hdkv.online/How.to.Convert-1.0.5-1.x86_64.rpm

# LSFG-VK
dnf5 -y install https://github.com/PancakeTAS/lsfg-vk/releases/download/v1.0.0/lsfg-vk-1.0.0.x86_64.rpm

# XPipe - TODO: Fix, yet another app that needs /opt/
# dnf5 -y install https://github.com/xpipe-io/xpipe/releases/latest/download/xpipe-installer-linux-x86_64.rpm
