#!/bin/bash

# required in every file
BASH_ENCRYPT_DIR_NAME=$1
PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/vars.sh
. $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/utils.sh
# . $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/testing.sh


# script starts here

. "$PRECOMMIT_HOOK_DIR_PATH/precommit.sh" $BASH_ENCRYPT_DIR_NAME
# more precommit hooks can be imported here...