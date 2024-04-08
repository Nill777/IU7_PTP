#!/bin/bash

# Компиляция
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c -g3 ./func_tests/b2t/b2t.c

# Комановка(-o название исполняемого файла)
gcc -o ./func_tests/b2t/b2t.exe b2t.o -lm
