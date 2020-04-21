#!/bin/bash

for folder in verify/semantic/*
do
	rm -f $folder/*.json
	for file in $folder/*.alf
	do
		echo $file
		node main.js $file $file.ast.json $file.json
	done
done