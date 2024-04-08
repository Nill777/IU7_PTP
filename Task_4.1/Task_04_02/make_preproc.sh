#!/bin/bash

# Данные после preproc.sh: 
# x; среднее арифметическое; max; min; нижний квартиль; средний квартиль; верхний квартиль

# Чистим старые данные
old_preproc="./preproc/pre*\.txt"
for old_prep in $old_preproc; do
    if [ -f "$old_prep" ]; then
        rm "$old_prep"
    fi
done

data_sort="./data/datasort_*\.txt"
data_unsort="./data/dataunsort_*\.txt"

# Сортировка данных в файле
tmp="./data/tmp.txt"
for data_ in $data_sort $data_unsort; do
    echo -n > "$tmp"
    sort -g "$data_" > "$tmp"
    echo -n > "$data_"
    cp "$tmp" "$data_"
done

if [ -f "$tmp" ]; then
    rm "$tmp"
fi


# Собираем новые данные
c=0
for data in $data_sort $data_unsort; do
    c=$(($c+1))
    echo -n -e "$c \r"
    main=$(echo "$data" | grep -o "[_][a-z]*" | grep -o "[a-z]*")
    # Вытаскиваем оптимизацию
    number=$(echo "$data" | grep -o "[O].")
    # Вытаскиваем количество элементов
    count_el=$(echo "$data" | grep -o "[1-9][0-9]*\." | grep -o "[1-9][0-9]*")
    # Отсортированный массив
    if [[ "$data" =~ ./data/datasort.* ]]; then
        sort="sort"
    # Массив общего вида
    else
        sort="unsort"
    fi

    preproc="./preproc/pre${sort}_${main}_${number}.txt"
    # Считаем сумму и ищем минимум, максимум, квантили
    count_line=$(wc -l "$data" | grep -o "[1-9][0-9]*[[:space:]]")
    n_str=$(($count_line/2))
    n_str_up=$(($count_line/4*3))
    n_str_down=$(($count_line/4))
    # Номер текущей строки
    cur=0
    summ=0
    min=$(head -n 1 "$data")
    max=$(head -n 1 "$data")
    while read a; do 
        cur=$(($cur+1))
        summ=`expr $summ + $a`
        if [[ "$a" -lt "$min" ]]; then
            min="$a"
        fi
        if [[ "$a" -gt "$max" ]]; then
            max="$a"
        fi
        if [[ "$cur" -eq "$n_str_up" ]]; then
            quartile_up="$a"
        fi
        if [[ "$cur" -eq "$n_str" ]]; then
            quartile_mid="$a"
        fi
        if [[ "$cur" -eq "$n_str_down" ]]; then
            quartile_down="$a"
        fi
    done < "$data"

    let "average = $summ / $count_line"
    # rstd_err
    tmp_sum=0
    while read a; do 
        tmp_t=`expr $a - $average`
        let "tmp_t = $tmp_t**2"
        let "tmp_sum += $tmp_t"
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
    str="${count_el} ${average} ${max} ${min} \
${quartile_down} ${quartile_mid} ${quartile_up} ${rstd_err}"
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

echo "make_preproc.sh выполнено успешно"
