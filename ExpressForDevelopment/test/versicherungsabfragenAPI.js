var expect  = require("chai").expect;
var request = require("request");
var testdbconfig = require('./modules/testdbconfig.js');
var fs = require('fs');
var app = require('../app.js');

var getDBPromis = function(){
  var credentials = testdbconfig.url;
  var pgp = require('pg-promise')();
  var db = pgp(credentials);
  return db;
}
var db = getDBPromis();

// Beschreibung der Testfälle:

describe("Versicherung abfragen", function(){

  //Erstellen der Schemen vor allen Tests in diesem Block
  before(function(done){
    var query = fs.readFileSync('test/data/general/createSchemas.sql').toString();
    db.any(query).then(function(){done(); console.log("Schema erstellt");}).catch(function(err){console.log("Fehler in der Erstellung der Schemen in der Datenbank\n"+ err)});
  });

  // Lege Testdaten an!
  beforeEach(function(done){
    var query = fs.readFileSync('test/data/versicherungenEinfuegen.sql').toString();
    db.any(query).then(function(){
      console.log("Testdaten eingefuegt");
      app.listen(3000);
      logger.consoleInfo('App hört auf port 3000 - Test Modus');
      done();
    }).catch(function(err){console.log("Fehler beim Einfuegen der Versicherungen\n"+ err);});

  });

  // Leere die Tabellen
  afterEach(function(done){
    var query = fs.readFileSync('test/data/general/truncateTables.sql').toString();
    app.close();
    logger.consoleInfo('App stoppt - Test Modus');
    db.any(query).then(function(){done()}).catch(function(err){console.log("Fehler beim leeren der Tabellen\n"+ err);});
  });

  // Drop Schemas nach allen Tests in diesem Block
  after(function(done){
    var query = fs.readFileSync('test/data/general/dropSchemas.sql').toString();
    db.any(query).then(function(){done()}).catch(function(err){console.log("Fehler bei der Verwerfung der Schemen in der Datenbank\n"+ err);});
  });

  var url = "http://localhost:3000/api/smartinsurance/versicherung/1";

  it("returns versicherung 1", function(done){
    var expectedResponse = fs.readFileSync('test/data/testcase1/1.json').toString();
    expectedResponse = JSON.parse(expectedResponse);
    request(url, function(error, response, body) {
      expect(response.statusCode).to.equal(200);
      expect(JSON.parse(body)).to.deep.equal(expectedResponse);
      done();
    });
  });

})
