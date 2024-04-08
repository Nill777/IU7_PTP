#!/bin/bash

if [ $# != 3 ]; then
    echo Usage: file_name.exe amount_of_elements count_tests
    exit 1
fi

# Вытаскиваем оптимизацию
number=$(echo "$app" | grep -o "[O].")

app="./app/${1#*/}"
# Убрать часть до
out=${1#*_}
out=${out%_*}
size=$2
N=$3

sh ./generate_sort.sh "$size"
sh ./generate_unsort.sh "$size"

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

echo
echo "dataset обновлен для ${1} (${size} элементов) успешно проведено ${N} тестов"
