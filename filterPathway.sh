#!/bin/bash
sed -i -e 's/<tr>\\n<td>//g' output
sed -i -e 's/<\/td>\\n<td>/\t/g' output
sed -i -e 's/<\/td>\\n<\/tr>/\t/g' output
sed -z -i -e 's/u'"'"'\\n'"'"'\n//g' output
sed -i -e 's/<sup>[0-9]<\/sup>//g' output
sed -i 's/&amp;/\&/g' output
sed -i 's/\\xa0//g' output
sed -i 's/ /_/g' output
#sed -e 's/[A-Z]\{4\}.[0-9]\{4\}L\?/working/g' output
#sed -i -z -e 's/u'"'"'\\n'"'"'//g' output
#echo 'abc'"'"'abc' u'\n'
