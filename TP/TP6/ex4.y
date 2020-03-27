
%left '+' '-'
%left '*' '/'

%{
    // function for grammar rule
    function rule (rule_name, items)
    {
      return {
        rule: rule_name,
        items: items
      };
    }
    variables_list = [];
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
    
start: statements               { return $1; }
;

statements
: statement ';' statements              { 
                                            $$ = rule ('statements',
                                                        [
                                                            $1,
                                                            token(';', ';'),
                                                            $3
                                                        ]
                                                    );
                                        }
| statement ';'                         { 
                                            $$ = rule ('statements',
                                                        [
                                                            $1,
                                                            token(';', ';')
                                                        ]
                                                    );
                                        }
;

statement
: variables_declaration                 { $$ = rule('statement', [$1]); } 
| expression                            { $$ = rule('statement', [$1]); }
| attribution                           { $$ = rule('statement', [$1]); }
| function_call                         { $$ = rule('statement', [$1]); }

;        
    
    
variables_declaration
: VAR variables                         {
                                            $$ = rule ('variables_declaration', [token ('VAR', $1), $2]);
                                        }
;
    
variables
: IDENTIFIER ',' variables              {
                                            $$ = rule ('variables', 
                                                        [
                                                            token ('IDENTIFIER', $1), 
                                                            token (',', ','), 
                                                            $3
                                                        ]
                                                    );
                                        }
| IDENTIFIER                            {
                                            $$ = token ('IDENTIFIER', $1);
                                        }
;

attribution
: IDENTIFIER '=' expression             {
                                            $$ = rule ('attribution', 
                                                        [
                                                            token('IDENTIFIER', $1),
                                                            token('=', '='),
                                                            $3
                                                        ]
                                                    );
                                            variables_list[$1] = $3;
                                        }
;


expression
: expression '+' expression             {
                                            $$ = rule ('expression', 
                                                    [
                                                        $1,
                                                        token ('+', '+'),
                                                        $3
                                                    ]
                                                );
                                        }
| expression '-' expression             {
                                            $$ = rule ('expression', 
                                                    [
                                                        $1,
                                                        token ('-', '-'),
                                                        $3
                                                    ]
                                                );
                                        }
| expression '*' expression             {
                                            $$ = rule ('expression', 
                                                    [
                                                        $1,
                                                        token ('*', '*'),
                                                        $3
                                                    ]
                                                );
                                        }
| expression '/' expression             {
                                            $$ = rule ('expression', 
                                                    [
                                                        $1,
                                                        token ('/', '/'),
                                                        $3
                                                    ]
                                                );
                                        }
| INTEGER                               { $$ = token('INTEGER', $1); } 
| FLOAT                                 { $$ = token('FLOAT', $1); }                                          
| IDENTIFIER                            {
                                            $$ = token('IDENTIFIER', $1);
                                            if(!variables_list[$1])
                                                console.log('Undefined variable ' + $1);
                                        }
;  

function_call
: IDENTIFIER LP parameters RP        {
                                            $$ = rule('function_call', 
                                                        [
                                                            token('IDENTIFIER', $1),
                                                            token ('LP', $2),
                                                            $3,
                                                            token ('RP', $4)
                                                        ]
                                                    );
                                        }
;

parameters
: expression ',' parameters              {
                                            $$ = rule ('parameters', 
                                                        [
                                                            $1,
                                                            token (',', ','),
                                                            $3
                                                        ]
                                            )
                                        }
| expression                             {
                                            $$ = $1;
                                        }
;