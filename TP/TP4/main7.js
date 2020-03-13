"use strict";

var Parser = require ('./ex5.js').Parser;
var lexer = new Parser ().lexer;

var fs = require ('fs');
var data = fs.readFileSync('./program.php').toString();
lexer.setInput (data);
 
var s = null;
var tokens = [];

do 
{
    try
    {
        s = lexer.next ();
    }
    catch (e)
    {
        console.log ('Error line '+(lexer.yylineno+1)+'\n'+lexer.showPosition());
        process.exit (-1);
    }
    if (s && s!== lexer.EOF)
    {
        tokens.push({type: s, value: lexer.yytext,  line: lexer.yylineno});
        fs.writeFileSync("./output.json", JSON.stringify(tokens, null, 2));
    }
} while (s !== lexer.EOF); 
