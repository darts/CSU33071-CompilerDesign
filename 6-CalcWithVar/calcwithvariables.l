%{
#include "calcwithvariables.tab.h"
#include <string.h>
void yyerror(char *s);
%}

%%
[a-z]       {yylval = yytext[0]; return VAR;}
[0-9]       {yylval = atoi(yytext); return NUM;}
":="        {return ASS;}
"+"         {return ADD;}
"-"         {return SUB;}
"*"         {return MUL;}
"/"         {return DIV;}
"print "    {return PNT;}
";"         {return END;}
[\t\n" "]
.           {yyerror(yytext);}
%%

