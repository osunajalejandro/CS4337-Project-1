# CS4337-Project-1
Repository for the first project of the Programming Language Paradigms class at UTD.

Only files to check out are the devlog and the calculator.rkt file. 

Run 
    racket calculator.rkt 
for iterative mode and
    racket calculator.rkt -b
for batch mode (no prompts)

For input, make sure the input is in racket list form
    i.e. 3 + 3 should be input as (+ 3 3) including the parentheses. 

When history is used, make sure that the history token has no tailing parenthesis
    i.e (+ 3 $1)
This will crash the program, correct input is
    (+ 3 $1 ) with whitespace at the end
