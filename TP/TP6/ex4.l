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
"("                                     { return "LP"; }
")"                                     { return "RP"; }
{Ws}                                    { /* skip whitespace */ }
{Identifier}		                    { return 'IDENTIFIER'; }
{Float}                                 { return 'FLOAT'; }
{Integer}                               { return 'INTEGER'; }
