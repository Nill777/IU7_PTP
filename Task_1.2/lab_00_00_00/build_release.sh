#!/bin/bash

# Компиляция
gcc -std=c99 -c main.c func.c add_entry.c sort.c print_substr.c

# Комановка
gcc -o main_release.exe main.o func.o add_entry.o sort.o print_substr.o -lm
