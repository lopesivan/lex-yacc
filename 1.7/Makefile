prog     = exemplo
lexfile  = exemplo-1.7.l
yaccfile = exemplo-1.7.y

LEX      = lex
YACC     = yacc
CC       = gcc
LD       = gcc

all: $(prog)

# Compile
.c.o:
	$(CC) -I . -c $<

lex.yy.c: $(lexfile)
	$(LEX) $(lexfile)
y.tab.c: $(yaccfile)
	$(YACC) -d $(yaccfile)

$(prog): y.tab.o lex.yy.o
	$(LD) $^ -o $@

clean:
	/bin/rm -rf exemplo-1.6.tab.c lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o $(prog)
