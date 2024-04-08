#!/bin/bash

# Компиляция
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c -g3 ./func_tests/t2b/t2b.c

# Комановка(-o название исполняемого файла)
gcc -o ./func_tests/t2b/t2b.exe t2b.o -lm
