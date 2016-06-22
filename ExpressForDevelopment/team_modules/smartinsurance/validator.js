var tdg = require('./tabledatagateway.js');
var logger = require('./logger.js');
var internal = {};

internal.isNumber = function(value){
    value = value + '';
    var regex = /^[1-9][0-9]*$/;
    if(value.match(regex)){
        return true;
    } else{
        return false;
    }
};

internal.isMoney = function(value){
    var regex = /^(([1-9][0-9]?[0-9]?)([.][0-9]{3})*|[0]),[0-9]{2}\s€$/;
    if(value.match(regex)){
        return true;
    } else{
        return false;
    }
};

internal.moneyToNumber = function(money){
    money = money + '';
    money = money.substring(0,money.length-2);
    var euros = money.split(/,/)[0].split(/[.]/);
    var cents = money.split(/,/)[1];
    var number = 0;
    for(var i=0; i<euros.length; i++){
        number += parseInt(euros[i]) * Math.pow(1000, (euros.length - i - 1));
    }
    number += parseInt(cents) / 100;
    return number;
};

internal.numberToMoney = function(number){
    number = number + '';
    var euros = number.split(/[.]/)[0];
    var money = '';
    if ( number.split(/[.]/)[1] != undefined ){
        money = number.split(/[.]/)[1];
    }
    money = ',' + money + ' €';
    var thousands = euros.length % 3;
    while(euros.length > 3){
        money = '.' + euros.substring(euros.length - 3) + money;
        euros = euros.substring(0,euros.length - 3);
    }
    money = euros + money;
    return money;
};

exports.versicherungID = function(req,res,next){
    var versicherungID = req.params.versicherungID;
    //Prüfe ob die ID eine Nummer ist
    if(internal.isNumber(versicherungID)){
        next();
    } else{
        res.status(400).send('Fehlerhafte Anfrage: Versicherungs ID ist keine Zahl');
    }
};

exports.investitionID = function(req,res,next){
    var investitionID = req.params.investitionID;
    //Prüfe ob die ID eine Nummer ist
    if(internal.isNumber(investitionID)){
        next();
    } else{
        res.status(400).send('Fehlerhafte Anfrage: Investitions ID ist keine Zahl');
    }
};

exports.schadensfallID = function(req,res,next){
    var schadensfallID = req.params.schadensfallID;
    //Prüfe ob die ID eine Nummer ist
    if(internal.isNumber(schadensfallID)){
        next();
    } else{
        res.status(400).send('Fehlerhafte Anfrage: Schadensfall ID ist keine Zahl');
    }
};

exports.profilID = function(req,res,next){
    var profilID = req.params.profilID;
    //Prüfe ob die ID eine Nummer ist
    if(profilID.match(/^([a-z]|[0-9]){8}-([a-z]|[0-9]){4}-([a-z]|[0-9]){4}-([a-z]|[0-9]){4}-([a-z]|[0-9]){12}$/)){
        next();
    } else{
        res.status(400).send('Fehlerhafte Anfrage: Schadensfall ID ist keine UUID');
    }
};

exports.parameterSchadensfall = function(req,res,next){
    var versicherungID = req.body.versicherungID;
    var schadenshoehe = req.body.schadenshoehe;
    var bezeichnung = req.body.bezeichnung;
    if(req.body.beschreibung == undefined) {
        req.body.beschreibung = '';
    }
    if(versicherungID == undefined || schadenshoehe == undefined || bezeichnung == undefined){
        res.status(400).send("Kann versicherungID und/oder schadenshoehe und/oder bezeichnung nicht angegeben.");
        return;
    }

    if(internal.isNumber(versicherungID) && internal.isMoney(schadenshoehe)){
        next();
    } else{
        logger.error('Bad Request: ' + versicherungID + " - " + schadenshoehe);
        res.status(400).send('Bad Request: ' + versicherungID + " - " + schadenshoehe);
    }
};

exports.parameterSchadensfallAendern = function(req,res,next){
    var schadensfallID = req.body.schadensfallID;
    var schadenshoehe = req.body.schadenshoehe;
    var bezeichnung = req.body.bezeichnung;
    if(req.body.beschreibung == undefined) {
        req.body.beschreibung = '';
    }
    if(schadensfallID == undefined || schadenshoehe == undefined || bezeichnung == undefined || !internal.isNumber(schadensfallID)){
        res.status(400).send("schadensfallID und/oder schadenshoehe und/oder bezeichnung sind nicht korrekt angegeben.");
        return;
    }

    if(internal.isMoney(schadenshoehe)){
        next();
    } else{
        logger.error('Bad Request: ' + schadensfallID + " - " + schadenshoehe);
        res.status(400).send('Bad Request: ' + schadensfallID + " - " + schadenshoehe);
    }
};

