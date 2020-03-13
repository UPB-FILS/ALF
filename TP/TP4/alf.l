/* Declarations */
WS                      \s

/* TODO: Declare regex for Digit, Letter and Punctuation */
Digit                   [0-9]
Letter                  [a-zA-Z]
Punctuation             [,\.\?!;:-]

%%

{WS}+                   { /* whitespace */ }
{Digit}+                { return 'NUMBER'; }
{Punctuation}           { return 'PUNCTUATION';}
{Letter}+               { return 'WORD'; }

%%