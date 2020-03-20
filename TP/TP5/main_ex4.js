"use strict";

var parser = require ('./ex4.js').parser;
 
try {
    parser.parse(' (2 + 3) * 5;');
}
catch (e) {
    console.log(e.message);
}