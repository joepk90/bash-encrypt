#!/bin/bash

# import vars and import util functions
. "$PROJECT_NAME/vars.sh"
. ./$BASH_UTILS_PATH/index.sh

BASH_PRECOMMIT_FILE="./$PROJECT_NAME/hooks/pre-commit.sh"
GIT_PRECOMMIT_FILE=".git/hooks/pre-commit"

PRECOMMIT_HOOK_IMPORT_STRING="./$HOOKS_DIR_PATH/precommit/includes.sh $PROJECT_NAME"

get_git_script_text() {
	cat $GIT_PRECOMMIT_FILE
}

get_bash_script_text() {
	echo $PRECOMMIT_HOOK_IMPORT_STRING
}

make_script_executable() {
	chmod +x "$1"
}

make_pre_commit_script_executable() {
	make_script_executable "$GIT_PRECOMMIT_FILE"
}

git_pre_commit_hook_contains_script() {
	
	SCRIPT_EXISTS="false"
	if grep -q "$PRECOMMIT_HOOK_IMPORT_STRING" "$GIT_PRECOMMIT_FILE"; then
		SCRIPT_EXISTS="true"
	fi

	echo $SCRIPT_EXISTS
}

create_pre_commit_hook_file() {
    touch "$GIT_PRECOMMIT_FILE"
    echo "#!/bin/bash" >> "$GIT_PRECOMMIT_FILE"
	echo "\n" >> "$GIT_PRECOMMIT_FILE"
}

insert_pre_commit_import_hook_into_file() {
	echo $PRECOMMIT_HOOK_IMPORT_STRING >> "$GIT_PRECOMMIT_FILE"
}


GIT_HOOK_FILE_EXISTS=$(test -f $GIT_PRECOMMIT_FILE && echo "true" || echo "false")

if [ "$GIT_HOOK_FILE_EXISTS" = "false" ]; then
	echo "the pre-commit git hook file does not exist. Creating it now."
    create_pre_commit_hook_file
    insert_pre_commit_import_hook_into_file
	make_pre_commit_script_executable
	return
fi


SCRIPT_EXISTS=$(git_pre_commit_hook_contains_script)

if [ "$SCRIPT_EXISTS" = "true" ]; then
	echo "the pre-commit git hook file exists and contains the git pre-commit hook script."
else
	echo "the pre-commit git hook file exists but does not contain the script. Updating it now..."
    insert_pre_commit_import_hook_into_file
	make_pre_commit_script_executable
	return
fi