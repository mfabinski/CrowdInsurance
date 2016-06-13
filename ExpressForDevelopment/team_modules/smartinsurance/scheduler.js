var ts = require('./transactionscript.js');
var logger = require('./logger.js');
var schedule = require('node-schedule');
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
exports.schedule = function() {
    var period = '0 0 */4 * * *'; // einmal alle 4 Stunden
    var job = schedule.scheduleJob(period, ts.periodicSchedule);
    logger.consoleInfo('Periodischen Job gestartet - ' + period);
}
