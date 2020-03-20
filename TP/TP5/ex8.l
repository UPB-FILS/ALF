Variable                [a-z]+
Integer                 [0-9]+
Float                   [0-9]+\.[0-9]+
String                  \"[^\"]+\"|\'[^\']+\'
Ws                      \s

%%

"int"                   { return "INT"; }
"double"                { return "DOUBLE"; }
"string"                { return "STRING"; }
"boolean"               { return "BOOLEAN"; }
"true"                  { return "TRUE"; }
"false"                 { return "FALSE"; }
"<-"                    { return "ATTRIBUTION"; }
";"                     { return ";"; }
"+"                     { return "+"; }
"-"                     { return "-"; }
"*"                     { return "*"; }
"/"                     { return "/"; }
"%"                     { return "%"; }
"("                     { return "LP"; }
")"                     { return "RP"; }
"||"                    { return "OR"; }
"&&"                    { return "AND"; }
"!"                     { return "NOT"; }

{Ws}+                   {}
{Variable}              { return "VARIABLE"; }
{Integer}               { return "INTEGER"; }
{Float}                 { return "FLOAT"; }
{String}                { return "STRING_VALUE"; }