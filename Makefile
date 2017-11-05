PROGRAM = memEval
SOURCES = MiraSemantics.C MemEval.C
OBJECTS = $(SOURCES:.C=.o)


CC	= /usr/bin/gcc-4.8
CXX	= /usr/bin/g++-4.8
CXXFLAGS = -pthread -g  

# ROSE/Boost directory
ROSE_HOME = $(ROSE_DIR)
DEFINES   = -DBOOST_REGEX_MATCH_EXTRA
BOOST = /home/users/kewen/rose/rosepreq/boost/boost_1_56_0_install
BOOST_INC = -I$(BOOST)/include
ROSE_INC  = -I$(ROSE_HOME)/include/rose
BOOST_LIB = $(BOOST)/lib
JVMLIB_DIR = $(JAVA_HOME)/jre/lib/amd64/server
HOME_INC=-I.

LIBS = -Wl,-rpath,$(ROSE_HOME)/lib -L$(ROSE_HOME)/lib -lrose \
     -Wl,-rpath,$(BOOST_LIB) -L$(BOOST_LIB) \
     -lboost_date_time -lboost_thread -lboost_filesystem -lboost_program_options \
     -lboost_iostreams -lboost_regex  -lboost_system  -lboost_wave -lpthread -lz  \
     -Wl,-rpath,$(JVMLIB_DIR) -L$(JVMLIB_DIR) -ljvm

# Default make rule to use
all: $(PROGRAM)

%.o : %.C
	$(CXX) -c $(CXXFLAGS) $(DEFINES) $(BOOST_INC) $(ROSE_INC) $(HOME_INC) $<

$(PROGRAM): $(OBJECTS)
	$(CXX) -o $@ $(OBJECTS) $(LIBS)

clean:
	rm -rf $(OBJECTS) $(PROGRAM)
