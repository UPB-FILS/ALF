#!/bin/bash

for folder in verify/assembly/*
do
	rm -f $folder/*.json
	rm -f $folder/*.wat
	rm -f $folder/*.wasm
	rm -f $folder/*.out
	for file in $folder/*.alf
	do
		echo $file
		node main.js $file 
		npx was $file.wat
	done
done