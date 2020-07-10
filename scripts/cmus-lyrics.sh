#!/bin/bash

base="https://genius.com/search?q="

cmus-remote -Q > /dev/null 2>&1
if [[ $? -ne 0  ]]; then
    exit 0
fi

track=$(cmus-remote -Q 2> /dev/null | grep "title" | cut -d" " -f3-)
track="${track// /%20}"

firefox "$base$track" &
