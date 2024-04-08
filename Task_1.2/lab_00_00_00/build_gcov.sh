#!/bin/bash

# Компиляция
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c -g3 --coverage main.c func.c add_entry.c sort.c print_substr.c

# Комановка(-o название исполняемого файла)
gcc -o main_gcov.exe main.o func.o add_entry.o sort.o print_substr.o --coverage -lm