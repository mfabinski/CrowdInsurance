var logger = require('./team_modules/smartinsurance/logger.js');
var app = require('./app.js');

require('./team_modules/smartinsurance/scheduler.js').schedule(); // SmartbackendRelevant

app.listen(3000, function() {
    if (process.argv[2] == undefined) {
        logger.consoleInfo('App hört auf port 3000 - Produktiver Modus');
    } else {
        logger.consoleInfo('App hört auf port 3000 - Test Modus');
    }
});
