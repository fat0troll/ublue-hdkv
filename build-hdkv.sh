#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Ghostty
dnf5 -y install ghostty

# ...and remove Ptyxis. It's nice but I prefer another terminal.
dnf5 -y remove ptyxis

# Install vk-hdr-layer: temporary hack for Nvidia + HDR without gamescope
dnf5 -y install vk-hdr-layer
