%left '+' '-'
// * and / have higher priority
%left '*' '/' 
 
%{
/*TODO: Add a new parameter, the line number of each statement*/
// function for grammar rule
function rule (rule_name, items)
{
  return {
    rule: rule_name,
    items: items
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
                                                $$ = rule ('start', [$1]);
                                                return $$; 
                                                /*TODO 2: AST: comment the previous lines and uncomment the following */
                                                // return {
                                                //     type: 'program',
                                                //     elements: $1
                                                // }
                                            }
    ;

statements: statement NEWLINE statements	{
                                                $$ = rule ('statements', [$1, token ('NEWLINE', $2), $3]);
                                                /*TODO 2: AST: comment the previous lines and uncomment the following */
                                                // $3.push($1); // add the statement to the array produced by statements ($1)
                                                // $$ = $3;
                                            }
            | statement NEWLINE				{
                                                $$ = rule ('statements', [$1, token ('NEWLINE', $2)]);
                                                // $$ = [];
                                                // $$.push($1);
                                            }
            | statement						{
                                                $$ = rule ('statements', [$1]);
                                                // $$ = [];
                                                // $$.push($1);
                                            }
            ;
 
statement:  expression                      {
                                                /* TODO 2: Remove the rule() function call for expression */
                                                $$ = rule ('statement', [$1]);
                                            }
            | expression_string             {
                                                /* TODO 3: Remove the rule() function call for each statement */
                                                $$ = rule ('statement', [$1]);
                                            }
            | variable                      {
                                                $$ = rule ('statement', [$1]);
                                            }
            | assign                        {
                                                $$ = rule ('statement', [$1]);
                                            }
            | function                      {
                                                $$ = rule ('statement', [$1]);
                                            }
			| function_call                 {
                                                $$ = rule ('statement', [$1]);
                                            }
            ;
 
 
expression: 'LP' expression 'RP'	        {
                                                /*TODO 2: Inside the AST, $$ will receive an object with the following properties: type, value*/
                                                $$ = rule ('expression', [token ('(', $1), $2, token (')', $3)]);
                                            }
	        | expression '+' expression	    { 
                                                /*TODO 2: For each of the following rules, $$ will receive an object with the following properties: type, operator, left, right*/
                                                $$ = rule ('expression', [$1, token ('+', $2), $3]);
                                            }
            | expression '-' expression 	{
                                                $$ = rule ('expression', [$1, token ('-', $2), $3]);
                                            }
            | expression '*' expression	    { 
                                                $$ = rule ('expression', [$1, token ('*', $2), $3]);
                                            }
            | expression '/' expression 	{
                                                $$ = rule ('expression', [$1, token ('/', $2), $3]);
                                            }
            | NUMBER 	                    { 
                                                // $1 is string so we store its float value
                                                $$ = token ('NUMBER', parseFloat ($1));
                                                /* TODO 2: For each of the following terminals, $$ will receive an object with the following parameters: type (type of the node), value(the actual value of the node) */
                                            }
	        | IDENTIFIER                    {
                                                // store the variable
                                                $$ = token ('IDENTIFIER', $1);
                                            }
            ;
expression_string: 
expression_string '+' expression_string     {   /*TODO 2: Same as for expression */
                                                $$ = rule ('expression_string', [$1, token ('+', $2), $3]);
                                            }
| STRING_VALUE                              {
                                                // store the variable
                                                // get the value of the string without the quotes
                                                $$ = token ('STRING_VALUE', $1.substring (1, $1.length-2));
                                            }
;
 
variable:	DEF variables                   {   /* TODO 3: AST object parameters: type('var'), variables(list of variables) */
                                                $$ = rule ('variable_definition', [token ('VAR', $1), $2]);
                                            }
        ;
 
variables:	IDENTIFIER ',' variables        {   /*TODO 3: Add an object corresponding to each identifier to the variables array ($3). The only parameter of this object will be the id.  */
                                                $$ = rule ('variables', 
                                                        [
                                                            token ('IDENTIFIER', $1), 
                                                            token (',', ','), 
                                                            $3
                                                        ]
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
                                                                        ]
                                                        );
                                            }
		| IDENTIFIER OF type                {   /*TODO 3: Add an object corresponding to the identifier in the $$ array. $$ will have to be initialised as an empty array first. The parameters of the object will be id and type. */
                                                $$ = rule ('variables', 
                                                            [
                                                                token ('IDENTIFIER', $1), 
                                                                token ('OF', 'of'),
                                                                $3
                                                            ]
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
                                                        ]
                                                    );
                                
                                            }
        | IDENTIFIER '=' expression_string  {
                                                $$ = rule ('assign', 
                                                        [
                                                            token ('IDENTIFIER', $1), 
                                                            token ('=', '='), 
                                                            $3
                                                        ]
                                                        );

                                            }
        ;
 
 
 
function: FUNCTION IDENTIFIER 'LP' parameters 'RP' NEWLINE statements END 
        { $$ = rule ('function', [token('FUNCTION', $1), token('IDENTIFIER', $2), token('(', $3), $4, token(')', $5), token('NEWLINE', $6), $7, token('END', $8)]); }
            /*TODO 3: $$ will receive an object with the following properties: type('function_declaration'), id(identifier value), parameters, expressions */
        ;
 
parameters: IDENTIFIER OF type ',' parameters
				{   /*TODO 3: Similar with the variables declaration */
					$$ = rule ('parameters', [token('IDENTIFIER', $1), token ('OF', 'of'), $3, token (',', ','), $5]);
				}
			| IDENTIFIER OF type
				{
					$$ = rule ('parameters', [token('IDENTIFIER', $1), token ('OF', 'of'), $3]);
				}
			|	{
					$$ = token ('EMPTY', '');
                }
            ;
 
function_call: IDENTIFIER 'LP' parameters_call 'RP' 
                { $$ = rule ('function_call', [token ('IDENTIFIER', $1), token ('(', $2), $3, token (')', $4)]);}
                /*TODO 3: $$ will receive an object with the following properties: type('function_call), id(identifier value)*/
    
            ;
 
parameters_call: expression ',' parameters_call
                                                {   /*TODO 3: Add the expression to the parameters_call array($1). $$ will receive $1 */
                                                    $$ = rule ('parameters_call', [$1, token (',', $2), $3]);
                                                }
			    | expression
                                                {   /* TODO 3: Add the expression to the $$ array, that will have to be initialised as empty first */
                                                    $$ = rule ('parameters_call', [$1]);
                                                }
                | expression_string ',' parameters_call
                                                {   /* TODO 3: Similar with expression */
                                                    $$ = rule ('parameters_call', [$1, token (',', $2), $3]);
                                                }
                | expression_string
                                                {
                                                    $$ = rule ('parameters_call', [$1]);
                                                }
                |	
                                                {
                                                    $$ = token ('EMPTY', '');
                                                }
                ;