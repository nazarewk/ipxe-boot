#!/usr/bin/env bash
set -e

#pip2 install ansible kubespray
dir=~/.kubespray
inventory=my_inventory
[ -f ${dir} ] \
  && git clone git@github.com:kubernetes-incubator/kubespray.git ${dir} \
  || (cd ${dir} && git pull)

cd ${dir}

# based on https://github.com/kubernetes-incubator/kubespray/blob/master/docs/getting-started.md#building-your-own-inventory
cp -r inventory/ ${inventory}/
declare -a IPS=(192.168.56.{10,12,13})
export CONFIG_FILE=${inventory}/inventory.cfg
python3 contrib/inventory_builder/inventory.py ${IPS[@]}

cat > ${inventory}/group_vars/all.yml << EOF
bootstrap_os: coreos
#loadbalancer_apiserver:
#  address: 0.0.0.0
#  port: 8080
kubeconfig_localhost: true
kubectl_localhost: true
EOF

ansible-playbook -i ${inventory}/inventory.cfg cluster.yml -b -v

export KUBECONFIG=${dir}/artifacts/admin.conf
cd ${dir}/artifacts
./kubectl proxy
