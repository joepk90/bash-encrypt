#!/bin/sh

# required in every file
BASH_ENCRYPT_DIR_NAME=$1
export PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/vars.sh
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/utils.sh
# . $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/testing.sh


# script starts here

. "$PROJECT_ROOT_PATH/.env" 

# export environment variable
export_secret_var

# checks
is_seed_populated

# chcek staged
check_staged




