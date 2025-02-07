#!/bin/bash

# import utils
. ./$BASH_DIR_PATH/utils/index.sh

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