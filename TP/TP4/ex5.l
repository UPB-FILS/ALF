WS                                  \s
Function_Name                       [a-zA-Z_][a-zA-Z0-9_]*
Integer                             [0-9]+
Float                               [0-9]+\.[0-9]+
Variable                            \$[a-zA-Z0-9]+

%%

":"                                { return ":"; }
";"                                { return ";"; }
"="                                { return "="; }
"+"                                { return "+"; }
"("                                { return "LP"; }
")"                                { return "RP"; }
"{"                                { return "LB"; }
"}"                                { return "RB"; }
","                                { return ","; }
"-"                                { return "-"; }
"*"                                { return "*"; }
"/"                                { return "/"; }
"%"                                { return "%"; }
"for"                              { return "FOR"; }
"if"                               { return "IF"; }
"while"                            { return "WHILE"; }
"else"                             { return "ELSE"; }
"function"                         { return "FUNCTION"; }
"break"                            { return "BREAK"; }
"switch"                           { return "SWITCH"; }
"case"                             { return "CASE"; }
"default"                          { return "DEFAULT"; }

{WS}                               {}
{Function_Name}                    { return "FUNCTION_NAME"; }
{Integer}                          { return "INTEGER"; }
{Float}                            { return "FLOAT"; }
{Variable}                         { return "VARIABLE"; }
