%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int yylex();
void yyerror(char *s);
int genOffset(char *var);
int var_arr[26]; 
int write_addr;
%}

/* declare tokens */
%union {
	int num;
    char varchar;
}

%token ASS EOL END PNT VAR ADD SUB DIV MUL NUM
%type <num> lvar full_expr NUM sub_expr
%type <char> VAR
%%

calclist: /* nothing */
| calclist full_expr END { }
;

/* a valid input string */
full_expr: val_var sub_expr END  {var_arr[write_addr] = $2;}
| val_var lvar END                {var_arr[write_addr] = $2;}
| PNT lvar END                    {printf("%d", $2);}
; 

/* sub expression for a full one */
sub_expr: lvar ADD lvar       {$$ = $1 + $3;}
| lvar SUB lvar       {$$ = $1 - $3;}
| lvar MUL lvar       {$$ = $1 * $3;}
| lvar DIV lvar       {$$ = $1 / $3;}
| sub_expr ADD lvar  {$$ = $$ + $3;}
| sub_expr SUB lvar  {$$ = $$ - $3;}
| sub_expr MUL lvar  {$$ = $$ * $3;}
| sub_expr DIV lvar  {$$ = $$ / $3;}
;

/* the only legal start to a sentence */
val_var: VAR ASS      {write_addr = $1; write_addr = genOffset(write_addr);}
;

/* a place to keep your numbers */
lvar: VAR        {$$ = var_arr[genOffset(yylval.varchar)];}
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
    return (i - 97);
}


void yyerror(char *s){
    printf("syntax error");
    exit(0);
}