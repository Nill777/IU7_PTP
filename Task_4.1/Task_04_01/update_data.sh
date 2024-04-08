#!/bin/bash

sh ./build_apps.sh
# Количество тестов
N=100
c_app=0

sizes="1 5 10 15 20 30 50 70 100 300 500 700 800 1000"
count=$(echo "$sizes" | grep -o "[0-9]*" | wc -l)

apps="./app/main_*\.exe"
count_app=0
for app in $apps; do
    count_app=$(($count_app+1))
done

for app in $apps; do
    c=0
    c_app=$(($c_app+1))
    main=${app#./app/}
    # Вытаскиваем оптимизацию
    number=$(echo "$app" | grep -o "[O].")
    a=$main
    out_=${a%%.exe}
    # Убрать часть до
    out=${out_#*_}

    for size in $sizes; do
        c=$(($c+1))
        echo -n -e "$c_app/$count_app $c/$count \r"
        data="./data/data_""$out""_""$size"".txt"
        tmp="./data/tmp.txt"
        echo -n > "$data"
        for (( i=1; i <= N; i++ )); do
            echo -n > "$tmp"
            echo "$size" > "$tmp"
            "$app" < "$tmp" >> "$data"
        done
    done
done

if [ -f "./data/tmp.txt" ]; then
    rm "./data/tmp.txt"
fi

echo "dataset успешно собран"
