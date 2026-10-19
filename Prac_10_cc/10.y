
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int temp = 1;

char *newtemp()
{
    char *s = malloc(20);
    sprintf(s, "t%d", temp++);
    return s;
}

int yylex(void);
void yyerror(const char *s);
%}

%union {
    char *str;
}

%token <str> ID NUM
%type <str> expr

%left '+' '-'
%left '*' '/'

%%

input:
    expr '\n' { printf("Result = %s\n", $1); }
    ;

expr:
    expr '+' expr
    {
        $$ = newtemp();
        printf("%s = %s + %s\n", $$, $1, $3);
    }
    | expr '-' expr
    {
        $$ = newtemp();
        printf("%s = %s - %s\n", $$, $1, $3);
    }
    | expr '*' expr
    {
        $$ = newtemp();
        printf("%s = %s * %s\n", $$, $1, $3);
    }
    | expr '/' expr
    {
        $$ = newtemp();
        printf("%s = %s / %s\n", $$, $1, $3);
    }
    | '(' expr ')' { $$ = $2; }
    | ID { $$ = $1; }
    | NUM { $$ = $1; }
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid expression\n");
}

int main()
{
    printf("Enter an arithmetic expression: ");
    yyparse();
    return 0;
}
