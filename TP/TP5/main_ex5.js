"use strict";

var parser = require ('./ex4.js').parser;
 
try {
    parser.parse(' (2 + 3) * "a";');
}
catch (e) {
    console.log(e.message);
    console.log('Unexpected token ' + e.hash.token + ', Value: ' + e.hash.text + ', Line: ' + e.hash.line + '. Expecting: ' + e.hash.expected);
}