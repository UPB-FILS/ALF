"use strict";

var str = '17;ŞOLOT E.C. Mihaela - Sara;1220FA';

// Point a
console.log('Position prenom: ' + str.indexOf('Mihaela - Sara'));

// Point b
console.log('Derniere position: ' + str.lastIndexOf(';'));


//Point c
var strComponents = str.split(';');
var name = strComponents[1].split(' ');

console.log('Traitement du nom: ');
for(let namePart of name)
{
    if(namePart !== '-')
    {
        console.log(namePart);
    }
}

console.log('Groupe: ' + strComponents[2]);