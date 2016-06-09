var express = require('express');
var tdg = require('tabledatagateway.js');
var ts = require('transactionscript.js');
var bodyParser = require('body-parser');
var schedule = require('node-schedule');
var logger = require('logger.js');
var validate = require('validator.js');

logger.clearLogFiles();

var app = module.exports = express();
app.use( bodyParser.json() );

app.use(express.static('../SmartInsurance/www/'));

app.all('*', function(req, res, next) {
    // add details of what is allowed in HTTP request headers to the response headers
    res.header('Access-Control-Allow-Origin', req.headers.origin);
    res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
    res.header('Access-Control-Allow-Credentials', false);
    res.header('Access-Control-Max-Age', '86400');
    res.header('Access-Control-Allow-Headers', 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept');
    // the next() function continues execution and will move onto the requested URL/URI
    next();
});

app.get('/api/smartinsurance/versicherung', ts.getVersicherungOf);

app.get('/api/smartinsurance/versicherung/:versicherungID', [validate.versicherungID, ts.getVersicherung]);

app.get('/api/smartinsurance/versicherung/:versicherungID/bewertungen', [validate.versicherungID, ts.getBewertungen]);

app.post('/api/smartinsurance/filter', ts.filterVersicherung);

app.get('/api/smartinsurance/kategorien', ts.getKategorien);

app.post('/api/smartinsurance/investieren', [validate.parameterZurInvestitionsErstellung, validate.obVersicherungGekuendigtIstOderWird, validate.obVersicherungSchonVollIst, ts.erstelleInvestition]);

app.get('/api/smartinsurance/investition', ts.getInvestitionOf);

app.get('/api/smartinsurance/investitionVers/:versicherungID', [validate.versicherungID, ts.listOfInvestitionen]);

app.get('/api/smartinsurance/investition/:investitionID', [validate.investitionID, ts.getInvestition]);

app.get('/api/smartinsurance/versicherung/:versicherungID/person', [validate.versicherungID, ts.getInvestorenVonVersicherung]);

app.get('/api/smartinsurance/versicherung/:versicherungID/invest', [validate.versicherungID, ts.calculateSumOfInvestVersicherung]);

app.get('/api/smartinsurance/schadensfall/:schadensfallID', [validate.schadensfallID, ts.getSchadensfallByID]);

app.get('/api/smartinsurance/profil/', ts.getProfilByID); // Für das eigene (vorläufig). Sollte auch die eigene haben!

app.get('/api/smartinsurance/profil/:profilID', ts.getProfilByID);

app.get('/api/smartinsurance/schadensfaelle/:versicherungID', [validate.versicherungID, ts.getSchadensfaelleByVersicherung]);

app.post('/api/smartinsurance/schadensfallmelden', [validate.parameterSchadensfall, ts.erstelleSchadensfall]);

app.post('/api/smartinsurance/schadensfall', [validate.parameterSchadensfallAendern, ts.updateSchadensfall]);

app.post('/api/smartinsurance/versicherungaendern', [validate.obKategorieExistiert, validate.parameterVersicherungAendern, ts.updateVersicherung]);

app.post('/api/smartinsurance/investition', [validate.parameterInvestitionAendern, ts.updateInvestition]);

app.post('/api/smartinsurance/versicherung', [validate.parameterZurVersicherungsErstellung, validate.obKategorieExistiert, ts.erstelleVersicherung]);

app.post('/api/smartinsurance/versicherung/:versicherungID/kuendigen', [validate.versicherungID, ts.versicherungKuendigungEinreichen]);

app.post('/api/smartinsurance/investition/:investitionID/kuendigen', [validate.investitionID, ts.investitionKuendigungEinreichen]);

app.post('/api/smartinsurance/kommentieren', [validate.parameterKommentar, ts.erstelleKommentar]);

app.get('/api/smartinsurance/kommentare/:versicherungID', [validate.versicherungID, ts.getKommentareByVID]);

// Nur fuer Testzwecke
app.get('/api/smartinsurance/periodic', ts.periodicSchedule);

app.get('/api/smartinsurance/zahlungsrelevant', ts.getPaymentrelevantInvestitions);
