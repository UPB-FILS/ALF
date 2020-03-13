"use strict";

var Parser = require ('./ex4.js').Parser;
var lexer = new Parser ().lexer;

var fs = require ('fs');
var data = fs.readFileSync('./text_and_numbers.txt').toString();
lexer.setInput (data);
 
var s = null;

do 
{
    try
    {
        s = lexer.next ();
    }
    catch (e)
    {
        console.log ('Error line '+ (lexer.yylineno + 1) + '\n' + lexer.showPosition() );
        process.exit (-1);
    }
    if (s && s!== lexer.EOF)
    {
       console.log ("type: " + s + " value: " + lexer.yytext + " line: " + lexer.yylineno);
    }
} while (s !== lexer.EOF); 
 
