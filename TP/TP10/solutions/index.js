"use strict";
 
// import fs for reading 
var fs = require ('fs');
 
// import the generated Parser
var parser = require ('./alf.js').parser;
 
var str = fs.readFileSync (process.argv[2], 'UTF-8');
 
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
        console.log('label start');
        for (let param of node.parameters) {
            writeThreeAddressCode(param);
        }
        console.log('call ' + node.function + ',' + node.parameters.length);
        console.log('stop');
    }
    else
    if (node.type === 'number')
    {
        console.log('push ' + node.value);
    }
    else
    if (node.type === 'assign')
    {
        writeThreeAddressCode(node.from);
        console.log('pop ' + node.to);
    }
    else
    if (node.type === 'identifier')
    {
        console.log('push ' + node.value);  
    }
    else
    if (node.type === 'expression')
    {
        if (node.left !== undefined && node.right !== undefined)
        {
            writeThreeAddressCode (node.left);
            writeThreeAddressCode (node.right);
            if(node.operator === '+') {
                console.log('add');
            } else if (node.operator === '-') {
                console.log('sub');
            } else if (node.operator === '/') {
                console.log('div');
            } else if (node.operator === '*') {
                console.log('mul');
            }
        }
    }
    else
    if (node.type === 'function')
    {
        console.log('goto start')
        console.log('label ' + node.name);
        for (let statement of node.statements)
            writeThreeAddressCode (statement);
        console.log('return');
    }
}
 
var ast = parser.parse (str);
console.log (JSON.stringify(ast, null, 4));

writeThreeAddressCode(ast);