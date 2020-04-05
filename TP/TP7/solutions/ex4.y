%left '+' '-'
// * and / have higher priority
%left '*' '/' 
 
%{
/*TODO: Add a new parameter, the line number of each statement*/
// function for grammar rule
function rule (rule_name, items, line)
{
  return {
    rule: rule_name,
    items: items,
    line: line + 1
  };
}

// function for token
function token (token_name, value)
{
  return {
    token: token_name,
    value: value
  };
}

var variables = [];
 
%}
 
%% 
 
start: statements                           { 
                                                // $$ = rule ('start', [$1], yylineno);
                                                // return $$; 
                                                /*TODO 2: AST: comment the previous lines and uncomment the following */
                                                return {
                                                   type: 'program',
                                                   elements: $1
                                                }
                                            };
 
statements: statements NEWLINE statement	{
                                                // $$ = rule ('statements', [$1, token ('NEWLINE', $2), $3], yylineno);
                                                /*TODO 2: AST: comment the previous lines and uncomment the following */
                                                $1.push($3); // add the statement to the array produced by statements ($1)
                                                $$ = $1;
                                            }
            | statement						{
                                                // $$ = rule ('statements', [$1], yylineno);
                                                $$ = [];
										        $$.push($1);
                                            }
            ;
 
statement:  expression                      
            | expression_string             
            | variable                      
            | assign                        
            | function                      
			| function_run                  
            ;
 
 
expression: 'LP' expression 'RP'	        {
                                                /*TODO 2: Inside the AST, $$ will receive an object with the following properties: type, value*/
                                                // $$ = rule ('expression', [token ('(', $1), $2, token (')', $3)], yylineno);
                                                $$ = {
                                                    type: 'expression',
                                                    value: $2
                                                };
                                            }
	        | expression '+' expression	    { 
                                                /*TODO 2: For each of the following rules, $$ will receive an object with the following properties: type, operator, left, right*/
                                                // $$ = rule ('expression', [$1, token ('+', $2), $3], yylineno);
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3
                                                };
                                            }
            | expression '-' expression 	{
                                                // $$ = rule ('expression', [$1, token ('-', $2), $3], yylineno);
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3
                                                };
                                            }
            | expression '*' expression	    { 
                                                // $$ = rule ('expression', [$1, token ('*', $2), $3], yylineno);
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3
                                                };
                                            }
            | expression '/' expression 	{
                                                // $$ = rule ('expression', [$1, token ('/', $2), $3], yylineno);
                                                $$ = {
                                                    type: 'expression',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3
                                                };
                                            }
            | NUMBER 	                    { 
                                                // $1 is string so we store its float value
                                                // $$ = token ('NUMBER', parseFloat ($1));
                                                /*For each of the following terminals, $$ will receive an object with the following parameters: type (type of the node), value(the actual value of the node) */
                                                $$ = {
                                                    type: 'number',
                                                    value: $1
                                                };
                                            }
	        | IDENTIFIER                    {
                                                // store the variable
                                                // $$ = token ('IDENTIFIER', $1);
                                                if(!variables[$1])
                                                    console.log($1 + " was not defined.")
                                                else if(variables[$1] === "found")
                                                    console.log ($1 + " was defined, but its value was never set.")
                                                else if (typeof(variables[$1])===Number || typeof(variables[$1])===String)
                                                $$ = {
                                                    type: 'identifier',
                                                    value: $1
                                                };
                                                
                                            }
            ;
expression_string: 
expression_string '+' expression_string     {   /*TODO 2: Same as for expression */
                                                // $$ = rule ('expression_string', [$1, token ('+', $2), $3], yylineno);
                                                $$ = {
                                                    type: 'expression_string',
                                                    op: $2,
                                                    left: $1,
                                                    right: $3
                                                };
                                            }
| STRING_VALUE                              {
                                                // store the variable
                                                // get the value of the string without the quotes
                                                // $$ = token ('STRING_VALUE', $1.substring (1, $1.length-2));
                                                $$ = {
                                                    type: 'string',
                                                    value: $1
                                                };
                                            }
;
 
variable:	DEF variables                   {   /* TODO 3: Object parameters: type: 'var', variables: list of variables */
                                                // $$ = rule ('variable', [token ('VAR', $1), $2], yylineno);
                                                $$ = {
                                                    type: 'variables_definition',
                                                    variables: $2
                                                }
                                            }
        ;
 
