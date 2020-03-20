"use strict";

var parser = require ('./ex2.js').parser;
 
try {
    parser.parse(' 2+3*4; ');
}
catch (e) {
    console.log(e.message);
}