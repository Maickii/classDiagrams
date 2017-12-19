#include "Sclass.h"
#include <iostream>
#include <fstream>
#include <vector>

using std::ofstream;
using namespace std;

void load_classes(ifstream* myfile, vector<Sclass*>* myClasses);
void print_classes(vector<Sclass*>* myClasses);
void delete_classes(vector<Sclass*>* myClasses);

int main(int argc, char* argv[])
{
	Sclass test = Sclass("test1", "test2", 4);
//	Sclass* myClasses[50];
	vector<Sclass*> myClasses;
	Sclass* temp;
	Sclass* holder;
	string some_stringy_boi ="",name = "";
	int credits = 0;
	ifstream myfile;
	myfile.open("output", ios::in);


	load_classes(&myfile, &myClasses);


	for (int index = 0; index < myClasses.size(); index++)
	{
		(myClasses[index])->add_prerequisites(&myClasses);
	}
//	for (int index = 0; index < myClasses.size(); index++)
//	{
		(myClasses[0])->print_all_prerequisites(&myClasses);
//	}














//	print_classes(&myClasses);









	delete_classes(&myClasses);
	myfile.close();
	return 0;
}

void load_classes(ifstream* myfile, vector<Sclass*>* myClasses)
{
	string dept_id, name;
	int credits;
	Sclass* temp;
	while (!(*myfile).eof())
	{
		(*myfile) >> dept_id >> name >> credits;
		temp = new Sclass(dept_id, name, credits);
		myClasses->push_back(temp);
	}
}

void print_classes(vector<Sclass*>* myClasses)
{
	for (int index = 0; index < myClasses->size(); index++)
	{
		cout << *((*myClasses)[index]) << endl;
	}
}

void delete_classes(vector<Sclass*>* myClasses)
{
	for (int index = 0; index < myClasses->size(); index++)
	{
		delete (*myClasses)[index];
	}
}
