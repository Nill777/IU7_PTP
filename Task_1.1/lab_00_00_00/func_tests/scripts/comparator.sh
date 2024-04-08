#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 2 ]; then
    exit 1
fi
# Маска для данной задачи
mask="[+-]?[0-9][0-9]*\.?[0-9]*"

out_prog=$1
out_test=$2

# grep-ом собираем выхлоп из файлов
prog=$(grep -Eo "$mask" "$out_prog")
test=$(grep -Eo "$mask" "$out_test")
# сравниваем их
if [ "$prog" != "$test" ]; then
    exit 1
fi
exit 0