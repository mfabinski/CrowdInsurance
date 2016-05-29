var express = require('express');
var tdg = require('tabledatagateway.js');
var ts = require('transactionscript.js');
var bodyParser = require('body-parser');
var schedule = require('node-schedule');
var logger = require('logger.js');

logger.clearLogFiles();

var app = express();
app.use( bodyParser.json() );

app.get('/', function (req, res) {
  res.send("Der Sever laeuft! :-)");
});

app.get('/api/smartinsurance/versicherung', ts.getVersicherungOf);

app.get('/api/smartinsurance/versicherung/:versicherungID', ts.getVersicherung);

app.post('/api/smartinsurance/investieren', ts.erstelleInvestition);

app.get('/api/smartinsurance/investition', ts.getInvestitionOf);

app.get('/api/smartinsurance/investitionVers/:versicherungID', ts.listOfInvestitionen);

app.get('/api/smartinsurance/investition/:investitionID', ts.getInvestition);

app.get('/api/smartinsurance/versicherung/:versicherungID/person', ts.getInvestorenVonVersicherung);

app.get('/api/smartinsurance/versicherung/:versicherungID/invest', ts.calculateSumOfInvestVersicherung);

app.post('/api/smartinsurance/versicherung', ts.erstelleVersicherung);

app.post('/api/smartinsurance/versicherung/:versicherungID/kuendigen', ts.versicherungKuendigungEinreichen);

app.post('/api/smartinsurance/investition/:investitionID/kuendigen', ts.investitionKuendigungEinreichen);

/*
*    *    *    *    *    *
┬    ┬    ┬    ┬    ┬    ┬
│    │    │    │    │    |
│    │    │    │    │    └ day of week (0 - 7) (0 or 7 is Sun)
│    │    │    │    └───── month (1 - 12)
│    │    │    └────────── day of month (1 - 31)
│    │    └─────────────── hour (0 - 23)
│    └──────────────────── minute (0 - 59)
└───────────────────────── second (0 - 59, OPTIONAL)
*/
if (process.argv[2] == undefined){ //wenn kein testmodus aktiv ist
  var period = '0 */1 * * * *';
  var job = schedule.scheduleJob(period, ts.periodicSchedule); // run every 10 minutes
  logger.consoleInfo('Periodischen Job gestartet - ' + period);
}

app.listen(3000, function () {
  if (process.argv[2] == undefined){
    logger.consoleInfo('App hört auf port 3000 - Produktier Modus');
  } else{
    logger.consoleInfo('App hört auf port 3000 - Test Modus');
  }
});
