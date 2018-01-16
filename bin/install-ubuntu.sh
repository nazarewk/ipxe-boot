#!/usr/bin/env bash
release=${1:-artful}
url="https://cloud-images.ubuntu.com/${release}/current"

file_dir=$(dirname "$(readlink -f "$0")")
base_dir=$(readlink -f ${file_dir}/..)
dir=${base_dir}/media/ubuntu
mkdir -p ${dir} && cd ${dir}
echo "dir=${dir}"

wget -N "${url}/unpacked/build-info.txt"
source build-info.txt

wget -N "${url}/unpacked/${orig_prefix}-amd64-vmlinuz-generic"
wget -N "${url}/unpacked/${orig_prefix}-amd64-initrd-generic"
wget -N "${url}/${orig_prefix}-amd64.squashfs"

ln -sf "${orig_prefix}-amd64-vmlinuz-generic" vmlinuz
ln -sf "${orig_prefix}-amd64-initrd-generic" initrd
ln -sf "${orig_prefix}-amd64.squashfs" root.squashfs

rm -Rf root
7z x root.squashfs -oroot