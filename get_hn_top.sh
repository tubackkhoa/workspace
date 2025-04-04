#!/bin/bash

# Fetch the HN page
PAGE=$(curl -s https://news.ycombinator.com)

# Get the title and link
echo "$PAGE" | grep -A1 'class="titleline"' | grep -o '<a href="[^"]*">[^<]*</a>' | head -n1 | \
  sed -E 's|<a href="([^"]*)">(.*)</a>|Title: \2\nLink: \1|'

# Get the points
echo "$PAGE" | grep -o '[0-9]* points' | head -n1 | sed 's/\(.*\)/Points: \1/'