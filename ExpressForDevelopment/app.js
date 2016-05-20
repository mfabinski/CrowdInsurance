var express = require('express');
var database = require('database.js');
var app = express();

app.get('/', function (req, res) {
  database.gib(function(result){
    res.send(result);
  })
});

app.get('/sf', database.getSchadensfaelle)

app.get('/versicherungen', database.getVersicherungen)

app.get('/versicherung', database.getVersicherung)

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
