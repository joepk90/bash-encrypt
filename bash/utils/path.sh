#!/bin/basht"


get directory path from where this script has been run from
get_relative_directory_path() {
    echo $(dirname "$0")
}

# remove the "." from the start of the string
get_trimmed_path() {
    DIR_PATH=$1
    TRIMMED_DIR_PATH=$(echo "$DIR_PATH" | sed 's|^\./||')
    echo $TRIMMED_DIR_PATH
}

get_absolute_directory_path() {
    DIR_PATH=$(get_relative_directory_path)

    DIR_NAME_TRIMMED=$(get_trimmed_path $DIR_PATH)

    FULL_PATH=$(echo "$PWD/$DIR_NAME_TRIMMED")

    echo $FULL_PATH
}