#!/bin/bash

sh ./build_apps.sh
# Количество тестов
N=100
c=0

apps="./app/main_*\.exe"
for app in $apps; do
    c=$(($c+1))
    main=${app#./app/}
    # Вытаскиваем оптимизацию
    number=$(echo "$app" | grep -o "[O].")
    a=$main
    out=${a%%.exe}
    # Убрать часть до
    out=${out#*_}

    c_1=0
    data="./data/data_""$out"".txt"
    echo -n > "$data"
    for (( i=1; i <= N; i++ )); do
        c_1=$(($c_1+1))
        echo -n -e "exe: $c test: $c_1/$N opt: $number size: $size \r"
        tmp="./data/tmp.txt"
        echo -n "$size" > "$tmp"
        "$app" < "$tmp" >> "$data"
    done
done

if [ -f "./data/tmp.txt" ]; then
    rm "./data/tmp.txt"
fi
echo
echo "dataset успешно собран"
