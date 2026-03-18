#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install Ghostty
dnf5 -y install ghostty

# ...and remove Ptyxis and Konsole. It's nice but I prefer another terminal.
dnf5 -y remove ptyxis konsole

# Install vk-hdr-layer: temporary hack for Nvidia + HDR without gamescope
dnf5 -y install vk-hdr-layer

# Install bazaar development dependencies
dnf5 -y install meson \
        cmake \
        blueprint-compiler \
        appstream-devel \
        gtk4-devel \
        libadwaita-devel \
        flatpak-devel \
        glycin-devel \
        glycin-gtk4-devel \
        libyaml-devel \
        libsoup \
        libsoup-devel \
        libdex-devel \
        libxmlb-devel \
        json-glib-devel \
        md4c-devel \
        webkitgtk6.0 \
        webkitgtk6.0-devel \
        libsecret-devel

# Dependencies for https://github.com/go-gl/glfw
dnf5 -y install libX11-devel \
        libXcursor-devel \
        libXrandr-devel \
        libXinerama-devel \
        libXi-devel \
        libXxf86vm-devel \
        libglvnd-devel
