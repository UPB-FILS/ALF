%left '+' '-'
// * and / have higher priority
%left '*' '/' 
 
%% 
 
start: statements 							{ 
												$$ =  {
													type:'module',
													statements: $1
												};
												return $$; 
											};
 
statements
: statement NEWLINE statements				{
                                                $3.splice (0, 0, $1);
                                                $$ = $3;
											}
| statement NEWLINE							{
												$$ = [$1];
											}
| statement									{
												$$ = [$1];
											}
;
						
statement
: expression  								{}
| assign 									{}
| function									{}
;
 
 
expression
: LP expression RP							{ $$ = $2; }
| expression '+' expression					{ 
												$$ = {
													type: 'expression',
													operator: '+',
													left: $1,
													right: $3
												};
											}
| expression '-' expression 				{
													$$ = {
													type: 'expression',
													operator: '-',
													left: $1,
													right: $3
												};
											}
| expression '*' expression					{ 
												$$ = {
													type: 'expression',
													operator: '*',
													left: $1,
													right: $3
												};
											}
| expression '/' expression 				{
												$$ = {
													type: 'expression',
													operator: '/',
													left: $1,
													right: $3
												};
											}
| IDENTIFIER 								{
												$$ = {
													type: 'identifier',
													value: $1
												};
											}
| NUMBER 									{ 
												$$ = {
													type: 'number',
													value: parseFloat ($1)
												};
											}
| STRING_VALUE 								{
												$$ = {
													type: 'string',
													value: $1.substring (1, $1.length-2)
												};
                                            }
| function_call
;

 
assign
: IDENTIFIER '=' expression					{
												$$ = {
													type: 'assign',
													to: $1,
													from: $3
												};
											}
;
 
function_call
: IDENTIFIER LP parameters_run RP  			{
												$$ = {
													type: 'function_call',
													function: $1,
													parameters: $3
												};
											};

parameters_run
: expression ',' parameters_run				{
												$3.splice (0, 0, $1);
												$$ = $3;
											}
| expression								{
												$$ = [$1];
											}
|											{
												$$ = [];
											}
;

function
: FUNCTION IDENTIFIER LP parameters_run RP NEWLINE LB NEWLINE statements RB     {
																					$$ = {
																						type: "function",
																						name: $2,
																						parameters: $4,
																						statements: $9
																					}
																				}
;																
