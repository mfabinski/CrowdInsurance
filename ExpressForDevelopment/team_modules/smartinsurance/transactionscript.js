var tdg = require('./tabledatagateway.js');
var q = require('q');
var logger = require('./logger.js');
var periodNumber = 0;
// var personID = "bfa73b02-21f7-11e6-b56d-6ffe69564a95";
var internal = {};

// Datenbankabfragen angestoßen durch den Client
//==============================================
// Daten laden
//-------------
// Lade alle Versicherungen der Person, die die Anfrage stellt
exports.getVersicherungOf = function (req, res, next) {
    logger.info('Versicherungen der Person ' + req.user.id + ' laden.');
    tdg.selectVersicherungOf(req.user.id,
        function(data){
            logger.info('Versicherungen der Person ' + req.user.id + 'erfolgreich geladen.');
            res.status(200).json(data);
        },
        function(err){
            logger.error('Fehler beim Laden der Versicherungen der Person ' + req.user.id + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Versicherungen.');
        }
    );
};

// Lade alle Felder einer Versicherungs nach der Versicherungs ID
exports.getVersicherung = function (req, res, next) {
    var versicherungID = req.params.versicherungID;

    tdg.selectVersicherung(versicherungID,
        function(data){
            logger.info('Versicherung ' + versicherungID + 'erfolgreich geladen.');
            if(data[0].id != null) {
                res.status(200).json(data);
            } else{
                res.status(404).send('Versicherung mit ID ' + versicherungID + ' wurde nicht gefunden.')
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Versicherung.');
        }
    );
};

exports.getBewertungen = function (req, res, next) {
    var versicherungID = req.params.versicherungID;

    tdg.selectBewertungen(versicherungID,
        function(data){
            logger.info('Bewertungen der Versicherung ' + versicherungID + 'erfolgreich geladen.');
            if(data.length != 0) {

                var return_data = [{"versicherungID":0,"bewertung":"keine","count":"0"},{"versicherungID":0,"bewertung":"daumenHoch","count":"0"},{"versicherungID":0,"bewertung":"daumenRunter","count":"0"}];
                for (var i=0; i<data.length ; i++){
                    if(data[i].bewertung == "daumenHoch"){
                        return_data[1] = data[i];}
                    else if (data[i].bewertung == "daumenRunter"){
                        return_data[2] = data[i];
                    }
                    else if(data[i].bewertung =="keine"){
                        return_data[0] = data[i];
                    }
                }
                res.status(200).json(return_data);
            } else{
                logger.info('Bewertungen der Versicherung ' + versicherungID + ' wurde nicht gefunden. Das heißt die Versicherung existiert nicht oder hat keine Investitionen.');
                res.status(204).json(data); // 204 no content
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Versicherung.');
        }
    );
};

// Filtern und sortieren der Versicherungen
exports.filterVersicherung = function (req, res, next) {
    var withFilter = true;
    var kategorie = req.body.kategorie;
    var orderby = req.body.orderby;
    if (orderby == undefined) orderby = "id";
    var asc_desc = req.body.ascending;
    if (asc_desc == undefined) asc_desc = true;
    var limit = 0;
    if (req.body.entrycount) {
      limit = req.body.entrycount
    }
    var skip = 0;
    if (req.body.page) {
      skip = req.body.page * entrycount;
    }
    // var orderbyindex = 1;

    // Mit oder ohne where Bedingung?
    if (kategorie == undefined) {
        withFilter = false;
    }

    // Bestimmen des Indexes der Spalte für die Sortierung
    // switch (orderby) {
    //   case "id": orderbyindex = 1; break;
    //   case "name": orderbyindex = 2; break;
    //   case "versicherungshoehe": orderbyindex = 3; break;
    //   case "beitrag": orderbyindex = 4; break;
    //   case "beschreibung": orderbyindex = 5; break;
    //   case "abschlussZeitpunkt": orderbyindex = 6; break;
    //   case "kuendigungsZeitpunkt": orderbyindex = 7; break;
    //   case "istGekuendigt": orderbyindex = 8; break;
    //   case "wirdGekuendigt": orderbyindex = 9; break;
    //   case "req.user.id": orderbyindex = 10; break;
    //   case "kategorie": orderbyindex = 11; break;
    //   case "anzahl_investoren": orderbyindex = 12; break;
    //   case "bewertung": orderbyindex = 13; break;
    //   case "rendite" : orderbyindex = 14; break;
    //   default: orderbyindex = 1; logger.consoleInfo('Cannot sort by '+orderby+' using id instead'); break;
    // }

    if (withFilter) {
        tdg.filterVersicherung(kategorie, orderby, asc_desc, limit, skip,
            function(data){
                logger.info('Filter Kategorie auf ' + kategorie + ' Sortierunger nach ' + orderby + ' ' + (asc_desc==="ascending")?'austeigend.':'absteigend.');
                if(data.length != 0) {
                    res.status(200).json(data);
                } else{
                    res.status(404).send('Filter Kategorie auf '  + kategorie + ' Sortierunger nach ' + orderby + ' ' + (asc_desc==="ascending")?'austeigend.':'absteigend fehlgeschlagen.')
                }
            },
            function(err){
                logger.info('Fehler beim Filtern'+ ' - ' + err);
                res.status(500).send('Fehler beim Filtern');
            }
        );
    } else {
        tdg.orderVersicherung(orderby, asc_desc, limit, skip,
            function(data){
                logger.info('Sortierunger nach ' + orderby + ' ' + (asc_desc==="ascending")?'austeigend.':'absteigend.');
                if(data.length != 0) {
                    res.status(200).json(data);
                } else{
                    res.status(404).send('Sortierunger nach ' + orderby + ' ' + (asc_desc==="ascending")?'austeigend.':'absteigend fehlgeschlagen.')
                }
            },
            function(err){
                logger.info('Fehler beim Sortieren'+ ' - ' + err);
                res.status(500).send('Fehler beim Sortieren');
            }
        );
    }
};

// Lade alle Kategorien
exports.getKategorien = function (req, res, next) {
    tdg.selectKategorien(
        function(data){
            logger.info('Kategorien erfolgreich geladen.');
            data = data[0].getkategorien;
            logger.info("Data: "+ data);
            data = data.substring(1,data.length-1);
            listOfKategorien = data.split(/,/);
            res.status(200).json(listOfKategorien);
        },
        function(err){
            logger.error('Fehler beim Laden der Kategorien - ' + err);
            res.status(500).send('Fehler beim Laden der Kategorien');
        }
    );
};

// Lade alle Investitionen der Person, die die Anfrage stellt
exports.getInvestitionOf = function (req, res, next) {
    tdg.selectInvestitionOf(req.user.id,
        function(data){
            logger.info('Investitionen der Person ' + req.user.id + 'erfolgreich geladen.');
            res.status(200).json(data);
        },
        function(err){
            logger.error('Fehler beim Laden der Investitionen der Person ' + req.user.id + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Investitionen.');
        }
    );
};

// Lade alle Investitionen einer Versicherung nach der Versicherungs ID
exports.listOfInvestitionen = function (req, res, next) {
    var versicherungID = req.params.versicherungID;
    tdg.selectInvestitionen(versicherungID,
        function(data){
            logger.info('Investitionen der Versicherung ' + versicherungID + 'erfolgreich geladen.');
            if(data.length != 0){
                res.status(200).json(data);
            } else{
                res.status(404).send('Keine Investitionen und/oder die Versicherung existiert nicht.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Investitionen der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Investitionen.');
        }
    );
};

// Lade alle Felder einer Investition nach der Investitions ID
exports.getInvestition = function (req, res, next) {
    var investitionID = req.params.investitionID;
    tdg.selectInvestition(investitionID,
        function(data){
            logger.info('Investition ' + investitionID + 'erfolgreich geladen.');
            if(data[0].id != null) {
                res.status(200).json(data);
            } else{
                res.status(404).send('Investition nicht gefunden.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Investition ' + investitionID + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Investition.');
        }
    );
};

exports.getSchadensfallByID = function (req, res, next) {
    var schadensfallID = req.params.schadensfallID;
    tdg.getSchadensfallByID(schadensfallID,
        function(data){
            logger.info('Schadensfall mit der ID ' + schadensfallID + 'erfolgreich geladen.');
            if(data[0].id != null){
                res.status(200).json(data);
            } else{
                res.status(404).send('Schadensfall nicht gefunden.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden des Schadensfalls mit der ID ' + schadensfallID + ' - ' + err);
            res.status(500).send('Fehler beim Laden des Schadensfalls.');
        }
    );
};

exports.getSchadensfaelleByVersicherung = function (req, res, next) {
    var versicherungID = req.params.versicherungID;
    tdg.getSchadensfaelleByVersicherung(versicherungID,
        function(data){
            logger.info('Schadensfaelle der Versicherung ' + versicherungID + 'erfolgreich geladen.');
            if(data.length != 0){
                res.status(200).json(data);
            } else{
                res.status(204).json(data); // 204 no content
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Schadensfaelle der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Schadensfaelle.');
        }
    );
};

// TODO: Beliebige Person ID und nicht nur die eigene
exports.getProfilByID = function (req, res, next) {
    var pID = req.params.profilID;
    if(pID == undefined){
        pID = req.user.id;
    }
    if (pID == req.user.id) {
      tdg.getProfilByID(pID,
          function(data){
              logger.info('Eigenes Profil der Person ' + pID + 'erfolgreich geladen.');
              if(data[0].id != null){
                  res.status(200).json(data);
              } else{
                  res.status(404).send('Profil nicht gefunden.');
              }
          },
          function(err){
              logger.error('Fehler beim Laden des eigenen Profils der Person ' + pID + ' - ' + err);
              res.status(500).send('Fehler beim Laden des Profils.');
          }
      );
    } else {
      tdg.getPublicProfilByID(pID,
          function(data){
              logger.info('Profil der Person ' + pID + 'erfolgreich geladen.');
              if(data[0].id != null){
                  res.status(200).json(data);
              } else{
                  res.status(404).send('Profil nicht gefunden.');
              }
          },
          function(err){
              logger.error('Fehler beim Laden des Profils der Person ' + pID + ' - ' + err);
              res.status(500).send('Fehler beim Laden des Profils.');
          }
      );
    }
};
};

exports.changeProfil = function(req, res, next){
  var personID = req.body.personID;
  var name = req.body.name;
  var prename = req.body.prename;
  var email = req.body.email;
  var iban = req.body.iban;
  var bic = req.body.bic;
  var bankinstitut = req.body.bankinstitut;
  var birthday = req.body.birthday;
  tdg.changeProfil(personID, name, prename, email, iban, bic, bankinstitut, birthday,
      function(data){
          logger.info('Profil der Person ' + personID + 'erfolgreich geaendert.');
          res.status(201).send('Erfolgreich geandert');
      },
      function(err){
          logger.error('Fehler beim Aendern des Profils der Person ' + pID + ' - ' + err);
          res.status(500).send('Fehler beim Laden des Profils.');
      }
  );

}

exports.getKommentareByVID = function (req, res, next) {
    var versicherungID = req.params.versicherungID;
    tdg.getKommentareByVID(versicherungID,
        function(data){
            logger.info('Kommentare der Versicherung ' + versicherungID + 'erfolgreich geladen.');
            if(data.length != 0){
                res.status(200).json(data);
            } else{
                logger.info('Keine Kommentare zu dieser Versicherung ' + versicherungID + ' gefunden.');
                res.status(204).json(data); // 204 no content
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Kommentare der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Laden des Profils.');
        }
    );
};


// Lade alle PersonenIDs einer Versicherung
exports.getInvestorenVonVersicherung = function (req, res, next) {
    var versicherungID = req.params.versicherungID;
    tdg.selectInvestorenVonVersicherung(versicherungID,
        function(data){
            logger.info('Investoren von Versicherung ' + versicherungID + ' erfolgreich geladen.');
            if (data.length == 0) {
                res.status(204).json(data); // Trifft auch zu wenn die Verischerung nicht existiert
            } else
            if (data[0].versicherungID != null) {
                res.status(200).json(data);
            } else{
                res.status(404).send('Versicherung nicht gefunden.'); // Wird nicht zutreffen (es sei denn die Datenbank ist nicht erreichbar)
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Investoren der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Laden der Personen.');
        }
    );
};

// Summiere alle aktuellen (=nicht gekuendigten) Investitionshoehen einer Versicherung
exports.calculateSumOfInvestVersicherung = function (req, res, next) {
    var versicherungID = req.params.versicherungID;
    tdg.selectInvestitionsSumVonVersicherung(versicherungID,
        function(data){
            logger.info('Kalkulieren der Investitionssumme der Versicherung ' + versicherungID + ' erfolgreich durchgeführt.');
            data[0] = {"suminvestition":data[0].getinvestitionssummebyvid};
            if(data[0].suminvestition != '0,00 €') {
                res.status(200).json(data);
            } else{
                res.status(204).json(data); // no investition
            }
        },
        function(err){
            logger.error('Fehler beim Kalkulieren der Investitionssumme der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Kalkulieren der Investitionssumme.');
        }
    );
};

//
// Erstellen / Anlegen von Versicherung und Investition
//-----------------------------------------------------
// Investition erstellen
exports.erstelleInvestition = function (req, res, next) {
    var versicherungID = req.body.versicherungID;
    var investitionshoehe = req.body.investitionshoehe;

    tdg.erstelleInvestition(versicherungID, req.user.id, investitionshoehe,
        function(data){
            res.status(201).json(data);
        },
        function(err){
            logger.error('Fehler beim Erstellen einer Investition für die Versicherung ' + versicherungID + ' mit einem Betrag von ' + betrag + ' - ' + err);
            res.status(500).send('Fehler beim Erstellen der Investition.');
        }
    );
};

// Versicherung erstellen
exports.erstelleVersicherung = function (req, res, next) {
    var name = req.body.name;
    var versicherungshoehe = req.body.versicherungshoehe;
    var beitrag = req.body.beitrag;
    var beschreibung = req.body.beschreibung;
    if(beschreibung == undefined){
        beschreibung = '';
    }
    var kategorie = req.body.kategorie;

    // logger.consoleInfo(name + " " + versicherungshoehe + " " + beitrag + " " + beschreibung + " " + kategorie);

    tdg.erstelleVersicherung(req.user.id, name, versicherungshoehe, beitrag, beschreibung, kategorie, //abschlussZeitpunkt,
        function(data){
            logger.info('Versicherung mit dem Namen ' + name + ', der Versicherungshöhe ' + versicherungshoehe
                + ' und mit einem Beitrag von ' + beitrag + ' erfolgreich erstellt.');
            res.status(201).json(data);
        },
        function(err){
            logger.error('Fehler beim Erstellen der Versicherung mit dem Namen ' + name + ', der Versicherungshöhe ' + versicherungshoehe
                + ' und mit einem Beitrag von ' + beitrag + ' - ' + err);
            res.status(500).send('Fehler beim Erstellen der Versicherung.');
        }
    );
};

exports.erstelleSchadensfall = function (req, res, next) {
    var versicherungID = req.body.versicherungID;
    var bezeichnung = req.body.bezeichnung;
    var beschreibung = req.body.beschreibung;
    var schadenshoehe = req.body.schadenshoehe;

    tdg.erstelleSchadensfall(versicherungID, bezeichnung, beschreibung, schadenshoehe,
        function(data){
            logger.info('Schadensfall für die Versicherung ' + versicherungID + ' mit einer Schadenshoehe von ' + schadenshoehe + ' erfolgreich erstellt.');
            res.status(201).json(data);
        },
        function(err){
            logger.error('Fehler beim Erstellen eines Schadensfalls für die Versicherung ' + versicherungID + ' mit einer Schadenshoehe von ' + schadenshoehe + ' - ' + err);
            res.status(500).send('Fehler beim Erstellen der Investition.');
        }
    );
};

exports.updateSchadensfall = function (req, res, next) {
    var schadensfallID = req.body.schadensfallID;
    var bezeichnung = req.body.bezeichnung;
    var beschreibung = req.body.beschreibung;
    var schadenshoehe = req.body.schadenshoehe;

    tdg.updateSchadensfall(schadensfallID, bezeichnung, beschreibung, schadenshoehe,
        function(){
            logger.info('Schadensfall ' + schadensfallID + ' mit einer Schadenshoehe von ' + schadenshoehe + ' erfolgreich geaendert.');
            res.status(200).send("Schadensfall erfolgreich geaendert.");
        },
        function(err){
            logger.error('Fehler beim Aendern des Schadensfalls ' + schadensfallID + ' mit einer Schadenshoehe von ' + schadenshoehe + ' - ' + err);
            res.status(500).send('Fehler beim Aendern des Schadensfalls.');
        }
    );
};

exports.updateVersicherung = function (req, res, next) {
    var versicherungID = req.body.versicherungID;
    var name = req.body.name;
    var beschreibung = req.body.beschreibung;
    var kategorie = req.body.kategorie;

    tdg.updateVersicherung(versicherungID, name, beschreibung, kategorie,
        function(){
            logger.info('Versicherung ' + versicherungID + ' erfolgreich geaendert.');
            res.status(200).send("Versicherung erfolgreich geaendert.");
        },
        function(err){
            logger.error('Fehler beim Aendern der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Aendern der Versicherung.');
        }
    );
};

exports.updateInvestition = function (req, res, next) {
    var investitionID = req.body.investitionID;
    var investitionshoehe = req.body.investitionshoehe;

    tdg.updateInvestition(investitionID, investitionshoehe,
        function(){
            logger.info('Investition ' + investitionID + ' erfolgreich geaendert.');
            res.status(200).send("Investition erfolgreich geaendert.");
        },
        function(err){
            logger.error('Fehler beim Aendern der Investition ' + investitionID + ' - ' + err);
            res.status(500).send('Fehler beim Aendern der Investition.');
        }
    );
};

exports.erstelleKommentar = function (req, res, next) {
    var versicherungID = req.body.versicherungID;
    var text = req.body.text;

    tdg.erstelleKommentar(versicherungID, text, req.user.id,
        function(data){
            tdg.getKommentarByKID(data[0].createkommentar,
                function(data2){
                    logger.info("Kommentar ID is " + data[0].createkommentar + "; Kommentar is " + JSON.stringify(data2));
                    res.status(201).json(data2);
                },
                function(err2){
                    logger.error('Fehler beim Laden des erstellten Kommentars.');
                    res.status(500).send('Fehler beim Lesen des erstellten Kommentars.');
                }
            );
        },
        function(err){
            logger.error('Fehler beim Erstellen eines Kommentars für die Versicherung ' + versicherungID + ' mit dem Text ' + text + ' - ' + err);
            res.status(500).send('Fehler beim Erstellen des Kommentars.');
        }
    );
};

//
// Kuendigung einreichen
//-----------------------------
// Kuendigung einer Versicherung einreichen (zzgl. der Einreichung der Kuendigung fue dazugehoerige Investitionen)
exports.versicherungKuendigungEinreichen = function (req, res, next) {
    var versicherungID = req.params.versicherungID;
    tdg.versicherungKuendigungEinreichen(versicherungID,
        function(data){
            logger.info('Kündigung der Versicherung ' + versicherungID + ' erfolgreich eingereicht.');
            res.status(200).json('Kündigung der Versicherung erfolgreich eingereicht.');
        },
        function(err){
            logger.error('Fehler beim Einreichen der Kündigung der Versicherung ' + versicherungID + ' - ' + err);
            res.status(500).send('Fehler beim Einreichen der Kündigung der Versicherung.');
        }
    );
};

// Kuendigung einer Investition einreichen
exports.investitionKuendigungEinreichen = function (req, res, next) {
    var investitionID = req.params.investitionID;
    tdg.investitionKuendigungEinreichen(investitionID,
        function(data){
            logger.info('Kündigung der Investition ' + investitionID + ' erfolgreich eingereicht.');
            res.status(200).json('Kündigung der Investition erfolgreich eingereicht.');
        },
        function(err){
            logger.error('Fehler beim Einreichen der Kündigung der Investition ' + investitionID + ' - ' + err);
            res.status(500).send('Fehler beim Einreichen der Kündigung der Investition.');
        }
    );
};

//
// Abhandlung der Perioden
//===============================
/*
 Die periodische Verarbeitung steuert die Zahlungsstroeme
 - Auszahlen der Schadenshoehe zum Ende des Kuendigungszeitraums verarbeiten
 - Kuendigungen von Versicherungen und Investitionen zum Ende des Kuendigungszeitraums verarbeiten
 - Einziehen der Versicherungsbeitraege
 - Auszahlung der Rendite
 */
exports.periodicSchedule = function (req,res,next) {
    logger.consoleInfo('Berechne Periode ' + periodNumber);
    q.fcall(function(){return new q.Promise(exports.auszahlungSchadensfaelle)})
        .then(function(){return new q.Promise(exports.versicherungKuendigungenVerarbeiten)})
        .then(function(){return new q.Promise(exports.investitionKuendigungenVerarbeiten)})
        .then(function(){return new q.Promise(exports.einziehenVersicherungsbeitraege)})
        .then(function(){return new q.Promise(exports.auszahlungRendite)})
        .then(function(){return new q.Promise(function(){
            if(res != undefined){
                periodNumber += 1;
                res.status(200).send('Periode erfolgreich berechnet.');
            }
        })})
        .catch(function (err){
            logger.error('Es ist ein Fehler im periodicSchedule aufgetreten: ' + err);
            if(res != undefined){
                res.status(500).send('Periode aufgrund eines Fehlers nicht berechnet.');
            }
        })
        .done();
};

exports.auszahlungSchadensfaelle = function(resolve, reject, notify) {
    q.fcall(function(){return new q.Promise(internal.verringerungInvestitionshoehen)}) // Für alle Einträge aus "SchadensfallAbzugDerInvestition" s
        .then(function(){return new q.Promise(internal.auszahlungSchadenshoehe)}) // Für alle Einträge aus "SchadensfallVersicherung" s:
        .then(function(){return new q.Promise(internal.finalizeSchadensfall)}) // Für alle Schadensfälle mit istAusgezahlt = false
        .then(function(){
            logger.info('Auszahlung der Schadensfälle ist durch gegangen.');
            resolve();
        })
        .catch(function (err){
            logger.error('Es ist ein Fehler bei der Auszahlung der Schadensfälle aufgetreten: ' + err);
            reject();
        })
};

internal.verringerungInvestitionshoehen = function(resolve, reject, notify){
    tdg.reduceInvestitionenWegenSchaden(
        function(){
            logger.info('Erfolgreich die Schäden von den Investitionen abgezogen.');
            resolve();
        },
        function(){
            logger.error('Fehler beim Abziehen der Schäden von den Investitionen.');
            reject();
        }
    );
};

internal.auszahlungSchadenshoehe = function(resolve, reject, notify){
    tdg.paySchadensfaelle(
        function(){
            logger.info('Erfolgreich das Schadenshoehen ausgezahlt.');
            resolve();
        },
        function(){
            logger.error('Fehler beim Auszahlen der Schadenshoehen.');
            reject();
        }
    );
};

internal.finalizeSchadensfall = function(resolve, reject, notify){
    tdg.finalizeSchadensfall(
        function(){
            logger.info('Erfolgreich das istAusgezahlt-Flag gesetzt.');
            resolve();
        },
        function(){
            logger.error('Fehler beim setzten des istAusgezahlt-Flags.');
            reject();
        }
    );
};

exports.versicherungKuendigungenVerarbeiten = function(resolve, reject, notify) {
    // Für alle Versicherungen die wirdGekuendigt = true haben:
    // Setze istGekuendigt = true
    tdg.updateVersicherungGekuendigt(
        function(data){
            //log versicherungsskuendigungen erfolgreich abgeschlossen
            resolve();
        },
        function(err){
            logger.error('Es ist ein Fehler bei der Kündiungsroutine der Versicherungen aufgetreten - ' + err);
            reject();
            //log fehler bei verischerung kuendigen
        }
    );
};

exports.investitionKuendigungenVerarbeiten = function(resolve, reject, notify) {
    // Für alle Invesitionen die wirdGekuendigt = true haben:
    // Zahlung von der Versicherung an den Investor
    // Setze istGekuendigt = true
    tdg.investitionKuendigen(
        function(data){
            //log investitionskuendigungen erfolgreich abgeschlossen
            resolve();
        },
        function(err){
            logger.error('Es ist ein Fehler bei der Kündiungsroutine der Investitionen aufgetreten - ' + err);
            reject();
        }
    );
};

exports.bewertungAbgeben = function(req, res, next) {

    var thumb = req.body.bewertung;
    var investitionID = req.params.investitionID;
    if (thumb =='up'){
        tdg.setinvestitionbewertung(investitionID, "daumenHoch", function(data){
                res.status(200).json(data);
            },
            function (err){
                logger.error('Fehler beim Upvoten der Investition ' + investitionID + ' - ' + err);
                res.status(500).send('Fehler beim Upvoten.');
            }
        )
    }
    else if (thumb=='down'){
        tdg.setinvestitionbewertung(investitionID, "daumenRunter", function(data){
                res.status(200).json(data);
            },
            function (err){
                logger.error('Fehler beim Downvoten der Investition ' + investitionID + ' - ' + err);
                res.status(500).send('Fehler beim Downvoten der Investition ' + investitionID);
            }
        )
    }
};


exports.einziehenVersicherungsbeitraege = function(resolve, reject, notify) {
    // Laufende Versicherungen laden
    // Fuer jede Versicherung bestimmen, wie hoch die Investitionssumme ist und den Beitrag bestimmen
    tdg.selectActiveVersicherungAndCalculateBeitrag(
        function(data) {
            // Die Zahlungen ausfuehren
            internal.beitragEinziehen(data);
            resolve();
        },
        function(err) {
            logger.error('Es ist ein Fehler beim Einziehen der Versicherungsbeiträge aufgetreten - ' + err);
            reject();
        }
    );
};

internal.beitragEinziehen = function(data) {
    for (var i = 0, versicherung; versicherung = data[i]; i++) {
        logger.info('Einzug eines Beitrags ' + JSON.stringify(versicherung));
        tdg.insertZahlung(versicherung.id,versicherung.personID, versicherung.echterBeitrag);
    }
};

exports.auszahlungRendite = function(resolve, reject, notify) {
    tdg.getPaymentrelevantInvestitions(
        function(data) {
            internal.renditeAuszahlen(data);
            resolve();
        },
        function(err) {
            logger.error('Es ist ein Fehler beim Einziehen der Versicherungsbeiträge aufgetreten - ' + err);
        }
    );
};

internal.renditeAuszahlen = function(data) {
    for (var i = 0, investition; investition = data[i]; i++) {
        logger.info('Auszahlung einer Rendite ' + JSON.stringify(investition));
        tdg.insertZahlung(investition.id,investition.personID, "-" + investition.rendite);
    }
};

exports.getPaymentrelevantInvestitions = function(req,res,next){
    tdg.getPaymentrelevantInvestitions(
        function(data){
            res.json(data);
        },
        function(){
            res.send('fail');
        }
    );
};
