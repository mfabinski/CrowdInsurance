var pg = require('pg');
var fs = require('fs');

var sql = fs.readFileSync('setup.sql').toString();

pg.connect('postgres://smartinsurance:123456@postgres/smartbackendevelopment', function(err, client, done){
    if(err){
        console.log('error: ', err);
        process.exit(1);
    }
    client.query(sql, function(err, result){
        done();
        if(err){
            console.log('error: ', err);
            process.exit(1);
        }
        process.exit(0);
    });
});
