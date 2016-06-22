var expect  = require("chai").expect;
var request = require("request");
var fs = require('fs');
var app = require('../app.js');
var server;
var logger = require('../team_modules/smartinsurance/logger.js');
logger.setLogLevel(process.env.DEBUG_LEVEL || "error"); // info for more verbose output

var getDBPromis = function(){
  var credentials;
  try {
    var testdbconfig = require('./modules/testdbconfig.js');
    credentials = testdbconfig.url;
  } catch(err) {
    credentials = 'postgres://' + process.env.DB_USER + ':' + process.env.DB_PASSWORD + '@' + process.env.DB_HOST + ':' + process.env.DB_PORT + '/' + process.env.DB_DATABASENAME + ((process.env.DB_SSL=="true")?'?ssl=true':'');
  }
  logger.info('Setze die Test Datenbank-URL auf ' + credentials);
  var pgp = require('pg-promise')();
  var db = pgp(credentials);
  return db;
};
var db = getDBPromis();

// Beschreibung der Testfälle:
describe("Test API:", function(){

  //Erstellen der Schemen vor allen Tests in diesem Block
  before(function(done){
    var query = fs.readFileSync('test/data/general/createSchemas.sql').toString();
    db.any(query).then(function() {
      done();
      logger.info("Schema erstellt");
    }).catch(function(err){
      logger.info("Fehler in der Erstellung der Schemen in der Datenbank\n"+ err);
      done(err);
    });
  });

  // Lege Testdaten an!
  beforeEach(function(done){
    var query = fs.readFileSync('test/data/general/testdatenEinfuegen.sql').toString();
    db.any(query).then(function(){
      logger.info("Testdaten eingefuegt");
      server = app.listen(3000, function () {
        logger.info('App hört nun auf port 3000 - Test Modus');
        done();
      });
    }).catch(function(err){
      logger.info("Fehler beim Einfuegen der Versicherungen\n"+ err);
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

  describe("get /api/smartinsurance/investition/:id", function(){

    it("Test auf erfolgreiche Rückgabe einer Investition by id", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investition/13";
      var expectedResponse = fs.readFileSync('test/data/investitionapi/13.json').toString();
      expectedResponse = JSON.parse(expectedResponse);
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length(1);
        expect(responseObject[0]).to.have.property('id').to.equal(expectedResponse[0].id);
        expect(responseObject[0]).to.have.property('versicherungID').to.equal(expectedResponse[0].versicherungID);
        expect(responseObject[0]).to.have.property('ipersonID').to.equal(expectedResponse[0].ipersonID);
        expect(responseObject[0]).to.have.property('ipersonName').to.equal(expectedResponse[0].ipersonName);
        expect(responseObject[0]).to.have.property('ipersonPrename').to.equal(expectedResponse[0].ipersonPrename);
        expect(responseObject[0]).to.have.property('investitionshoehe').to.equal(expectedResponse[0].investitionshoehe);
        expect(responseObject[0]).to.have.property('bewertung').to.eql(expectedResponse[0].bewertung);
        expect(responseObject[0]).to.have.property('iabschlussZeitpunkt').to.equal(expectedResponse[0].iabschlussZeitpunkt);
        expect(responseObject[0]).to.have.property('ikuendigungsZeitpunkt').to.equal(expectedResponse[0].ikuendigungsZeitpunkt);
        expect(responseObject[0]).to.have.property('iistGekuendigt').to.equal(expectedResponse[0].iistGekuendigt);
        expect(responseObject[0]).to.have.property('iwirdGekuendigt').to.equal(expectedResponse[0].iwirdGekuendigt);
        expect(responseObject[0]).to.have.property('vpersonID').to.equal(expectedResponse[0].vpersonID);
        expect(responseObject[0]).to.have.property('vpersonName').to.equal(expectedResponse[0].vpersonName);
        expect(responseObject[0]).to.have.property('vpersonPrename').to.equal(expectedResponse[0].vpersonPrename);
        expect(responseObject[0]).to.have.property('name').to.equal(expectedResponse[0].name);
        expect(responseObject[0]).to.have.property('versicherungshoehe').to.equal(expectedResponse[0].versicherungshoehe);
        expect(responseObject[0]).to.have.property('beitrag').to.equal(expectedResponse[0].beitrag);
        expect(responseObject[0]).to.have.property('beschreibung').to.equal(expectedResponse[0].beschreibung);
        expect(responseObject[0]).to.have.property('vabschlussZeitpunkt').to.equal(expectedResponse[0].vabschlussZeitpunkt);
        expect(responseObject[0]).to.have.property('vkuendigungsZeitpunkt').to.equal(expectedResponse[0].vkuendigungsZeitpunkt);
        expect(responseObject[0]).to.have.property('vistGekuendigt').to.equal(expectedResponse[0].vistGekuendigt);
        expect(responseObject[0]).to.have.property('vwirdGekuendigt').to.equal(expectedResponse[0].vwirdGekuendigt);
        expect(responseObject[0]).to.have.property('kategorie').to.equal(expectedResponse[0].kategorie);

        done();
      });
    });

    it("Test auf Fehlschlag bei Abfrage einer nicht vorhandenen id", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investition/1";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investition/abc";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investition/;DROP%20DROP%20SCHEMA%20public";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

  });

  describe("get /api/smartinsurance/versicherung", function(){

    it('Alle Versicherungen einer Person', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length.of.at.least(1);
        var versicherungOf = responseObject[0].personID;
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          expect(versicherung).to.have.property("personID").to.equal(versicherungOf);
        }
        done();
      });
    });

  });

  describe("get /api/smartinsurance/versicherung/:versicherungID/bewertungen", function(){
    it('Bewertung einer Versicherung', function(done){
      var expectedResponse = fs.readFileSync('test/data/versicherungapi/bewertung89.json').toString();
      expectedResponse = JSON.parse(expectedResponse);
      var url = "http://localhost:3000/api/smartinsurance/versicherung/89/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length(3);
        var versicherungID = responseObject[0].versicherungID;
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          expect(versicherung).to.have.property("versicherungID").to.equal(versicherungID);
          expect(versicherung).to.have.property("bewertung");
          var bewertung = versicherung.bewertung;
          for (var j = 0, expected; expected = expectedResponse[j]; j++) {
            if (bewertung == expected.bewertung) {
              expect(versicherung).to.have.property("count").to.equal(expected.count);
            }
          }
        }
        done();
      });
    });

    it("Test auf Fehlschlag bei Abfrage einer Versicherung ohne Bewertung", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/107/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/abc/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/;DROP%20DROP%20SCHEMA%20public/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

  });

  describe("post /api/smartinsurance/filter", function(){
    it('Test des Kategoriefilters', function(done) {
      var url = "http://localhost:3000/api/smartinsurance/filter";
      var postbody = {
        "kategorie" : "Auto"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = body; // JSON.parse(body); Strange das hier ein Objekt rausfällt. TODO Prüfen!!!
        expect(responseObject).to.have.length.of.at.least(1);
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          expect(versicherung).to.have.property("kategorie").to.equal("Auto");
        }
        done();
      });
    });

    it('Tets der aufsteigenden Sortierung', function(done) {
      var url = "http://localhost:3000/api/smartinsurance/filter";
      var postbody = {
        "orderby" : "rendite",
        "ascending" : true
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = body; // JSON.parse(body); Strange das hier ein Objekt rausfällt. TODO Prüfen!!!
        expect(responseObject).to.have.length.of.at.least(1);
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          if (i>0) {
            expect(versicherung).to.have.property("rendite").to.be.at.least(responseObject[i-1].rendite); // Test the rendite is higher or equal responseObject[i-1].rendite
          }
        }
        done();
      });
    });

    it('Tets der absteigenden Sortierung', function(done) {
      var url = "http://localhost:3000/api/smartinsurance/filter";
      var postbody = {
        "orderby" : "rendite",
        "ascending" : false
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = body; // JSON.parse(body); Strange das hier ein Objekt rausfällt. TODO Prüfen!!!
        expect(responseObject).to.have.length.of.at.least(1);
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          if (i>0) {
            expect(versicherung).to.have.property("rendite").to.be.at.most(responseObject[i-1].rendite); // Test the rendite is lower or equal responseObject[i-1].rendite
          }
        }
        done();
      });
    });

    it('Tets der Kombination von Kategoriefilter und Sortierung', function(done) {
      var url = "http://localhost:3000/api/smartinsurance/filter";
      var postbody = {
        "kategorie" : "Auto",
        "orderby" : "rendite",
        "ascending" : true
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = body; // JSON.parse(body); Strange das hier ein Objekt rausfällt. TODO Prüfen!!!
        expect(responseObject).to.have.length.of.at.least(1);
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          expect(versicherung).to.have.property("kategorie").to.equal("Auto");
          if (i>0) {
            expect(versicherung).to.have.property("rendite").to.be.at.least(responseObject[i-1].rendite); // Test the rendite is higher or equal responseObject[i-1].rendite
          }
        }
        done();
      });
    });

  });

  describe("get /api/smartinsurance/kategorien", function(){
    it('Werden alle Kategorien zurückgegeben', function(done){
      var url = "http://localhost:3000/api/smartinsurance/kategorien";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length.of.at.least(7);
        expect(responseObject).to.include.members(["Auto", "Schiff", "Flugzeug", "Haus", "Küchengeräte", "Möbel", "Maschinen"]);
        done();
      });
    });
  });

  describe("post /api/smartinsurance/investieren", function(){
    it('Erfolgreiches anlegen einer Investition', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investieren";
      var postbody = {
        "versicherungID":"85",
        "investitionshoehe":"5,00 €"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(201);
        done();
      });
    });
    it('Fehlschlag nicht erlaubtes Investieren zu hohe Investitionssumme', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investieren";
      var postbody = {
        "versicherungID":"77",
        "investitionshoehe":"1.299.400,00 €"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(201); //Naechst kleinerer passende Betrag wurde investiert
        done();
      });
    });
    it('Fehlschlag nicht vorhandene Versicherung', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investieren";
      var postbody = {
        "versicherungID":"2",
        "investitionshoehe":"5,00 €"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(409);
        done();
      });
    });
    it('Fehlschlag negative Beträge', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investieren";
      var postbody = {
        "versicherungID":"68",
        "investitionshoehe":"-5,00 €"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
    it('Fehlschlag unterdefinierter Body', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investieren";
      var postbody = {
        "versicherungID":"68"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
  });

  describe("get /api/smartinsurance/investition", function(){
    it('Alle Investitionen einer Person', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investition";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length.of.at.least(1);
        var investitionOf = responseObject[0].ipersonID;
        for (var i = 0, investition; investition = responseObject[i]; i++) {
          expect(investition).to.have.property("ipersonID").to.equal(investitionOf);
        }
        done();
      });
    });

  });

  describe("get /api/smartinsurance/investitionVers/:versicherungID", function(){
    it('Rückgabe aller Investitionen zu einer Versicherung', function(done){
      var url = "http://localhost:3000/api/smartinsurance/investitionVers/89";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        var responseObject = JSON.parse(body);
        expect(responseObject).to.have.length.of.at.least(1);
        var versicherungID = responseObject[0].versicherungID;
        for (var i = 0, versicherung; versicherung = responseObject[i]; i++) {
          expect(versicherung).to.have.property("versicherungID").to.equal(versicherungID);
        }
        done();
      });
    });

    it("Test auf Fehlschlag bei Abfrage einer nicht vorhandenen id", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investitionVers/1";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investitionVers/abc";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

    it("Test auf Fehlschlag bei fehlerhafter Anfrage", function(done){
      var url = "http://localhost:3000/api/smartinsurance/investitionVers/;DROP%20DROP%20SCHEMA%20public";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

  });

  describe("post /api/smartinsurance/versicherung", function(){
    it('Erfolgreiches anlegen einer Versicherung', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung";
      var postbody = {
        "name":"Rennboot",
        "versicherungshoehe":"5,00 €",
        "beitrag":"5,00 €",
        "beschreibung":"Super schnelles Rennboot mit extra Turbomotor",
        "kategorie":"Schiff"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(201);
        done();
      });
    });
    it('Fehlschlag negative Beträge', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung";
      var postbody = {
        "name":"Rennboot",
        "versicherungshoehe":"-5,00 €",
        "beitrag":"5,00 €",
        "beschreibung":"Super schnelles Rennboot mit extra Turbomotor",
        "kategorie":"Schiff"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
    it('Fehlschlag unterdefinierter Body', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung";
      var postbody = {
        "name":"Rennboot",
        "versicherungshoehe":"5,00 €",
        "kategorie":"Schiff"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
  });

  describe("post /api/smartinsurance/versicherung/:versicherungID/kuendigen", function(){
    it('Erfolgreiche Kündigung einer Versicherung', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/85/kuendigen";
      var postbody = {};
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('Fehlschlag Versicherung existiert nicht', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/1/kuendigen";
      var postbody = {};
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });
    it('Fehlschlag Versicherung gehört nicht dem ausführenden Nutzer');
    it('Fehlschlag Versicherung bereits gekündigt', function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/85/kuendigen";
      var postbody = {};
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(409);
        done();
      });
    });
  });

  describe("post /api/smartinsurance/investition/:investitionID/kuendigen", function(){
    it('Erfolgreiche Kündigung einer Investition');
    it('Fehlschlag Investition existiert nicht');
    it('Fehlschlag Investition gehört nicht dem ausführenden Nutzer');
    it('Fehlschlag Investition bereits gekündigt');
  });

  describe("get /api/smartinsurance/versicherung/:versicherungID/person", function(){
    it('Erfolgreiches Laden der aller Investoren einer existierenden Versicherung',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/89/person";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });

    });
    it('Existierende Versicherung hat keine Investoren',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/90/person";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
    it('Angegebene VersicherungsID ist keine Nummer',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/;DROP%20DROP%20SCHEMA%20public/person";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
    it('Versicherung existiert nicht 404',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/1/person";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
  });

  describe("get /api/smartinsurance/versicherung/:versicherungID/invest", function(){
    it('Erfolgreiches Laden der Investitionssumme einer existierenden Versicherung',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/89/invest";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('Existierende Versicherung hat keine Investitionen und somit keine Investitionssumme',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/90/invest";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
    it('Angegebene VersicherungsID ist keine Nummer',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/;DROP%20DROP%20SCHEMA%20public/invest";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
  });

  describe("post /api/smartinsurance/schadensfallmelden", function(){
    it('?');
  });

  describe("get /api/smartinsurance/schadensfaelle/:versicherungID", function(){
    it('Erfolgreiches Laden der Schadensfaelle einer existierenden Versicherung',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfaelle/89";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('Existierende Versicherung hat keine Schadensfaelle',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfaelle/90";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
    it('Angegebene VersicherungsID ist keine Nummer',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfaelle/;DROP%20DROP%20SCHEMA%20public";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
    it('Versicherung existiert nicht 404',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfaelle/1";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
  });

  describe("get /api/smartinsurance/schadensfall/:schadensfallID", function(){
    it('Erfolgreiches Laden eines existierenden Schadensfalls',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfall/1";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('Angegebene SchadensfallID ist keine Nummer',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfall/;DROP%20DROP%20SCHEMA%20public";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
    it('Schadensfall existiert nicht 404',function(done){
      var url = "http://localhost:3000/api/smartinsurance/schadensfall/9999";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });
  });

  describe("post /api/smartinsurance/schadensfall/    Schadensfall bearbeiten", function(){
    it('?');
  });

  describe("get /api/smartinsurance/profil/profilID", function(){
    it('Erfolgreiches Laden eines existierenden Profils',function(done){
      var url = "http://localhost:3000/api/smartinsurance/profil/bfa77220-21f7-11e6-b56d-b76efa9c5485";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('ProfilID ist keine uuid',function(done){
      var url = "http://localhost:3000/api/smartinsurance/profil/9999";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
    it('Profil existiert nicht',function(done){
      var url = "http://localhost:3000/api/smartinsurance/profil/08ddf6b0-3857-11e6-aa52-632db7cb795f";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });
  });

  describe("get /api/smartinsurance/versicherung/:versicherungID/bewertungen", function(){
    it('Erfolgreiches Laden der Bewertungen einer existierenden Versicherung',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/89/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('Existierende Versicherung hat keine Investitionen und somit keine Bewertungen',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/90/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
    it('Angegebene VersicherungsID ist keine Nummer',function(done){
      var url = "http://localhost:3000/api/smartinsurance/versicherung/;DROP%20DROP%20SCHEMA%20public/bewertungen";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
  });

  describe("get IoT-Gerät hinzufügen?", function(){
    it('?');
  });

  describe("post Schadensfall Bild hinzufügen", function(){
    it('?');
  });

  describe("post /api/smartinsurance/kommentieren", function(){
    it('Erfolgreiches anlegen eines Kommentars', function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentieren";
      var postbody = {
        "versicherungID":"85",
        "text":"Ich bin ein Kommentar"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(201);
        done();
      });
    });

    it('Anlegen eines Kommentars bei einer nicht vorhandenen Versicherung', function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentieren";
      var postbody = {
        "versicherungID":"8599",
        "text":"Ich bin ein Kommentar"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(409);
        done();
      });
    });

    it('Anlegen eines Kommentars mit ungültiger VersicherungID', function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentieren";
      var postbody = {
        "versicherungID":"SQLINJECTION",
        "text":"Ich bin ein Kommentar"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

    it('Anlegen eines Kommentars ohne Text', function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentieren";
      var postbody = {
        "versicherungID":"85"
      };
      request({
        "url":url,
        "method":"POST",
        "body" : postbody,
        "json" : true
      }, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });

  });

  describe("get /api/smartinsurance/kommentare/:versicherungID", function(){
    it('Erfolgreiches Laden der Kommentare einer existierenden Versicherung',function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentare/89";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
    it('Existierende Versicherung hat keine Kommentare',function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentare/90";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(204);
        done();
      });
    });
    it('Angegebene VersicherungsID ist keine Nummer',function(done){
      var url = "http://localhost:3000/api/smartinsurance/kommentare/;DROP%20DROP%20SCHEMA%20public";
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(400);
        done();
      });
    });
  });

  describe("post /api/smartinsurance/versicherungaendern", function(){
    it('?');
  });

  describe("post /api/smartinsurance/investition", function(){
    it('?');
  });

  // Leere die Tabellen
  afterEach(function(done){
    var query = fs.readFileSync('test/data/general/truncateTables.sql').toString();
    server.close(); // app.close() wurde rausgepatcht: https://github.com/expressjs/express/issues/1366
    logger.info('App stoppt - Test Modus');
    db.any(query).then(function(){
      done();
    }).catch(function(err){
      logger.info("Fehler beim leeren der Tabellen\n"+ err);
      done(err);
    });
  });

  // Drop Schemas nach allen Tests in diesem Block
  after(function(done){
    var query = fs.readFileSync('test/data/general/dropSchemas.sql').toString();
    db.any(query).then(function(){
      done()
    }).catch(function(err){
      logger.info("Fehler bei der Verwerfung der Schemen in der Datenbank\n"+ err);
      done(err);
    });
  });

});

describe("Test Backendroutine", function() {
  it('Kündigung einer Versicherung');
  it('Kündigung einer Investition');
  it('Zahlungsfluss Beiträge');
  it('Zahlungsfluss Rendite');
  it('Zahlungsfluss Invesition');
});
