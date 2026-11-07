#!/bin/bash

set -ouex pipefail

# Install additional packages
dnf5 -y install dmg2img \
    python3-vkbasalt-cli \
    qdirstat \
    git-lfs \
    binutils \
    perf \
    sysprof \
    virt-viewer \
    uv \
    android-tools \
    qemu-ui-dbus \
    qemu-audio-dbus \
    systemd-devel \
    libusb1-devel

# Install darkly and klassy
dnf5 install -y \
    --enable-repo="terra" \
    darkly klassy

# Install dwarfs
dnf5 -y copr enable jc141/DwarFS
dnf5 -y install dwarfs
dnf5 -y copr disable jc141/DwarFS

# Install fsearch
dnf5 -y copr enable cboxdoerfer/fsearch
dnf5 -y install fsearch
dnf5 -y copr disable cboxdoerfer/fsearch

# renovate: datasource=docker depName=ngrok/ngrok extractVersion=^(?<version>\d+\.\d+\.\d+)-debian$
NGROK_VERSION=3.39.13
wget --hsts-file /tmp/.wget-hsts -O /tmp/ngrok.tar.gz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-${NGROK_VERSION}-linux-amd64.tgz"
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*

# amdgpu_top
# renovate: datasource=github-releases depName=Umio-Yasuno/amdgpu_top
AMDGPU_TOP_VERSION=v0.11.5
dnf5 -y install "https://github.com/Umio-Yasuno/amdgpu_top/releases/download/${AMDGPU_TOP_VERSION}/amdgpu_top-${AMDGPU_TOP_VERSION#v}-1.x86_64.rpm"

# LSFG-VK
# renovate: datasource=github-releases depName=PancakeTAS/lsfg-vk
LSFG_VK_VERSION=v1.0.0
dnf5 -y install "https://github.com/PancakeTAS/lsfg-vk/releases/download/${LSFG_VK_VERSION}/lsfg-vk-${LSFG_VK_VERSION#v}.x86_64.rpm"

# XPipe - TODO: Fix, yet another app that needs /opt/
# renovate: datasource=github-releases depName=xpipe-io/xpipe
XPIPE_VERSION=24.10
dnf5 -y install "https://github.com/xpipe-io/xpipe/releases/download/${XPIPE_VERSION}/xpipe-installer-linux-x86_64.rpm"
