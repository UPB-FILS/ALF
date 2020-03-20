%left '+' '-'
%left '*' '/' '%'
%left AND OR
%right NOT
%%

start
: statements         {
                        console.log('No errors'); 
                        return $$;                   
                    }  
;

statements
: statement ';' statements
| statement ';'
;

statement
: declaration
| expression                                
| expression_string
| expression_boolean
;

declaration
: INT VARIABLE ATTRIBUTION INTEGER              { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| DOUBLE VARIABLE ATTRIBUTION FLOAT             { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| STRING VARIABLE ATTRIBUTION STRING_VALUE      { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| BOOLEAN VARIABLE ATTRIBUTION boolean_value      { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
;

boolean_value
: TRUE 
| FALSE 
;

expression
: expression '+' expression                     {  
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    console.log('Operator: ' + $2); 
                                                    var variables = [];
                                                    if(isNaN($1))
                                                        variables.push($1);
                                                    if (isNaN($3))
                                                        variables.push($3);
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) + parseFloat($3); 
                                                        console.log($$);
                                                    }
                                                }
| expression '-' expression                     {   
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    console.log('Operator: ' + $2);
                                                    var variables = [];
                                                    if(isNaN($1))
                                                        variables.push($1);
                                                    if (isNaN($3))
                                                        variables.push($3);
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) - parseFloat($3); 
                                                        console.log($$);
                                                    }
                                                }
| expression '*' expression                     { 
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    console.log('Operator: ' + $2);   
                                                    var variables = [];
                                                    if(isNaN($1))
                                                        variables.push($1);
                                                    if (isNaN($3))
                                                        variables.push($3);
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) * parseFloat($3); 
                                                        console.log($$);
                                                    }
                                                }
| expression '/' expression                     { 
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    console.log('Operator: ' + $2);   
                                                    var variables = [];
                                                    if(isNaN($1))
                                                        variables.push($1);
                                                    if (isNaN($3))
                                                        variables.push($3);
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) / parseFloat($3); 
                                                        console.log($$);
                                                    }
                                                }
| expression '%' expression                     { 
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    console.log('Operator: ' + $2);   
                                                    var variables = [];
                                                    if(isNaN($1))
                                                        variables.push($1);
                                                    if (isNaN($3))
                                                        variables.push($3);
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) % parseFloat($3); 
                                                        console.log($$);
                                                    }
                                                }
| LP expression RP                              { $$ = $2; }
| INTEGER                                       { $$ = $1; }
| FLOAT                                         { $$ = $1; }
| VARIABLE                                      { $$ = $1; }
;

expression_string
: expression_string '+' expression_string       {
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    console.log('Operator: ' + $2);   
                                                    
                                                    $$ = $1 + $3;
                                                    console.log($$);
                                                }
| STRING_VALUE                                  {
                                                    $$ = JSON.parse($1);
                                                }
;

expression_boolean
: expression_boolean AND expression_boolean     {
                                                    console.log('Operator: ' + $2);
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    $$ = JSON.parse($1) && JSON.parse($3);
                                                    console.log($$);
                                                }
| expression_boolean OR expression_boolean      {
                                                    console.log('Operator: ' + $2);
                                                    console.log('Operands: ' + $1 + ',' + $3);
                                                    $$ = JSON.parse($1) || JSON.parse($3);
                                                    console.log($$);
                                                }
| NOT expression_boolean                        {
                                                    console.log('Operator: ' + $1);
                                                    console.log('Operands: ' + $2);
                                                    $$ = !JSON.parse($2);
                                                    console.log($$);
                                                }
| boolean_value
;