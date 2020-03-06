"use strict";

var fs = require('fs');
var java_errors = fs.readFileSync('./java_errors').toString();
var lines = java_errors.split(/\r?\n/);
var errors = [];
var errorNr = 0;
var notesNr = 0;
for(let line of lines)
{
    let errorObject = {};
    if(line.indexOf('error') >= 0)
    {
        errorNr++;
        errorObject.type = 'error';
        let lineNr = line.split(':')[1];
        errorObject.line = lineNr;
        let fileName = line.split(':')[0];
        errorObject.filename = fileName;
        let description = line.split(':')[2];
        errorObject.description = description;

        errors.push(errorObject);
    }
    if(line.indexOf('Note') >= 0)
    {
        notesNr++;
        errorObject.type = 'note';
        let description = line.split(':')[1];
        errorObject.description = description;

        errors.push(errorObject);
    }
}

console.log("Nombre d'erreurs: " + errorNr);
console.log('Nombre de notes: ' + notesNr);

fs.writeFileSync('./errors', JSON.stringify(errors, null, 2), 'utf8');