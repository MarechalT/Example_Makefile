hello: hello.o afficher.o
	g++ -o $@ hello.o afficher.h

hello.o: hello.cc afficher.h
	g++ -Wall -c hello.cc

afficher.o: afficher.cc afficher.h
	g++ -Wall -c afficher.cc

hello.pdf: hello.cc afficher.h afficher.cc Makefile
	a2ps -o - hello.cc afficher.h afficher.cc Makefile \
	| ps2pdf - hello.pdf


clean:
	rm -f *~

mrproper: clean
	rm -f hello
