'use strict';

let string = 'cod';
let substrings = [];
for(let i = 0; i < string.length; i++) {
    for(let j = 1; j <= string.length - i; j++) {
        substrings.push(string.substr(i, j));
    }
}

console.log(substrings);