#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: ./build_debug.sh file_name
    exit 1
fi

a=$1
out=${a%%.c}
out_f=$out"_debug.exe"
out_s=$out".o"
# Компиляция
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c -g3 "$1"
# Комановка(-o название исполняемого файла)
gcc -o "$out_f" "$out_s" -lm