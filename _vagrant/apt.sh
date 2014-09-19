#!/usr/bin/env bash

apt-get update
apt-get install -y git
apt-get install -y build-essential

apt-add-repository -y ppa:ubuntu-lxc/daily
apt-get update --quiet
apt-get install --assume-yes --quiet lxc lxc-dev

#apt-get install -y libclxclient-dev libvirt-dev
#apt-get install -y bridge-utils libvirt-bin debootstrap

cat << EOF > /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node wheezy main
deb-src https://deb.nodesource.com/node wheezy main
EOF

sudo apt-get install nodejs

exit 0