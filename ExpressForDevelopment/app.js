var express = require('express');
var database = require('database.js');
var app = express();

app.get('/', function (req, res) {
  database.gib(function(result){
    res.send(result);
  })
});

app.get('/sf', function(req, res, next){database.getSchadensfaelle(req, res, next);})

app.get('/versicherungen', function(req, res, next){database.getVersicherungen(req, res, next);})


app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
