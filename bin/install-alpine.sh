#!/usr/bin/env bash
release=${1:-standard}
version=${2:-3.7.0}

name=alpine-${release}
filename=${name}-${version}-x86_64.iso
mkdir -p media/${name} media/alpine-nfsroot
cd media/${name}
wget http://dl-cdn.alpinelinux.org/alpine/v$(printf "%.3s" ${version})/releases/x86_64/${filename} -O ${filename}

7z x -y ${filename}

mkdir -p root
7z x -y boot/modloop-hardened -oroot/.modloop
cp -R apks/ root/