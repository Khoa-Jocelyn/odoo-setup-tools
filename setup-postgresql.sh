#!/bin/bash

# Install PostgreSQL Versions
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
sudo apt update
sudo apt -y dist-upgrade

# PostgreSQL 14: port 5432 (default port), to support Odoo 16
sudo apt install -y postgresql-14 postgresql-contrib
sudo -u postgres createuser --interactive -p 5432 -r "$USER" -s

# PostgreSQL 12: port 5435, supports Odoo 12, Odoo 13, Odoo 14, Odoo 15
sudo apt install -y postgresql-12 postgresql-client-12
sudo -u postgres createuser --interactive -p 5434 -r "$USER" -s

# Start PostgreSQL service
sudo service postgresql start
sudo -u postgres psql <<EOF
CREATE USER $USER WITH LOGIN SUPERUSER CREATEDB CREATEROLE INHERIT REPLICATION CONNECTION LIMIT -1;
ALTER USER postgres PASSWORD '0';
\q
EOF

# Install the pgAdmin 4 database management application
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install -y pgadmin4-desktop
