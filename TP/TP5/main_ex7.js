"use strict";

var parser = require ('./ex7.js').parser;
var fs = require ('fs');
let file = process.argv[2];
try {
    var statements = fs.readFileSync(file).toString();
    try {
        parser.parse(statements);
    }
    catch (e) {
        console.log(e.message);
        console.log('Unexpected token ' + e.hash.token + ', Value: ' + e.hash.text + ', Line: ' + e.hash.line + '. Expecting: ' + e.hash.expected);
    }
}
catch(e) {
    console.log(e.message)
}
