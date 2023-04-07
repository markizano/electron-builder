#!/bin/bash

# Remove previous link if it doesn't use update-alternatives
if [ `readlink "/usr/bin/${executable}"` != "/etc/alternatives/${executable}" ]; then
  rm -f "/usr/bin/${executable}"
fi

update-alternatives --install '/usr/bin/${executable}' '${executable}' '/opt/${sanitizedProductName}/${executable}' 100

# SUID chrome-sandbox for Electron 5+
chmod 4755 '/opt/${sanitizedProductName}/chrome-sandbox' || true

update-mime-database /usr/share/mime || true
update-desktop-database /usr/share/applications || true
