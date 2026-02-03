#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install vk-hdr-layer: temporary hack for Nvidia + HDR without gamescope
dnf5 -y install vk-hdr-layer
