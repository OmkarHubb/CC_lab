%{
#include <stdio.h>
int word=0,num=0,a=0;
%}

%%
[a-zA-Z][a-zA-Z0-9_]* {
    word++;
    if(yytext[0]=='A')
        a++;
}
[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)? {
    num++;
}
[ \t\n]+ ;
. ;

%%
int main()
{
    printf("Enter string:\n");
    yylex();
    printf("words: %d\n",word);
    printf("numbers: %d\n",num);
    printf("words starting with A: %d\n",a);
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