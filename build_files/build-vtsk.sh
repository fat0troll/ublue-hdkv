#!/bin/bash

set -ouex pipefail

# Install Ghostty
dnf5 install -y \
    --enable-repo="terra" \
    ghostty ghostty-zsh-completion

# ...and remove Konsole. It's nice but I prefer another terminal.
dnf5 -y remove konsole
