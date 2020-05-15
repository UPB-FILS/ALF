#!/bin/bash

for folder in verify/assembly/*
do
	rm -f $folder/*.json
	rm -f $folder/*.wat
	rm -f $folder/*.wasm
	rm -f $folder/*.out
	
	optimizations=""

	if (echo $folder | grep bonus &> /dev/null);
	then
		optimizations="fold_constants unused"
	fi

	for file in $folder/*.alf
	do
		echo $file
		node main.js $file $optimizations
		npx was $file.wat 
	done

	rm -f $folder/*.wasm
done