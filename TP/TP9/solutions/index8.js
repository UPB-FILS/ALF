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
            results.push ({
                result: null,
                arg1: parameter.result,
                arg2: null,
                op: 'param'
            });
        }
        
        node.result = {
            type: 'temp',
            value: nextVar(),
            line: results.length + 1 
        };
        results.push ({
            result: node.result,
            arg1: node.function, 
            arg2: node.parameters.length,
            op: 'call'
        });
    }
    else
    if (node.type === 'number')
    {
        node.result = {
            type: 'number',
            value: node.value
        }
    }
    else
    if (node.type === 'identifier')
    {
        node.result = {
            type: 'identifier',
            value: node.value
        }
    }
    else
    if (node.type === 'expression')
    {
        if (node.left !== undefined && node.right !== undefined)
        {
            writeThreeAddressCode (node.left);
            writeThreeAddressCode (node.right);
            node.result = {
                type: 'temp',
                value: nextVar(),
                line: results.length + 1
            };
            results.push ({
                result: node.result,
                arg1: node.left.result,
                arg2: node.right.result,
                op: node.operator
            });
        }
    }
    else
    if (node.type === 'assign')
    {
        writeThreeAddressCode (node.from);
        results.push ({
            result: null,
            arg1: node.to,
            arg2: node.from.result,
            op: '='
        });
    }
}
 
var ast = parser.parse (str);
console.log (JSON.stringify(ast, null, 4));
writeThreeAddressCode(ast); 
console.log (JSON.stringify(results, null, 4));