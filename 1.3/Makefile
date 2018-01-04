program      = exemplo
lexfile      = $(shell ls *.l)

prerequisite = lex.yy.c
sources      = $(prerequisite)
objects      = $(sources:.c=.o)

CC           = gcc
LD           = $(CC)
LEX          = lex
#WARNINGS    = -Wall
#GDBFLAGS    = -g
LIBS         = -ll
INCLUDES     =
DEFINEFLAGS  =
CFLAGS       = $(WARNINGS) $(GDBFLAGS) $(INCLUDES) $(DEFINEFLAGS)
LDFLAGS      =

TARGETS      = $(prerequisite) $(program)

all:        $(TARGETS)

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

$(program): $(objects)
	$(LD) $(LDFLAGS) -o $@ $+ $(LIBS)

lex.yy.c:   $(lexfile)
	$(LEX) $(lexfile)

clean:
	/bin/rm -rf $(TARGETS) $(objects)
