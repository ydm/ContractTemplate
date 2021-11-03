#!/bin/bash

ROOT=$(readlink -f $(dirname $BASH_SOURCE)/..)
sed -i s/__NAME__/$1/g $ROOT/package.json
