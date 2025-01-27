#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install additional packages
dnf -y install dmg2img \
    python3-vkbasalt-cli \
    darkly \
    dotool \
    dwarfs \
    libFAudio \
    fsearch \
    klassy \
    ksysguard6 \
    qdirstat

# TODO: follow ngrok releases from AUR
wget -O /tmp/ngrok.tar.gz https://bin.equinox.io/a/9VU6NY9RyvK/ngrok-v3-3.19.1-linux-amd64.tar.gz
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*

# TODO: make sure these packages are also auto-updated!!
# maybe let dependabot handle those?
# amdgpu_top
dnf -y install https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.10.1/amdgpu_top-0.10.1-1.x86_64.rpm

# Hydra Launcher
dnf -y install https://github.com/hydralauncher/hydra/releases/download/v3.1.5/hydralauncher-3.1.5.x86_64.rpm
