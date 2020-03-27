"use strict";

var parser = require ('./ex3.js').parser;
var fs = require ('fs');
try {
   fs.writeFileSync('output.json', JSON.stringify(parser.parse ('var a, b; a=2+45;'), null, 2));
}
catch (e) {
   console.log (e.message);
   console.log(e.hash);
}