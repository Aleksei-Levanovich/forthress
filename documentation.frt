' dup g" 
( a - a a )
Duplicate the cell on top of the stack.
" doc-word 

' drop g"
( a -- )
Drop the topmost element of the stack
" doc-word

' swap g" 
( a b -- b a )
Swap two topmost elements of the stack
" doc-word

' 0branch g"
Jump to a location if TOS = 0. Location is calculated in a similar way.
Branch0 is a compile only word.
" doc-word

' branch g"
Jump to a location. Location is absolute. That means that using it interactively is quasi-impossible; however, using it as a low-level primitive to implement if and similar constructs is much more convenient.
Branch is a compile-only word.
" doc-word

' docol g"
This is the implementation of any colon-word. The XT itself is not used, but the implementation (i_docol) is.
" doc-word

' bye g"
Exits Forthress
" doc-word

' prints g"
( addr -- )
Prints a null-terminated string.
" doc-word

' count g"
( str -- len )
Accepts a null-terminated string, calculates its length.
" doc-word

' number g"
( str -- len num )
Parses an integer from string.
" doc-word

' word g"
( addr -- len )
Reads word from stdin and stores it starting at address addr. Word length is pushed into stack.
" doc-word

' emit g"
( c -- )
Outputs a single character to stdout.
" doc-word
