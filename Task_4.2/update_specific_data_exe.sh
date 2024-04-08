#!/bin/bash

if [ $# != 3 ]; then
    echo Usage: file_name.exe amount_of_elements count_tests
    exit 1
fi


app="./app/${1#*/}"
# Вытаскиваем оптимизацию
number=$(echo "$app" | grep -o "[O].")
# Убрать часть до
out=${1#*_}
out=${out%_*}
size=$2
N=$3

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
if [ -f "./data/tmp.txt" ]; then
    rm "./data/tmp.txt"
fi
echo
echo "dataset обновлен для ${1} (${size} элементов) успешно проведено ${N} тестов"
