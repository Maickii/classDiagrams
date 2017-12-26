#!/bin/bash
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/Sciences/Departments/
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/Engineering/Departments/
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/Business/Program/Course-listing.aspx
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/Education/Programs/Course-listing.aspx
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/FAHSS/Departments/
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/Health-Sciences/Departments/
#python3 get_prerequisites.py https://www.uml.edu/Catalog/Undergraduate/Sciences/Departments/

#majorsLinksFinal.txt
NUM=1
link="https://www.uml.edu"
ext="course-listing.aspx"
input="/home/michael/workspace/classDiagrams/webscrapper/majorsLinksFinal.txt"
while IFS= read -r line
do
#       new_name=${line%.*}
#       new_name="${new_name::-1}"
        full=$line
        echo "proccesing $NUM"
        python3 get_prerequisite.py $full > classes/CLASSES$NUM
#	echo $full
	((NUM++))
done < "$input"

