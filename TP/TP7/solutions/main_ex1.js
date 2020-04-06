"use strict";

var parser = require ('./ex1.js').parser;
var fs = require ('fs');

try {
    var data = fs.readFileSync('../script.alf').toString();
    console.log(JSON.stringify(parser.parse (data), null, 2));
}
catch (e) {
    console.log (e.message);
}