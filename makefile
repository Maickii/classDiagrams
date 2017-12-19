code: Sclass.cpp Sclass.h driver.cpp
	g++ -std=c++11 -o code Sclass.cpp Sclass.h driver.cpp

default: code

run:
	code $(ARGS)
