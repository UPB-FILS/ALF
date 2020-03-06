"use strict";

var fs = require('fs');

var fileContent = fs.readFileSync('./students1220fa.csv').toString();
var students = fileContent.split('\r\n');

var regex = /[0-9]+;([A-ZÀ-ž]+)\s([A-Z\.]+\s)?([A-Za-zÀ-ž\s-]+);([0-9]+[A-Z])/;

var studentsArray = [];
for(let student of students)
{
    var match = regex.exec(student);
    match = match.splice(1, 5);
    var studentObject = {};
    if(match[0])
        studentObject.lastName = match[0];
        
    if(match[2])
        studentObject.firstName = match[2];
        
    if(match[3])
        studentObject.groupe = match[3];
    
    studentsArray.push(studentObject);
}
console.log(studentsArray);



