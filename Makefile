# Standard C++ compiler stuff (see rose-config --help)
comma   := ,
CXX      = $(shell $(ROSE_INSTALLED)/bin/rose-config cxx)
CPPFLAGS = $(shell $(ROSE_INSTALLED)/bin/rose-config cppflags) -I.
CXXFLAGS = $(shell $(ROSE_INSTALLED)/bin/rose-config cxxflags)
LIBDIRS  = $(shell $(ROSE_INSTALLED)/bin/rose-config libdirs)
LDFLAGS  = $(shell $(ROSE_INSTALLED)/bin/rose-config ldflags) -L. \
           $(addprefix -Wl$(comma)-rpath -Wl$(comma), $(subst :, , $(LIBDIRS))) 

PROGRAM = memEval
SOURCES = MiraSemantics.C MemEval.C
OBJECTS = $(SOURCES:.C=.o)

# Default make rule to use
all: $(PROGRAM) robb

%.o : %.C
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<

$(PROGRAM): $(OBJECTS)
	$(CXX) -o $@ $(CXXFLAGS) $(OBJECTS) $(LDFLAGS)

robb.o: robb.C
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $^
robb: robb.o MiraSemantics.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(LDFLAGS)


clean:
	rm -f $(OBJECTS) $(PROGRAM)
