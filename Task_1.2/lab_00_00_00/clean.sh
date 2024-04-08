#!/bin/bash

# *.txt *.exe *.o *.out *.gcno *.gcda *.gcov
junk_files1="./func_tests/*/*.out"
junk_files2="./func_tests/*/*.exe"
junk_files3="./*.exe ./*.o ./*.out ./*.gcno ./*.gcda ./*.gcov"
# Проверить, существует ли файл
for el in $junk_files1 $junk_files2 $junk_files3;
do
    if [[ -f $el ]]; then
        rm "$el"
    fi
done
