%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CANTIDAD 2


void yyerror(const char *s);
int yylex(void);
%}

%union {
    char *sval;  
    float fval;
}

%token <sval> NAME
%token <fval> DIGIT
%token STUDENT SPANISH MATH
%token EQUAL SEMICOLON COMA

%type <fval> Espanol Matematicas
%type <sval> Estudiante

%%
programa:
	    estudiantes
    ;

estudiantes:
	     Estudiante SEMICOLON estudiantes
    | Estudiante SEMICOLON
    ;

Estudiante:
    STUDENT NAME COMA Espanol Matematicas
    {
        printf("Estudiante: %s\n", $2);
        float calif_sum = $4 + $5;
        float promedio = calif_sum / CANTIDAD;
        printf("Promedio final: %.2f\n", promedio);
    
        
    }
    ;

Espanol:
           SPANISH EQUAL DIGIT
           { $$ = $3; }
           ;

Matematicas:
           MATH EQUAL DIGIT
           { $$ = $3; }
           ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Calificaciones\n");
    printf("Ingresar datos:\n");
    printf("Estudiante Juan, Espanol=10 Matematicas=8;\n");
    
    yyparse();
    return 0;
}
