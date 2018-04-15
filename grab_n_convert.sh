#!/bin/bash -e
source functions.sh

event="$1"

[ -z "$event" ] && error "Must enter event name "

time ./grab.sh "$event"

time ./convert_dv_to_mp4.sh "$event"
