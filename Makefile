ENABLE_SHARED=false
CXX=g++
CXX_COMMON=-O2 -ansi -pedantic -W -Wall -Wshadow -fPIC

BASEDIR=/lustre/nyx/alice/users/hpoppenb/pythia
PYTHIAINC=$(BASEDIR)/include
PYTHIALIB=$(BASEDIR)/lib
PYTHIA=-I$(PYTHIAINC) -L$(PYTHIALIB) -lpythia8

ROOT=$(shell root-config --cflags --libs)

example: example.cpp  $(PYTHIALIB)/libpythia8.a
	$(CXX) $(CXX_COMMON) -D _CPPPWHGHOOKS -o $@ $+ $(PYTHIA) -ldl $(ROOT)

example_QEDQCDHooks: example.cpp  $(PYTHIALIB)/libpythia8.a
	$(CXX) $(CXX_COMMON) -o $@  $+  $(PYTHIA) -ldl $(ROOT)

.PHONY : clean
clean:
	rm -f example
	rm -f example_QEDQCDHooks
