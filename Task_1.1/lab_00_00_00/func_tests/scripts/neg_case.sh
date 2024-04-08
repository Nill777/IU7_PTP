#!/bin/bash

# Все делаем из папки lab_!!!
# Проверка количества переданных файлов
if [ $# -ne 1 ]; then
	exit 1
fi

test_in=$1

# Коды ошибок
test_pass="0"
test_failed="1"

# Если передали входной и выходной файлы,
# то передаём их исполняемому файлу *.exe

touch ./func_tests/scripts/prog_neg.out

command="./*.exe"
prog="./func_tests/scripts/prog_neg.out"
$command < "$test_in" > "$prog"

return_code="$?"
# Проверка завершения программы
if [ "$return_code" -ne 0 ]; then						# не нулевой код ошибки возврата
	exit "$test_pass"									# верный тест
else													# неверный тест
	exit "$test_failed"
fi