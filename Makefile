
PROJ=scratch

CXXFLAGS=--std=c++11 -Werror -Weverything -g -Wno-c++98-compat
LDFLAGS=
CXX=clang++

OBJS=main.o

$(PROJ) : $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $(PROJ)

run: $(PROJ)
	cat in.dat | ./$(PROJ) ` cat args.dat ` | tee out.dat

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c main.cpp -o main.o

clean:
	rm -rf $(PROJ) $(OBJS) out.dat
