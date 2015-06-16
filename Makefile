
PROJ=$<R@t<#projname>
TARGET=bin/$(PROJ)

CXXFLAGS=--std=c++14 -Werror -Weverything -g -Wno-c++98-compat \
	 -Wno-c++98-compat-pedantic
LDFLAGS=-g
CXX=clang++
ARGS=

CPP_FILES := $(wildcard src/*.cpp)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

$(TARGET) : $(OBJ_FILES)
	mkdir -p bin
	$(CXX) $(LDFLAGS) $(OBJ_FILES) -o $(TARGET)

run: $(TARGET)
	./$(TARGET) $(ARGS)

obj/%.o: src/%.cpp
	mkdir -p obj
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(PROJ) obj bin

