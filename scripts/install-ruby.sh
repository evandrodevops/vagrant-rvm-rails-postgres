#!/usr/bin/env bash

source $HOME/.rvm/scripts/rvm

rvm use --default --install $1

shift

if (( $# ))
  then gem install $@
fi

rvm cleanup all

# Rails depends on Node.js
sudo apt-get install -y nodejs
