#!/bin/bash

BASH_ENCRYPT=$1

. "$BASH_ENCRYPT/vars.sh"

. "$PRECOMMIT_HOOK_DIR_PATH/precommit.sh" $BASH_ENCRYPT
# more precommit hooks can be imported here...