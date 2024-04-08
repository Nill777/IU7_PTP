#!/bin/bash

if [ $# != 2 ]; then
    echo "Usage: ./main_*.c time"
    exit 1
fi

sh ./build_app.sh "$1"

a=$1
out=${a%%.c}
out=${out#*_}
apps="./app/main_""$out""*\.exe"
echo $apps
for app in $apps; do
    # Вытаскиваем оптимизацию
    number=$(echo "$app" | grep -o "[O].")
    echo $number
    a=$1
    out=${a%%.c}
    out=${out#*_}

    touch "./data/data_""$out""_""$number"".txt"
    data="./data/data_""$out""_""$number"".txt"

    echo "$1 $2"
    tmp="./data/tmp.txt"
    echo "$2" > "$tmp"
    "$app" < "$tmp" >> "$data"
done

if [[ -f "./data/tmp.txt" ]]; then
    rm "./data/tmp.txt"
fi
echo
echo "dataset успешно обновлен"
