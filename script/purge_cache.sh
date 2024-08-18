#!/bin/bash
file=$1
cache_path="/var/cache/nginx"
hashed_key=$(echo -n "$file" | md5sum | awk '{print $1}')
rm -f $cache_path/*/$hashed_key
