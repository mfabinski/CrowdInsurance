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

app.get('/', function (req, res) {
  res.send("Der Sever laeuft! :-)");
});

app.get('/api/smartinsurance/versicherung', ts.getVersicherungOf);

app.get('/api/smartinsurance/versicherung/:versicherungID', [validate.versicherungID, ts.getVersicherung]);

app.get('/api/smartinsurance/kategorien', ts.getKategorien);

app.post('/api/smartinsurance/investieren', [validate.parameterZurInvestitionsErstellung, validate.obVersicherungGekuendigtIstOderWird, validate.obVersicherungSchonVollIst, ts.erstelleInvestition]);

app.get('/api/smartinsurance/investition', ts.getInvestitionOf);

app.get('/api/smartinsurance/investitionVers/:versicherungID', [validate.versicherungID, ts.listOfInvestitionen]);

app.get('/api/smartinsurance/investition/:investitionID', [validate.investitionID, ts.getInvestition]);

app.get('/api/smartinsurance/versicherung/:versicherungID/person', [validate.versicherungID, ts.getInvestorenVonVersicherung]);

app.get('/api/smartinsurance/versicherung/:versicherungID/invest', [validate.versicherungID, ts.calculateSumOfInvestVersicherung]);

app.post('/api/smartinsurance/versicherung', [validate.parameterZurVersicherungsErstellung, validate.obKategorieExistiert, ts.erstelleVersicherung]);

app.post('/api/smartinsurance/versicherung/:versicherungID/kuendigen', [validate.versicherungID, ts.versicherungKuendigungEinreichen]);

app.post('/api/smartinsurance/investition/:investitionID/kuendigen', [validate.investitionID, ts.investitionKuendigungEinreichen]);
