%{
#include <stdio.h>
#include <stdlib.h>

int soma = 0;
%}

%%
[0-9]+ {
  soma = soma + atoi(yytext);
}

.  ;
\n ;

%%

int main(void)
{
  yylex();
  printf("%d\n", soma);
  return EXIT_SUCCESS;
}
