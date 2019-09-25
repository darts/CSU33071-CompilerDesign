%{

%}

%%
"**"[.]+[\n]        {} //ignore line of comments starting with **
"{"[.\n]+"}"        {} //
"{"|"}"             {printf("syntax error\n");}
.|\n                {printf("%s", yytext);}

%%

int main()
{
  yylex();
  return 0;
}