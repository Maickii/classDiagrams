grep -o '[A-Z]\{4\}\( \|.\)[0-9]\{4\}L\?' preRecs > temp
cat temp > preRecs
sed -i 's/ /./g' preRecs
