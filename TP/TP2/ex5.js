'use strict';

let randomArray = [];

for(let i = 0; i < 10; i++)
    randomArray.push(Math.random() * (50 - 1) + 1);

// console.log(randomArray);

let dif = randomArray[0];

for(let i = 1; i < 10; i++)
    dif-=randomArray[i];

console.log(dif);