#!/bin/bash

# Upgrade OS
sudo apt-get -y upgrade && sudo apt-get update

# Install VN Unikey
sudo add-apt-repository -y ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install -y ibus-bamboo
#ibus restart

# Install Chrome
chrome_deb_file="google-chrome-stable_current_amd64.deb"
if [ -f "$chrome_deb_file" ]; then
    echo "File $chrome_deb_file already exists."
else
    wget https://dl.google.com/linux/direct/$chrome_deb_file
fi
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get update
