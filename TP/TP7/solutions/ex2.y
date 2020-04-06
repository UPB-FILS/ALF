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
 
statements: statement NEWLINE statements	{
                                                // $$ = rule ('statements', [$1, token ('NEWLINE', $2), $3], yylineno);
                                                /*TODO 2: AST: comment the previous lines and uncomment the following */
                                                $3.push($1); // add the statement to the array produced by statements ($1)
                                                $$ = $3;
                                            }
            | statement NEWLINE				{
                                                // $$ = rule ('statements', [$1, token ('NEWLINE', $2)], yylineno);
                                                $$ = [];
										        $$.push($1);
                                            }
            | statement						{
                                                // $$ = rule ('statements', [$1], yylineno);
                                                $$ = [];
										        $$.push($1);
                                            }
            ;
 
statement:  expression                      
            | expression_string             {   /* TODO 3: Remove the rule() function call for each statement */
                                                $$ = rule ('statement', [$1], yylineno);
                                            }
            | variable                      {
                                                $$ = rule ('statement', [$1], yylineno);
                                            }
            | assign                        {
                                                $$ = rule ('statement', [$1], yylineno);
                                            }
            | function                      {
                                                $$ = rule ('statement', [$1], yylineno);
                                            }
			| function_run                  {
                                                $$ = rule ('statement', [$1], yylineno);
                                            }
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
                                                $$ = {
                                                    type: 'identifier',
                                                    value: $1
                                                };
                                            }
            ;
expression_string: 
expression_string '+' expression_string     {   /*TODO 2: Same as for expression */
                                                $$ = rule ('expression_string', [$1, token ('+', $2), $3], yylineno);
                                            }
| STRING_VALUE                              {
                                                // store the variable
                                                // get the value of the string without the quotes
                                                $$ = token ('STRING_VALUE', $1.substring (1, $1.length-2));
                                            }
;
 
variable:	DEF variables                   {   /* TODO 3: Parameters: type: 'var', variables: list of variables */
                                                $$ = rule ('variable', [token ('DEF', $1), $2], yylineno);
                                            }
        ;
 
variables:	IDENTIFIER ',' variables        {   /*TODO 3: Add an object corresponding to each identifier to the variables array. The only parameter of this object will be the id.  */
                                                $$ = rule ('variables', 
                                                        [
                                                            token ('IDENTIFIER', $1), 
                                                            token (',', ','), 
                                                            $3
                                                        ],
                                                        yylineno
                                                        );
                                
                                            }
		| IDENTIFIER                        {   /*TODO 3: Add the identtifier object (id is the only parameter) to the $$ array. $$ will have to be initialised as an empty array first. */
                                                $$ = token ('IDENTIFIER', $1);
                                            }
		| IDENTIFIER OF type ',' variables  {   /*TODO 3: Add the identifier object to the variables array ($1). The object will have the parameters id and type. $$ will receive $1 */
                                                $$ = rule ('variables', 
                                                            [
                                                                token ('IDENTIFIER', $1), 
                                                                token ('OF', 'of'),
                                                                $3,
                                                                token (',', ','), 
                                                                $5
                                                            ],
                                                            yylineno
                                                        );
                                            }
		| IDENTIFIER OF type                {   /*TODO 3: Add an object corresponding to the identifier in the $$ array. $$ will have to be initialised as an empty array first. The parameters of the object will be id and type. */
                                                $$ = rule ('variables', 
                                                            [
                                                                token ('IDENTIFIER', $1), 
                                                                token ('OF', 'of'),
                                                                $3
                                                            ],
                                                            yylineno
                                                        );
                                
                                            }
        ;
 
type:   INT                                 {   /*TODO 3: Remove the token() function call */
                                                $$ = token ('INT', 'int');
                                            }
        | FLOAT                             {
                                                $$ = token ('FLOAT', 'float');
                                            }
        | STRING                            {
                                                $$ = token ('STRING', 'string');
                                            }
        ;
 
assign: IDENTIFIER '=' expression           {   /*TODO 3: $$ will receive an object withh the following properties: type ('assign'), to(object with the id $1), from ($3) */
                                                $$ = rule ('assign', 
                                                        [
                                                            token ('IDENTIFIER', $1), 
                                                            token ('=', '='), 
                                                            $3
                                                        ],
                                                        yylineno
                                                    );
                                
                                            }
        | IDENTIFIER '=' expression_string  {
                                                $$ = rule ('assign', 
                                                        [
                                                            token ('IDENTIFIER', $1), 
                                                            token ('=', '='), 
                                                            $3
                                                        ],
                                                        yylineno
                                                        );

                                            }
        ;
 
 
 
function: FUNCTION IDENTIFIER 'LP' parameters 'RP' NEWLINE statements END 
        { $$ = rule ('function', [token('FUNCTION', $1), token('IDENTIFIER', $2), token('(', $3), $4, token(')', $5), token('NEWLINE', $6), $7, token('END', $8)], yylineno); }
            /*TODO 3: $$ will receive an object with the following properties: type('function_declaration'), id(identifier value), parameters, expressions */
        ;
 
parameters: IDENTIFIER OF type ',' parameters
				{   /*TODO 3: Similar with the variables declaration */
					$$ = rule ('parameters', [token('IDENTIFIER', $1), token ('OF', 'of'), $3, token (',', ','), $5], yylineno);
				}
			| IDENTIFIER OF type
				{
					$$ = rule ('parameters', [token('IDENTIFIER', $1), token ('OF', 'of'), $3], yylineno);
				}
			|	{
					$$ = token ('EMPTY', '');
                }
            ;
 
function_run: IDENTIFIER 'LP' parameters_run 'RP' 
                { $$ = rule ('function_run', [token ('IDENTIFIER', $1), token ('(', $2), $3, token (')', $4)], yylineno);}
                /*TODO 3: $$ will receive an object with the following properties: type('function_run'), id(identifier value)*/
    
            ;
 
parameters_run: expression ',' parameters_run
                                                {   /*TODO 3: Add the expression to the parameters_run array($1). $$ will receive $1 */
                                                    $$ = rule ('parameters_run', [$1, token (',', $2), $3], yylineno);
                                                }
			    | expression
                                                {   /* TODO 3: Add the expression to the $$ array, that will have to be initialised as empty first */
                                                    $$ = rule ('parameters_run', [$1], yylineno);
                                                }
                | expression_string ',' parameters_run
                                                {   /* TODO 3: Similar with expression */
                                                    $$ = rule ('parameters_run', [$1, token (',', $2), $3], yylineno);
                                                }
                | expression_string
                                                {
                                                    $$ = rule ('parameters_run', [$1], yylineno);
                                                }
                |	
                                                {
                                                    $$ = token ('EMPTY', '');
                                                }
                ;