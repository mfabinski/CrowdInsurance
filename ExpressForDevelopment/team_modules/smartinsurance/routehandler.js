var express = require('express');

module.exports = function() {
//    var backendHelper = require("smartbackendHelper")(passport);
//    var oauth = backendHelper.oauthModel;

    var router = express.Router();
    var tdg = require('./tabledatagateway.js');
    var ts = require('./transactionscript.js');
    var logger = require('./logger.js');
    var validate = require('./validator.js');

  router.get('/versicherung/', ts.getVersicherungOf);

  router.get('/versicherung/:versicherungID', [validate.versicherungID, ts.getVersicherung]);

  router.get('/versicherung/:versicherungID/bewertungen', [validate.versicherungID, ts.getBewertungen]);

  router.post('/filter', ts.filterVersicherung);

  router.get('/kategorien', ts.getKategorien);

  router.post('/investieren', [validate.parameterZurInvestitionsErstellung, validate.obVersicherungGekuendigtIstOderWird, validate.obVersicherungSchonVollIst, ts.erstelleInvestition]);

  router.get('/investition', ts.getInvestitionOf);

  router.get('/investitionVers/:versicherungID', [validate.versicherungID, ts.listOfInvestitionen]);

  router.get('/investition/:investitionID', [validate.investitionID, ts.getInvestition]);

  router.get('/versicherung/:versicherungID/person', [validate.versicherungID, ts.getInvestorenVonVersicherung]);

  router.get('/versicherung/:versicherungID/invest', [validate.versicherungID, ts.calculateSumOfInvestVersicherung]);

  router.get('/schadensfall/:schadensfallID', [validate.schadensfallID, ts.getSchadensfallByID]);

  router.get('/profil/', ts.getProfilByID); // Für das eigene (vorläufig). Sollte auch die eigene haben!

  router.get('/profil/:profilID', [validate.profilID, ts.getProfilByID]);

  router.get('/schadensfaelle/:versicherungID', [validate.versicherungID, ts.getSchadensfaelleByVersicherung]);

  router.post('/schadensfallmelden', [validate.parameterSchadensfall, ts.erstelleSchadensfall]);

  router.post('/schadensfall', [validate.parameterSchadensfallAendern, ts.updateSchadensfall]);

  router.post('/versicherungaendern', [validate.obKategorieExistiert, validate.parameterVersicherungAendern, ts.updateVersicherung]);

  router.post('/investition', [validate.parameterInvestitionAendern, ts.updateInvestition]);

  router.post('/versicherung', [validate.parameterZurVersicherungsErstellung, validate.obKategorieExistiert, ts.erstelleVersicherung]);

  router.post('/versicherung/:versicherungID/kuendigen', [validate.versicherungID, validate.obVersicherungGekuendigtIstOderWird, ts.versicherungKuendigungEinreichen]);

  router.post('/investition/:investitionID/kuendigen', [validate.investitionID, ts.investitionKuendigungEinreichen]);

  router.post('/kommentieren', [validate.parameterKommentar, ts.erstelleKommentar]);

  router.get('/kommentare/:versicherungID', [validate.versicherungID, ts.getKommentareByVID]);

  router.put('/investition/:investitionID/bewertung', [validate.investitionID, ts.bewertungAbgeben]);

  // Nur fuer Testzwecke
  router.get('/periodic', ts.periodicSchedule);

  router.get('/zahlungsrelevant', ts.getPaymentrelevantInvestitions);
  router.get('/', helloWorld);
  router.get('/test', helloWorld);
  router.get('/test/', helloWorld);

  function helloWorld(req, res) {
    res.send(JSON.stringify({success: true, text: "Hello World"}));
  }
  return router;
}
