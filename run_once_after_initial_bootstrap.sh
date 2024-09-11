#!/bin/bash

sudo apt update
# Install ansible
if ! command -v ansible-playbook &> /dev/null; then
    sudo apt install -y ansible
fi

if command -v ansible-playbook &> /dev/null; then
    ansible-galaxy install -r {{ joinPath .chezmoi.sourceDir "dot_bootstrap/requirements.yaml"}}
    ansible-playbook -v {{ joinPath .chezmoi.sourceDir "dot_bootstrap/setup.yaml" | quote }} --ask-become-pass
fi
