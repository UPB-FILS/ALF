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

function isDefined (variable)
{
   //TODO 3: add here the code to verify if a variable is already in the symbol table and call this function for the variables definition rule
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
| function
| function_call
;
 
 
expression
: LP expression RP			                {
                                                $$ = {
                                                    type: 'expression',
                                                    value: $2,
                                                    line: yylineno + 1
                                                };
                                            }
| expression '+' expression			        {
                                                /**TODO 4: Check if the type of each operand. If one of the operands is a variable, 
                                                 * check of its type in the symbol table */
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    line: yylineno + 1
                                                };
                                                /** TODO 5: Add a new parameter(exprType) to $$. The value of this parameter will be determined 
                                                 * based on the type of the operands */
                                            }
| expression '-' expression 		        {
                                                /**TODO 4: Check if the type of each operand. If one of the operands is a variable, check its type 
                                                 * in the symbol table. If one of the operands is a string, return an error */
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    line: yylineno + 1
                                                };
                                            }
| expression '*' expression			        { 
                                                /**TODO 4: Check if the type of each operand. If one of the operands is a variable, check its type 
                                                 * in the symbol table. If one of the operands is a string, return an error*/
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    line: yylineno + 1
                                                };
                                                /** TODO 5: Add a new parameter(exprType) to $$. The value of this parameter will be determined 
                                                 * based on the type of the operands */
                                            }
| expression '/' expression 		        {
                                                /**TODO 4: Check if the type of each operand. If one of the operands is a variable, check its type
                                                 * in the symbol table. If one of the operands is a string, return an error */
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3,
                                                    line: yylineno + 1
                                                };
                                                /*TODO 5: Add a new parameter(exprType) to $$. The value of this parameter will be determined 
                                                based on the type of the operands */
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
: variables ',' IDENTIFIER			        { // TODO2: add the variable to the symbol table, type is unknown
                                              // TODO 3: verify for identifier 
                                                $1.push({
                                                    id: $3,
                                                    line: yylineno + 1
                                                });
                                                $$ = $1;
                                            }
| IDENTIFIER 						        { // TODO2:add the variable to the symbol table, type is unknown
                                              // TODO 3: verify for identifier 

                                                $$ = [];
                                                $$.push({
                                                    id: $1,
                                                    line: yylineno + 1
                                                })	
                                            }
| variables ',' IDENTIFIER '[' type ']'     { // TODO2: add the variable to the symbol table, type is specified by $5
                                              // TODO 3: verify for identifier   
                                                $1.push({
                                                    id: $3,
                                                    type: $5,
                                                    line: yylineno + 1
                                                });
                                                $$ = $1;
                                            }
| IDENTIFIER '[' type ']'			        { // TODO2: Add the variable to the symbol table, type is specified by $3
                                              // TODO 3: verify for identifier 
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
: IDENTIFIER '=' expression 	    {
                                        /*TODO 5: The type of the identifer in the symbol table will be the type of the expression (exprType)*/
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

function
: FUNCTION IDENTIFIER LP parameters RP NEWLINE statements NEWLINE END 	            {   /*TODO 6: Add the function to the symbol table using a function similar to addVariable */
																						$$ = {
																							type: 'function_declaration',
																							id: $2,
																							parameters: $4,
																							instructions: $7,
																							line: yylineno + 1
																						};																			
																					}
;
 
parameters
: parameters ',' IDENTIFIER '[' type ']'	    {   /*TODO 6: Add the identifyer to the symbol table using addVariable. The type will be 'parameter' */
                                                    $1.push({
                                                        id: $3,
                                                        type: $5,
                                                        line: yylineno + 1
                                                    });
                                                    $$ = $1;
                                                }
| IDENTIFIER '[' type ']'					    {   /*TODO 6: Add the identifyer to the symbol table using addVariable. The type will be 'parameter' */
                                                    $$ = [];
                                                    $$.push({
                                                        id: $1,
                                                        type: $3,
                                                        line: yylineno + 1
                                                    });
                                                }
|										        {
                                                    $$ = [];
                                                }
;
 
function_call
: IDENTIFIER '(' parameters_run ')' 	        {
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
