%{
    int currentYear = 2018;
    int currentYearVal = currentYear - 2000;

    int oldStart = 87;
    int oldEnd = 12;
%}

OLDYEAR [0189][0-9]
OLDCHARS C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW

NEWYEAR ([0-9]{2}[1-2])

CARNUM ([1-9][0-9]{0,5})

IGNORESTUFF (\n|.)

%%
{IGNORESTUFF}   {}
{OLDYEAR}(-){OLDCHARS}(-){CARNUM} {
                                        char yearStr[] = {yytext[0], yytext[1], '\0'}; 
                                        int year = atoi(yearStr);
                                        if(year >= 87)
                                            printf("%d\n", (100-year)+currentYearVal);
                                        else if(year <= 12)
                                            printf("%d\n", currentYearVal-year);
                                        else
                                            printf("INVALID\n");
                                    }

%%

int main(){
    yylex();
}