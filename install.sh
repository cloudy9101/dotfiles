#!/bin/sh

echo "Start install.sh"

echo "PWD: $(pwd)"

. ./helper.sh

OSTYPE=$(detect_os)

if [ "$OSTYPE" = "linux" ]; then
  . ./install.linux.sh
elif [ "$OSTYPE" = "darwin" ]; then
  . ./install.mac.sh
fi
