#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: ./build_release.sh file_name
    exit 1
fi

a=$1
out=${a%%.c}
out_f=$out"_release.exe"
out_s=$out".o"
# Компиляция
gcc -std=c99 -c "$1"
# Комановка
gcc -o "$out_f" "$out_s" -lm