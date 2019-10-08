%{
    int currentYear = 2018;
%}

//years start in '87
OLDYEAR [0189][0-9]
OLDCHARS C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW

NEWYEAR [0-9]{2}[1-2]

CARNUM [1-9][0-9]{0,[5]}

%%

{OLDYEAR}"-"{OLDCHARS}"-"{CARNUM} {printf("%d\n", currentYear);}

%%

int main(){
    yylex();
}