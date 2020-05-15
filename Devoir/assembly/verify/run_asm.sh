#!/bin/bash

echo -n > "$3"

npx was "$1" -o run.wasm

while read inputstr
do
    echo $inputstr > "file.keyboard"
	npx was r run.wasm < "file.keyboard" -m 1:1 >> "$3"
	err=$?
	if [ $err == 0 ]; then 
		echo >> "$3"
	else
		exit 1
	fi
done < "$2"

