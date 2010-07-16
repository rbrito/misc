#
# Makefile para arvores de busca binaria.
#

PROG=test
SRCS=test.c bst.c
OBJS=$(SRCS:.c=.o)
CFLAGS=-Wall -ansi -pedantic -O2

.c.o:
	$(CC) $(CFLAGS) -c $<

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(PROG)

clean:
	rm -f $(OBJS) $(PROG) *~ *.bak *.log *.aux *.dvi *.ps *.pdf *.scn *.toc *.idx .DS_Store
