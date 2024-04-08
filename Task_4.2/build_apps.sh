#!/bin/bash

sizes="5 50 100 150 200 250 300 350 400 450 500 550"
opts="O0 O2 O3 Os"

mains="./main_*\.c"
echo $mains
for main in $mains; do
    a=$main
    out=${a%%.c}
    out=${out#*_}
    for opt in $opts; do
        for size in $sizes; do
            gcc -Wall -Wpedantic -Wextra \
            -DN="${size}" \
            -"$opt" \
            "$main" -o ./app/main_""$out""_"$opt""_""$size"".exe" -lm
        done
    done
done

echo "build_apps.sh выполнено успешно"
