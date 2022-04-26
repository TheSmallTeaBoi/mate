#/usr/bin/env bash

while IFS= read -r line; do
	echo "$line" |\
		# Bold
	       	sed -Er 's/=(.*)=/*\1*/' |\
		# Italics
	       	sed -Er 's/\/(.*)\//_\1_/' |\
		# Headings
	       	sed -Er 's/^#+\s*(.*)/# \1/' |\
		# Lists
		sed -Er 's/^[\t|    ]+\- */\t\- /' |\
		# Numbered lists
	       	sed -Er 's/^[\t|    ]+([0-9]+)[\.|\)][ ]*/\t\1\. /' |\
		# Monospace and verbatim
	       	sed -Er 's/[\||%](.*)[\||%]/`\1`/' |\
		# Links
	       	sed -Er 's/\((.*)\)\{(.*)\}/\[\1\]\(\2\)/' |\
		# Code blocks
	       	sed -Er 's/^\-\-\- */```/'
done < $1
