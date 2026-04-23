#!/usr/bin/env bash

pandoc cv.md \
  -o index.html \
  --from gfm \
  --to html5 \
  --standalone \
  --metadata title="Emil Oszmánbegovity" \
  --section-divs \
  --strip-comments \
  --no-highlight \
  --embed-resources --standalone
