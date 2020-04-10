%left '+' '-'
%left '*' '/' 
 
%{
// function for grammar rule
var symbol_table = {};

function addVariable (variable, type)
{
  symbol_table[variable] = {
    type: type,
    value: undefined
  };
}

/*TODO 6 */
function addFunction (id, parameters)
{
  symbol_table[id] = {
    parameters: parameters
  };
}

function deleteParameters () {
	for(let key of Object.keys(symbol_table)) {
		if (symbol_table[key].type === 'parameter') {
			delete symbol_table[key];
		}
	}
}

function isDefined (variable)
{
    if (symbol_table[variable])
        return true;
    else
        return false;
}
/*TODO 4 */
function matching (left, right, op)
{
    let type_left;
    let type_right;

    if(left.type === 'variable') {
        type_left = symbol_table[left.value].type;
    }
    else
        type_left = left.type;
    if(right.type === 'variable') {
        type_right = symbol_table[right.value].type;
    }
    else
        type_right = right.type;
    
    if ((type_left === 'string' || type_right === 'string') && op !== '+')
        return false;
    
    return true;
}
/*TODO 5 */
function getType (left, right, op)
{
    let type_left;
    let type_right;

    if(left.type === 'variable') {
        type_left = symbol_table[left.value].type;
    }
    else
        type_left = left.type;
    if(right.type === 'variable') {
        type_right = symbol_table[right.value].type;
    }
    else
        type_right = right.type;
    
    if(type_left === type_right)
        return type_left;
    if (type_left === 'string' || type_right === 'string')
        return 'string';
    if (type_left === 'float' || type_right === 'float')
        return 'float';
}
%}
 
%% 
 
start
: statements 	                            {
                                                return { 
                                                    ast: {
                                                        type: 'program',
                                                        elements: $1,
                                                        line: yylineno + 1
                                                    },
                                                    symbol_table: symbol_table
                                                };
                                            }
;
 
statements
: statements NEWLINE statement		        {
                                                $1.push($3); // add the statement to the array produced by statements ($1)
                                                $$ = $1;
                                            }
| statement							        {
                                                $$ = [];
                                                $$.push($1); // an array with one element
                                            }
;
 
statement
: expression
| variable
| assign
| array
| function
| function_call
;
 
 
expression
: '(' expression ')'			            {
                                                $$ = {
                                                    type: 'expression',
                                                    value: $2,
                                                    line: yylineno + 1
                                                };
                                            }
| expression '+' expression			        {   /*TODO 4 + 5 */
                                                if(!matching ($1, $3, $2))
                                                    return 'ERROR: The types are not corresponding'
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    exprType: getType ($1, $3, $2),
                                                    line: yylineno + 1
                                                };
                                            }
| expression '-' expression 		        {   /*TODO 4  + 5*/
                                                if(!matching ($1, $3, $2))
                                                    return 'ERROR: The types are not corresponding'
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    exprType: getType ($1, $3, $2),
                                                    line: yylineno + 1
                                                };
                                            }
| expression '*' expression			        {   /*TODO 4 + 5 */
                                                if(!matching ($1, $3, $2))
                                                    return 'ERROR: The types are not corresponding' 
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    exprType: getType ($1, $3, $2),
                                                    line: yylineno + 1
                                                };
                                            }
| expression '/' expression 		        {   /*TODO 4 + 5*/
                                                if(!matching ($1, $3, $2))
                                                    return 'ERROR: The types are not corresponding'
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    exprType: getType ($1, $3, $2),
                                                    line: yylineno + 1
                                                };
                                            }
| NUMBER 				                    { 
                                                $$ = {
                                                        type: 'int',
                                                        value: $1,
                                                        line: yylineno + 1
                                                };
                                            }
| IDENTIFIER 			                    {
                                                $$ = {
                                                    type: 'variable',
                                                    value: $1,
                                                    line: yylineno + 1
                                                };
                                            }
| STRING_VALUE                              {
                                                $$ = {
                                                    type: 'string',
                                                    value: $1,
                                                    line: yylineno + 1
                                                };
                                            }
;
 
variable: DEF variables                     {
                                                $$ = {
                                                    type: 'variable_definition',
                                                    variables: $2,
                                                    line: yylineno + 1
                                                };
                                            }
