export PROJECT_NAME=bash-encrypt
export BASH_DIR_PATH=${PROJECT_NAME}/bash
export HOOKS_DIR_PATH=${PROJECT_NAME}/hooks
# alternatively this import path means the .env file will always be imported from this path
# include $(dir $(realpath $(lastword $(MAKEFILE_LIST))))/.env
	
# make bash scripts executable
# bash-scripts-configure:
# 	make env-vars && chmod +x ./${PROJECT_NAME}/*

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
# make bash scripts executable
bash-scripts-configure:
	chmod +x ./${BASH_DIR_PATH}/*/**

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
git-configure-hooks:
	@. ./${BASH_DIR_PATH}/git-configure-hooks.sh

# encrypt a single secret filee - example usage:
# make secret-encrypt file="src/test/text.secret"
secret-encrypt:
	bash ./${BASH_DIR_PATH}/encrypt-file.sh $(ARGS)

# decrypt a single secret file - example usage:
# make secret-decrypt file="src/test/text.secret"
secret-decrypt:
	bash ./${BASH_DIR_PATH}/decrypt-file.sh $(ARGS)

# encrypt all secret files
secrets-encrypt-all:
	bash ./${BASH_DIR_PATH}/encrypt-all.sh
	
# decrypt all secret files
secrets-decrypt-all:
	bash ./${BASH_DIR_PATH}/decrypt-all.sh

# check all secret files are encrypted
secrets-check-all:
	bash ./${BASH_DIR_PATH}/check-all.sh



### GIT COMMANDS

# check all staged (git) secret files are encrypted
secrets-check-staged:
	bash ./${PROJECT_NAME}/hooks/check-staged.sh