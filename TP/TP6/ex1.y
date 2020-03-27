
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
                                            $$ = $1;
                                        }
;

statement
: variables_declaration                 { $$ = rule('statement', [$1]); } 
| expression                            { $$ = rule('statement', [$1]); }
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
;                                      