;
 
variables
: variables ',' IDENTIFIER			        {   /*TODO 3 */
                                                if(isDefined($3))
                                                    return 'ERROR: The variable ' + $3 + ' is already defined.'
                                                /*TODO 2 */
                                                addVariable ($3, 'unknown');
                                                $1.push({
                                                    id: $3,
                                                    line: yylineno + 1
                                                });
                                                $$ = $1;
                                            }
| IDENTIFIER 						        {   /*TODO 3 */
                                                if(isDefined($1))
                                                    return 'ERROR: The variable ' + $1 + ' is already defined.'
                                                /*TODO 2 */
                                                addVariable ($1, 'unknown');
                                                $$ = [];
                                                $$.push({
                                                    id: $1,
                                                    line: yylineno + 1
                                                })	
                                            }
| variables ',' IDENTIFIER '[' type ']'     {   /*TODO 3 */
                                                if(isDefined($3))
                                                    return 'ERROR: The variable ' + $3 + ' is already defined.'
                                                /*TODO 2 */
                                                addVariable ($3, $5);
                                                $1.push({
                                                    id: $3,
                                                    type: $5,
                                                    line: yylineno + 1
                                                });
                                                $$ = $1;
                                            }
| IDENTIFIER '[' type ']'			        {   /*TODO 3 */
                                                if(isDefined($1))
                                                    return 'ERROR: The variable ' + $1 + ' is already defined.'
                                                /*TODO 2 */
                                                addVariable ($1, $3);
                                                $$ = [];
                                                $$.push({
                                                    id: $1,
                                                    type: $3,
                                                    line: yylineno + 1
                                                });	
                                            }
;
 
type
: INT 
| FLOAT
| STRING
;
 
assign
: IDENTIFIER '=' expression 	            {   /*TODO 5 */
                                                symbol_table[$1].type = $3.exprType;
                                                $$ = {
                                                    type: 'assign',
                                                    to: {
                                                        id: $1,
                                                        line: yylineno + 1
                                                    },
                                                    from: $3,
                                                    line: yylineno + 1
                                                };
                                            }
                                    
;
/*TODO 1 */
array
: LIST IDENTIFIER '=' '[' array_elements ']'    {
                                                    $$ = {
                                                        type: 'array_declaration',
                                                        array: $2,
                                                        elements: $5,
                                                        line: yylineno + 1
                                                    }
                                                }
;

array_elements
: array_elements ',' expression			        {
                                                    $1.push($3);
                                                    $$ = $1;
                                                }
| expression							        {
                                                    $$ = [];
                                                    $$.push($1);
                                                }
;

function
: FUNCTION IDENTIFIER LP parameters RP NEWLINE statements NEWLINE END 	        {       /*TODO 6 */
                                                                                        addFunction($2, $4);
																						$$ = {
																							type: 'function_declaration',
																							id: $2,
																							parameters: $4,
																							instructions: $7,
																							line: yylineno + 1
                                                                                        };	
                                                                                        deleteParameters();																		
																					}
;
 
parameters
: parameters ',' IDENTIFIER '[' type ']'	    {
                                                    addVariable($3, 'parameter');
                                                    $1.push({
                                                        id: $3,
                                                        type: $5,
                                                        line: yylineno + 1
                                                    });
                                                    $$ = $1;
                                                }
| IDENTIFIER '[' type ']'					    {
                                                    addVariable($1, 'parameter');
                                                    $$ = [];
                                                    $$.push({
                                                        id: $1,
                                                        type: $3,
                                                        line: yylineno + 1
                                                    });
                                                }
        |										{
                                                    $$ = [];
                                                }
;
 
function_call
: IDENTIFIER LP parameters_run RP   	        {
                                                    $$ = {
                                                        type: 'function_call',
                                                        id: $1,
                                                        parameters: $3,
                                                        line: yylineno + 1
                                                    };
                                                }
;
 
parameters_run
: parameters_run ',' expression			        {
                                                    $1.push($3);
                                                    $$ = $1;
                                                }
| expression							        {
                                                    $$ = [];
                                                    $$.push($1);
                                                }
|										        {
                                                    $$ = [];
                                                }
;
