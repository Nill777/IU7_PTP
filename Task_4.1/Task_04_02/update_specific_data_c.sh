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

sh ./generate_sort.sh "$size"
sh ./generate_unsort.sh "$size"
apps="./app/main_${out}_*\.exe"
for app in $apps; do
    # Вытаскиваем оптимизацию
    number=$(echo "$app" | grep -o "[O].")
    # Отсортированный массив
    c_1=0
    data_sort="./data/datasort_""$out""_""$number""_""$size"".txt"
    res_sort="./resource/sort_""$size"".txt"
    for (( i=1; i <= N; i++ )); do
        c_1=$(($c_1+1))
        echo -n -e "$c_1/$N \r"
        "$app" < "$res_sort" >> "$data_sort"
    done
    # Неотсортированный массив
    c_2=0
    data_unsort="./data/dataunsort_""$out""_""$number""_""$size"".txt"
    res_unsort="./resource/unsort_""$size"".txt"
    for (( i=1; i <= N; i++ )); do
        c_2=$(($c_2+1))
        echo -n -e "$c_2/$N \r"
        "$app" < "$res_unsort" >> "$data_unsort"
    done
done

echo
echo "dataset обновлен для ${1} (${size} элементов) успешно проведено ${N} тестов"
