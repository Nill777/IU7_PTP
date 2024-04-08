#!/bin/bash

clang -std=c99 -Wall -fsanitize=address -fno-omit-frame-pointer -g main.c func.c add_entry.c sort.c print_substr.c -o main_asan.exe
