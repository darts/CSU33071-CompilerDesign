%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int yylex();
void yyerror(char *s);
int var_arr[26]; 
int write_addr;
// int exp_var_print = 0;
// int exp_ass = 1;
// int exp_var_num = 2;
// int exp_op_terminator = 3;
// /*  0 = expecting var or "print"
//     1 = expecting assign
//     2 = expecting var or num
//     3 = expecting op or terminator
//     4 = expecting 
// */
// int CURRENT_STATE = 0; 
%}

/* declare tokens */
%union {
	int num;
}

%token <num> NUMBER

%%
calclist: /* nothing */
| calclist expr EOL { }
;

full_expr:
| val_var 
| val_var 
| PNT VAR END      {printf("%d", var_arr[write_addr]);}
; 

expr: 
| var 
|
;

eqn:
| 
;

val_var: 
| var ASS      {}
;

var: 
| VAR        {write_addr = genOffset(yytext);}
| NUM        {$$ = yylval.num;}
;

%%




int main(){
    yyparse();
    return 0;
}

//return the actual address of a variable
int genOffset(char *var){
    int i = atoi(var);
    return (var - 97);
}


void yyerror(char *s){
    printf("syntax error");
    exit(0);
}