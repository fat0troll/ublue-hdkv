#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable additional repos
dnf copr enable deltacopy/darkly

# Install additional packages
dnf -y install dmg2img \
    python3-vkbasalt-cli \
    darkly
