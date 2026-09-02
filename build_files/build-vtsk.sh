#!/bin/bash

set -ouex pipefail

# Install Ghostty
dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty
dnf5 -y copr disable scottames/ghostty

# ...and remove Konsole. It's nice but I prefer another terminal.
dnf5 -y remove konsole

# Install faugus
dnf -y copr enable faugus/faugus-launcher
dnf -y install faugus-launcher
dnf -y copr disable faugus/faugus-launcher

# ..and remove Lutris. I don't use it.
dnf -y remove lutris
