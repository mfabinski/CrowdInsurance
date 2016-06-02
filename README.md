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

On Linux:
```
pg_dump -h pftclan.de -W -U smartbackenduser -p 995 --schema-only --no-owner --no-security-labels --no-acl --schema-only -d smartbackenddevelopment -n smartinsurance -n smartbackend  > ~/git/crowdinsurance/ExpressForDevelopment/test/data/general/createSchemas.sql
```

On Windows (Version may vary):
```
cd "C:\Program Files (x86)\pgAdmin III\1.22\"
pg_dump.exe -h pftclan.de -W -U smartbackenduser -p 995 --schema-only --no-owner --no-security-labels --no-acl --schema-only -d smartbackenddevelopment -n smartinsurance -n smartbackend  -f ~/git/crowdinsurance/ExpressForDevelopment/test/data/general/createSchemas.sql
```


## Misc

Hi Kids, ich bin Carlo.
