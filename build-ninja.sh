#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install additional packages
dnf5 -y install bpytop \
    coolercontrol \
    ghostty \
    gnome-system-monitor \
    htop \
    liquidctl \
    ksysguard6 \
    mc \
    ulauncher \
    xkill
