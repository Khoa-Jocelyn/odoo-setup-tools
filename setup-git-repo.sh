#!/bin/bash

CURRENT_PATH=$(pwd)
SOURCE_PATH="$HOME/Git"

# Copy git repo
# SOURCE_DIR="/media/$USER/Backup/Viindoo"
# DESTINATION_DIR="$HOME"
# sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_DIR $DESTINATION_DIR

# Create folders
if [ ! -d "$SOURCE_PATH" ]; then
   sudo mkdir $SOURCE_PATH
   sudo chown dinhvankhoa:dinhvankhoa $SOURCE_PATH
fi
if [ ! -d "$SOURCE_PATH/16.0" ]; then
   sudo mkdir -p $SOURCE_PATH/16.0
   sudo chown dinhvankhoa:dinhvankhoa $SOURCE_PATH/16.0
fi
if [ ! -d "$SOURCE_PATH/17.0" ]; then
   sudo mkdir -p $SOURCE_PATH/17.0
   sudo chown dinhvankhoa:dinhvankhoa $SOURCE_PATH/17.0
fi
cd $SOURCE_PATH

# Git clone repo
git clone git@github.com:Viindoo/odoo.git # odoo repo
git clone git@github.com:Viindoo/tvtmaaddons.git # tvtmaaddons repo
git clone git@github.com:Viindoo/erponline-enterprise.git # erponline-enterprise repo
git clone git@github.com:Viindoo/branding.git # branding repo

# 16.0
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/odoo $SOURCE_PATH/16.0
cd $SOURCE_PATH/16.0/odoo
git checkout 16.0
cd ../../
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/tvtmaaddons $SOURCE_PATH/16.0
cd $SOURCE_PATH/16.0/tvtmaaddons
git checkout 16.0
cd ../../
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/erponline-enterprise $SOURCE_PATH/16.0
cd $SOURCE_PATH/16.0/erponline-enterprise
git checkout 16.0
cd ../../
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/branding $SOURCE_PATH/16.0
cd $SOURCE_PATH/16.0/branding
git checkout 16.0
cd ../../

# 17.0
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/odoo $SOURCE_PATH/17.0
cd $SOURCE_PATH/17.0/odoo
git checkout 17.0
cd ../../
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/tvtmaaddons $SOURCE_PATH/17.0
cd $SOURCE_PATH/17.0/tvtmaaddons
git checkout master
cd ../../
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/erponline-enterprise $SOURCE_PATH/17.0
cd $SOURCE_PATH/17.0/erponline-enterprise
git checkout master
cd ../../
sudo rsync -a --chown=dinhvankhoa:dinhvankhoa -r $SOURCE_PATH/branding $SOURCE_PATH/17.0
cd $SOURCE_PATH/17.0/branding
git checkout master
cd ../../

# Remove repo template
sudo rm -rf $SOURCE_PATH/odoo
sudo rm -rf $SOURCE_PATH/tvtmaaddons
sudo rm -rf $SOURCE_PATH/erponline-enterprise
sudo rm -rf $SOURCE_PATH/branding

cd $CURRENT_PATH
