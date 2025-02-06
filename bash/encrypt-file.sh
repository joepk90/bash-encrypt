#!/bin/bash

# import utils
. ./$BASH_DIR_PATH/utils.sh

# export environment variable
export_secret_var

# checks
is_seed_populated
file_has_valid_extension
if_encrypted_abort "$file"

# encrypt the file
encrypt_file "$file"

echo "File encrypted."