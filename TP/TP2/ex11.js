'use strict';

var etudiants = [
    { nom: 'Ion', prenom: 'Mihai', points_credit: 35},
    { nom: 'Popescu', prenom: 'Stefan', points_credit: 120},
    { nom: 'Dumitru', prenom: 'Ana-Maria', points_credit: 200},
    { nom: 'Vasile', prenom: 'Anca', points_credit: 170},
    { nom: 'Stanescu', prenom: 'George', points_credit: 100}
];

function sortArray (property) {
    etudiants = etudiants.sort (function (a, b) {
        let propA = a[property];
        let propB = b[property];
        if (propA < propB) {
            return -1;
        }
        if (propA > propB) {
            return 1;
        }
        return 0;
    });
    return etudiants;
}
console.log(sortArray('points_credit'));