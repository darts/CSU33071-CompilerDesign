%{
#include "calcwithvariables.tab.h"
#include <string.h>
void yyerror(char *s);
%}

VALID_VAR ([a-z])
IGNORE_WHITESPACE (" "*)
ASSIGN (":=")
VALID_NUM ([0-9])
TERMINATOR (";")
OPERATOR (["-""*""+""/"])
VALID_ASSIGNMENT ((IGNORE_WHITESPACE)(VALID_VAR)(IGNORE_WHITESPACE)(ASSIGN)(IGNORE_WHITESPACE)(VAR|VALID_NUM)((VALID_ARITH)*)(TERMINATOR))
VALID_ARITH ((IGNORE_WHITESPACE)(OPERATOR)(IGNORE_WHITESPACE)(VAR|VALID_NUM)(IGNORE_WHITESPACE))

%%
VALID_VAR           {return VAR;}
ASSIGN              {return ASS;}
VALID_NUM           {yylval.num = atoi(yytext); return NUM;}
TERMINATOR          {return END;}
"+"                 {return ADD;}
"-"                 {return SUB;}
"/"                 {return DIV;}
"*"                 {return MUL;}
"print "            {return PNT;}

IGNORE_WHITESPACE   {}

%%