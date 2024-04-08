#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 2 ]; then
    exit 1
fi

out_prog=$1
out_test=$2

# сравниваем их
rc=$(cmp -s "$out_prog" "$out_test")
if [ ! "$rc" ]; then
    exit 1
fi
exit 0