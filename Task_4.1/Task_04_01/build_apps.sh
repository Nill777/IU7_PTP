#!/bin/bash

opts="O0"

mains="./main_*\.c"
echo $mains
for main in $mains; do
    a=$main
    out=${a%%.c}
    # Убрать часть до
    out=${out#*_}
    for opt in $opts; do
        gcc -Wall -Wpedantic -Wextra \
        -"$opt" \
        "$main" -o ./app/main_""$out""_"$opt"".exe"
    done
done

echo "build_apps.sh выполнено успешно"