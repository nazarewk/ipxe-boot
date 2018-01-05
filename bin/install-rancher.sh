#!/usr/bin/env bash
release=${1:-latest}

name=rancher
url=http://releases.rancher.com/os/${release}

mkdir -p media/${name}
cd media/${name}

wget -N ${url}/vmlinuz
wget -N ${url}/initrd