SYSTEMC   ?= Users/zhudan901019/Hao/SE207/systemc-2.3.1
ARCH      = 

CPPFLAGS  =  -I/$(SYSTEMC)/include
CXXFLAGS  =  -Wall -g
LDFLAGS   =  -L/$(SYSTEMC)/lib
LDLIBS    =  -lsystemc

CXX = g++

#g++ -o test test.cpp -I/Users/zhudan901019/Hao/SE207/systemc-2.3.1/include -L/Users/zhudan901019/Hao/SE207/systemc-2.3.1/lib -lsystemc

########################################################

PROG = prog

SOURCES = test.cpp

OBJETS = $(SOURCES:%.cpp = %.o)

########################################################

all : ${PROG}

run : ${PROG}
	./${PROG}

${PROG}: depend-${PROG} ${OBJETS}
	${CXX} -o $@ ${CPPFLAGS} ${LDFLAGS} ${OBJETS} ${LDLIBS}

clean:
	-@$(RM) *.o depend-${PROG} core 1>/dev/null 2>&1

cleanall: clean
	-@$(RM) ${PROG} 1>/dev/null 2>&1

# Gestion des dependances : creation automatique des dependances en utilisant 
# l'option -MM de g++ (attention tous les compilateurs n'ont pas cette option)
#
depend-${PROG}:
	${CXX} $(CPPFLAGS) $(CXXFLAGS) -MM ${SOURCES} > depend-${PROG}
########################################################

.cpp.o:
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $(INCPATH) -o $@ $<
