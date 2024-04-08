#!/bin/bash

# Компиляция
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c -g3 main.c func.c add_entry.c sort.c print_substr.c

# Комановка(-o название исполняемого файла)
gcc -o main_debug.exe main.o func.o add_entry.o sort.o print_substr.o -lm