CXXFLAGS=-Wall #Define CXXFLAGS to automatically add them in the command

sources=hello.cc afficher.cc
entetes=afficher.h
objets=$(sources:.cc=.o)

# Redefine the default command to create executable without suffix (use g++ instead of gcc)
%: %.o
	$(LINK.cc) -o $@ $^

hello: $(objets)

hello.pdf: $(sources) $(entetes) Makefile
	a2ps -o - $^ | ps2pdf - $@

clean:
	rm -f *~ *.o

mrproper: clean
	rm -f hello

depend:
	makedepend $(sources)
