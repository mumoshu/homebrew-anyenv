#!/bin/bash

trap result 0

set -e

if anyenv version; then
  brew uninstall anyenv
fi

cp brew-anyenv.rb /usr/local/Library/Formula/anyenv.rb

brew install anyenv --HEAD

anyenv install --list

brew uninstall anyenv
