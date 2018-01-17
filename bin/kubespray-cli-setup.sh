#!/usr/bin/env bash
set -e

#pip2 install ansible kubespray
get_coreos_nodes() {
  for node in $@
  do
    echo node1[ansible_host=${node},bootstrap_os=coreos,ansible_user=core]
  done
}

NODES=(192.168.56.{10,12,13})
NODES=($(get_coreos_nodes ${NODES[@]}))
echo NODES=${NODES[@]}
kubespray prepare -y --nodes ${NODES[@]}
cat > ~/.kubespray/bootstrap-os.yml << EOF
- hosts: all
  become: yes
  gather_facts: False
  roles:
  - bootstrap-os
EOF

(cd ~/.kubespray; ansible-playbook -i inventory/inventory.cfg bootstrap-os.yml)
kubespray deploy -y --coreos
