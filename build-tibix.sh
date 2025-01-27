#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install additional packages
dnf -y install dmg2img \
    python3-vkbasalt-cli \
    darkly

dnf -y install https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.10.1/amdgpu_top-0.10.1-1.x86_64.rpm
