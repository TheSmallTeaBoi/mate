#/usr/bin/env bash

usage="
-h        : print this help

Run this script by calling a file to get a markdown file out of a MATE file.
Examples:
Print markdown to the terminal
---
./parser.sh readme.mate
---

Save markdown file out of a MATE file
---
./parser.sh readme.mate >> README.md
---
"

if [ $# -ne 1 ] || [ $1 == '-h' ] || [ $1 == '--help' ]; then
    echo "$usage"
    exit
fi

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
