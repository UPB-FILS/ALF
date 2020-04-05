"use strict";

var parser = require ('./ex3.js').parser;
var fs = require ('fs');

try {
    var data = fs.readFileSync('../ex3.txt').toString();
    console.log(JSON.stringify(parser.parse (data), null, 4));
}
catch (e) {
    console.log (e.message);
}