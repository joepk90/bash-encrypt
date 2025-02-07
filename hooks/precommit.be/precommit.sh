#!/bin/sh

BASH_ENCRYPT=$1

. "./.env" 
. "$BASH_ENCRYPT/vars.sh"
. "$BASH_UTILS_PATH/index.sh"

# export environment variable
export_secret_var

# checks
is_seed_populated

# chcek staged
check_staged




