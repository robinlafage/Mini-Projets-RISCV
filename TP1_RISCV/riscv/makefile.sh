#!/bin/bash
riscv64-unknown-elf-as -march=rv64g $1.s -o $1.o
riscv64-unknown-elf-as -march=rv64g libprint.s -o libprint.o
riscv64-unknown-elf-gcc $1.o libprint.o -o $1

if [ $2 = "exec" ]; then
spike pk ./$1
fi