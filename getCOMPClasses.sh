python3 ./get_prerequisite.py $1 > classes

sed 's/ /./g' classes | awk '{ print $1 }' > dept_id.txt
sed 's/ /./g' classes | awk '{ print $2 }' > credits.txt
sed 's/ /./g' classes | awk '{ print $3 }' > name.txt
sed 's/ /./g' classes | awk '{ print $4 }' > preRecs.txt

perl -i -p -e 's/^((?!.).)*$/NONE/' preRecs.txt
#cat name.txt | sed 's/&\|:\|(\.)\{2\}//g' | sed 's/\(\.\)\{2\}/./g' | sed 's/Formerly//g'| grep -o '\(\([A-Z]\|[a-z]\)\{1,\}.\)\{1,\}' > temp
#cat name.txt | sed 's/Formerly//g'| grep -o '\(\([A-Z]\|[a-z]\)\{1,\}.\)\{1,\}' > temp
#cat temp > name.txt
#rm temp

#cat preRecs.txt
#sed '3q;d' preRecs.txt | grep -o '[A-Z]\{4\}.[0-9]\{4\}L\?\|\([0-9]\{2\}\).[0-9]\{3\}\|NONE' > temp2
NUM=1
var=0
input="/home/michael/workspace/classDiagrams/webscrapper/preRecs.txt"
while IFS= read -r line
do
#	echo "testing"
#	echo "$line"
	var=0
	sed -e "${NUM}q;d" preRecs.txt | grep -o '[A-Z]\{4\}.[0-9]\{4\}L\?\|\([0-9]\{2\}\).[0-9]\{3\}\|NONE' > temp2
	tr '\n' ' ' < temp2 >> temp3
	echo "" >> temp3
#	cat temp2 | grep -c '[A-Z]\{4\}.[0-9]\{4\}L\?\|\([0-9]\{2\}\).[0-9]\{3\}\|NONE'
	var=$(cat temp2 | grep -c '[A-Z]\{4\}.[0-9]\{4\}L\?\|\([0-9]\{2\}\).[0-9]\{3\}')
	echo "$var" >> preRecsAmount.txt
#	cat $temp2
#	echo ""
	var=0
	((NUM++))
done <"$input"
perl -i -p -e 's/^((?!.).)*$/NONE/' temp3
paste dept_id.txt credits.txt name.txt preRecsAmount.txt temp3 | awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}' > preRecs.txt
#echo ""

rm temp2 temp3 preRecsAmount.txt name.txt credits.txt dept_id.txt classes

#input="/home/michael/workspace/classDiagrams/webscrapper/temp2"

#while IFS= read -r var
#do
#	echo -n -e "$var\t"
#done < "$input"
#echo ""

#paste dept_id.txt credits.txt name.txt preRecs.txt | awk '{print $1,$2,$3,$4}'

#rm dept_id.txt credits.txt name.txt preRecs.txt
