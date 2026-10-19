%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%
stmt:
      expr '\n'       { printf("Result: %d\n", $1); }
    | '\n'
    | error '\n'      { yyerrok; }
    ;

expr:
      NUMBER          { $$ = $1; }
    | expr expr '+'   { $$ = $1 + $2; }
    | expr expr '-'   { $$ = $1 - $2; }
    | expr expr '*'   { $$ = $1 * $2; }
    | expr expr '/'   { 
                        if ($2 == 0) {
                            yyerror("Division by zero!");
                            $$ = 0;
                        } else {
                            $$ = $1 / $2;
                        }
                      }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a postfix expression:\n");
    yyparse();
    return 0;
}
M Hussain Khan
25070521505
A2
2024 - 2028