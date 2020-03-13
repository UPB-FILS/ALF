"use strict";

var Parser = require ('./alf.js').Parser;
 
// use the lexer from the generated Parser
var lexer = new Parser ().lexer;
 
// add a text to the lexer
lexer.setInput ("Hello, the ALF TP is from 12 PM to 2 PM.");
 
var s = null;
 
// repeat while you get an EOF token
do 
{
    try
    {
        // get the next token
        s = lexer.next ();
    }
    catch (e)
    {
        // if there is an error
        // print the line number (lexer.yylineno+1)
        // print the error position (lexer.showPosition ())
        console.log ('Error line '+(lexer.yylineno+1)+'\n'+lexer.showPosition());
        process.exit (-1);
    }
    if (s && s!== lexer.EOF)
    {
        // print the token (s)
        // print the token text (lexer.yytext)
        console.log (s+' '+lexer.yytext);
    }
} while (s !== lexer.EOF); 