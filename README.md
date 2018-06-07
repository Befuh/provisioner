# Befuh Provisioner [![ubuntu: 18.04](https://img.shields.io/badge/ubuntu-18.04-7E2254.svg?style=flat-square)](https://wiki.ubuntuusers.de/Bionic_Beaver/) [![ansible: v2.4](https://img.shields.io/badge/ansible-v2.4-56B4B6.svg?style=flat-square)](http://docs.ansible.com/ansible/latest/index.html) 
Provisioner for setting up a bionic server and deploying the complete Befuh stack.

## Installation and Setup
``` 
$ git clone --recursive git@github.com:rawroland/befuh-provisioner.git <folder>
$ cd <folder>
$ sudo /bin/bash provision/preinstaller/ubuntu-18.04.sh --env=prod
$ sudo ansible-playbook provision/ansible/playbook.yml
```
