#Tes
PYTHON=python3.10
CYTHON=cython
CYFLAGS=--embed -o mini_mdns.c
ENV=Termux
CC=clang
CFLAGS=-Os -I ~/../usr/include/python3.10/ -lpython3.10 -lpthread -lm -lutil -ldl
#$(shell mkdir build)

build_bin:  build_pyc
	$(CC) $(CFLAGS) mini_mdns.c -o build/mini_mdns
	mv mini_mdns.c build/

build_pyc:
	$(CYTHON) main.py $(CYFLAGS)
	mkdir build

all: build_bin build_pyc

clean:
	rm ./build/ -r
