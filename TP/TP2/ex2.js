'use strict';

// a
console.log('Point a) ');
console.log('Liste des arguments: ' + process.argv);

// b
console.log('Point b) ');
console.log('Nombre d\'arguments: ' + process.argv.length);

// c 
console.log('Point c) ');
for(let arg of process.argv)
console.log(arg);
