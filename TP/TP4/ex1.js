"use strict";

var movies = [
  'The Shawshank Redemption,1994,9.2',
  'Titanic,1997,7.8',
  'Pulp Fiction,1994,8.9',
  'The Revenant,2015,8.0'
];

for(let movie of movies)
{
    let movieNameRegex = /[A-Za-z\s]+/;
    let yearRegex = /[0-9]+/;
    let noteRegex = /[1-9]\.[0-9]/;
    let matchName = movieNameRegex.exec(movie);
    let matchYear = yearRegex.exec(movie);
    let matchNote = noteRegex.exec(movie);
    console.log("Titre: " + matchName[0]);
    console.log("Annee: " + matchYear[0]);
    console.log("NoteIMDb: " + matchNote);
    console.log("---------------------");
}