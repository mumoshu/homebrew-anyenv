#!/bin/bash

set -e

if anyenv version; then
  brew uninstall anyenv
fi

cp brew-anyenv.rb /usr/local/Library/Formula/anyenv.rb

cat /usr/local/Library/Formula/rbenv.rb

brew install anyenv --HEAD

anyenv install --list

brew uninstall anyenv
