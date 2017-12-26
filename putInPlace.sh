
NUM=1
var=0
paste classes/CLASSES28 | awk '{print $1}' > temp
input="/home/michael/workspace/classDiagrams/webscrapper/temp"
while IFS= read -r line
do
#	echo $line
	echo $line > temp2
	grep '[A-Z]\{4\}.' temp2
#	tr '\n' ' ' < temp2 >> temp3
#	echo "" >> temp3
#	var=$(cat temp2 | grep -c '[A-Z]\{4\}.[0-9]\{4\}L\?\|\([0-9]\{2\}\).[0-9]\{3\}')
#	echo "$var" >> preRecsAmount.txt
#	var=0
	((NUM++))
done <"$input"


rm temp
