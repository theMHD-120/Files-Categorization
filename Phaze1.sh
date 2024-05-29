#!/usr/bin/env bash
: '
	||| In the name of ALLAH |||
	----------------------------
	Operating Systems Laboratory
	Homework 01 - Phaze 01
	----------------------------
	Seyed Mahdi Mahdavi Mortazavi
	StdNum: 40030490
	----------------------------
	>>> Make some files with
	Different types ...
'

maxLenOfTypes=5
maxLenOfNames=10
signs=(\! 0 a A \; 1 b B \@ 2 c C \$ 3 d D \% 4 e E \^ 5 f F \- 6 g G \_ 7 h H \+ 8 i I \= 9 j J \` k K \# l L \' m M \, n M \~ o O p P q Q r R s S t T u U v V w W x X y Y z Z)
lowAlphas=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
# signs array is used to create file names (length = 77).
# lowAlphas array is used to create file types.
arrOfNames=()  # array of file names.
arrOfTypes=()  # array of file types.
arrOfFiles=()  # array of files (names.types).

for ((i = 0 ; i < $2 ; i++)); do
  fileName=""
  lenOfName=$(($RANDOM % "$maxLenOfNames"))
  for ((j = 1 ; j <= $(("$lenOfName" + 1)) ; j++)); do
    index=$(($RANDOM % 77))
    char="${signs[$index]}"
    fileName+="$char"
  done
  arrOfNames+=("$fileName")
done

for ((i = 0 ; i < $3 ; i++)); do
  fileType=""
  lenOfType=$(($RANDOM % "$maxLenOfTypes"))
  for ((j = 1 ; j <= $(("$lenOfType" + 1)) ; j++)); do
    index=$(($RANDOM % 26))
    letter="${lowAlphas[$index]}"
    fileType+="$letter"
  done
  arrOfTypes+=("$fileType")
done

typesIndex=0

for name in "${arrOfNames[@]}"; do
  arrOfFiles+=("$name"."${arrOfTypes[$typesIndex]}")
  mkdir -p $1
  touch $1/"${arrOfFiles[-1]}"
  typesIndex=$((typesIndex + 1))
  if [[ "$typesIndex" == $3 ]]
  then
    typesIndex=0
  fi
done

echo "${arrOfFiles[@]}"
