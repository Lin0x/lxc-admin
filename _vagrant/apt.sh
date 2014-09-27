#!/usr/bin/env bash

# cat << EOF > /etc/apt/sources.list.d/nodesource.list
# deb https://deb.nodesource.com/node wheezy main
# deb-src https://deb.nodesource.com/node wheezy main
# EOF

apt-add-repository -y ppa:ubuntu-lxc/daily

apt-get update

apt-get install -y git
apt-get install -y build-essential
apt-get install -y lxc lxc-dev

#apt-get install -y libclxclient-dev libvirt-dev
#apt-get install -y bridge-utils libvirt-bin debootstrap

apt-get install -y nodejs
apt-get install -y redis-server

exit 0