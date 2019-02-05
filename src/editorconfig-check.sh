#/bin/bash
BASEDIR="$(dirname "$0")"
BASENAME="$(basename "$0")"

DIR=$1
BEFORE_SHA=$2
CURRENT_SHA=$3

command="git --git-dir=$DIR/.git diff-tree --no-commit-id --name-only -r $BEFORE_SHA..$CURRENT_SHA | xargs -i sh -c 'cd $DIR && test -f {} && editorconfig-checker $DIR/{}'"

if [[ "$#" -ne 3 || "$BEFORE_SHA" == "0000000000000000000000000000000000000000" ]]; then
  echo "Usage: $BASEDIR/$BASENAME DIR BEFORE_COMMIT CURRENT_COMMIT"
  exit 0
fi


if [ "$debug" == "on" ]; then
	echo $command
else
	eval $command
fi
