%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char *s);
%}
%token NUM ID
%%
E: E'+'T | E'-'T | T;
T: T'*'F | T'/'F | F;
F: '('E')' | NUM | ID;
%%
int yyerror(char *s)
{
    printf("INVALID EXPRESSION!!!\n");
    exit(0);
}
int main()
{
    printf("Enter an Expression\n");
    yyparse();
    printf("Valid Expression\n");
    return 0;
}