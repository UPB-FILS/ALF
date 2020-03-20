"use strict";

var parser = require ('./ex3.js').parser;
 
try {
    parser.parse('2+3+a+b+c;');
}
catch (e) {
    console.log(e.message);
}