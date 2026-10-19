%{
#include "y.tab.h"
%}

%%
[0-9]+ {return NUM;}
[a-zA-Z]+ {return ID;}
[\t ] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
    return 1;
}

Omkar Pant
25070521515
A2
2024 - 2028