exports.parameterVersicherungAendern = function(req,res,next){
    var versicherungID = req.body.versicherungID;
    var name = req.body.name;
    var beschreibung = req.body.beschreibung;
    if(beschreibung == undefined){
        beschreibung = '';
    }

    if(name != undefined && versicherungID != undefined && name.length > 0 && internal.isNumber(versicherungID)) {
        next();
    } else{
        res.status(400).send('Bad Request: ' + name + " - " + beschreibung + " - " + versicherungID);
    }
};

exports.parameterInvestitionAendern = function(req,res,next){
    var investitionID = req.body.investitionID;
    var investitionshoehe = req.body.investitionshoehe;

    if(investitionID != undefined && investitionshoehe != undefined && internal.isNumber(investitionID) && internal.isMoney(investitionshoehe)){
        next();
    } else{
        res.status(400).send('Bad Request: ' + investitionID + " - " + investitionshoehe);
    }
};

exports.parameterZurInvestitionsErstellung = function(req,res,next){
    var versicherungID = req.body.versicherungID;
    var investitionshoehe = req.body.investitionshoehe;

    if(versicherungID != undefined && investitionshoehe != undefined && internal.isNumber(versicherungID) && internal.isMoney(investitionshoehe)){
        next();
    } else{
        res.status(400).send('Bad Request: ' + versicherungID + " - " + investitionshoehe);
    }
};

exports.parameterZurVersicherungsErstellung = function(req,res,next){
    var name = req.body.name;
    var versicherungshoehe = req.body.versicherungshoehe;
    var beitrag = req.body.beitrag;
    var beschreibung = req.body.beschreibung;
    if(beschreibung  != undefined){
      beschreibung = '';
    }

    if(name != undefined && versicherungshoehe != undefined && beitrag != undefined && name.length > 0 && internal.isMoney(versicherungshoehe) && internal.isMoney(beitrag)) {
        next();
    } else{
        res.status(400).send('Bad Request: ' + name + " - " + versicherungshoehe + " - " + beitrag + " - " + beschreibung);
    }
};

exports.parameterKommentar = function(req,res,next){
    var versicherungID = req.body.versicherungID;
    var text = req.body.text;

    if(text != undefined && versicherungID != undefined && text.length > 0 && internal.isNumber(versicherungID)) {
      tdg.selectVersicherung(versicherungID,
          function(data){
              if(data[0].id != null){
                  next();
              } else{
                  res.status(409).send('Angegebene Versicherung existiert nicht.');
              }
          },
          function(err){
              logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' zum Zweck der Validierung - ' + err);
              res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Versicherung existiert.');
          }
      );
    } else{
        res.status(400).send('Bad Request: ' + versicherungID + " - " + text);
    }
};

