#!/bin/zsh

TCdiff=true

open -a AvidMediaComposer

sleep 1
say "LFG"

until [[ $TCdiff == false ]]; do

	screencapture -x -R "$(cat $0:h:a/.screencap_region)" /tmp/a.png
	a=$(md5 -q /tmp/a.png)
	echo "a= $a"

	#THE COMMAND
	$0:h:a/cliclick w:500 kd:cmd,shift t:a ku:cmd,shift \
			t:8 \
			w:100 \
			t:dgf \
			w:300 \
			kd:cmd t:a ku:cmd t:vv \
			kd:shift kp:space ku:shift t:89 kd:shift t:b ku:shift \
			w:5000

	screencapture -x -R "$(cat $0:h:a/.screencap_region)" /tmp/b.png
	b=$(md5 -q /tmp/b.png)
	echo "b= $b"

	if [ "$a" = "$b" ]; then
		echo "same"
		TCdiff=false
	else
		echo "changed"
		TCdiff=true
	fi
done

	#THE COMMAND: \
	deselect all tracks \
	select V1 \
	select clip \
	mark in to out \
	match frame \
	select all tracks \
	cycle picture/sound x2 \
	timeline \
	deselect V1 \
	select A1 \
	overwrite \
	wait 5 secs \
