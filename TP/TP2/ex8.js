'use strict';

function checkProperty (obj, propertyName) {
    let properties = Object.keys(obj);
    if(properties.indexOf(propertyName) >= 0) {
        return true;
    }
    return false;
}

let etudiant = {
    nom: 'Diana',
    prenom: 'Ghindaoanu'
};

console.log(checkProperty(etudiant, 'nom'));
console.log(checkProperty(etudiant, 'adresse'));
