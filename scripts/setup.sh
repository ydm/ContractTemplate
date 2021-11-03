#!/bin/bash

if [ -z "$1" ] ; then
    echo "usage: $0 <project-name>"
    exit 1
fi

# Replace __NAME__ with given arg.
sed -i s/__NAME__/$1/g ContractTemplate/package.json

touch ContractTemplate/.secret

mv ContractTemplate "$1"
