"use strict";

var parser = require ('./ex9.js').parser;
try {
    parser.parse('int a <- 2 + 3 * 5;');
}
catch (e) {
    console.log(e.message);
    console.log('Unexpected token ' + e.hash.token + ', Value: ' + e.hash.text + ', Line: ' + e.hash.line + '. Expecting: ' + e.hash.expected);
}

