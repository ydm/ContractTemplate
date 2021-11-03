#!/bin/bash

if [ -z "$1" ] ; then
    echo "usage: $0 <project-name>"
    exit 1
fi

PROJECT=$1

# Create project directory.
mkdir $PROJECT

# Populate it.
(cd ContractTemplate && git archive --format=tar HEAD) | tar x -C $PROJECT

# Setup project.
(
    cd $PROJECT

    # Not needed.
    rm setup.sh

    # Needed .secret.
    touch .secret

    # Replace __NAME__ with given arg.
    sed -i s/__NAME__/$1/g package.json

    # Initialize node modules.
    npm install

    # Initialize git.
    git init
    git add .
    git commit -m initial
)
