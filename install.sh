#!/bin/sh

echo "Start install.sh"

echo "PWD: $(pwd)"

. ./helper.sh

OSTYPE=$(detect_os)

if [ "$OSTYPE" = "linux" ] && [ -f "/etc/debian_version" ]; then
  . ./install.linux.sh
elif [ "$OSTYPE" = "darwin" ]; then
  . ./install.mac.sh
fi
