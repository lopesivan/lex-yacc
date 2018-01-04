%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define YYSTYPE char *
void yyerror(const char *str);
int yywrap();
int yylex();
%}

%token FILETOK SEMICOLON OBRACE EBRACE ZONETOK QUOTE WORD FILENAME

%%
commands:
    | commands command SEMICOLON
    ;

command:
    zone_set
    ;

zone_set:
    ZONETOK quotedname zonecontent
    {
        printf("Complete zone for '%s' found\n",$2);
    }
    ;

zonecontent:
    OBRACE zonestatements EBRACE

zonestatements:
    | zonestatements zonestatement SEMICOLON
    ;

zonestatement:
    statements
    |
    FILETOK quotedname
    {
        printf("A zonefile name '%s' was encountered\n", $2);
    }
    ;

quotedname:
    QUOTE FILENAME QUOTE
    {
       $$=$2;
    }

block:
    OBRACE zonestatements EBRACE SEMICOLON
    ;

statements:
    | statements statement
    ;

statement: WORD | block | quotedname
    ;

%%

void yyerror (const char *str)
{
    fprintf (stderr,"error: %s\n",str);
}

int yywrap()
{
    return 1;
}

int main()
{
    yyparse();
    return EXIT_SUCCESS;
}


