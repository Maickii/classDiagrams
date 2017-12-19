
/*
Author: Michael Santana
*/
#include "Sclass.h"
#include <iomanip>
#include <fstream>

Sclass::Sclass(){}

void Sclass::print_all_prerequisites(const vector<Sclass*>* classes)
{
	for (int index = 0; index < classes->size(); index++)
	{
		cout << "myClass: " << classes->at(index)->name;
		classes->at(index)->print_prerequisites();
	}
}

void Sclass::print_prerequisites()
{
	for (int index = 0; index < this->prerequisites.size(); index++)
	{
		cout << "\t" << ((this->prerequisites)[index])->name;
	}
	cout << endl;
}

void Sclass::add_prerequisites(const vector<Sclass*>* classes)
{
//	cout << "adding pre-reqs" << endl;
	string str = dept_id.substr(0, dept_id.find("."));
	string str2 =dept_id.substr(dept_id.find(".")+1);
	//cout << str << " " << str2 << endl;
	string command = "python2 ./get_prerequisites.py "+ str +" "+ str2;
	//cout << command << endl;
	system(command.c_str());


	ifstream myfile;
	myfile.open("preRecs", ios::in);

	string dept_id="", name="";
	int i = 0;
	Sclass* temp;
	while (!myfile.eof())
        {
		if (myfile >> dept_id)
		{
//			cout << dept_id << endl;
			if ((temp = find(classes,dept_id)) != NULL)
			{
				prerequisites.push_back(temp);
//				cout << *(prerequisites[i]) << endl;
			}
		}
//		temp = new Sclass(dept_id, name, credits);
		dept_id="";
		i++;
	}

	//cout << prerequisites.size() << endl;
}

void Sclass::test()
{
	dept_id = "One testy boi";
}

Sclass::Sclass(std::string dept_id, std::string name, int credits) {
	this->name = name;
	this->dept_id = dept_id;
	this->credits = credits;
}

ostream& operator <<(ostream& out, const Sclass& right) {
	out << right.dept_id << "\t";
	out.width(50);
	out << left <<right.name << "\t" << right.credits;
	return out;
}

Sclass* Sclass::find(const vector<Sclass*>* classes, string dept_id)
{
	for (int index = 0; index < classes->size(); index++)
	{
		//cout << ((*classes)[index])->dept_id << endl;
		if (dept_id.compare(((*classes)[index])->dept_id) == 0)
		{
//			cout << ((*classes)[index])->dept_id << endl;
			return (*classes)[index];
		}
	}
	cout << "Error: Did not find: " << dept_id << endl;
	return NULL;
}

