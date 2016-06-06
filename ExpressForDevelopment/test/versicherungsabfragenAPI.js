var expect  = require("chai").expect;
var request = require("request");
var fs = require('fs');
var app = require('../app.js');
var server;
var logger = require('logger.js');

var getDBPromis = function(){
  var credentials;
  try {
    var testdbconfig = require('./modules/testdbconfig.js');
    credentials = testdbconfig.url;
  } catch(err) {
    credentials = 'postgres://' + process.env.DB_USER + ':' + process.env.DB_PASSWORD + '@' + process.env.DB_HOST + ':' + process.env.DB_PORT + '/' + process.env.DB_DATABASENAME + ((process.env.DB_SSL=="true")?'?ssl=true':'');
  }
  logger.consoleInfo('Setze die Test Datenbank-URL auf ' + credentials);
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
    db.any(query).then(function(){done(); logger.consoleInfo("Schema erstellt");}).catch(function(err){logger.consoleInfo("Fehler in der Erstellung der Schemen in der Datenbank\n"+ err)});
  });

  // Lege Testdaten an!
  beforeEach(function(done){
    var query = fs.readFileSync('test/data/general/testdatenEinfuegen.sql').toString();
    db.any(query).then(function(){
      logger.consoleInfo("Testdaten eingefuegt");
      server = app.listen(3000, function () {
        logger.consoleInfo('App hört nun auf port 3000 - Test Modus');
        done();
      });
    }).catch(function(err){logger.consoleInfo("Fehler beim Einfuegen der Versicherungen\n"+ err);});

  });

  // Leere die Tabellen
  afterEach(function(done){
    var query = fs.readFileSync('test/data/general/truncateTables.sql').toString();
    server.close(); // app.close() wurde rausgepatcht: https://github.com/expressjs/express/issues/1366
    logger.consoleInfo('App stoppt - Test Modus');
    db.any(query).then(function(){done()}).catch(function(err){logger.consoleInfo("Fehler beim leeren der Tabellen\n"+ err);});
  });

  // Drop Schemas nach allen Tests in diesem Block
  after(function(done){
    var query = fs.readFileSync('test/data/general/dropSchemas.sql').toString();
    db.any(query).then(function(){done()}).catch(function(err){logger.consoleInfo("Fehler bei der Verwerfung der Schemen in der Datenbank\n"+ err);});
  });

  var url = "http://localhost:3000/api/smartinsurance/versicherung/114";

  it("Test Rückgabe Versicherung by id", function(done){
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

  it("Test Fehlschlag Versicherung by id", function(done){
    request(url, function(error, response, body) {
      expect(response.statusCode).to.equal(404);
      var responseObject = JSON.parse(body);
      done();
    });
  });

})
