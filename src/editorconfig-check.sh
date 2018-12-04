#/bin/bash
DIR=$1
BEFORE_SHA=$2
CURRENT_SHA=$3

command="git --git-dir=$DIR/.git diff-tree --no-commit-id --name-only -r $BEFORE_SHA $CURRENT_SHA | xargs -i sh -c 'test -f {} && editorconfig-checker $DIR/{}'"

if [ "$debug" == "on" ]; then
	echo $command
else
	eval $command
fi
