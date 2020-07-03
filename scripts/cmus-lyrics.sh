#!/bin/bash

base="https://genius.com/search?q="

track=$(cmus-remote -Q 2> /dev/null | grep "title" | cut -d" " -f3-)
if [[ $? -ne 0  ]]; then
    echo ""
    exit 0
if


track="${track// /%20}"

firefox "$base$track" &
