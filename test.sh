#!/bin/bash

formula=anyenv

run_tests() {
  anyenv install --list
}

set -ex

if run_tests; then
  brew uninstall $formula
fi

cp $formula.rb /usr/local/Library/Formula/$formula.rb

cat /usr/local/Library/Formula/rbenv.rb

brew install $formula --HEAD

run_tests

brew uninstall $formula
