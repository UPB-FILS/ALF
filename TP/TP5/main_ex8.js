"use strict";

var parser = require ('./ex8.js').parser;
try {
    parser.parse('true && !false || false; boolean b <- true;');
}
catch (e) {
    console.log(e.message);
    console.log('Unexpected token ' + e.hash.token + ', Value: ' + e.hash.text + ', Line: ' + e.hash.line + '. Expecting: ' + e.hash.expected);
}

