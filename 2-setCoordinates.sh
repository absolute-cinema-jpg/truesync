#!/bin/zsh

coordfile="$0:h:a/.screencap_region"

osascript -e 'display dialog "Move the mouse to the TOP-LEFT corner, then press Enter."'
tl=$(cliclick p)
osascript -e 'display dialog "Move the mouse to the BOTTOM-RIGHT corner, then press Enter."'
br=$(cliclick p)

x1=${tl%,*}; y1=${tl#*,}
x2=${br%,*}; y2=${br#*,}

x=$(( x1 < x2 ? x1 : x2 ))
y=$(( y1 < y2 ? y1 : y2 ))
w=$(( x2 > x1 ? x2 - x1 : x1 - x2 ))
h=$(( y2 > y1 ? y2 - y1 : y1 - y2 ))

echo "$x,$y,$w,$h" > "$coordfile"

isNew=false

source "$0:h:a/1-config.sh"
