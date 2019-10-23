%{
# include <stdio.h>
int yylex();
void yyerror(char *s);
%}

/* declare tokens */
%token 