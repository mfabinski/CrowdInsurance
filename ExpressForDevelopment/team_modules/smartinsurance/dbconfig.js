// Retreive credentials
exports.getCredentials = function() {
    var credentials;
    // Passed as commandline parameter?
    if (process.argv[2] != undefined && (process.argv[2].startsWith('postgres'))) {
        credentials = process.argv[2];
        return credentials;
    }
    // Configured locally with dbconfig.js file?
    try {
        var dbconfig = require('../../node_modules/dbconfig.js');
        credentials = dbconfig.url;
        return credentials;
    } catch(err) {}
    // Configured by SmartBackend?
    try {
        var dbconfig = require('../../node_modules/smartbackendHelper/lib/database.js');
        credentials = dbconfig.smartinsurance;
        return credentials;
    } catch(err) {}
    // Configured with environment variable?
    credentials = 'postgres://' + process.env.DB_USER + ':' + process.env.DB_PASSWORD + '@' + process.env.DB_HOST + ':' + process.env.DB_PORT + '/' + process.env.DB_DATABASENAME + ((process.env.DB_SSL=="true")?'?ssl=true':'');
    return credentials;
};
