#!/bin/bash

# Все делаем из папки lab_!!!
# Проверка количества переданных файлов
if [ $# -ne 2 ]; then
	exit 1
fi

file_in=$1
file_args=$2

# Коды ошибок
test_pass="0"
test_failed="1"

flag=$(head -n 1 "$file_args")
file_substr=$(sed '2q;d' "$file_args")

# Если передали входной и выходной файлы,
# то передаём их исполняемому файлу *.exe

touch ./func_tests/scripts/prog_neg.out
prog="./func_tests/scripts/prog_neg.out"

# Переводим текстовые файлы в бинарные
sh ./t2b.sh "$file_in" "$file_in"

if [[ "$flag" == "ab" ]]; then
	touch ./func_tests/data/add.out
	add_entry="./func_tests/data/add.out"
	# Вытаскиваем запись, которую нужно добавить из file_args
	sed -n '3,7p' "$file_args" > "$add_entry"

	command="./*.exe ${flag} ${file_in}"
	$command < "$add_entry" > "$prog"
else
	command="./*.exe ${flag} ${file_in} ${file_substr}"
	$command > "$prog"
fi

return_code="$?"

# Переводим бинарные файлы в текстовые
sh ./b2t.sh "$file_in" "$file_in"
# Проверка завершения программы
if [ "$return_code" -ne 0 ]; then						# не нулевой код ошибки возврата
	exit "$test_pass"									# верный тест
else
	exit "$test_failed"									# неверный тест
fi
