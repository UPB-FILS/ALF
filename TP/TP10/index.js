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
        /** TODO 7: 
         * Print on the screen label start
         * Write the three address code for each parameter 
         * Print on the screen the function call
         * Print stop
        */
    }
    else
    if (node.type === 'number')
    {
        /** TODO 4: node.value has to be pushed to the stack. 
         * This operation will be printed on the screen, without actually pushing the value to a stack*/
    }
    else
    if (node.type === 'assign')
    {
       /** TODO 6: write the three address code for node.from
        * node.to has to be popped from the stack
        * This operation will only be printed on the screen, without actually popping the value from a stack
        */
    }
    else
    if (node.type === 'identifier')
    {
        /** TODO 4: node.value has to be pushed to the stack 
         * This operation will only be printed on the screen, without actually pushing the value to a stack
        */
    }
    else
    if (node.type === 'expression')
    {
        if (node.left !== undefined && node.right !== undefined)
        {
            writeThreeAddressCode (node.left);
            writeThreeAddressCode (node.right);

            /** TODO 4: Print the operation name according to node.operator value */
        }
    }
    else
    if (node.type === 'function')
    {
         /** TODO 8:
          * Print goto start
          * Print the label name
          * Write the three address code for each statement of the function
          * Print return
         */
    }
}
 
var ast = parser.parse (str);
console.log (JSON.stringify(ast, null, 4));

writeThreeAddressCode(ast);
 
