#!/bin/bash
PACKAGES_TO_INSTALL="
openjdk-8-jdk
make
build-essential
libreadline-dev
wget
curl
llvm
libssl-dev
zlib1g-dev
libbz2-dev
libsqlite3-dev
libncurses5-dev
libncursesw5-dev
xz-utils
tk-dev
libffi-dev
liblzma-dev
libgdbm-dev
libnss3-dev
libedit-dev
libc6-dev
python-setuptools
libxml2-dev
libxslt1-dev
libsasl2-dev
python3-dev
libldap2-dev
libjpeg-dev
python2-dev
libpq-dev
"
# Install the necessary packages for the development environment 
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install ${PACKAGES_TO_INSTALL}

# Install Nodejs
curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install -y nodejs

# Install the Less to CSS compiler
sudo npm install -g npm
sudo npm install -g less less-plugin-clean-css

# Install an HTML to PDF converter
sudo apt install -y wkhtmltopdf
