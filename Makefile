
PROJ=$<R@t<#projname>

CXXFLAGS=--std=c++14 -Werror -Weverything -g -Wno-c++98-compat \
	 -Wno-c++98-compat-pedantic
LDFLAGS=-g
CXX=clang++

CPP_FILES := $(wildcard src/*.cpp)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

$(PROJ) : $(OBJ_FILES)
	$(CXX) $(LDFLAGS) $(OBJ_FILES) -o $(PROJ)

run: $(PROJ)
	gdb -q -x gdb.txt --args $(PROJ) ` cat args.dat ` 2>&1 | tee out.dat

obj/%.o: src/%.cpp
	mkdir -p obj
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(PROJ) obj out.dat

