#!/bin/bash

# Количество ошибочных тестов
count_err=0
pos=0
neg=0

# Коды ошибок
test_pass="0"
test_failed="1"

# Позитивные тесты
files="./func_tests/data/pos_??_in.txt"
for file_in in $files; do

	# Вытаскиваем номер теста
	number=$(echo "$file_in" | grep -o "[0-9]*")

	# Проверка на наличие тестов(-z длина строки = 0)
	if [ -z "$number" ]; then
		break
	fi
	# Флаг наличия поз. тестов
    pos=1

	# Название выходного тестового файла
	file_out="./func_tests/data/pos_""$number""_out.txt"

	# Выходной файл существует => передаем входной и выходной файлы в pos_case.sh
	# Не существует, то тест провален, переходим к следующему тесту

	if [ -f "$file_out" ]; then
		command="./func_tests/scripts/pos_case.sh ""$file_in ""$file_out"
	else
		echo "POS_""$number"": FAILED"
		count_err=$((count_err + 1))
		continue
	fi

	$command
	return_code="$?"

	# Результат в соответствии с кодом возврата ./pos_case.sh
	if [ "$return_code" = "$test_pass" ]; then
		echo "POS_""$number"": PASSED"
	fi
	if [ "$return_code" = "$test_failed" ]; then
		echo "POS_""$number"": FAILED"
		count_err=$((count_err + 1))
        pos=$((pos + 1))
	fi
done

# Негативные тесты 
files="./func_tests/data/neg_??_in.txt"
for file_in in $files; do

	# находим номер теста
	number=$(echo "$file_in" | grep -o "[0-9]*")

	# проверка на наличие тестов(-z длина строки = 0)
	if [ -z "$number" ]; then
		break
	fi
	# Флаг наличия нег. тестов
    neg=1

	# Передаем входной тестовый файл в ./neg_case.sh
	command="./func_tests/scripts/neg_case.sh ""$file_in"
	
	$command
	return_code="$?"

	# Результат в соответствии с кодом возврата ./neg_case.sh
	if [ "$return_code" = "$test_pass" ]; then
		echo "NEG_""$number"": PASSED"
	fi
	if [ "$return_code" = "$test_failed" ]; then
		echo "NEG_""$number"": FAILED"
		count_err=$((count_err + 1))
	fi
done

# Дополнительная информация

if [ "$count_err" = 0 ]; then
	echo "All tests passed." 
else
	echo "Failed $count_err tests." 
fi

if [ "$pos" = 0 ]; then
	echo "No positive tests." 
fi

if [ "$neg" = 0 ]; then 
	echo "No negative tests."
fi

exit "$count_err"