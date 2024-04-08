#!/bin/bash

clang -std=c99 -Wall -fsanitize=undefined -fno-omit-frame-pointer -g main.c func.c add_entry.c sort.c print_substr.c -o main_udsan.exe
