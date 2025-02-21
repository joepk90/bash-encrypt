# import utils

# required in every file
export PROJECT_ROOT_PATH=$(git rev-parse --show-toplevel)

. $PROJECT_ROOT_PATH/$BASH_UTILS_PATH/utils.sh
. $PROJECT_ROOT_PATH/$BASH_UTILS_PATH/git-utils.sh
# . "$BASH_UTILS_PATH/path.sh" # not currently in use