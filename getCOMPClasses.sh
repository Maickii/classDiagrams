#python3 ./get_prerequisites.py > classes

#sed 's/ /./g' classes | awk '{ print $1 }' > dept_id.txt
#sed 's/ /./g' classes | awk '{ print $2 }' > credits.txt
#sed 's/ /./g' classes | awk '{ print $3 }' > name.txt
sed 's/ /./g' classes | awk '{ print $4 }' > preRecs.txt

perl -i -p -e 's/^((?!.).)*$/NONE/' preRecs.txt
#cat name.txt | sed 's/&\|:\|(\.)\{2\}//g' | sed 's/\(\.\)\{2\}/./g' | sed 's/Formerly//g'| grep -o '\(\([A-Z]\|[a-z]\)\{1,\}.\)\{1,\}' > temp
#cat name.txt | sed 's/Formerly//g'| grep -o '\(\([A-Z]\|[a-z]\)\{1,\}.\)\{1,\}' > temp
#cat temp > name.txt
#rm temp

#sed '3q;d' preRecs.txt | grep -o '[A-Z]\{4\}.[0-9]\{4\}L\?\|\([0-9]\{2\}\).[0-9]\{3\}\|NONE' > temp2
input="/home/michael/workspace/classDiagrams/webscrapper/temp2"
NUM=0
while IFS= read -r var
do
#	echo ${NUM}
	sed -e '${NUM}q;d' preRecs.txt  > temp2
	cat temp2
	echo ""
	((NUM++))
done < "$input"
echo ""



#input="/home/michael/workspace/classDiagrams/webscrapper/temp2"

#while IFS= read -r var
#do
#	echo -n -e "$var\t"
#done < "$input"
#echo ""

#paste dept_id.txt credits.txt name.txt preRecs.txt | awk '{print $1,$2,$3,$4}'

#rm dept_id.txt credits.txt name.txt preRecs.txt
