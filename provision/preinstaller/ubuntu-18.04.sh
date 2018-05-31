#!/bin/bash

set -o nounset
echo "Prepare for provisioning"
# set expected script args
ENV=`echo ${*} | egrep -o '(--env=)(\w+\S)' | awk -F'=' '{print $2}'`

# Update only if there was no update within the last day
if [ 86500 -le `expr $(date +'%s') - $(stat -c '%Y' /var/lib/apt/lists/$(ls -Art /var/lib/apt/lists | tail -n 1))` ]; then
    apt update
fi;

if ! `which git >/dev/null 2>&1`; then
  echo "Install git"
  apt install -y git
fi;

if ! `which ansible >/dev/null 2>&1`; then
  echo "#### Install ansible ####"
  export LC_ALL="en_US.UTF-8"
  export LC_CTYPE="en_US.UTF-8"
  apt udpate
  apt install -y software-properties-common python-minimal python python-pip sshpass python3-numpy python3-scipy
  pip install pip --upgrade
  pip install setuptools --upgrade
  pip install pyopenssl ndg-httpsclient pyasn1
  pip install ansible

  mkdir -p /etc/ansible
  touch /etc/ansible/hosts
  echo -e "\n[flora-tours]\n127.0.0.1 ansible_connection=local env=\""${ENV:=dev}"\"" | tee /etc/ansible/hosts
fi;
