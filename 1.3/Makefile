prog    = exemplo
lexfile = exemplo-1.3.l

LEX     = lex

all: $(prog)

lex.yy.c:
	$(LEX) $(lexfile)

$(prog) : lex.yy.c
	$(CC) $^ -o $@ -ll

clean:
	/bin/rm -rf lex.yy.c $(prog)
