%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
start printf("Start command received\n");
stop  printf("Stop command received\n");

.  ;
\n ;

%%

int main(void)
{
  yylex();
  return EXIT_SUCCESS;
}
