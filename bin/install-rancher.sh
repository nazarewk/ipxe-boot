#!/usr/bin/env bash
release=${1:-latest}

name=rancher
url=http://releases.rancher.com/os/${release}

file_dir=$(dirname "$(readlink -f "$0")")
base_dir=$(readlink -f ${file_dir}/..)
dir=${base_dir}/media/rancher
cc_dir=${dir}/cc
mkdir -p ${dir} ${cc_dir} && cd ${dir}

wget -N ${url}/vmlinuz
wget -N ${url}/initrd

keys=$()

cat << EOF > ${cc_dir}/ssh.yml
#cloud-config
ssh_authorized_keys:
$(ssh-add -L | sed 's/^/  - /g')
EOF
