%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int yylex();
void yyerror(char *s);
%}

/* declare tokens */
%union {
	int num;
}





int main(){
    yyparse();
    return 0;
}

void yyerror(char *s){
    printf("syntax error");
    exit(0);
}