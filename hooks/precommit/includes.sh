#!/bin/bash

BASH_ENCRYPT=$1

. "$BASH_ENCRYPT/vars.sh"

HOOKS_DIR_PATH="./$HOOKS_DIR_PATH/precommit"

. "$HOOKS_DIR_PATH/precommit.sh" $BASH_ENCRYPT
# more precommit hooks can be imported here...