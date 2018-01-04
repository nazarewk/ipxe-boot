#!/usr/bin/env bash

mkdir -p media/coreos
cd media/coreos
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz.sig
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz.sig
gpg --verify coreos_production_pxe.vmlinuz.sig
gpg --verify coreos_production_pxe_image.cpio.gz.sig