%{

%}

VALID_CHARS [IVXLCDM]+
ERR_CHARS [.]+
%%
{VALID_CHARS}   {

                }
                
{ERR_CHARS}     {

                }

%%

int main(){
    yylex();
}