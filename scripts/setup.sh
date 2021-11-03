#!/bin/bash

ROOT=$(readlink -f $(dirname $BASH_SOURCE)/..)

if [ -z "$1" ] ; then
    echo "usage: $0 <project-name>"
    exit 1
fi

# Replace __NAME__ with given arg.
sed -i s/__NAME__/$1/g $ROOT/package.json

touch $ROOT/.secret
