#!/bin/bash

EMAIL="$1"

# Install Git
sudo apt -y install git

# Create SSH key ed25519
ssh_dir="$HOME/.ssh"
if [ ! -d "$ssh_dir" ]; then
    mkdir -p "$ssh_dir"
fi
ssh-keygen -t ed25519 -C "$EMAIL" -f "$ssh_dir/id_ed25519" -N "" <<< y
ssh-add ~/.ssh/id_ed25519

