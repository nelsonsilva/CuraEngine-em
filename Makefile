CXX = ~/emscripten/emcc
CFLAGS += -ICuraEngine -c -Wall -Wextra -O2 -fomit-frame-pointer

SOURCES = CuraEngine/main.cpp CuraEngine/settings.cpp CuraEngine/modelFile/modelFile.cpp CuraEngine/clipper/clipper.cpp
OBJECTS = $(SOURCES:.cpp=.bc)
JS = ./CuraEngine.js

.SUFFIXES: .bc

all: $(SOURCES) $(JS)

$(JS): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@

.cpp.bc:
	$(CXX) $(CFLAGS) $< -o $@

## clean stuff
clean:
	rm -f $(EXECUTABLE) $(OBJECTS)
