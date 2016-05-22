var express = require('express');
var tdg = require('tabledatagateway.js');
var logic = require('logic.js');
var bodyParser = require('body-parser');
var schedule = require('node-schedule');

var app = express();
app.use( bodyParser.json() );

app.get('/', function (req, res) {
  res.send("Der Sever laeuft! :-)");
});

app.get('/api/smartinsurance/versicherung', logic.getVersicherungOf)

app.get('/api/smartinsurance/versicherung/:versicherungID', logic.getVersicherung)

app.post('/api/smartinsurance/investieren', logic.erstelleInvestition)

app.get('/api/smartinsurance/investition', logic.getInvestitionOf)

app.get('/api/smartinsurance/investitionVers/:versicherungID', logic.listOfInvestitionen)

app.get('/api/smartinsurance/investition/:investitionID', logic.getInvestition)

app.get('/api/smartinsurance/versicherung/:versicherungID/person', logic.getInvestorenVonVersicherung)

app.get('/api/smartinsurance/versicherung/:versicherungID/invest', logic.calculateSumOfInvestVersicherung)

app.post('/api/smartinsurance/versicherung', logic.erstelleVersicherung)

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
var job = schedule.scheduleJob('0 */10 * * * *', logic.periodicSchedule); // run every 10 minutes

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
