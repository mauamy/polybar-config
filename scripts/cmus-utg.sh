#!/bin/bash

base="https://www.ultimate-guitar.com/search.php?search_type=title&value="

cmus-remote -Q > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo ""
    exit 0
fi

track=$(cmus-remote -Q 2> /dev/null | grep "title" | cut -d" " -f3-)
track="${track// /%20}"

firefox "$base$track" &
