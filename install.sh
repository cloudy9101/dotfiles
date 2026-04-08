#!/bin/sh

echo "Start install.sh"

echo "PWD: $(pwd)"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source install.linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source install.mac.sh
fi