exports.obKategorieExistiert = function(req,res,next){ //Not YET READY!!!
    var kategorie = req.body.kategorie;
    tdg.selectKategorien(
        function(data){
            // logger.consoleInfo("Abfrage der Kategorien: " + JSON.stringify(data));
            data = data[0].getkategorien;
            data = data.substring(1,data.length-1);
            listOfKategorien = data.split(/,/);
            // logger.consoleInfo("Alle Kategorien: " + listOfKategorien);
            if(listOfKategorien.indexOf(kategorie) != -1){
                next();
            } else{
                res.status(404).send('Angegebene Kategorie existiert nicht in der Datenbank.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' zum Zweck der Validierung - ' + err);
            res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Versicherung bereits gekuendigt ist oder wird.');
        }
    );
};

exports.obVersicherungExistiert = function(req,res,next){
  var versicherungID = req.body.versicherungID;
  if (versicherungID == undefined){
    versicherungID = req.params.versicherungID;
  }
  tdg.selectVersicherung(versicherungID,
      function(data){
          //logger.consoleInfo('VersicherungID: ' + versicherungID + '    Data: ' + JSON.stringify(data));
          if(data[0].id != null){
              next();
          } else{
              res.status(404).send('Angegebene Versicherung existiert nicht.');
          }
      },
      function(err){
          logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' zum Zweck der Validierung - ' + err);
          res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Versicherung existiert.');
      }
  );
}

exports.obVersicherungGekuendigtIstOderWird = function(req,res,next){
    var versicherungID = req.body.versicherungID;
    if (versicherungID == undefined){
      versicherungID = req.params.versicherungID;
    }
    tdg.selectVersicherung(versicherungID,
        function(data){
            //logger.consoleInfo('VersicherungID: ' + versicherungID + '    Data: ' + JSON.stringify(data));
            if(data[0].istGekuendigt == false && data[0].wirdGekuendigt == false){
                req.body.versicherungshoehe = data[0].versicherungshoehe;
                next();
            } else{
                res.status(409).send('Angegebene Versicherung ist oder wird Gekuendigt und somit kann nicht mehr in sie investiert werden.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' zum Zweck der Validierung - ' + err);
            res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Versicherung bereits gekuendigt ist oder wird.');
        }
    );
};

exports.obVersicherungSchonVollIst = function(req,res,next){
    var versicherungID = req.body.versicherungID;
    var versicherungshoehe = internal.moneyToNumber(req.body.versicherungshoehe); //Wird in obVersicherungGekuendigtIstOderWird zugewiesen

    tdg.selectInvestitionsSumVonVersicherung(versicherungID,
        function(data){
            var diff = versicherungshoehe - internal.moneyToNumber(data[0].getinvestitionssummebyvid);
            var investitionshoehe = internal.moneyToNumber(req.body.investitionshoehe);
            if(diff >= investitionshoehe){
                next();
            } else if(diff > 0 && diff < investitionshoehe) {
                // Investiere maximal wenn es nicht reicht
                req.body.investitionshoehe = internal.numberToMoney(diff);
                next();
            } else if(diff == 0){
                res.status(409).send('Angegebene Versicherung ist voll investiert.');
            } else{
                logger.error('Es wurde mehr investiert als die Versicherung vorsieht.');
                res.status(500).send('Err: Es wurde mehr investiert als die Versicherung vorsieht.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Versicherung ' + versicherungID + ' zum Zweck der Validierung - ' + err);
            res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Versicherung bereits gekuendigt ist oder wird.');
        }
    );
};

exports.obInvestitionExistiert = function(req,res,next){
  var investitionID = req.body.investitionID;
  if (investitionID == undefined){
    investitionID = req.params.investitionID;
  }
  tdg.selectInvestition(investitionID,
      function(data){
          //logger.consoleInfo('InvestitionID: ' + investitionID + '    Data: ' + JSON.stringify(data));
          if(data[0].id != null){
              next();
          } else{
              res.status(404).send('Angegebene Investition existiert nicht.');
          }
      },
      function(err){
          logger.error('Fehler beim Laden der Investition ' + investitionID + ' zum Zweck der Validierung - ' + err);
          res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Investition existiert.');
      }
  );
}

exports.obInvestitionGekuendigtIstOderWird = function(req,res,next){
    var investitionID = req.body.investitionID;
    if (investitionID == undefined){
      investitionID = req.params.investitionID;
    }
    tdg.selectInvestition(investitionID,
        function(data){
            //logger.consoleInfo('InvestitionID: ' + investitionID + '    Data: ' + JSON.stringify(data));
            if(data[0].iistGekuendigt == false && data[0].iwirdGekuendigt == false){
                next();
            } else{
                res.status(409).send('Angegebene Investition ist oder wird Gekuendigt.');
            }
        },
        function(err){
            logger.error('Fehler beim Laden der Investition ' + investitionID + ' zum Zweck der Validierung - ' + err);
            res.status(500).send('Es konnte nicht festgestellt werden ob die angegebene Investition bereits gekuendigt ist oder wird.');
        }
    );
};

exports.obUserExistiert = function(req,res,next){
  var personID = req.body.personID;
  if (personID == undefined){
    personID = req.params.personID;
  }
  tdg.getProfilByID(personID,
      function(data){
          //logger.consoleInfo('VersicherungID: ' + versicherungID + '    Data: ' + JSON.stringify(data));
          if(data[0].id != null){
              next();
          } else{
              res.status(404).send('Angegebener User/Person existiert nicht.');
          }
      },
      function(err){
          logger.error('Fehler beim Laden der User/Person ' + personID + ' zum Zweck der Validierung - ' + err);
          res.status(500).send('Es konnte nicht festgestellt werden ob der angegebene User/Person existiert.');
      }
  );
}

exports.parameterProfilAendern = function(req,res,next){
  logger.consoleInfo("validate.parameterProfilAendern noch nicht implementiert");
  var personID = req.body.personID;
  var name = req.body.name;
  var prename = req.body.prename;
  var email = req.body.email;
  var iban = req.body.iban;
  var bic = req.body.bic;
  var bankinstitut = req.body.bankinstitut;
  if(personID == undefined || name == undefined || prename == undefined || email == undefined || iban == undefined || bic == undefined || bankinstitut == undefined){
    res.status(400).send('Die Anfrage ist unterdefiniert (Es fehlen Felder).')
  }
  else{
    next();
  }
}
