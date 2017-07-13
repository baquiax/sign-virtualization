#!/bin/bash

for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko; do
  echo "Signing $modfile"
  sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 \
                                MOK.priv \
                                MOK.der "$modfile"
done

modprobe vboxdrv