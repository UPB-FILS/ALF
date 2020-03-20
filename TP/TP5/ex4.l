Variable                [a-z]+
Integer                 [0-9]+
Float                   [0-9]+\.[0-9]+
String                  \"[^\"]+\"|\'[^\']+\'
Ws                      \s

%%

"int"                   { return "INT"; }
"double"                { return "DOUBLE"; }
"string"                { return "STRING"; }
"<-"                    { return "ATTRIBUTION"; }
";"                     { return ";"; }
"+"                     { return "+"; }
"-"                     { return "-"; }
"*"                     { return "*"; }
"/"                     { return "/"; }
"%"                     { return "%"; }
"("                     { return "LP"; }
")"                     { return "RP"; }

{Ws}+                   {}
{Variable}              { return "VARIABLE"; }
{Integer}               { return "INTEGER"; }
{Float}                 { return "FLOAT"; }
{String}                { return "STRING_VALUE"; }