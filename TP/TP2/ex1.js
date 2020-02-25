"use strict";

let number_array = [10, 20, 30];

// a
console.log('Point a) ');
console.log(number_array);

// b
console.log('Point b) ');
for(let i = 0; i < number_array.length; i++)
console.log(number_array[i] + ' ');

// c
console.log('Point c) ');
for(let number of number_array)
console.log(number + ' ');

// d
console.log('Point d) ');
for(let i in number_array)
console.log(number_array[i] + ' ');