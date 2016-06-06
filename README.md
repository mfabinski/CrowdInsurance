# CrowdInsurance

[![build status](https://gitlab.cloudf.de/matthias/crowdinsurance/badges/master/build.svg)](https://gitlab.cloudf.de/matthias/crowdinsurance/commits/master)

## Getting started

Setup after cloning (or when new packages are added in the pulled commits):

```
cd ExpressForDevelopment
npm install
```

To start the server (make sure you are in `~/git/CrowdInsurance/ExpressForDevelopment`):
```
npm start
```

## Database Development

After changes to the database the schema has to be extracted and saved.

[Zugangsdaten](https://trello.com/c/Z3u0u06M)


On Linux:
```
pg_dump -h pftclan.de -W -U smartbackenduser -p 995 --schema-only --no-owner --no-security-labels --no-acl --schema-only -d smartbackenddevelopment -n smartinsurance -n smartbackend  > ~/git/crowdinsurance/ExpressForDevelopment/test/data/general/createSchemas.sql
```

On Windows (Version may vary):
```
cd "C:\Program Files (x86)\pgAdmin III\1.22\"
pg_dump.exe -h pftclan.de -W -U smartbackenduser -p 995 --schema-only --no-owner --no-security-labels --no-acl --schema-only -d smartbackenddevelopment -n smartinsurance -n smartbackend  -f %userprofile%/git/crowdinsurance/ExpressForDevelopment/test/data/general/createSchemas.sql
```

## Tests

Für die Generierung von Testdaten kann mit dem folgenden Befehl ein Datenexport gezogen werden:
```
cd "C:\Program Files (x86)\pgAdmin III\1.22\"
pg_dump.exe -h pftclan.de -W -U smartbackenduser -p 995 --column-inserts --data-only --no-owner --no-security-labels --no-acl -d smartbackenddevelopment -n smartinsurance -n smartbackend  -f %userprofile%/git/crowdinsurance/ExpressForDevelopment/test/data/general/testdatenEinfuegen.sql
```

## Misc

Hi Kids, ich bin Carlo.
