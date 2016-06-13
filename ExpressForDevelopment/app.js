var express = require('express');
var bodyParser = require('body-parser');
var morgan       = require('morgan')
var logger = require('./team_modules/smartinsurance/logger.js');
logger.clearLogFiles();

logger.setLogLevel(process.env.DEBUG_LEVEL || "info");

var route_smartinsurance = require('./team_modules/smartinsurance/routehandler');


var app = module.exports = express();
app.use(morgan('dev')); // log every request to the console
app.use( bodyParser.json() );


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
app.use('/api/smartinsurance', route_smartinsurance());

app.use(express.static('../SmartInsurance/www/'));
