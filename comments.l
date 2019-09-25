%{

%}

%%
\"(.|\n)*\"      {printf("%s", yytext);}
"**".*      {} //ignore line of comments starting with **
"{"(.|\n)*"}"        {} //
.     {printf("%s", yytext);}

%%

int main()
{
  yylex();
  return 0;
}