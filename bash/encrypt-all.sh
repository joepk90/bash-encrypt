#!/bin/bash

# import utils
. ./$BASH_UTILS_PATH/index.sh

# export environment variable
export_secret_var

# checks
is_seed_populated

for file in $(get_all_secrets); do
    
    IS_ENCRYPTED=$(is_file_encrypted $file)

    # if file is already encrypted, skip trying to encrypt the file
    if [ "$IS_ENCRYPTED" = "true" ]; then
        continue
    fi

    encrypt_file $file

    
done