"use strict";

var fs = require('fs');

var fileContent = fs.readFileSync('./students1220fa.csv').toString();

// Point a
var students = fileContent.split(/\r?\n/);
console.log(students);

// Point b
for(let student of students)
{
    var parts = student.split(';');
    var index = parts[0];
    var fullName = parts[1];
    var group = parts[parts.length - 1];
    var lastName = fullName.split(' ')[0];
    var firstName = '';
    if(fullName.split(' ')[2]) // Check if a student doesn't have initials
        firstName = fullName.split(' ')[2];
    else
        firstName = fullName.split(' ')[1];
    console.log('Etudiant no. ' + index);
    console.log('Prenom: ' + firstName);
    console.log('Nom: ' + lastName);
    console.log('Groupe: ' + group);
    console.log('------------------------');
}
