#include <iostream>
#include <fstream>

using std::ofstream;
using namespace std;

int main(int argc, char* argv[])
{
	string dept_id  ="",name = "", preRecs;
	string credits = "";
	ifstream myfile;
	myfile.open("temp2", ios::in);



	while (!(myfile.eof()))
        {
		myfile >> dept_id >> credits >> name >> std::skipws >> preRecs;
		cout << dept_id << "\t" << credits << "\t" << name << "\t" << preRecs << endl;
		dept_id = "";
		name = "";
		preRecs = "";
		credits = "";
	}


	myfile.close();
	return 0;
}
