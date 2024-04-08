#!/bin/bash

sh ./build_apps.sh
# Количество тестов
N=1000
c=0

sizes="1 500 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 6000 6500 7000 7500 \
8000 8500 9000 9500 10000 11000 12000 13000 14000 15000 16000 17000 18000 19000 20000"

count=$(echo "$sizes" | grep -o "[0-9]*" | wc -l)

apps="./app/main_*\.exe"
for size in $sizes; do
    c=$(($c+1))
    sh ./generate_sort.sh "$size"
    sh ./generate_unsort.sh "$size"

    for app in $apps; do
        main=${app#./app/}
        # Вытаскиваем оптимизацию
        number=$(echo "$app" | grep -o "[O].")
        a=$main
        out=${a%%.exe}
        # Убрать часть до
        out=${out#*_}

        # Отсортированный массив
        c_1=0
        data_sort="./data/datasort_""$out""_""$size"".txt"
        echo -n > "$data_sort"
        res_sort="./resource/sort_""$size"".txt"
        for (( i=1; i <= N; i++ )); do
            c_1=$(($c_1+1))
            echo -n -e "$c/$count $c_1/$N $number \r"
            "$app" < "$res_sort" >> "$data_sort"
        done
        # Неотсортированный массив
        c_2=0
        data_unsort="./data/dataunsort_""$out""_""$size"".txt"
        echo -n > "$data_unsort"
        res_unsort="./resource/unsort_""$size"".txt"
        for (( i=1; i <= N; i++ )); do
            c_2=$(($c_2+1))
            echo -n -e "$c/$count $c_2/$N $number \r"
            "$app" < "$res_unsort" >> "$data_unsort"
        done
    done
done

echo
echo "dataset успешно собран"
