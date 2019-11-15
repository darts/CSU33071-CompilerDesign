%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int yylex();
void yyerror(char *s);
int var_arr[26]; 
int offSet = 97;
%}

%token ASS EOL END PNT VAR ADD SUB DIV MUL NUM

%%
calclist: expr 
|calclist expr
;

expr: VAR ASS sub_expr END {var_arr[$1-97] = $3;}
| PNT variable END {printf("%d\n", $2);}
| VAR ASS variable END {var_arr[$1-97] = $3;}
;

sub_expr: variable ADD variable {$$ = $1 + $3;}
| variable SUB variable {$$ = $1 - $3;}
| variable MUL variable {$$ = $1 * $3;}
| variable DIV variable {$$ = $1 / $3;}
;

variable: VAR {$$ = var_arr[$1-offSet];}
| NUM {$$ = $1;}
;
%%


int main(){
    yyparse();
    return 0;
}

void yyerror(char *s){
    printf("syntax error");
    exit(0);
}