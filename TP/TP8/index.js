"use strict";

var parser = require ('./alf.js').parser;
var fs = require ('fs');

try {
    var data = fs.readFileSync('ex1.txt').toString();
    fs.writeFileSync('./output.json', JSON.stringify(parser.parse (data), null, 3));
}
catch (e) {
    console.log (e.message);
}