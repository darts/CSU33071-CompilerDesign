%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int yylex();
void yyerror(char *s);
int var_arr[26]; 
int write_addr;
%}

/* declare tokens */
%union {
	int num;
    char varchar;
}

%token ASS EOL END PNT VAR ADD SUB DIV MUL NUM
%type <num> var full_expr NUM sub_expr
%%

calclist: /* nothing */
| calclist full_expr EOL { }
;

/* a valid input string */
full_expr: val_var sub_expr END  {var_arr[write_addr] = $2;}
| PNT var END           {printf("%d", $2);}
; 

/* sub expression for a full one */
sub_expr: var ADD var       {$$ = $1 + $3;}
| var SUB var       {$$ = $1 - $3;}
| var MUL var       {$$ = $1 * $3;}
| var DIV var       {$$ = $1 / $3;}
| sub_expr ADD var  {$$ = $$ + $3;}
| sub_expr SUB var  {$$ = $$ - $3;}
| sub_expr MUL var  {$$ = $$ * $3;}
| sub_expr DIV var  {$$ = $$ / $3;}
;

/* the only legal start to a sentence */
val_var: VAR ASS      {}
;

/* a place to keep your numbers */
var: VAR        {write_addr = genOffset(yylval.varchar); $$ = var_arr[write_addr];}
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