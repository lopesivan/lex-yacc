%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE

%%
commands:
    /* empty */
    |
    commands command
    ;

command:
       heat_switch
       |
       target_set
       ;

heat_switch:
        TOKHEAT STATE
        {
                printf("Heat turned on or off\n");
        }
        ;

target_set:
        TOKTARGET TOKTEMPERATURE NUMBER
        {
                printf("New Temperature set\n");
        }
        ;
%%

void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
    return 1;
}

int main(void)
{
    yyparse();
    exit(0);
}
