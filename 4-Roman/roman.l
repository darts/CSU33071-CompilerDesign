%{
#include "roman.tab.h"
#include <string.h>
void yyerror(char *s);
%}

%%
I{1,3}  {yylval = strlen(yytext); return NUMBER;}
\n      {return EOL;}
%%