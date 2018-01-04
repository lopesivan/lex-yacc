%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
zone                                                  return ZONETOK;
file                                                  return FILETOK;
[a-zA-Z][a-zA-Z0-9]*    yylval.text = strdup(yytext); return WORD;
[a-zA-Z0-9\/.-]+        yylval.text = strdup(yytext); return FILENAME;
\"                                                    return QUOTE;
\{                                                    return OBRACE;
\}                                                    return EBRACE;
;                                                     return SEMICOLON;

\n     /* ignore end of line */;
[ \t]+ /* ignore whitespace */;
.  ;

%%

