#!/bin/zsh

coordfile="$0:h:a/.screencap_region"

echo "Move the mouse to the TOP-LEFT corner, then press Enter."
read
tl=$(cliclick p)
echo "Move the mouse to the BOTTOM-RIGHT corner, then press Enter."
read
br=$(cliclick p)

x1=${tl%,*}; y1=${tl#*,}
x2=${br%,*}; y2=${br#*,}

x=$(( x1 < x2 ? x1 : x2 ))
y=$(( y1 < y2 ? y1 : y2 ))
w=$(( x2 > x1 ? x2 - x1 : x1 - x2 ))
h=$(( y2 > y1 ? y2 - y1 : y1 - y2 ))

echo "$x,$y,$w,$h" > "$coordfile"
