#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Ghostty
dnf5 -y install ghostty

# ...and remove Ptyxis and Konsole. It's nice but I prefer another terminal.
dnf5 -y remove ptyxis konsole

# Dependencies for https://github.com/go-gl/glfw
dnf5 -y install libX11-devel libXcursor-devel \
        libXrandr-devel libXinerama-devel \
        libXi-devel libXxf86vm-devel \
        libglvnd-devel
