#!/usr/bin/env bash

curl -sSL https://get.rvm.io | bash -s
source $HOME/.rvm/scripts/rvm
rvm use --install 2.1.2

exit 0
