#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: amount_of_elements
    exit 1
fi

res="./resource/unsort_""$1"".txt"
if [ ! -f "$res" ]; then
    echo "$1" > "$res"
    for (( i=1; i <= $1; i++ )); do
        echo "$RANDOM" >> "$res"
    done

    echo "unsort_test_""$1"" успешно создан"
fi
