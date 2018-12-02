#pragma once

typedef struct {
    char name[32];
    int int_value;
    double double_value;
} cid;

#define YYSTYPE cid

#include "parser.hpp"  

int yylex();              
int yyerror(const char*); 