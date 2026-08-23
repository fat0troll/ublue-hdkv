#!/bin/bash

set -ouex pipefail

# Clean package manager cache
dnf5 clean all

# Clean temporary files
rm -rf /tmp/* || true

# Cleanup the entirety of `/var`.
# None of these get in the end-user system and bootc lints get super mad if anything is in there
rm -rf /var
mkdir -p /var/tmp
chmod -R 1777 /var/tmp
