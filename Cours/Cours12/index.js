let fs = require ('fs');

// function file_read (error, data)
// {
//     if (error) throw error;
//     console.log (data);
// }

// let data = fs.readFileSync ('text.txt', 'ascii');
// console.log (data);


try {
    fs.readFile ('text.', 'ascii', function (error, data) {
        if (error) throw error;
        console.log (data);
    });
}
catch (e)
{
    console.log ('exception');
}

console.log ('read file sent');


// while (true) {}
