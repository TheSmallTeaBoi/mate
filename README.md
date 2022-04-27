# MATE
## Yet another markup language


# Why?
Why not?

# Definition of the language:

The definition of the language goes as follows
```
Name             Formatting                   Regex
Bold:            =Some text=                  /=(.*)=/
Italics:         /Some text/                  /\/(.*)\//
Headings:        # Some text                  /^#+\s*(.*)/
Sub headings:    ) Some text                  /^\)+\s*(.*)/
Lists:           - Some text                  /^[\t|    ]+\- */
Numbered lists:  1. Some text                 /^[\t|    ]+([0-9]+)[\.|\)][ ]*/
Monospace:       |Some text|                  /\|(.*)\|/
Verbatim:        %Some text%                  /%(.*)%/
Links:           (Text){link}                 /\((.*)\)\{(.*)\}/
Code blocks:     ---                          /^\-\-\- */
```
# MATE
#### Yet another markup language


# Why?
Why not?

# Definition of the language:

The definition of the language goes as follows
```
Name             Formatting                   Regex
Bold:            =Some text=                  /=(.*)=/
Italics:         /Some text/                  /\/(.*)\//
Headings:        # Some text                  /^#+\s*(.*)/
Sub headings:    ) Some text                  /^\)+\s*(.*)/
Lists:           - Some text                  /^[\t|    ]+\- */
Numbered lists:  1. Some text                 /^[\t|    ]+([0-9]+)[\.|\)][ ]*/
Monospace:       |Some text|                  /\|(.*)\|/
Links:           (Text){link}                 /\((.*)\)\{(.*)\}/
Code blocks:     ---                          /^\-\-\- */
```

	\- You can also \_escape_ \=stuff=
