#!/bin/zsh

afplay $0:h:a/Content/start_2.mp3 &

# Your variables
coordinates="$(cat $0:h:a/.screencap_region)"
v1="t:8"
selectClip="t:d"
markInOut="t:g"
matchFrame="t:f"
cyclePicSound="t:v"
timeline="kd:shift kp:space ku:shift"
a1="t:9"
overwrite="kd:shift t:b ku:shift"
delay=5

# Build the message text
message="COORDINATES:
$coordinates

LOOP DELAY:
$delay seconds

SHORTCUTS:
V1-$v1					select clip-$selectClip
mark in to out-$markInOut		match frame-$matchFrame
cycle picture/sound-$cyclePicSound	timeline-$timeline
A1-$a1					overwrite-$overwrite"

# Show the dialog and capture the button pressed
choice=$(osascript <<EOF
set theChoice to choose from list {"Run", "Set coordinates", "Set loop delay", "Button Remapping"} ¬
    with title "truesync setup" ¬
    with prompt "$message" ¬
    default items {"Run"} ¬
    OK button name "Select" ¬
    cancel button name "Cancel"
if theChoice is false then
    return "Cancel"
else
    return item 1 of theChoice
end if
EOF
)

# Act on the choice
case "$choice" in
    "Run")
        echo "Running…"
	afplay $0:h:a/Content/run.mp3 &
        # your run commands here
        ;;
    "Set coordinates")
        echo "Opening configuration…"
	afplay "$0:h:a/Content/set coordinates.mp3" &
        # your configure commands here
        ;;
    "Set loop delay")
	echo "Setting delay"
	afplay "$0:h:a/Content/set loop delay.mp3" &
	;;
    "Button Remapping")
	echo "Remapping buttons"
	afplay "$0:h:a/Content/button remapping.mp3" &
	;;
    "Cancel"|*)
        echo "Cancelled."
        exit 0
        ;;
esac
