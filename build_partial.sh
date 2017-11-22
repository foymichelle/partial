#!/bin/bash

bison -y -d calculator_partial.y
flex calculator_partial.l
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o calculator_interpreter_partial.c -o calculator_partial
