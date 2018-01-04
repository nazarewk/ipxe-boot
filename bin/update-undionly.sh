#!/usr/bin/env bash
config="BINARY=undionly.kpxe&BINDIR=bin&REVISION=master&DEBUG=undi%2Cdhcp&EMBED.00script.ipxe=%23%21ipxe%0A%0Aset%20user-class%20iPXE-nazarewk%0A%0A%3Aretry_boot%0Aautoboot%20%7C%7C%20goto%20retry_boot"
wget "https://rom-o-matic.eu/build.fcgi?${config}" -O ./static/undionly.kpxe