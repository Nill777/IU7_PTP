#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: ./build_debug.sh file_name
    exit 1
fi

a=$1
out=${a%%.c}
out=$out"_gcov.exe"

gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c -O0 -g3 --coverage "$1"
gcc main.o -o "$out" --coverage -lm