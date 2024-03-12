#!/bin/bash

#####################################
# run from ~/ansible #
#####################################


DIR="/ansible/galaxy-roles"

if [ -d "$DIR" ]; then
    echo "Installing ansible role files in ${DIR}"
    ansible-galaxy install -r /ansible/requirements.yaml

else
    echo " ${DIR} not found. Making directory ${DIR}"
    mkdir /ansible/galaxy-roles
    echo "Installing ansible role files in ${DIR}"
    ansible-galaxy install -r /ansible/requirements.yaml
    
fi
