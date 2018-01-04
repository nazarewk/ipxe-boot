#!/usr/bin/env bash
release=${1:-latest}

name=archiso
mkdir -p media/${name}
cd media/${name}
wget -r -np -R "index.html" --relative https://mirrors.evowise.com/archlinux/iso/${release}/arch/ -nH --cut-dirs=3