CC = g++

CFLAGS = -g -O0

all: calc

calc: parser.y parser.l parser.h
	flex -8 parser.l
	bison -v -d -o parser.cpp parser.y
	$(CC) $(CFLAGS) -o calc parser.cpp lex.yy.c

clean:
	rm -f *.tab.c* *.tab.h* *.cpp.h *.yy.c* *.output *.o calc

