#!/usr/bin/env bash
: '
	||| In the name of ALLAH |||
	----------------------------
	Operating Systems Laboratory
	Homework 01 - Phaze 02
	----------------------------
	Seyed Mahdi Mahdavi Mortazavi
	StdNum: 40030490
	----------------------------
	>>> Arrange your created
	Files By their types ...
'

crtdFiles=($(./Phaze1.sh $2 $3 $4))
P1StatusCode=$?
# Get the output and status code of the first script.

if [[ "$P1StatusCode" == 0 ]]; then
  echo "Status code: $P1StatusCode"
  for file in "${crtdFiles[@]}"; do
    folderName=$(echo "$file" | grep -oE '\.[^.]+$')
    folderName="${folderName[@]:1}"  # removing dot(.) at the first of folder name.
    mkdir -p "$1/$folderName"
    mv "$2/$file" "$1/$folderName/$file"
  done
else
  echo "Exit code with error: $P1StatusCode"
fi
