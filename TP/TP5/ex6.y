%left '+' '-'
%left '*' '/' '%'
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
;

declaration
: INT VARIABLE ATTRIBUTION INTEGER              { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| DOUBLE VARIABLE ATTRIBUTION FLOAT             { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| STRING VARIABLE ATTRIBUTION STRING_VALUE      { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
;

expression
: expression '+' expression                     {  
                                                    console.log($1 +  '+' + $3); 
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
                                                    console.log($1 +  '-' + $3);
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
                                                    console.log($1 +  '*' + $3);    
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
                                                    console.log($1 +  '/' + $3);
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
                                                    console.log($1 +  '%' + $3);
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
                                                    $$ = $1 + $3;
                                                    console.log($$);
                                                }
| STRING_VALUE                                  {
                                                    $$ = JSON.parse($1);
                                                }
;