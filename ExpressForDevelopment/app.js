var express = require('express');
var tdg = require('tabledatagateway.js');
var logic = require('logic.js');
var app = express();

app.get('/', function (req, res) {
  res.send("Der Sever laeuft! :-)");
});

app.get('/api/versicherung', logic.getVersicherungOf)

app.get('/api/versicherung/:versicherungID', logic.getVersicherung)

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
