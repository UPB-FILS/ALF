'use strict';

function circonference ( diametre )
{
    // return Math.PI * diametre;
    let c = Math.PI * diametre;
    console.log(parseInt(c, 10));
}
function surface ( diametre )
{
    // return Math.PI * Math.pow(diametre, 2) / 4;
    let s = Math.PI * Math.pow(diametre, 2) / 4;
    console.log(parseInt(s, 10));
}

circonference(3);
surface(3);