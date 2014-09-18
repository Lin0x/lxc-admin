#!/usr/bin/env bash

apt-get update
apt-get install -y git
apt-get install -y build-essential
apt-get install -y lxc lxc-dev libclxclient-dev libvirt-dev
apt-get install -y bridge-utils libvirt-bin debootstrap

exit 0