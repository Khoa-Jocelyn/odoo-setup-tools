#!/bin/bash

# Install python versions
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y python3.7 python3.7-dev python3.7-venv # Used for odoo13
sudo apt install -y python3.8 python3.8-dev python3.8-venv # Used for odoo14, odoo15
sudo apt install -y python3.9 python3.9-dev python3.9-venv # Used for odoo15
sudo apt install -y python3.10 python3.10-dev python3.10-venv # Used for odoo16, odoo17
sudo apt install -y python3.11 python3.11-dev python3.11-venv # Used for odoo17
sudo apt install -y python3-pip
sudo -H pip3 install --upgrade pip

# Setup python environment
ENV_DIR="$HOME/Environments"
if [ ! -d "$(dirname "$ENV_DIR")" ]; then
    mkdir -p "$(dirname "$ENV_DIR")"
fi
python3.7 -m venv ~/Environments/python/3.7/odoo/13.0
python3.8 -m venv ~/Environments/python/3.8/odoo/14.0
python3.8 -m venv ~/Environments/python/3.8/odoo/15.0
python3.9 -m venv ~/Environments/python/3.9/odoo/15.0
python3.10 -m venv ~/Environments/python/3.10/odoo/16.0
python3.10 -m venv ~/Environments/python/3.10/odoo/17.0
python3.11 -m venv ~/Environments/python/3.11/odoo/17.0
