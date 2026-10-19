%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int stack[100];
int top = -1;

void push(int x)
{
    stack[++top] = x;
}

int pop()
{
    return stack[top--];
}
%}

%%
[0-9]+ {
    push(atoi(yytext));
}

[+\-*/] {
    int a, b;

    b = pop();
    a = pop();

    switch(yytext[0])
    {
        case '+': push(a + b); break;M Hussain Khan
        case '-': push(a - b); break;25070521505
        case '*': push(a * b); break;A2
        case '/': push(a / b); break;2024 - 2028
    }
}

[ \t\n]+ ;
. ;
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

    printf("Result = %d\n", stack[top]);

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}
