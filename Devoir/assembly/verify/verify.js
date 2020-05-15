"use strict";

let _ = require ('lodash');

let originalFile = process.argv[2];
let verifyFile = process.argv[3];

let originalTree;
let verifyTree;

// console.log (process.argv);

try
{
	originalTree = require ('./'+originalFile);
}
catch (e)
{
	console.error ('Cannot load original tree from '+originalFile);
	process.exit (-1);
}

try
{
	verifyTree = require ('./'+verifyFile);
}
catch (e)
{
	console.error ('Cannot load tree from '+verifyFile);
	process.exit (-1);
}


if (_.isEqualWith (originalTree, verifyTree))
{
	
}
else
{
	// console.log ('Variables are allocated differently');
	process.exit (-1);
}
