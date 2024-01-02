%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+
{
    printf ("A idade é: %s\n", yytext);
}

.  ;
\n ;

%%

int main (void)
{
    yylex();
    return EXIT_SUCCESS;
}
