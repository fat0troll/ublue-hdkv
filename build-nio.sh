#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# fsearch dependency
# may break on Fedora 42!
# and yes, it's the official way to install it
# see https://github.com/cboxdoerfer/fsearch/issues/584
dnf -y install https://dl.fedoraproject.org/pub/fedora/linux/releases/40/Everything/x86_64/os/Packages/l/libicu73-73.2-1.fc40.x86_64.rpm

# Install additional packages
dnf -y install dmg2img \
    python3-vkbasalt-cli \
    dotool \
    dwarfs \
    libFAudio \
    fsearch \
    ksysguard6 \
    qdirstat \
    wine

# TODO: follow ngrok releases from AUR
wget --hsts-file /tmp/.wget-hsts -O /tmp/ngrok.tar.gz https://bin.equinox.io/a/9VU6NY9RyvK/ngrok-v3-3.19.1-linux-amd64.tar.gz
mkdir /tmp/ngrok-install
tar -xf /tmp/ngrok.tar.gz -C /tmp/ngrok-install
mv /tmp/ngrok-install/ngrok /usr/bin
rm -r /tmp/ngrok*
