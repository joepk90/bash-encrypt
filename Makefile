export PROJECT_NAME=bash-encrypt
# alternatively this import path means the .env file will always be imported from this path
# include $(dir $(realpath $(lastword $(MAKEFILE_LIST))))/.env
	
# make bash scripts executable
# bash-scripts-configure:
# 	make env-vars && chmod +x ./${PROJECT_NAME}/*

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
# make bash scripts executable
bash-scripts-configure:
	chmod +x ./${PROJECT_NAME}/encrypt-file.sh
	chmod +x ./${PROJECT_NAME}/encrypt-all.sh
	chmod +x ./${PROJECT_NAME}/decrypt-file.sh
	chmod +x ./${PROJECT_NAME}/decrypt-all.sh
	chmod +x ./${PROJECT_NAME}/check-all.sh
	chmod +x ./${PROJECT_NAME}/check-staged.sh
	chmod +x ./${PROJECT_NAME}/utils.sh

# configure gits precommit hook
# it must be renamed to pre-commit in order for git to use it.
git-configure-hooks:
	@. ./${PROJECT_NAME}/git-configure-hooks.sh

# encrypt a single secret filee - example usage:
# make secret-encrypt file="src/test/text.secret"
secret-encrypt:
	bash ./${PROJECT_NAME}/encrypt-file.sh $(ARGS)

# decrypt a single secret file - example usage:
# make secret-decrypt file="src/test/text.secret"
secret-decrypt:
	bash ./${PROJECT_NAME}/decrypt-file.sh $(ARGS)

# encrypt all secret files
secrets-encrypt-all:
	bash ./${PROJECT_NAME}/encrypt-all.sh
	
# decrypt all secret files
secrets-decrypt-all:
	bash ./${PROJECT_NAME}/decrypt-all.sh

# check all secret files are encrypted
secrets-check-all:
	bash ./${PROJECT_NAME}/check-all.sh

# check all staged (git) secret files are encrypted
secrets-check-staged:
	bash ./${PROJECT_NAME}/check-staged.sh