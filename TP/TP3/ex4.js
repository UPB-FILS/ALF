"use strict";

var fs = require("fs");
var passwd = fs.readFileSync('./passwd').toString();

var lines = passwd.split(/\r?\n/);
var users = [];
for(let line of lines)
{
    let parts = line.split(':');
    let userInfo = {
        username: parts[0],
        password: parts[1],
        uid: parts[2],
        gid: parts[3],
        uid_info: parts[4],
        homedir: parts[5],
        shell: parts[6]
    };
    users.push(userInfo);
}
console.log(users);