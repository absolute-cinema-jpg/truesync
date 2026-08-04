#!/bin/zsh

TCdiff=true

open -a AvidMediaComposer
sleep 1
$0:h:a/cliclick $timeline

until [[ $TCdiff == false ]]; do

	screencapture -x -R "$(cat $0:h:a/.screencap_region)" /tmp/a.png
	a=$(md5 -q /tmp/a.png)

	#THE COMMAND
	$0:h:a/cliclick w:500 kd:cmd,shift t:a ku:cmd,shift \
			$v1 \
			w:100 \
			$selectClip \
			$markInOut \
			$matchFrame \
			w:300 \
			kd:cmd t:a ku:cmd \
			$cyclePicSound $cyclePicSound \
			$timeline \
			$v1 \
			$a1 \
			$overwrite

	sleep $delay

	screencapture -x -R "$(cat $0:h:a/.screencap_region)" /tmp/b.png
	b=$(md5 -q /tmp/b.png)

	if [ "$a" = "$b" ]; then
		echo "same"
		TCdiff=false
	else
		echo "changed"
		TCdiff=true
	fi
done

