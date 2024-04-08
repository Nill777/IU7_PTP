#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 2 ]; then
    exit 1
fi

sh ./func_tests/b2t/build_b2t.sh
touch ./func_tests/b2t/tmp1.out
tmp_1="./func_tests/b2t/tmp1.out"
echo -n > "$tmp_1"
touch ./func_tests/b2t/tmp2.out
tmp_2="./func_tests/b2t/tmp2.out"
echo -n > "$tmp_2"

cp -r "$1" "$tmp_1"
./func_tests/b2t/b2t.exe "$tmp_1" "$tmp_2"
cp -r "$tmp_2" "$2"

if [[ -f "$tmp_1" ]]; then
    rm "$tmp_1"
fi
if [[ -f "$tmp_2" ]]; then
    rm "$tmp_2"
fi
