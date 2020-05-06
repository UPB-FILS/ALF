let net = require ('net');

let server = net.createServer ();

let id = 0;

server.on ('connection', function (socket)
{
    id = id + 1;
    let socket_id = id;
    console.log ('connection received '+socket_id);
    socket.on ('data', function (data) {
        console.log ('data '+socket_id+': '+data.toString ());
    });

    socket.on ('error', function ()
    {
        console.log ('connection error, closed '+socket_id);
    });

    socket.on ('end', function ()
    {
        console.log ('connection closed '+socket_id);
    });
});

server.listen (8000);