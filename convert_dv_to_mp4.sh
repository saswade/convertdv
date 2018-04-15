#!/bin/bash

source functions.sh

function convert {
	                ffmpeg -i "$1" \
                        -vf yadif -vcodec libx264 \
                        -preset medium -profile:v main \
                        -level 3.0 -pix_fmt yuv420p -crf 23 \
                        -x264-params ref=4 \
                        -acodec mp3 -ac 2 -ar 24000 -ab 80k \
                        -movflags faststart \
			-nostdin \
                        "$2" > /dev/null 2>&1
}

event="$1"

[ -z "$event" ] && error "Event=$event is empty"

cd "dv/$event"

ls -1 | while read dvfile; do
	info ">>>>    >>>>   >>>>   >>>>   >>>>"
	info "File === $dvfile"
	mp4file="$(echo "$dvfile" | cut -d '-' -f1,2,3,4 | tr '.' '-').mp4"
	destdir="../../mp4/$event"
	mkdir -p "$destdir"
	mp4fileNdir="$destdir/$mp4file"
	info "Converting $dvfile to $mp4file"
	if [ ! -f "$mp4fileNdir" ]; then
		convert "$dvfile" "$mp4file"
		mv "$mp4file" "$destdir"
	else
		info "File present skip converting"
	fi

	echo "$dvfile" | cut -d'-' -f2,3,4 | tr '._-' ' ' | \
	while read year month day hour minute second; do 
		datetime="$year-$month-$day $hour:$minute:$second"; 
		info "Changing file [$dvfile] last mod date to [$datetime]"
		touch -d "$datetime" "$dvfile"
		info "Changing file [$mp4fileNdir] last mod date to [$datetime]"
		touch -d "$datetime" "$mp4fileNdir"
	done
done
