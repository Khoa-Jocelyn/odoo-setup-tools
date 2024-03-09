#!/bin/bash

CURRENT_PATH=$(pwd)
ODOO_VERSION="$1"
if [ "$ODOO_VERSION" = "13.0" ]; then
    PYTHON_VERSION='3.7'
elif [ "$ODOO_VERSION" = "14.0" ]; then
    PYTHON_VERSION='3.8'
elif [ "$ODOO_VERSION" = "15.0" ]; then
    PYTHON_VERSION='3.9'
elif [ "$ODOO_VERSION" = "16.0" ]; then
    PYTHON_VERSION='3.10'
elif [ "$ODOO_VERSION" = "17.0" ]; then
    PYTHON_VERSION='3.10'
fi
REQUIREMENT_PATH="$HOME/Git/$ODOO_VERSION"
PATHS=()
while IFS= read -r -d '' path; do
    PATHS+=("$path")
done < <(find "$REQUIREMENT_PATH" -name "requirements.txt" -print0)
ENV_PATH="$HOME/Environments/python/$PYTHON_VERSION/odoo/$ODOO_VERSION/bin"
cd $ENV_PATH
source activate
pip install --upgrade pip
pip install wheel 
for path in "${PATHS[@]}"; do
    pip install -r $path
done
deactivate
cd $CURRENT_PATH
