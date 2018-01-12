#!/usr/bin/env bash
version=${1:-$(curl https://download.clearlinux.org/latest)}

url="https://download.clearlinux.org/releases/${version}/clear/clear-${version}-pxe.tar.xz"
name=clear-pxe
filename="${name}.tar.xz"
dir="media/${name}"
mkdir -p ${dir} && cd ${dir}
wget -N "${url}" -O "${filename}"
tar -xJf ${filename}
ln -sf "$(ls -1t org.clearlinux.* | head -n 1)" linux