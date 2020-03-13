WS                          \s
Letter                      [A-Za-z]
Digit                       [0-9]
Punctuation                 [,\.\?!;;]

%%

{WS}                        {}
{Letter}+                   { return 'WORD'; }
{Digit}+                    { return 'NUMBER'; }
{Punctuation}               { return 'PUNCTUATION'; }

%%
