"use strict";

var parser = require ('./ex2.js').parser;
var fs = require ('fs');
try {
   fs.writeFileSync('output.json', JSON.stringify(parser.parse ('var a, b; 2+3*a; 2+b;'), null, 2));
}
catch (e) {
   console.log (e.message);
   console.log(e.hash);
}