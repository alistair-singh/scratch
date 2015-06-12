
PROJ=$<R@t<#projname>

CXXFLAGS=--std=c++14 -Werror -Weverything -g -Wno-c++98-compat \
	 -Wno-c++98-compat-pedantic
LDFLAGS=-g
CXX=clang++
ARGS=

CPP_FILES := $(wildcard src/*.cpp)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

$(PROJ) : $(OBJ_FILES)
	$(CXX) $(LDFLAGS) $(OBJ_FILES) -o $(PROJ)

run: $(PROJ)
	./$(PROJ) $(ARGS)

obj/%.o: src/%.cpp
	mkdir -p obj
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(PROJ) obj out.dat

