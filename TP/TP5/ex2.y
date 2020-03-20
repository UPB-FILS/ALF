%left '+' '-'
%left '*' '/' '%'
%%

start
: statement         {
                        console.log('No errors'); 
                        return $$;                   
                    }
;

statement
: declaration ";"
| expression ";"
| expression_string ";"
;

declaration
: INT VARIABLE ATTRIBUTION INTEGER              { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| DOUBLE VARIABLE ATTRIBUTION FLOAT             { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| STRING VARIABLE ATTRIBUTION STRING_VALUE      { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
;

expression
: expression '+' expression
| expression '-' expression
| expression '*' expression
| expression '/' expression
| expression '%' expression
| INTEGER
| FLOAT
;

expression_string
: expression_string '+' expression_string
| STRING_VALUE
;