#!/bin/bash

assertEquals () {
	output=$1
	expected=$2
	result=$(diff <(echo "$output") <(echo "$expected"))

	if [[ -z $result ]]; then
		echo -e "$(basename "$0" | cut -d '.' -f1) ${GREEN}OK${NC}"
	else
		echo -e "$result"
		exit 1
	fi
}
