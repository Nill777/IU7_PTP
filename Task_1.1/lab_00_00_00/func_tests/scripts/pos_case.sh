#!/bin/bash

# Все делаем из папки lab_!!!
# Проверка количества переданных файлов
if [ $# -ne 2 ]; then
	exit 1
fi

test_in=$1
test_out=$2

# Коды ошибок
test_pass="0"
test_failed="1"

# Если передали входной и выходной файлы,
# то передаём их исполняемому файлу *.exe

touch ./func_tests/scripts/prog.out

command="./*.exe"
prog="./func_tests/scripts/prog.out"
$command < "$test_in" > "$prog"

return_code="$?"
# Проверка завершения программы
if [ "$return_code" -ne 0 ]; then						# не нулевой код ошибки
	exit "$test_failed"
fi

# сравниваем выходные данные программы и данные в тесте
if ! ./func_tests/scripts/comparator.sh "$prog" "$test_out"; then		# неверный тест
	exit "$test_failed"
    
else													# верный тест
	exit "$test_pass"
fi