"use strict";

var parser = require ('./ex4.js').parser;
var fs = require ('fs');
try {
   fs.writeFileSync('./output.json', JSON.stringify(parser.parse ('a=4; function(a, 2+3);'), null, 2));
}
catch (e) {
   console.log (e.message);
   console.log(e.hash);
}