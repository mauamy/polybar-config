#!/bin/sh

active_window_id=$(xdotool getactivewindow 2> /dev/null )
if [ $? -eq 0 ]; then
	active_window_title=$(xprop -id $active_window_id | grep "^WM_NAME" | cut -d'"' -f2)

	echo $active_window_title | cut -c 1-50
else
	echo ""
fi

