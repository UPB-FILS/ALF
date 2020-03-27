Ws                      \s+
Identifier              [A-Za-z\$_][A-Za-z\$_0-9]*
Integer                 [0-9]+
Float                   [0-9]+\.[0-9]+


%% 

"var" 		                            { return 'VAR'; }
","				                        { return ','; }
";"                                     { return ";"; }
"+"                                     { return "+"; }
"-"                                     { return "-"; }
"*"                                     { return "*"; }
"/"                                     { return "/"; }
"="                                     { return "="; }
{Ws}                                    { /* skip whitespace */ }
{Identifier}		                    { return 'IDENTIFIER'; }
{Integer}                               { return 'INTEGER'; }
{Float}                                 { return 'FLOAT'; }