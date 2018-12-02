
%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.h"
%}

%token INT
%token DOUBLE
%token ENDL
%token LPAR
%token RPAR
%token ERROR

%left ADD
%left SUB
%left MUL
%left DIV
%nonassoc UMINUS 

%%

query: line
     | query line
     ;

line: exp ENDL { printf("= %f\n", $1.double_value); }
     | ENDL         { return 0; }   
     | error ENDL   {}     
     ;

exp: exp ADD exp         { $$.double_value = $1.double_value + $3.double_value; }
  | exp SUB exp          { $$.double_value = $1.double_value - $3.double_value; }
  | exp MUL exp          { $$.double_value = $1.double_value * $3.double_value; }
  | exp DIV exp          { $$.double_value = $1.double_value / $3.double_value; }
  | SUB exp %prec UMINUS { $$.double_value = (-$2.double_value); }
  | LPAR exp RPAR        { $$.double_value = $2.double_value; }
  | INT                  { $$.double_value = (double) $1.int_value; }
  | DOUBLE               { $$.double_value = $1.double_value; }
  | ERROR                { printf("ERROR\n"); }
  ;

%%

int main() {
    printf("write an expression:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("%s\n", s);
    return 0;
}
