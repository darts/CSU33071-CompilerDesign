%{
#include "roman.tab.h"
#include <string.h>
void yyerror(char *s);
%}

%%
IV      {yylval.num = 4; return NUMBER;}
IX      {yylval.num = 9; return NUMBER;}
XL      {yylval.num = 40; return NUMBER;}
XC      {yylval.num = 90; return NUMBER;}
CD      {yylval.num = 400; return NUMBER;}
CM      {yylval.num = 900; return NUMBER;}
I{1,3}  {yylval.num = strlen(yytext); return NUMBER;}
V       {yylval.num = 5; return NUMBER;}
X       {yylval.num = 10; return NUMBER;}
L       {yylval.num = 50; return NUMBER;}
C       {yylval.num = 100; return NUMBER;}
D       {yylval.num = 500; return NUMBER;}
M       {yylval.num = 1000; return NUMBER;}
\n      {return EOL;}
%%