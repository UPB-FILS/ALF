"use strict";

var fs = require("fs");
var passwd = fs.readFileSync('./passwd').toString();

var lines = passwd.split('\r\n');

var regex = /^([a-z\-_]+)?:(x)?:([0-9]+)?:([0-9]+)?:([A-Za-z\s-(),]+)?:([A-Za-z\/\-0-9]+)?:([A-Za-z\/]+)?$/;
var users = [];
for(let line of lines)
{
    var match = regex.exec(line);
    console.log(match);
    let userInfo = {
        username: match[1],
        password: match[2],
        uid: match[3],
        gid: match[4],
        uid_info: match[5],
        homedir: match[6],
        shell: match[7]
    };
        users.push(userInfo);
}
console.log(users);