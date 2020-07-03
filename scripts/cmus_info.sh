#!/bin/bash

info=$(cmus-remote -Q 2> /dev/null)
if [[ $1 -ne 0 ]]; then
	exit
fi

#echo $info

function getTag {
	value=$(echo -e "$info" | grep "tag $1" | cut -d" " -f3-)
	echo $value
}

function getSetValue {
	value=$(echo -e "$info" | grep "set $1 " | cut -d" " -f3-)
	echo $value
}

status=$(echo $info | grep "status" | cut -d" " -f2)

if [[ "$status" = "playing" ]]; then
	artist=$(getTag "artist")
	title=$(getTag "title")

	shuffle=$(getSetValue "shuffle")
	repeat=$(getSetValue "repeat")
	repeat_current=$(getSetValue "repeat_current")


	shuffle_icon=" 咽"
	repeat_icon=""

	if [[ "$shuffle" = "false" ]]; then
		shuffle_icon=""
	fi

	if [[ "$repeat" = "true" ]]; then
		repeat_icon=" 凌"
	elif [[ "$repeat_current" = "true" ]]; then
		repeat_icon=" 綾"
	fi

	echo "$artist - $title$shuffle_icon$repeat_icon "
else
	echo ""
fi

