#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: amount_of_elements
    exit 1
fi

res="./resource/sort_""$1"".txt"
if [ ! -f "$res" ]; then
    echo "$1" > "$res"
    for (( i=1; i <= $1; i++ )); do
        echo "$i" >> "$res"
    done

    echo "sort_test_""$1"" успешно создан"
fi
