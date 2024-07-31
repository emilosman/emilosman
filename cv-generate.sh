#!/bin/bash

current_date=$(date +"%Y%m%d")
output_file="$HOME/Documents/cv/${current_date} Emil Oszmanbegovity CV.pdf"
tmpfile=$(mktemp /tmp/md_no_images.XXXXXX.md)

sed '/!\[.*\](.*)/d' ./docs/index.md > "$tmpfile"

pandoc -o "$output_file" "$tmpfile" -V geometry:margin=1in --resource-path=.:docs:assets

rm "$tmpfile"
