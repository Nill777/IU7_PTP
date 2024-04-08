#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: ./build_debug_msan.sh file_name
    exit 1
fi
a=$1
out=${a%%.c}
out=$out"_msan.exe"

clang -std=c99 -Wall -fsanitize=memory -fno-omit-frame-pointer -g "$1" -o "$out"