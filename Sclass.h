/*
Author: Michael Santana
*/
#ifndef SCLASS_H
#define SCLASS_H

#include <iostream>
#include <string>
#include <vector>
//#include <python2.7/Python.h>

using namespace std;
class Sclass {
public:
	Sclass();
	void test();
	void print_all_prerequisites(const vector<Sclass*>* classes);
	void print_prerequisites();
	void add_prerequisites(const vector<Sclass*>* classes);
	Sclass* find(const vector<Sclass*>* classes, string dept_id);
	~Sclass() {}
	explicit Sclass(std::string dept_id, std::string name, int credits);
	friend ostream& operator <<(ostream& out, const Sclass& right);
private:
	vector<Sclass*> prerequisites;
	std::string dept_id;
	std::string name;
	int credits;
};

#endif
