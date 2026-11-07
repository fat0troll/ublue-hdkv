#!/bin/bash

set -ouex pipefail

# Install additional packages
# COPR is needed for ccze
dnf5 -y copr enable caiobruno/fedora-packages
dnf5 -y install dmg2img \
    python3-vkbasalt-cli \
    qdirstat \
    apg \
    ccze \
    s-tui \
    kvantum \
    webkit2gtk4.1-devel
dnf5 -y copr disable caiobruno/fedora-packages

# Install darkly and klassy
dnf5 install -y \
    --enable-repo="terra" \
    darkly klassy

# Install dwarfs
dnf5 -y copr enable jc141/DwarFS
dnf5 -y install dwarfs
dnf5 -y copr disable jc141/DwarFS

# Install fsearch
dnf5 -y copr enable cboxdoerfer/fsearch
dnf5 -y install fsearch
dnf5 -y copr disable cboxdoerfer/fsearch

# renovate: datasource=docker depName=ngrok/ngrok extractVersion=^(?<version>\d+\.\d+\.\d+)-debian$
NGROK_VERSION=3.19.1
wget --hsts-file /tmp/.wget-hsts -O /tmp/ngrok.tar.gz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-${NGROK_VERSION}-linux-amd64.tgz"
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*

# renovate: datasource=github-releases depName=openziti/zrok
ZROK_VERSION=v0.4.47
wget --hsts-file /tmp/.wget-hsts -O /tmp/zrok.tar.gz "https://github.com/openziti/zrok/releases/download/${ZROK_VERSION}/zrok_${ZROK_VERSION#v}_linux_amd64.tar.gz"
mkdir /tmp/zrok-install
tar -xf /tmp/zrok.tar.gz -C /tmp/zrok-install
mv /tmp/zrok-install/zrok /usr/bin
rm -r /tmp/zrok*
