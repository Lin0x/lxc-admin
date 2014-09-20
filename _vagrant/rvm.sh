#!/usr/bin/env bash

curl -L https://get.rvm.io | sudo bash

sudo su -l -c "rvm use --install 2.1.2"

exit 0
