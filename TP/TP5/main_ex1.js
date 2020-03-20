"use strict";

var parser = require ('./ex1.js').parser;
 
try {
    parser.parse(' string c <- "alf"; ');
}
catch (e) {
    console.log(e.message);
}