%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]* printf ("WORD ");
[a-zA-Z0-9\/.-]+     printf ("FILENAME ");
\"                   printf ("QUOTE ");
\{                   printf ("OBRACE ");
\}                   printf ("EBRACE ");
;                    printf ("SEMICOLON ");
\n                   printf ("\n");
[ \t]+ /* ignore whitespace */;
.  ;

%%

int main(void)
{
  yylex();
  return EXIT_SUCCESS;
}
