#!/bin/bash
if [ $# -ne 1 ]; then
    exit 1
fi

opts="O0 O2"

a=$1
out=${a%%.c}
out=${out#*_}

for opt in $opts; do
	gcc -Wall -Wpedantic -Wextra \
    -"$opt" \
    "$1" -o ./app/main_""$out""_"$opt"".exe"
done

echo "build_app.sh выполнено успешно"
