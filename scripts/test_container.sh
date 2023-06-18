#!/bin/bash

count=0
started=false

while true; do
    count=$((count + 1))
    echo "[$STAGE_NAME] Starting container [Attempt: $count]"

    testStart=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000)

    if [ "$testStart" -eq 200 ]; then
        started=true
        break
    else
        sleep 1
    fi
done

if ! $started; then
    exit 1
fi
