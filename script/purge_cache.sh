#!/bin/bash
file=$1
hashed_key=$(echo -n "$file" | md5sum | awk '{print $1}')
find "/var/cache/nginx" -type f -name "$hashed_key" -exec rm -f {} \;
exit 0
