#!/usr/bin/env bash
set -e

# pip2 install ansible kubespray
get_coreos_nodes() {
  for node in $@
  do
    echo -n node1[
    echo -n ansible_host=${node},
    echo -n bootstrap_os=coreos,
    echo -n ansible_user=core,
    echo -n ansible_default_ipv4.address=${node}
    echo ]
  done
}

NODES=($(get_coreos_nodes 192.168.56.{10,12,13}))
echo NODES=${NODES[@]}
kubespray prepare -y --nodes ${NODES[@]}

cat << EOF > ~/.kubespray/bootstrap-os.yml
- hosts: all
  become: yes
  gather_facts: False
  roles:
  - bootstrap-os
EOF

(cd ~/.kubespray; ansible-playbook -i inventory/inventory.cfg bootstrap-os.yml)
kubespray deploy -y --coreos
