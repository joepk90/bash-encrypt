#!/bin/bash

# required in every file
export PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/vars.sh
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/utils.sh


# script starts here

# import utils
. $BASH_ENCRYPT_BASH_DIR_PATH/utils.sh

# export environment variable
export_secret_var

# checks
is_seed_populated
file_has_valid_extension
if_encrypted_abort "$file"

# encrypt the file
encrypt_file "$file"

echo "File encrypted."