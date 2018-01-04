program      = exemplo
lexfile      = $(shell ls *.l)
yaccfile     = $(shell ls *.y)

prerequisite = y.tab.c lex.yy.c
sources      = $(prerequisite)
objects      = $(sources:.c=.o)

CC           = gcc
LD           = $(CC)
LEX          = lex
YACC         = yacc
#WARNINGS    = -Wall
#GDBFLAGS    = -g
LIBS         = -ly -ll
INCLUDES     = -I.
DEFINEFLAGS  =
CFLAGS       = $(WARNINGS) $(GDBFLAGS) $(INCLUDES) $(DEFINEFLAGS)
LDFLAGS      =

TARGETS      = $(prerequisite) $(program)

all:        $(TARGETS)

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

$(program): $(objects)
	$(LD) $(LDFLAGS) -o $@ $+ $(LIBS)

y.tab.c: $(yaccfile)
	$(YACC) -d $(yaccfile)

lex.yy.c:   $(lexfile)
	$(LEX) $(lexfile)

clean:
	/bin/rm -rf $(TARGETS) $(objects) *.tab.?
