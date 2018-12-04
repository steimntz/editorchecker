#!/usr/bin/env bash

BASEDIR="$(dirname "$0")"
. $BASEDIR/assert.sh

output="$(debug=on $BASEDIR/../src/editorconfig-check.sh ./windson AABA BBAB)"
expected="git --git-dir=./windson/.git diff-tree --no-commit-id --name-only -r AABA BBAB | xargs -i sh -c 'test -f {} && editorconfig-checker ./windson/{}'"
assertEquals "$output" "$expected"

output="$(debug=on $BASEDIR/../src/editorconfig-check.sh ./windson A)"
expected="Usage: tests/../src/editorconfig-check.sh DIR BEFORE_COMMIT CURRENT_COMMIT"
assertEquals "$output" "$expected"

output="$(debug=on $BASEDIR/../src/editorconfig-check.sh ./windson 0000000000000000000000000000000000000000 B)"
expected="Usage: tests/../src/editorconfig-check.sh DIR BEFORE_COMMIT CURRENT_COMMIT"
assertEquals "$output" "$expected"

#output="$(debug=on $BASEDIR/../src/editorconfig-check.sh ./windson A 00000000000)"
#expected="Usage: tests/../src/editorconfig-check.sh DIR BEFORE_COMMIT CURRENT_COMMIT"
#assertEquals "$output" "$expected"
