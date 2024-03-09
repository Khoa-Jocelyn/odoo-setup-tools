#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

echo "Please enter your email that was used to register the SSH key for git:"
read EMAIL

# Setup OS
source setup-ubuntu.sh

# Setup Git
source setup-git.sh $EMAIL

# Setup development environment
source setup-dev-env.sh

# Setup Python
source setup-python.sh

# Setup Postgresql
source setup-postgresql.sh

# Setup Git Repo
source setup-git-repo.sh

# Setup Odoo Requirement
source setup-odoo-requirement.sh 16.0
source setup-odoo-requirement.sh 17.0

# Setup Eclipse
source setup-eclipse.sh
