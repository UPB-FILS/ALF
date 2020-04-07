Newline               \r?\n
Ws                    [ \t]
Number                [0-9]+("."[0-9]+)?
String_value          \"[^\"]*\"
Identifier            [A-Za-z][A-Za-z0-9]*


%%


"def"                 { return 'DEF'; }
"int"                 { return 'INT'; }
"float"               { return 'FLOAT'; }
"string"              { return 'STRING'; }
"function"            { return 'FUNCTION'; }
"end"                 { return 'END'; }
"list"                { return 'LIST'; }
"="				      { return '='; }
"-"                   { return '-'; }
"+"                   { return '+'; }
"*"                   { return '*'; }
"/"                   { return '/'; }
"("                   { return 'LP'; }
")"	                  { return 'RP'; }
','				      { return ','; }
"["                   { return '['; }
"]"                   { return ']'; }
{Ws}                  { /*skip whitespace*/ }
{Newline}             { return 'NEWLINE'; }
{Number}              { return 'NUMBER'; }
{String_value}        { return 'STRING_VALUE'; }
{Identifier}          { return 'IDENTIFIER'; }