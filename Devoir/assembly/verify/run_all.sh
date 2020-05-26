#!/bin/bash

mkdir -p output
rm -rf output/*

POINTS=0

dir=$1

errorslist=$dir/errors.out
rm -f $errorslist

cd "$dir"

if [ -d node_modules ];
then
	echo 'Please delete the node_modules folder from your homework archive'
elif [ ! -f package.json ];
then
	echo 'The package.json file is missing'
	echo 'Please add a package.json file to you homework archive.'
elif ! npm install;
then
	echo 'npm install fail, please verify that the package.json file information'
else

	npm install jshint lodash was

	MAIN=`node verify/startup.js | cut -d ';' -f 1`
	AUTHOR=`node verify/startup.js | cut -d ';' -f 2`

	echo Your main file is "$MAIN"
	echo The author is "$AUTHOR"

	passed=0
	failed=0
	total=0

	echo "grammar.js" > .jshintignore
	echo "backend.js" >> .jshintignore

	echo '{ "node":true, "loopfunc": true, "esversion":9 }' > .jshintrc

	if [ ! -f $MAIN ];
	then
		echo "Your main.js file is missing"
	elif ! npx jshint *.js;
	then
		echo "Please review your code, you have jshint errors"
	else
		cd -
		for folder in assembly/*
		do
			if [ -d $folder ];
			then
				if [ -f "$folder"/run.txt ];
				then
					echo `head -n 1 "$folder"/run.txt` "(Variables, WAS)" 
					P1=`head -n 2 "$folder"/run.txt | tail -n 1 | cut -d " " -f 1`
					P2=`head -n 2 "$folder"/run.txt | tail -n 1 | cut -d " " -f 2`
				else
					echo `basename $folder`
					P1=1
					P2=10
				fi
				if [ $failed == 0 ] || ! (echo $folder | grep bonus &> /dev/null);
				then
					for file in "$folder"/*.alf
					do
						inputfile=`pwd`/"$file".json
						opt_outputfile=output/`basename "$file"`.opt.json
						wat_outputfile=output/`basename "$file"`.wat
						originalfile="$file.wat"
						originalopt="$file.opt.json"
						originaloutputfile="$file.wasm"
						errorsfile=output/`basename "$file"`.err
						title=`head -n 1 "$file" | grep '{' | cut -d '{' -f 2 | cut -d '}' -f 1` 
						if [ `echo -n "$title" | wc -c` -eq 0 ];
						then
							title=`basename $file`
						fi
						optimizations=""
						if (echo $folder | grep bonus &> /dev/null); then
							optimizations="fold_constants unused"
						fi
						# echo $optimizations
						node "$1" "$inputfile" "$opt_outputfile" "$wat_outputfile" $optimizations
						strtitle="Verifying $title"
						printf '%s' "$strtitle"
						pad=$(printf '%0.1s' "."{1..60})
						padlength=75
						# echo $originalfile
						# echo $outputfile
						e=""
						str="("
						# Symbol
						echo "Variables" > "$errorsfile"
						echo "-----------" >> "$errorsfile"
						if node verify.js "$originalopt" "$opt_outputfile"  >> "$errorsfile" 2>&1
						then
							p=$P1
							passed=$(($passed+1))
							POINTS=$(($POINTS+$P1))
						else
							diff --ignore-all-space -y --suppress-common-lines "$originalopt" "$opt_outputfile" >> "$errorsfile" 2>&1
							p=0
							e="variables "
						fi
						str=$str"$p""p, "
						# AST
						echo "WAS" >> "$errorsfile"
						echo "-----------" >> "$errorsfile" 
						if [ "$e" == "" ]
						then
							keyboardfile="$file".in
							if [ ! -f $keyboardfile ]; then keyboardfile="empty.in"; fi
							if ! timeout 10 ./run_asm.sh "$originalfile" "$keyboardfile" "$file".out; then
								echo " checker error"
								exit 1
							fi
							timeout 10 ./run_asm.sh "$wat_outputfile" "$keyboardfile" "$wat_outputfile".out 2>> "$errorsfile"
							err=$?
							if [ $err == 124 ]; then
								e=$e"timeout "
								p=0
							elif [ $err != 0 ]; then
								e=$e"asm "
								p=0
							else
								if diff -y --suppress-common-lines "$file".out "$wat_outputfile".out >> "$errorsfile" 2>&1
								then
									p=$P2
									passed=$(($passed+1))
									POINTS=$(($POINTS+$P2))
								else
									p=0
									e=$e"asm "
								fi
							fi
						else
							echo "Not tested, variable allocation error" >> "$errorsfile" 
							p=0
						fi
						str=$str"$p""p)"
						if [ "$e" == "" ]
						then
							str="ok "$str
						else
							#str="error (0p)"
							failed=$(($failed+1))
							echo "--------------" >> $errorslist 
							echo $strtitle >> $errorslist
							# head -10 "$errorsfile" >> $errorslist
							cat "$errorsfile" >> $errorslist
							str="error "$str
						fi
						total=$(($total+2))
						printf '%*.*s' 0 $((padlength - ${#strtitle} - ${#str} )) "$pad"
						printf '%s\n' "$str"
						#head -35 "$errorsfile"
					done
				else
					echo "Not verifying bonus, you have $failed failed tests"
				fi
			fi
		done	
	fi

	echo 'Tests: ' $passed '/' $total
	echo 'Points: '$POINTS
	echo 'Mark without penalities: '`echo $(($POINTS*3)) | sed 's/..$/.&/'`

	if [ "$passed" != "$total" ];
	then
		echo -e "Original tree						      | Your tree" 1>&2
		cat $errorslist 1>&2
	fi
fi
