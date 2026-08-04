#!/bin/zsh

# Your variables
coordinates="$(cat $0:h:a/.screencap_region)"
isNew=true
source "$0:h:a/.keys" 2>/dev/null
source "$0:h:a/.delay"

#Start
source "$0:h:a/1-config.sh"

