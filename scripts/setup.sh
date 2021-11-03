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

    # Replace __NAME__ with given arg.
    sed -i s/__NAME__/$1/g package.json

    # Create empty .secret.
    touch .secret

    # Initialize git.
    git init
    git commit -m initial

    # Initialize node modules.
    npm install
)
