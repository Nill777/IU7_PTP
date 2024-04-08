#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 2 ]; then
    exit 1
fi

sh ./func_tests/t2b/build_t2b.sh
touch ./func_tests/t2b/tmp1.out
tmp_1="./func_tests/t2b/tmp1.out"
touch ./func_tests/t2b/tmp2.out
tmp_2="./func_tests/t2b/tmp2.out"

cp -r "$1" "$tmp_1"
./func_tests/t2b/t2b.exe "$tmp_1" "$tmp_2"
cp -r "$tmp_2" "$2"

if [[ -f "$tmp_1" ]]; then
    rm "$tmp_1"
fi
if [[ -f "$tmp_2" ]]; then
    rm "$tmp_2"
fi
