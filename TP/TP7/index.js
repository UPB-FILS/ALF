"use strict";

var parser = require ('./alf.js').parser;
var fs = require ('fs');

try {
    var data = fs.readFileSync('./script.alf').toString();
    fs.writeFileSync('./output.json', JSON.stringify(parser.parse (data), null, 2));
}
catch (e) {
    console.log (e.message);
}