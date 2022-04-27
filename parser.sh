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

verbatim=false
codeBlockReg="\s*^\-\-\- *"

while IFS= read -r line; do                       # Read line by line
    if [ $verbatim = false ]; then                # If you're not in a code block
        if [[ "$line" =~ $codeBlockReg ]]; then   # If code block starts
            echo '```'
	    verbatim=true
        else                                      # If you are not in a code block, apply regex
            echo "$line" |\
                # Bold
                sed -Er 's/([^\\])=(.*?[^\\])=/\1*\2*/' |\
                # Italics
                sed -Er 's/([^\\])_(.*?[^\\])_/\1*\2*/' |\
                # Headings
                sed -Er 's/^#+\s*(.*)/# \1/' |\
                # Sub headings
                sed -Er 's/^\)+\s*(.*)/#### \1/' |\
                # Lists
                sed -Er 's/^[\t+| {4,}]+\- */\t\- /' |\
                # Numbered lists
                sed -Er 's/^[\t+| {4,}]+([0-9]+)[\.|\)][ ]*/\t\1\. /' |\
                # Monospace and verbatim
                sed -Er 's/([^\\])\|(.*?[^\\])\|/\1*\2*/' |\
                # Links
                sed -Er 's/\((.*)\)\{(.*)\}/\[\1\]\(\2\)/'
        fi
    else                                          # If you are in a code block
	    if [[ "$line" =~ $codeBlockReg ]]; then   # If code block ends
            echo '```'
	        verbatim=false
	    else                                      # Print the same you got
            echo "$line"
        fi
    fi
done < $1
