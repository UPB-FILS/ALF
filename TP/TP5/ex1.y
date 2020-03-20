%%

start
: declaration ';'   {
                        return $$;                    
                    }
;

declaration
: INT VARIABLE ATTRIBUTION INTEGER              { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| DOUBLE VARIABLE ATTRIBUTION FLOAT             { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| STRING VARIABLE ATTRIBUTION STRING_VALUE      { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
;