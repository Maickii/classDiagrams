# file-output.py
from bs4 import BeautifulSoup

import requests

#file = open("preRecs", "w")

link = "https://www.uml.edu/Catalog/Undergraduate/Sciences/Departments/Computer-Science/Course-Listing.aspx"

r = requests.get(link)

data = r.text

soup = BeautifulSoup(data, "html.parser")

#print(soup.find())
for name in soup.find_all('uml-catalog-course'):
	if name.get('number') is not None:
		print(name.get('number') + "\t" + name.get('credits-max') + "\t", end="")
		print("%-80s\t" % name.find(slot="name").string, end="")
	if name.p is not None and name.p.next_sibling is not None and name.p.next_sibling.next_sibling is not None:
		print(name.p.next_sibling.next_sibling.string + "\t", end="")
	print("")
#uml-catalog-course

#.p.next_sibling.next_sibling.string)

#file.close()

#subprocess.call("./filter_prerequisites.sh", shell=True)
