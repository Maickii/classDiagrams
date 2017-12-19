#grep -o '[A-Z]\{4\}\( \|.\)[0-9]\{4\}L\?' temp
#sed 's/ /./g' temp > temp2
grep -o '[A-Z]' temp2
#grep '[0-9]\{2\}\.[0-9]\{3\}' temp2
#grep '\.\{2,\}' temp2
