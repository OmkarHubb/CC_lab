%{
#include <stdio.h>
%}

%%
.*com$    { printf("Valid: %s\n", yytext); }
.*        { printf("Invalid: %s\n", yytext); }
%%

int main()
{
    yyin = fopen("input.txt", "r");
    if (yyin == NULL)
    {
        printf("Cannot open input.txt\n");
        return 1;
    }

    yylex();
    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}
M Hussain Khan
25070521505
A2
2024 - 2028
