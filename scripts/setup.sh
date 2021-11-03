#!/bin/bash

if [ -z "$1" ] ; then
    echo "usage: $0 <project-name>"
    exit 1
fi

PROJECT=$1

mkdir $PROJECT
(cd ContractTemplate && git archive --format=tar HEAD) | tar x -C $PROJECT

# Replace __NAME__ with given arg.
sed -i s/__NAME__/$1/g $PROJECT/package.json

# Create empty .secret.
touch $PROJECT/.secret
