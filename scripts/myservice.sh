#!/bin/bash

count=1

while true
do
    echo "At ($(date)) the count is $count"
    count=$((count + 1))
    sleep 3
done