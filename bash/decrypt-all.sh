#!/bin/bash

# required in every file
export PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/vars.sh
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/utils.sh


# script starts here

# export environment variable
export_secret_var

# checks
is_seed_populated

for file in $(get_all_secrets); do

    IS_ENCRYPTED=$(is_file_encrypted $file)
    
    # if file is already decrypted, skip trying to decrypt the file
    if [ "$IS_ENCRYPTED" = "false" ]; then
        continue
    fi
    
    decrypt_file $file
    
done