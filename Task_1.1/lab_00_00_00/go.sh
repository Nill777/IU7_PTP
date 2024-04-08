#!/bin/bash

if [ $# != 1 ]; then
    echo Usage: ./go.sh file_name
    exit 1
fi

echo Result testing build_debug:
./build_debug.sh "$1"
./func_tests/scripts/func_tests.sh "$1"
./clean.sh
echo ""

echo Result testing build_release:
./build_release.sh "$1"
./func_tests/scripts/func_tests.sh "$1"
./clean.sh
echo ""

echo Result testing build_debug_asan:
./build_debug_asan.sh "$1"
./func_tests/scripts/func_tests.sh "$1"
./clean.sh
echo ""

echo Result testing build_debug_msan:
./build_debug_msan.sh "$1"
./func_tests/scripts/func_tests.sh "$1"
./clean.sh
echo ""

echo Result testing build_debug_ubsan:
./build_debug_ubsan.sh "$1"
./func_tests/scripts/func_tests.sh "$1"
./clean.sh
echo ""

echo Result gcov:
./build_gcov.sh "$1"
./func_tests/scripts/func_tests.sh "$1"
./collect_coverage.sh "$1"
./clean.sh
echo ""
echo Temporary files removed
echo ""