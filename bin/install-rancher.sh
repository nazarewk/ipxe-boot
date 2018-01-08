#!/usr/bin/env bash
release=${1:-latest}

name=rancher
url=http://releases.rancher.com/os/${release}

file_dir=$(dirname "$(readlink -f "$0")")
base_dir=$(readlink -f ${file_dir}/..)
dir=${base_dir}/media/rancher
mkdir -p ${dir} && cd ${dir}
mkdir -p ${dir}/cc

wget -N ${url}/vmlinuz
wget -N ${url}/initrd