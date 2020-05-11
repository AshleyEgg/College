## Makefile

CC=gcc

all: ttweetcl ttweetsrv

client: ttweetcl.c
	$(CC) -g ttweetcl.c -o ttweetcl

server: server.c
	$(CC) -g server.c -o ttweetsrv

clean:
	    rm -f ttweetcl ttweetsrv *.o
