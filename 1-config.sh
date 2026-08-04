#!/bin/zsh

if [ $isNew = true ]; then
	afplay $0:h:a/Resources/Sounds/start_2.mp3 &
fi

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
set theChoice to choose from list {"Run", "Button Remapping", "Set coordinates", "Set loop delay"} ¬
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
	afplay "$0:h:a/Resources/Sounds/run.mp3" &
        # your run commands here
        ;;
     "Button Remapping")
	echo "Remapping buttons"
	afplay "$0:h:a/Resources/Sounds/button remapping.mp3" &
	open "$0:h:a/.keys"
	;;
    "Set coordinates")
        echo "Opening configuration…"
	afplay "$0:h:a/Resources/Sounds/wheres that timecode window.mp3" &
	source "$0:h:a/2-setCoordinates.sh"
        ;;
    "Set loop delay")
	echo "Setting delay"
	afplay "$0:h:a/Resources/Sounds/lets not waste time here.mp3" &
	source "$0:h:a/3-setDelay.sh"
	;;
    "Cancel"|*)
        echo "Cancelled."
	if [ $isNew = true ]; then
		afplay "$0:h:a/Resources/Sounds/nevermind.mp3" &
	fi
        exit 0
        ;;
esac
