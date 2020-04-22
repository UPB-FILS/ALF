"use strict";
 
var fs = require ('fs');
 
var parser = require ('../alf.js').parser;
 
var str = fs.readFileSync (process.argv[2], 'UTF-8');
 
var variable_id = 0;

var results = [];
function nextVar ()
{
    return 'var' + variable_id++;
}
 
 
function writeThreeAddressCode (node)
{
    if (node.type === 'module')
    {
        for (var statement of node.statements)
        {
            writeThreeAddressCode(statement);
        }
    }
    else
    if (node.type === 'function_call')
    {
        for (let parameter of node.parameters)
            writeThreeAddressCode(parameter);
        for (let parameter of node.parameters) {
            /* Ex 4-6: console.log ('param ' + parameter.result); */
            /* Ex 7 */
            results.push ('param ' + parameter.result);
        }
        
        node.result = nextVar();
        /* Ex 4-6: console.log (node.result + ' = call ' + node.function + ', ' + node.parameters.length);*/
        /*Ex 7 */
        results.push (node.result + ' = call ' + node.function + ', ' + node.parameters.length);
    }
    else
    if (node.type === 'number')
    {
        node.result = node.value;
    }
    else
    if (node.type === 'identifier')
    {
        node.result = node.value;
    }
    else
    if (node.type === 'expression')
    {
        if (node.left !== undefined && node.right !== undefined)
        {
            writeThreeAddressCode (node.left);
            writeThreeAddressCode (node.right);
            node.result = nextVar();
            /* Ex 4-6: console.log (node.result + ' = ' + node.left.result + ' ' + node.operator + ' ' + node.right.result );*/
            /* Ex 7*/
            results.push (node.result + ' = ' + node.left.result + ' ' + node.operator + ' ' + node.right.result );
        }
    }
    else
    if (node.type === 'assign')
    {
        writeThreeAddressCode (node.from);
        /* Ex 4-6: console.log (node.to + ' = ' + node.from.result);*/
        /* Ex 7*/
        results.push (node.to + ' = ' + node.from.result);
    }
}
 
var ast = parser.parse (str);
console.log (JSON.stringify(ast, null, 4));
writeThreeAddressCode(ast); 
/* Ex 7 */
console.log (results);