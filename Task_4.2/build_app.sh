#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Use: sh ./build_app.sh file_name.c matrix_size"
    exit 1
fi

opts="O0 O2 O3 Os"

a=$1
out=${a%%.c}
out=${out#*_}
size=$2

for opt in $opts; do
	gcc -Wall -Wpedantic -Wextra \
    -DN="${size}" \
    -"$opt" \
    "$1" -o ./app/main_""$out""_"$opt""_""$size"".exe" -lm
done

echo "build_app.sh выполнено успешно"
