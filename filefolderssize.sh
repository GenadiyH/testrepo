#!/bin/bash
funcsize()
{
	du -ha --block-size=KB $1 
}

funcborder()
{
	title="| $1 |"
	edge=$(echo "$title" | sed 's/./-/g')
	echo "$edge"
	echo "$title"
}


for folderfile in $(ls -d $1)
do
	funcsize $folderfile
done | sort -hr > /tmp/sizetmp


while read -r line; do
	funcborder "$(echo -e "$line")"
done </tmp/sizetmp


rm -f /tmp/sizetmp
