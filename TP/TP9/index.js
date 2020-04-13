"use strict";
 
// import fs for reading 
var fs = require ('fs');
 
// import the generated Parser
var parser = require ('./alf.js').parser;
 
var str = fs.readFileSync (process.argv[2], 'UTF-8');
 
var variable_id = 0;

 
// get a new temporary variable
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
        /**TODO:
         * generate the three address code for each parameter of the node.parameters array
         * write on the screen the three address code for each parameter
         * node.result will be nextVar()
         * write on the screen the three address code for function call
         */
    }
    else
    if (node.type === 'number')
    {
        // the result for a number is the number itself
        node.result = node.value;
    }
    else
    if (node.type === 'assign')
    {
        /** TODO: 
         * generate the three address code for node.from
         * write on the screen the three address code for assign */
    }
    else
    if (node.type === 'identifier')
    {
        /*TODO: the result is the value of the identifier */
    }
    else
    if (node.type === 'expression')
    {
        if (node.left !== undefined && node.right !== undefined)
        {
            writeThreeAddressCode (node.left);
            writeThreeAddressCode (node.right);

            // node.left.result is the result of node.left
            // node.right.result is the result of node.right
            
            /** TODO: 
             * node.result will be nextVar()
             * write on the screen the three address code based on result, left result, right result and operator*/
        }
    }
}
 
var ast = parser.parse (str);
console.log (JSON.stringify(ast, null, 4));

writeThreeAddressCode(ast);
 