variables:	variables ',' IDENTIFIER        {   /*TODO 3: Add an object corresponding to each identifier to the variables array. The only parameter of this object will be the id($1); $$ will receive the array  */
                                                // $$ = rule ('variables', 
                                                //         [
                                                //             token ('IDENTIFIER', $1), 
                                                //             token (',', ','), 
                                                //             $3
                                                //         ],
                                                //         yylineno
                                                //         );
                                                $1.push({
                                                    id: $3
                                                });
                                                $$ = $1;
                                
                                            }
		| IDENTIFIER                        {   /*TODO 3: Add the identifier object (id is the only parameter) to the $$ array. $$ will have to be initialised as an empty array first. */
                                                // $$ = token ('IDENTIFIER', $1);
                                                $$ = [];
                                                $$.push({
                                                    id: $1
                                                });
                                                variables[$1] = "found";
                                            }
		| variables ',' IDENTIFIER OF type  {   /*TODO 3: Add the identifier object to the variables array ($5). The object will have the parameters id and type. $$ will receive the array */
                                                // $$ = rule ('variables', 
                                                //             [
                                                //                 token ('IDENTIFIER', $1), 
                                                //                 token ('OF', 'of'),
                                                //                 $3,
                                                //                 token (',', ','), 
                                                //                 $5
                                                //             ],
                                                //             yylineno
                                                //         );
                                                $1.push({
                                                    id: $3,
                                                    type: $5
                                                });
                                                $$ = $1;
                                            }
		| IDENTIFIER OF type                {   /*TODO 3: Add an object corresponding to the identifier in the $$ array. $$ will have to be initialised as an empty array first. The parameters of the object will be id and type. */
                                                // $$ = rule ('variables', 
                                                //             [
                                                //                 token ('IDENTIFIER', $1), 
                                                //                 token ('OF', 'of'),
                                                //                 $3
                                                //             ],
                                                //             yylineno
                                                //         );
                                                $$ = [];
                                                $$.push({
                                                    id: $1,
                                                    type: $3
                                                });
                                                variables[$1] = "found";
                                            }
        ;
 
type: INT                                 
    | FLOAT                             
    | STRING                            
    ;
 
assign: IDENTIFIER '=' expression           {   /*TODO 3: $$ will receive an object withh the following properties: type ('assign'), to(object with the id $1), from ($3) */
                                                // $$ = rule ('assign', 
                                                //         [
                                                //             token ('IDENTIFIER', $1), 
                                                //             token ('=', '='), 
                                                //             $3
                                                //         ],
                                                //         yylineno
                                                //     );
                                                $$ = {
                                                    type: 'assign',
                                                    to: $1,
                                                    from: $3
                                                };
                                                variables[$1] = $3;
                                            }
        | IDENTIFIER '=' expression_string  {
                                                // $$ = rule ('assign', 
                                                //         [
                                                //             token ('IDENTIFIER', $1), 
                                                //             token ('=', '='), 
                                                //             $3
                                                //         ],
                                                //         yylineno
                                                //         );
                                                $$ = {
                                                    type: 'assign',
                                                    to: $1,
                                                    from: $3
                                                };
                                                variables[$1] = $3;
                                            }
        ;
 
 
 
function: FUNCTION IDENTIFIER 'LP' parameters 'RP' NEWLINE statements NEWLINE END 
        { 
            // $$ = rule ('function', [token('FUNCTION', $1), token('IDENTIFIER', $2), token('(', $3), $4, token(')', $5), token('NEWLINE', $6), $7, token('END_FUNCTION', $8)], yylineno); 
            /*TODO 3: $$ will receive an object with the following properties: type('function_declaration'), id(identifier value), parameters, instructions */
            $$ = {
                type: 'function_declaration',
                id: $2,
                parameters: $4,
                instructions: $7
            }
        }
        ;
 
parameters: parameters ',' IDENTIFIER OF type 
				{   /*TODO 3: Similar with the variables declaration */
					// $$ = rule ('parameters', [token('IDENTIFIER', $1), token ('OF', 'of'), $3, token (',', ','), $5], yylineno);
                    $1.push({
                        id: $3,
                        type: $5
                    });
                    $$ = $1;
                }
			| IDENTIFIER OF type
				{
					// $$ = rule ('parameters', [token('IDENTIFIER', $1), token ('OF', 'of'), $3], yylineno);
                    $$ = [];
                    $$.push({
                        id: $1,
                        type: $3
                    });
                }
			|	{
                    // $$ = token ('EMPTY', '');
                    $$ = [];
                }
            ;
 
function_run: IDENTIFIER 'LP' parameters_run 'RP' 
                { 
                    // $$ = rule ('function_run', [token ('IDENTIFIER', $1), token ('(', $2), $3, token (')', $4)], yylineno);
                    /*TODO 3: $$ will receive an object with the following properties: type('function_run'), id(identifier value), parameters (array of parameters_run)*/
                    $$ = {
                        type: 'function_run',
                        id: $1,
                        parameters: $3
                    };
                }
            ;
 
parameters_run: parameters_run ',' expression
                                                {   /*TODO 3: Add the expression to the parameters_run array($3). $$ will receive $3 */
                                                    // $$ = rule ('parameters_run', [$1, token (',', $2), $3], yylineno);
                                                    $1.push($3);
                                                    $$ = $1;
                                                }
			    | expression
                                                {   /* TODO 3: Add the expression to the $$ array, that will have to be initialised as empty first */
                                                    // $$ = rule ('parameters_run', [$1], yylineno);
                                                    $$ = [];
                                                    $$.push($1);
                                                }
                | parameters_run ',' expression_string
                                                {   /* TODO 3: Similar with expression */
                                                    // $$ = rule ('parameters_run', [$1, token (',', $2), $3], yylineno);
                                                    $1.push($3);
                                                    $$ = $1;
                                                }
                | expression_string
                                                {
                                                    // $$ = rule ('parameters_run', [$1], yylineno);
                                                    $$ = [];
                                                    $$.push($1);
                                                }
                |	
                                                {
                                                    // $$ = token ('EMPTY', '');
                                                    $$ = [];
                                                }
                ;