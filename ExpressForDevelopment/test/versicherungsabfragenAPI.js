var expect  = require("chai").expect;
var request = require("request");
var fs = require('fs');
var app = require('../app.js');
var server;
var logger = require('logger.js');
var verbose = false;

var getDBPromis = function(){
  var credentials;
  try {
    var testdbconfig = require('./modules/testdbconfig.js');
    credentials = testdbconfig.url;
  } catch(err) {
    credentials = 'postgres://' + process.env.DB_USER + ':' + process.env.DB_PASSWORD + '@' + process.env.DB_HOST + ':' + process.env.DB_PORT + '/' + process.env.DB_DATABASENAME + ((process.env.DB_SSL=="true")?'?ssl=true':'');
  }
  if (verbose) logger.consoleInfo('Setze die Test Datenbank-URL auf ' + credentials);
  var pgp = require('pg-promise')();
  var db = pgp(credentials);
  return db;
}
var db = getDBPromis();

// Beschreibung der Testfälle:
describe("Test API:", function(){

  //Erstellen der Schemen vor allen Tests in diesem Block
  before(function(done){
    var query = fs.readFileSync('test/data/general/createSchemas.sql').toString();
    db.any(query).then(function() {
      done();
      if (verbose) logger.consoleInfo("Schema erstellt");
    }).catch(function(err){
      if (verbose) logger.consoleInfo("Fehler in der Erstellung der Schemen in der Datenbank\n"+ err);
      done(err);
    });
  });

  // Lege Testdaten an!
  beforeEach(function(done){
    var query = fs.readFileSync('test/data/general/testdatenEinfuegen.sql').toString();
    db.any(query).then(function(){
      if (verbose) logger.consoleInfo("Testdaten eingefuegt");
      server = app.listen(3000, function () {
        if (verbose) logger.consoleInfo('App hört nun auf port 3000 - Test Modus');
        done();
      });
    }).catch(function(err){
      if (verbose) logger.consoleInfo("Fehler beim Einfuegen der Versicherungen\n"+ err);
      done(err);
    });
  });

  describe("get /api/smartinsurance/versicherung/:id", function(){

    it("Test auf erfolgreiche Rückgabe einer Versicherung by id", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/114";
      var expectedResponse = fs.readFileSync('test/data/versicherungapi/114.json').toString();
      expectedResponse = JSON.parse(expectedResponse);
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length(1);
        expect(responseObject[0]).to.have.property('id').to.equal(expectedResponse[0].id);
        expect(responseObject[0]).to.have.property('beitrag').to.equal(expectedResponse[0].beitrag);
        expect(responseObject[0]).to.have.property('istGekuendigt').to.equal(expectedResponse[0].istGekuendigt);
        expect(responseObject[0]).to.have.property('personID').to.equal(expectedResponse[0].personID);
        expect(responseObject[0]).to.have.property('name').to.equal(expectedResponse[0].name);
        expect(responseObject[0]).to.have.property('versicherungshoehe').to.equal(expectedResponse[0].versicherungshoehe);
        expect(responseObject[0]).to.have.property('beschreibung').to.equal(expectedResponse[0].beschreibung);
        expect(responseObject[0]).to.have.property('abschlussZeitpunkt').to.equal(expectedResponse[0].abschlussZeitpunkt);
        expect(responseObject[0]).to.have.property('kuendigungsZeitpunkt').to.equal(expectedResponse[0].kuendigungsZeitpunkt);
        expect(responseObject[0]).to.have.property('wirdGekuendigt').to.equal(expectedResponse[0].wirdGekuendigt);
        expect(responseObject[0]).to.have.property('kategorie').to.equal(expectedResponse[0].kategorie);
        expect(responseObject[0]).to.have.property('personName').to.equal(expectedResponse[0].personName);
        expect(responseObject[0]).to.have.property('personPrename').to.equal(expectedResponse[0].personPrename);
        done();
      });
    });

    it("Test auf Fehlschlag bei Abfrage einer nicht vorhandenen id", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/10";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/abc";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/;DROP%20DROP%20SCHEMA%20public";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

  });

  // Leere die Tabellen
  afterEach(function(done){
    var query = fs.readFileSync('test/data/general/truncateTables.sql').toString();
    server.close(); // app.close() wurde rausgepatcht: https://github.com/expressjs/express/issues/1366
    if (verbose) logger.consoleInfo('App stoppt - Test Modus');
    db.any(query).then(function(){
      done();
    }).catch(function(err){
      if (verbose) logger.consoleInfo("Fehler beim leeren der Tabellen\n"+ err);
      done(err);
    });
  });

  // Drop Schemas nach allen Tests in diesem Block
  after(function(done){
    var query = fs.readFileSync('test/data/general/dropSchemas.sql').toString();
    db.any(query).then(function(){
      done()
    }).catch(function(err){
      if (verbose) logger.consoleInfo("Fehler bei der Verwerfung der Schemen in der Datenbank\n"+ err);
      done(err);
    });
  });

});
