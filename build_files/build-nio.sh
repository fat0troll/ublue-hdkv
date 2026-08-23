#!/bin/bash

set -ouex pipefail

# Install additional packages
dnf5 -y install dmg2img \
    python3-vkbasalt-cli \
    libFAudio \
    qdirstat \
    apg \
    ccze \
    python3-icoextract \
    s-tui \
    croc \
    kvantum \
    webkit2gtk4.1-devel

# Install darkly and klassy
dnf5 install -y \
    --enable-repo="terra" \
    darkly klassy

# Install dotool
dnf5 -y copr enable smallcms/dotool
dnf5 -y install dotool
dnf5 -y copr disable smallcms/dotool

# Install dwarfs
dnf5 -y copr enable jc141/DwarFS
dnf5 -y install dwarfs
dnf5 -y copr disable jc141/DwarFS

# Install fsearch
dnf5 -y copr enable cboxdoerfer/fsearch
dnf5 -y install fsearch
dnf5 -y copr disable cboxdoerfer/fsearch

# TODO: follow ngrok releases from AUR
wget --hsts-file /tmp/.wget-hsts -O /tmp/ngrok.tar.gz https://bin.equinox.io/a/9VU6NY9RyvK/ngrok-v3-3.19.1-linux-amd64.tar.gz
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*

# TODO: follow zrok releases from Github
wget --hsts-file /tmp/.wget-hsts -O /tmp/zrok.tar.gz https://github.com/openziti/zrok/releases/download/v0.4.47/zrok_0.4.47_linux_amd64.tar.gz
mkdir /tmp/zrok-install
tar -xf /tmp/zrok.tar.gz -C /tmp/zrok-install
mv /tmp/zrok-install/zrok /usr/bin
rm -r /tmp/zrok*
