start cmd /k node app.js postgres://testuser:test@localhost:5432/testdatabase
timeout /t 0.1
start cmd /k npm test
