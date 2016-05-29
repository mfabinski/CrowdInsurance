var ts = require('transactionscript.js');
var schedule = require('node-schedule');
var logger = require('logger.js');
var app = require('./app');

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
    logger.consoleInfo('App hört auf port 3000 - Produktiver Modus');
  } else{
    logger.consoleInfo('App hört auf port 3000 - Test Modus');
  }
});
