#!/bin/bash

# exported in make file
export BASH_ENCRYPT_DIR_NAME=bash-encrypt
export BASH_ENCRYPT_BASH_DIR_PATH=${BASH_ENCRYPT_DIR_NAME}/bash
export BASH_ENCRYPT_HOOKS_DIR_PATH=${BASH_ENCRYPT_DIR_NAME}/hooks

# utils
export BASH_ENCRYPT_BASH_UTILS_PATH=${BASH_ENCRYPT_BASH_DIR_PATH}/utils

# hooks
export BASH_ENCRYPT_PRECOMMIT_HOOK_DIR_PATH=${BASH_ENCRYPT_HOOKS_DIR_PATH}/precommit


# DOCUMENTATION ON PATHS

# these vars do not include the absolute path - they are used to build the absolute path.

## BASH SCRIPTS

# each bash script file must include the following two lines at the top of the file in order to run properly:
# PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)
# . $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/vars.sh


## GIT HOOKS

# git hooks file must include the following three lines at the top of the file in order to run properly:
# BASH_ENCRYPT_DIR_NAME=$1
# PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)
# . $PROJECT_ROOT_PATH/$BASH_ENCRYPT_DIR_NAME/vars.sh