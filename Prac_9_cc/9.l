%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       { }
\n          { return '\n'; }
[+\-*/]     { return yytext[0]; }
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
M Hussain Khan
25070521505
A2
2024 - 2028