#!/bin/bash -e
source functions.sh

event="$1"

[ -z "$event" ] && error "Must enter event name "

event=$(echo "$event" | tr ' ' '_')

fileprefix="$(echo "$event" | tr ': -/.' '_' | tr -s '_')-"

workdir="dv/$event"

info "workdir=${workdir}, file prefix=${fileprefix}"

mkdir -p "$workdir"

cd "$workdir"

# autosplit splits recording when new scene starts based on time
# -autosplit=120 splits the recording whenever there
#                 is a gap in the recording that is 2 mins or longer.
dvgrab -autosplit=3 -size 1000 -timecode -t -rewind "$fileprefix"
