#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: ./build_debug_udsan.sh file_name
    exit 1
fi
a=$1
out=${a%%.c}
out=$out"_udsan.exe"

clang -std=c99 -Wall -fsanitize=undefined -fno-omit-frame-pointer -g "$1" -o "$out"