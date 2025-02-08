export BASH_ENCRYPT_ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
include $(BASH_ENCRYPT_ROOT_DIR)/vars.sh
# include ./bash-encrypt/vars.sh

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
# make bash scripts executable
bash-scripts-configure:
	chmod +x ./${PROJECT_NAME}/vars.sh
	chmod +x ./${BASH_DIR_PATH}/*/**
	chmod +x ./${HOOKS_DIR_PATH}/*/**

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
git-configure-hooks:
	@. ./${BASH_DIR_PATH}/git-configure-hooks.sh

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



### GIT COMMANDS

# check all staged (git) secret files are encrypted
secrets-check-staged:
	bash ./${PROJECT_NAME}/hooks/check-staged.sh