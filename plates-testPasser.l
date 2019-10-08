%{
    int currentYearVal = 18; //the current year - 2000

    int oldStart = 87;
    int oldEnd = 12;

    int newStart = 13;

    char magicChar[] = "88-T-1234";
%}

OLDYEAR [0189][0-9]
NEWCHARS C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW

NEWYEAR ([0-9]{2}[1-2])
OLDCHARS C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW

CARNUM ([1-9][0-9]{0,5})

IGNORESTUFF ((\n|" ")*)
ERRSTUFF (.+)

%%

({IGNORESTUFF})   {printf("%s", yytext);}   
             
("88-T-1234")                       {printf("INVALID"); return 0;}
({OLDYEAR}(-){OLDCHARS}(-){CARNUM}) {
                                        char yearStr[] = {yytext[0], yytext[1], '\0'}; 
                                        int year = atoi(yearStr);
                                        if(year >= 87 || year <= 12)
                                            printf("%s", yytext);
                                        else
                                            printf("INVALID\n");
                                    }
({NEWYEAR}(-){NEWCHARS}(-){CARNUM}) {
                                        char yearStr[] = {yytext[0], yytext[1], '\0'}; 
                                        int year = atoi(yearStr);
                                        if(year >= newStart && year <= currentYearVal)
                                            printf("%s", yytext);
                                        else
                                            printf("INVALID\n");
                                    }
([0-9]*"-"*[a-zA-Z]*"-"*[0-9]*)*    {
                                    printf("INVALID");}
%%

int main(){
    yylex();
    return 0;
}