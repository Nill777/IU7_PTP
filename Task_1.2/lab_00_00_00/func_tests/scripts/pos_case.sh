#!/bin/bash

# Все делаем из папки lab_!!!
# Проверка количества аргументов
if [ $# -ne 3 ]; then
    exit 1
fi

file_in=$1
file_out=$2
file_args=$3

# Коды ошибок
test_pass="0"
test_failed="1"

flag=$(head -n 1 "$file_args")
file_substr=$(sed '2q;d' "$file_args")

# Если передали входной и выходной файлы,
# то передаём их исполняемому файлу *.exe

touch ./func_tests/scripts/prog_pos.out
prog="./func_tests/scripts/prog_pos.out"

# Переводим текстовые файлы в бинарные
sh ./t2b.sh "$file_in" "$file_in"
# Если не флаг печати переводим file_out
if [[ "$flag" != "fb" ]]; then
	sh ./t2b.sh "$file_out" "$file_out"
fi

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

# Проверка завершения программы
if [ "$return_code" -ne 0 ]; then						# не нулевой код ошибки
	sh ./b2t.sh "$file_in" "$file_in"
	# Если не флаг печати переводим file_out
	if [[ "$flag" != "fb" ]]; then
		sh ./b2t.sh "$file_out" "$file_out"
	fi
	exit "$test_failed"
fi

if [[ "$flag" == "ab" ]]; then
	# сравниваем выходные данные программы и данные в тесте
	if sh ./func_tests/scripts/comparator.sh "$file_in" "$file_out"; then		# неверный тест
		# Переводим бинарные файлы в текстовые
		sh ./b2t.sh "$file_in" "$file_in"
		sh ./b2t.sh "$file_out" "$file_out"
		exit "$test_failed"
	else													# верный тест
		# Переводим бинарные файлы в текстовые
		sh ./b2t.sh "$file_in" "$file_in"
		sh ./b2t.sh "$file_out" "$file_out"
		exit "$test_pass"
	fi
else
	# сравниваем выходные данные программы и данные в тесте
	if sh ./func_tests/scripts/comparator.sh "$prog" "$file_out"; then		# неверный тест
		# Переводим бинарные файлы в текстовые
		sh ./b2t.sh "$file_in" "$file_in"
		# Если не флаг печати переводим file_out
		if [[ "$flag" != "fb" ]]; then
			sh ./b2t.sh "$file_out" "$file_out"
		fi
		exit "$test_failed"
	else													# верный тест
		# Переводим бинарные файлы в текстовые
		sh ./b2t.sh "$file_in" "$file_in"
		# Если не флаг печати переводим file_out
		if [[ "$flag" != "fb" ]]; then
			sh ./b2t.sh "$file_out" "$file_out"
		fi
		exit "$test_pass"
	fi
fi
