var express = require('express');
var tdg = require('tabledatagateway.js');
var ts = require('transactionscript.js');
var bodyParser = require('body-parser');
var schedule = require('node-schedule');

var app = express();
app.use( bodyParser.json() );

app.get('/', function (req, res) {
  res.send("Der Sever laeuft! :-)");
});

app.get('/api/smartinsurance/versicherung', ts.getVersicherungOf)

app.get('/api/smartinsurance/versicherung/:versicherungID', ts.getVersicherung)

app.post('/api/smartinsurance/investieren', ts.erstelleInvestition)

app.get('/api/smartinsurance/investition', ts.getInvestitionOf)

app.get('/api/smartinsurance/investitionVers/:versicherungID', ts.listOfInvestitionen)

app.get('/api/smartinsurance/investition/:investitionID', ts.getInvestition)

app.get('/api/smartinsurance/versicherung/:versicherungID/person', ts.getInvestorenVonVersicherung)

app.get('/api/smartinsurance/versicherung/:versicherungID/invest', ts.calculateSumOfInvestVersicherung)

app.post('/api/smartinsurance/versicherung', ts.erstelleVersicherung)

app.post('/api/smartinsurance/versicherung/:versicherungID/kuendigen', ts.versicherungKuendigungEinreichen)

app.post('/api/smartinsurance/investition/:investitionID/kuendigen', ts.investitionKuendigungEinreichen)

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
var job = schedule.scheduleJob('0 */10 * * * *', ts.periodicSchedule); // run every 10 minutes

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
