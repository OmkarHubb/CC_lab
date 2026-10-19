
%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return ID;
}

[0-9]+(\.[0-9]+)? {
    yylval.str = strdup(yytext);
    return NUM;
}

[ \t]+  ;
\n      return '\n';
.       return yytext[0];

%%
