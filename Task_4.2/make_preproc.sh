#!/bin/bash

# Данные после preproc.sh: 
# x; среднее арифметическое; rstd_error; value

# Чистим старые данные
old_preproc="./preproc/pre*\.txt"
for old_prep in $old_preproc; do
    if [ -f "$old_prep" ]; then
        rm "$old_prep"
    fi
done

data_multiply="./data/data_multiply_*\.txt"
data_t_multiply="./data/data_tmultiply_*\.txt"
# Собираем новые данные
c=0
for data in $data_multiply $data_t_multiply; do
    c=$(($c+1))
    echo -n -e "$c \r"
    main=$(echo "$data" | grep -o "[_][a-z]*" | grep -o "[a-z]*")
    # Вытаскиваем оптимизацию
    number=$(echo "$data" | grep -o "[O].")
    # Вытаскиваем количество элементов
    count_el=$(echo "$data" | grep -o "[1-9][0-9]*\." | grep -o "[1-9][0-9]*")

    preproc="./preproc/pre_${main}_${number}.txt"
    # Считаем сумму
    count_line=$(wc -l "$data" | grep -o "[1-9][0-9]*[[:space:]]")
    # Номер текущей строки
    cur=0
    summ=0
    while read a; do 
        cur=$(($cur+1))
        summ=`expr $summ + $a`
    done < "$data"

    let "average = $summ / $count_line"
    # rstd_err
    tmp_sum=0
    while read a; do 
        tmp=`expr $a - $average`
        let "tmp = $tmp**2"
        let "tmp_sum += $tmp"
    done < "$data"

    let "dispersion = $tmp_sum / ($count_line - 1)"
    std_deviation=$(echo "sqrt($dispersion)" | bc -l)
    temp=$(echo "sqrt($count_line)" | bc -l)
    std_err=$(echo "$std_deviation / $temp" | bc -l)
    if [[ "$average" -eq "0" ]]; then
        rstd_err="-"
    else
        rstd_err=$(echo "($std_err / $average) * 100" | bc -l |  grep -o "[1-9]*\.[0-9][0-9]")
    fi

    # Чистка после grep
    if [[ ! "$rstd_err" ]]; then
        rstd_err="0"
    fi
    if [[ "$rstd_err" =~ ^\.[0-9][0-9] ]]; then
        rstd_err="0""$rstd_err"
    fi
    # Строка для записи
    str="${count_el} ${average} ${rstd_err} ${value}"
    # echo $count_el
    echo "$str" >> "$preproc" 
done

# Сортировка данных в файле
prep_for_sort="./preproc/pre*\.txt"
tmp="./preproc/tmp.txt"
for prep in $prep_for_sort; do
    echo -n > "$tmp"
    sort -g "$prep" > "$tmp"
    echo -n > "$prep"
    cp "$tmp" "$prep"
done

if [ -f "$tmp" ]; then
    rm "$tmp"
fi

# preproc="./preproc/pre*\.txt"
# for prep in $preproc; do
#     # while read a; do
#     #     echo | 
#     # done < $prep
#     cat $prep
#     t=$(cat "$prep" | grep -o "[0-9]+[[:space:]][0-9]+[[:space:]]")
#     echo $t
#     # file_with_value="./data/value.txt"
#     # echo "$average" >> "$file_with_value"
# done

echo "make_preproc.sh выполнено успешно"
