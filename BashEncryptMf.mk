export PROJECT_ROOT_PATH := $(shell git rev-parse --show-toplevel)
export BASH_ENCRYPT_ROOT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
include $(BASH_ENCRYPT_ROOT_DIR)/vars.sh

BASH_DIR_PATH=${PROJECT_ROOT_PATH}/${BASH_ENCRYPT_BASH_DIR_PATH}
HOOKS_DIR_PATH=${PROJECT_ROOT_PATH}/${BASH_ENCRYPT_HOOKS_DIR_PATH}

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
# make bash scripts executable
bash-scripts-configure:
	chmod +x ${BASH_ENCRYPT_ROOT_DIR}/vars.sh
	chmod +x ${BASH_ENCRYPT_ROOT_DIR}/utils.sh
	chmod +x ${BASH_DIR_PATH}/*/**
	chmod +x ${BASH_DIR_PATH}/*/**

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
git-configure-hooks:
	. ./${BASH_DIR_PATH}/git-configure-hooks.sh

# encrypt a single secret filee - example usage:
# make secret-encrypt file="src/test/text.secret"
secret-encrypt:
	. ${BASH_DIR_PATH}/encrypt-file.sh $(ARGS)

# decrypt a single secret file - example usage:
# make secret-decrypt file="src/test/text.secret"
secret-decrypt:
	. ${BASH_DIR_PATH}/decrypt-file.sh $(ARGS)

# encrypt all secret files
secrets-encrypt-all:
	. ${BASH_DIR_PATH}/encrypt-all.sh
	
# decrypt all secret files
secrets-decrypt-all:
	. ${BASH_DIR_PATH}/decrypt-all.sh

# check all secret files are encrypted
secrets-check-all:
	. ${BASH_DIR_PATH}/check-all.sh

# run to make sure the project paths are set correctly
bash-encrypt-testing:
	. ${BASH_DIR_PATH}/testing.sh