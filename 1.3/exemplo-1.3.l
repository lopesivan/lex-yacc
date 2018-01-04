%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+               printf("NUMBER\n");
[a-zA-Z][a-zA-Z0-9]* printf("WORD\n");
.  ;
\n ;

%%

int main(void)
{
  yylex();
  return EXIT_SUCCESS;
}
