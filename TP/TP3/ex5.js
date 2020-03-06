"use strict";

var fs = require('fs');

var fileContent = fs.readFileSync('./students1220fa.csv').toString();
var students = fileContent.split(/\r?\n/);

var regex = /[0-9]+;([A-ZÀ-ž]+)\s([A-Z\.]+\s)?([A-Za-zÀ-ž\s-]+);([0-9]+[A-Z])/;

for(let student of students)
{
    var match = regex.exec(student);
    console.log(match.splice(1, 5).join('\n'));
    console.log('--------------------');
}



