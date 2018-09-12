#!/bin/sh
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 DIRECTORY" >&2
  exit 1
fi
if ! [ -e "$1" ]; then
  echo "$1 not found" >&2
  exit 1
fi
if ! [ -d "$1" ]; then
  echo "$1 not a directory" >&2
  exit 1
fi

if docker kill websql || true; then
    docker build --no-cache -t shadowcodex/phpliteadmin ./
    docker run -d -it --rm -p 2015:2015 -v $1:/db --name websql shadowcodex/phpliteadmin
    echo "\n\n"
    echo "####################################"
    echo "Started docker as daemon 'websql'"
    echo "####################################"
fi