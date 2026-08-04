#!/bin/zsh

delay=$(osascript -e 'text returned of (display dialog "How many seconds between each clip" default answer "")')

isNew=false

source "$0:h:a/1-config.sh"
