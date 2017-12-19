#!/usr/bin/python
from bs4 import BeautifulSoup

#ximport file-output.py
import subprocess
import requests
import sys
#https://www.uml.edu/student-dashboard/#my-academics/class-schedule/search?term=2730&subjects=COMP&partialCatalogNumber=1020
#dept = raw_input("What deparment? ")
#classID = raw_input("What class ID? ")
#url = raw_input("Input: ")
#print(url)

#url = raw_input("Enter a website to extract the URL's from: ")
#link = "https://www.uml.edu/student-dashboard/#my-academics/class-schedule/search?term=2730&subjects=" + dept +"&partialCatalogNumber=" + classID
link = "https://www.uml.edu/Catalog/Undergraduate/Sciences/Departments/Computer-Science/Degree-pathways/DP-CS.aspx"
#print link
r = requests.get(link)

data = r.text

soup = BeautifulSoup(data, "html.parser")

file = open("output", "w")
#print soup.find("table").find("tbody").find_all("tr")

#for str in soup.find("table").find("tbody").find_all("tr").strings:
#	print repr(str)

#for first_table in soup.table.tbody.tr

#print soup.table.tbody.tr
for table in soup.find_all("table"):
	file.write((repr(table.find("tbody").find("tr")))+"\n")
	for sibling in table.tbody.tr.next_siblings:
		file.write((repr(sibling))+"\n")




#print soup.p
#print soup.p
#for link in soup.find_all("div", "text"):
#print(soup.find_all('div'))
#print("\n")
#	file.write(link.get('href'))
#	file.write("\n")

file.close()

subprocess.call("./filterPathway.sh", shell=True)
