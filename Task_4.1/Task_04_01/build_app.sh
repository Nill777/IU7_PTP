#!/bin/bash
if [ $# -ne 1 ]; then
    exit 1
fi

opts="O0"

for opt in $opts; do
    a=$1
    out=${a%%.c}
    out=${out#*_}
	gcc -Wall -Werror -Wpedantic -Wextra \
    -"$opt" \
    "$1" -o ./app/main_""$out""_"$opt"".exe"
done

echo "build_app.sh выполнено успешно"
