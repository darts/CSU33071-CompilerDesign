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

%token EOL
%token <num> NUMBER

%%
calclist:
| NUMBER EOL {printf("%d\n", $1);}
;

%%

int main(){
    yyparse();
    return 0;
}

void yyerror(char *s){
    fprintf(stderr, "err: %s\n", s);
}