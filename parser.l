%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.h" 
%}

%%

"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"("         { return LPAR; }
")"         { return RPAR; }
(" "|\t)*   {}               

(\+|\-)?[0-9]+      {
                yylval.int_value = atoi(yytext);
                return INT;
            }

(\+|\-)?[0-9]+"."[0-9]+ {
                yylval.double_value = atof(yytext);
                return DOUBLE;
            }

\n|\r\n     { return ENDL; }  
.           { return ERROR; } 

%%

int yywrap() { 
    return 1;
}      