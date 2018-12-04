#!/usr/bin/env bash

BASEDIR="$(dirname "$0")"
. $BASEDIR/assert.sh

output="$(debug=on $BASEDIR/../src/editorconfig-check.sh ./windson A B)"
expected="git --git-dir=./windson/.git diff-tree --no-commit-id --name-only -r A B | xargs -i sh -c 'test -f {} && editorconfig-checker ./windson/{}'"
assertEquals "$output" "$expected"
