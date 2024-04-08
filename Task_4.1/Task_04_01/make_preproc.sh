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

data="./data/data_*\.txt"

# Сортировка данных в файле
tmp="./data/tmp.txt"
count=0
for data_ in $data; do
    count=$(($count+1))
    echo -n > "$tmp"
    sort -g "$data_" > "$tmp"
    echo -n > "$data_"
    cp "$tmp" "$data_"
done

if [ -f "$tmp" ]; then
    rm "$tmp"
fi
c=0
# Собираем новые данные
for data_ in $data; do
    c=$(($c+1))
    echo -n -e "$c/$count \r"
    # Убрать часть до
    main_=${data_#*_}
    # Убрать часть после
    main=${main_%_*}
    sleep=$(echo "$data_" | grep -o "[1-9][0-9]*\." | grep -o "[1-9][0-9]*")

    preproc="./preproc/pre_${main}.txt"
    # Считаем среднее арифметическое
    count_line=$(wc -l "$data_" | grep -o "[1-9][0-9]*[[:space:]]")
    # Номер текущей строки
    cur=0
    summ=0
    while read a; do 
        cur=$(($cur+1))
        summ=`expr $summ + $a`
    done < "$data_"

    let "average = $summ / $count_line"
    # Строка для записи
    str="${sleep} ${average}"
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
