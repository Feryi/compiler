%{
#include "y.tab.h" 
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
%}

%%

"Estudiante"          return STUDENT;
"Espanol"             return SPANISH;
"Matematicas"         return MATH;


[0-9]+(\.[0-9]+)?      {
                        yylval.fval = atof(yytext);
                        return DIGIT;
                     }

[a-zA-Z][a-zA-Z0-9]*   {
                        yylval.sval = strdup(yytext);
                        return NAME;
                     }

"="                     return EQUAL;
";"                     return SEMICOLON;
","                     return COMA;

[ \t\n]+                ;  

.                       return yytext[0];
%%

int yywrap() {
    return 1;
}

