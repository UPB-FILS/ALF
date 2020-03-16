#!/bin/bash

for folder in verify/robot/*
do
	for file in $folder/*.s
	do
		echo $file
		node main.js $file > $file.out
	done
done
