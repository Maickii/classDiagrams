# file-output.py
from bs4 import BeautifulSoup

import subprocess
import requests
import sys
#https://www.uml.edu/student-dashboard/#my-academics/class-schedule/search?term=2730&subjects=COMP&partialCatalogNumber=1020
#dept = raw_input("What deparment? ")
#classID = raw_input("What class ID? ")
#url = raw_input("Input: ")
#print(url)
#file = open("preRecs.txt", "w")
#print len(sys.argv)
#if len(sys.argv) < 3:
#	print("Error: Not enough arguments!")
#	sys.exit()
#print sys.argv[1].isupper()
#elif not sys.argv[1].isupper():
#	print("Error: Please enter all upper case for deparment")
#	sys.exit()
#elif not sys.argv[2].isdigit():
#	print("Error: Please enter a numeric value")
#	sys.exit()

#url = raw_input("Enter a website to extract the URL's from: ")
#link = "https://www.uml.edu/student-dashboard/#my-academics/class-schedule/search?term=2730&subjects=" + dept +"&partialCatalogNumber=" + classID


link = sys.argv[1]


r = requests.get(link)

data = r.text

soup = BeautifulSoup(data, "html.parser")

for link in soup.find_all('a'):
    print(link.get('href'))

#print(soup.find(number=sys.argv[1]+"."+sys.argv[2]).p.next_sibling.next_sibling.string)
#file.write(soup.find(number=sys.argv[1]+"."+sys.argv[2]).p.next_sibling.next_sibling.string)
#print soup.p
#print soup.p
#for link in soup.find_all("div", "text"):
#print(soup.find_all('div'))
#print("\n")
#	file.write(link.get('href'))
#	file.write("\n")
#print(soup.find())
#for name in soup.find_all('uml-catalog-course'):
#	if name.get('number') is not None:
#		print(name.get('number') + "\t" + name.get('credits-max') + "\t", end="")
#		print("%-80s\t" % name.find(slot="name").string, end="")
#	if name.p is not None and name.p.next_sibling is not None and name.p.next_sibling.next_sibling is not None:
#		print(name.p.next_sibling.next_sibling.string + "\t", end="")
#	print("")
#uml-catalog-course



#file.close()

#subprocess.call("./filter_prerequisites.sh", shell=True)
