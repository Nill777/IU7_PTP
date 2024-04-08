#!/bin/bash

if [ $# != 3 ]; then
    echo Usage: file_name.c amount_of_elements count_tests
    exit 1
fi

a=${1%%.c}
# Убрать часть до
out=${a#*_}
size=$2
N=$3

sh ./build_app.sh "$1"

apps="./app/main_${out}_*\.exe"
for app in $apps; do
    # Вытаскиваем оптимизацию
    number=$(echo "$app" | grep -o "[O].")

    c_1=0
    data="./data/data_""$out""_""$number""_""$size"".txt"
    echo -n > "$data"
    for (( i=1; i <= N; i++ )); do
        c_1=$(($c_1+1))
        echo -n -e "test: $c_1/$N \r"
        tmp="./data/tmp.txt"
        echo -n "$size" > "$tmp"
        "$app" < "$tmp" >> "$data"
    done
done
if [ -f "./data/tmp.txt" ]; then
    rm "./data/tmp.txt"
fi
echo
echo "dataset обновлен для ${1} (${size} элементов) успешно проведено ${N} тестов"
