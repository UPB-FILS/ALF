"use strict";

var parser = require ('./ex2.js').parser;
var fs = require ('fs');

try {
    var data = fs.readFileSync('../ex2.txt').toString();
    console.log(JSON.stringify(parser.parse (data), null, 2));
}
catch (e) {
    console.log (e.message);
}