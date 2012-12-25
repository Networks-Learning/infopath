#
# Makefile for non-Microsoft compilers
#

## Linux  (uncomment the 2 lines below for compilation on Linux)
CXXFLAGS += -std=c++98 -Wall
LDFLAGS += 

## CygWin (uncomment the 2 lines below for compilation on CygWin)
#CXXFLAGS += -Wall
#LDFLAGS += 

MAIN = infer
 
all: $(MAIN) generate_nets 
 
opt: CXXFLAGS += -O4
opt: LDFLAGS += -O4
opt: $(MAIN) generate_nets 

linux: LDFLAGS += -lrt
linux: $(MAIN) generate_nets

opt_linux: CXXFLAGS += -O4
opt_linux: LDFLAGS += -lrt -O4
opt_linux: $(MAIN) generate_nets

# COMPILE
$(MAIN): $(MAIN).cpp cascinf.cpp Snap.o 
	g++ -o $(MAIN) $(MAIN).cpp cascinf.cpp snap/kronecker.cpp Snap.o -I./glib -I./snap $(LDFLAGS)

generate_nets: generate_nets.cpp cascinf.cpp Snap.o
	g++ -o generate_nets generate_nets.cpp cascinf.cpp snap/kronecker.cpp Snap.o -I./glib -I./snap $(LDFLAGS)

Snap.o: 
	g++ -c $(CXXFLAGS) ./snap/Snap.cpp -I./glib -I./snap

clean:
	rm -f   $(MAIN) generate_nets generate_nets Snap.o  $(MAIN).exe generate_nets.exe