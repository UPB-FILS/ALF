'use strict';

let etudiant = {
    nom: 'Diana',
    prenom: 'Ghindaoanu'
};

function convert()
{
    let resultArray = Object.keys(etudiant).map(function (key) {
        return [key, etudiant[key]];
    });
    console.log(resultArray);
}

convert();