#!/usr/bin/env bash
release=${1:-standard}
version=${2:-3.7.0}

name=alpine-${release}
filename=${name}-${version}-x86_64.iso
mkdir -p media/${name}
cd media/${name}
wget http://dl-cdn.alpinelinux.org/alpine/v$(printf "%.3s" ${version})/releases/x86_64/${filename} -O ${filename}

7z x -y ${filename}