var winston = require('winston');
var mkdirp = require('mkdirp');

// Make sure the log directory exists
mkdirp('logs', function (err) {
    if (err) {
        console.error(err);
    }
});

var logger = new (winston.Logger)({
    transports: [
        new (winston.transports.File)({
            name: 'info-file',
            filename: 'logs/server.log',
            level: 'info'
        }),
        new (winston.transports.File)({
            name: 'error-file',
            filename: 'logs/serverError.log',
            level: 'error'
        }),
        new (winston.transports.Console)({
            name: 'console',
            filename: 'logs/serverError.log',
            level: 'error'
        })
    ]
});

var consoleLogger = new (winston.Logger)({
    transports: [
        new (winston.transports.Console)(),
    ]
});

exports.error = function (msg) {
    logger.log('error', msg);
    //consoleLogger.log('error', msg);
    // zusätzliche metadaten als json: ('error', msg, {blub : 'blub'})
    // teile der nachricht können mit String interpolation ersetzt werden: ('error', 'message %1 %2', 'sounds', 'nice')
};

exports.info = function (msg) {
    logger.log('info', msg);
    //consoleLogger.log('info', msg);
};

exports.consoleInfo = function (msg) {
    logger.log('info', msg);
    consoleLogger.log('info', "[using deprecated consoleInfo:] " + msg);
};

exports.clearLogFiles = function () {
    var fs = require('fs');
    fs.truncate('logs/server.log', 0, function () {
    });
    fs.truncate('logs/serverError.log', 0, function () {
    });
};

// Levels : ['error', 'warn', 'info', 'verbose', 'debug', 'silly' ]
exports.setLogLevel = function (level) {
    logger.log('info', "Set LogLevel to " + level);
    logger.transports.console.level = level;
};
