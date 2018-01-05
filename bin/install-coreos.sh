#!/usr/bin/env bash
release=${1:-stable}
ct_version=${2:-0.5.0}

file_dir=$(dirname "$(readlink -f "$0")")
base_dir=$(readlink -f ${file_dir}/..)
dir=${base_dir}/media/coreos
mkdir -p ${dir} && cd ${dir}


boot_url=https://${release}.release.core-os.net/amd64-usr/current

wget -N ${boot_url}/coreos_production_pxe.vmlinuz
wget -N ${boot_url}/coreos_production_pxe.vmlinuz.sig
wget -N ${boot_url}/coreos_production_pxe_image.cpio.gz
wget -N ${boot_url}/coreos_production_pxe_image.cpio.gz.sig

wget -nc "https://github.com/coreos/container-linux-config-transpiler/releases/download/v${ct_version}/ct-v${ct_version}-x86_64-unknown-linux-gnu" -O ct
chmod +x ct

for path in $(ls ${base_dir}/container-linux-config/*.yml)
do
  file=${path%.*}
  input=${file}.yml
  file=${file##*/}
  output=${dir}/${file}.ign

  echo "Converting ${input} -> ${output}"
  ${dir}/ct -pretty -platform ec2 -in-file "${input}" -out-file "${output}"
  sed 's/\${COREOS_EC2_IPV4_LOCAL}/\${PRIVATE_IPV4}/g' -i "${output}"
done