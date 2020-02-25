'use strict';

let etudiant = {
    nom: process.argv[2],
    prenom: process.argv[3],
    points_credit: process.argv[4]
}

// Point a)
console.log('Point a)');
console.log(etudiant);


// Point b)
console.log('Point b)');
console.log(etudiant.nom + ' ' + etudiant.prenom + ' ' + etudiant.points_credit);


// Point c)
console.log('Point c)');
let etudiants = [];
etudiants.push(etudiant);

let etudiant2 = {
    nom: process.argv[5],
    prenom: process.argv[6],
    points_credit: process.argv[7]
}
etudiants.push(etudiant2);

let etudiant3 = {
    nom: process.argv[8],
    prenom: process.argv[9],
    points_credit: process.argv[10]
}
etudiants.push(etudiant3);

let etudiant4 = {
    nom: process.argv[11],
    prenom: process.argv[12],
    points_credit: process.argv[13]
}
etudiants.push(etudiant4);

let etudiant5 = {
    nom: process.argv[14],
    prenom: process.argv[15],
    points_credit: process.argv[16]
}
etudiants.push(etudiant5);


// Point d)
console.log('Point d)');
let maximum = 0;
let points_credit = [];
for(let et of etudiants)
    points_credit.push(et.points_credit);

console.log(Math.max(...points_credit));


// Point e)
console.log('Point e)');
let etudiantsNr = etudiants.length;
let product = 1;
for(let et of etudiants)
    product *= et.points_credit;

console.log(Math.pow(product, 1/etudiantsNr));

// Point f)
console.log('Point f)');
let longueurNomEtudiants = [];
for(let et of etudiants)
    longueurNomEtudiants.push(et.nom.length);

let nomMax = Math.max(...longueurNomEtudiants);
for(let et of etudiants)
    if(et.nom.length === nomMax)
        console.log(et);

// Point g)
console.log('Point g)');
console.log(etudiants.sort( function (a, b) {
    let nameA = a.nom.toUpperCase();
    let nameB = b.nom.toUpperCase();
    if (nameA < nameB) {
        return -1;
    }
    if (nameA > nameB) {
        return 1;
    }
    return 0;
}));