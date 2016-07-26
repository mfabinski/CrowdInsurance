# CrowdInsurance

[![build status](https://gitlab.cloudf.de/matthias/crowdinsurance/badges/master/build.svg)](https://gitlab.cloudf.de/matthias/crowdinsurance/commits/master)

## Installation instructions

### Run locally

1. Clone this repository
```
git clone https://gitlab.cloudf.de/matthias/crowdinsurance.git
```
2. Change dir into ExpressForDevelopment
```
cd ExpressForDevelopment
```
3. Install npm dependencies
```
npm install
```
4. Maintain database credentials in
```
ExpressForDevelopment/node_modules/smartbackendHelper/lib/config/database.js
```
enter the following line with the database connection string:
```
exports.url = 'postgres://user:password@server:port/dbname?ssl=true';
```
5. load database schema into the database from
```
ExpressForDevelopment/test/data/general/createSchemas.sql
```
5. Start the server
```
npm start
```
6. Access the server on localhost

### Run with docker

1. Prepare a _bare metal_ database or use a docker postgres database
```
docker pull registry.cloudf.de/matthias/depostgresdocker:9.5
```
2. load database schema into the database from
```
ExpressForDevelopment/test/data/general/createSchemas.sql
```
3. Pull the latest database
```
docker pull registry.cloudf.de/matthias/crowdinsurance:latest
```
4. Start the docker container manually

Set the following environment variables to the prepared postgres database when starting the container...

```
 DB_USER
 DB_PASSWORD
 DB_HOST
 DB_PORT
 DB_DATABASENAME
 DB_SSL
```

...or use a docker-compose.yml file and docker-compose to start your server.

Create a `docker-compose.yml` file:

```
crowdinsurance:
 image: registry.cloudf.de/matthias/crowdinsurance:latest
 ports:
   - 3000:3000
 environment:
   - DB_USER=user
   - DB_PASSWORD=password
   - DB_HOST=databasehost
   - DB_PORT=portnumber
   - DB_DATABASENAME=databasename
   - DB_SSL=true
```

Start it with

```
docker-compose up -d
```

Congratulations, you have now a running SmartInsurance server with database.

## Live Demo

You can see a video about SmartInsurance on YouTube.

## Interested? Try it out

Or register for a free account on http://crowdinsurance.cloudf.de/


## Contribution Guide

Interested in contribution to our project. Feel free to request developer access and contribute to SmartInsurance.

### Getting started

Setup after cloning (or when new packages are added in the pulled commits):

```
cd ExpressForDevelopment
npm install
```

To start the server (make sure you are in `~/git/CrowdInsurance/ExpressForDevelopment`):
```
npm start
```

### Database Development

After changes to the database the schema has to be extracted and saved.

[Zugangsdaten](https://trello.com/c/Z3u0u06M)


On Linux:
```
pg_dump -h pftclan.de -W -U smartbackenduser -p 995 --schema-only --no-owner --no-security-labels --no-acl --schema-only -d smartbackenddevelopment -n smartinsurance -n smartbackend -n borrowit -n smarthandwerk -n smarttourismus -n smarttransport -n public  > ~/git/crowdinsurance/ExpressForDevelopment/test/data/general/createSchemas.sql
```

On Windows (Version may vary):
```
cd "C:\Program Files (x86)\pgAdmin III\1.22\"
pg_dump.exe -h pftclan.de -W -U smartbackenduser -p 995 --schema-only --no-owner --no-security-labels --no-acl --schema-only -d smartbackenddevelopment -n smartinsurance -n smartbackend -n borrowit -n smarthandwerk -n smarttourismus -n smarttransport -n public -f %userprofile%/git/crowdinsurance/ExpressForDevelopment/test/data/general/createSchemas.sql
```

### Tests

Für die Generierung von Testdaten kann mit dem folgenden Befehl ein Datenexport gezogen werden:
```
cd "C:\Program Files (x86)\pgAdmin III\1.22\"
pg_dump.exe -h pftclan.de -W -U smartbackenduser -p 995 --column-inserts --data-only --no-owner --no-security-labels --no-acl -d smartbackenddevelopment -n smartinsurance -n smartbackend -n borrowit -n smarthandwerk -n smarttourismus -n smarttransport -n public  -f %userprofile%/git/crowdinsurance/ExpressForDevelopment/test/data/general/testdatenEinfuegen.sql
```

### Integration in das SMART Backend

```
git clone git@gitlab.cloudf.de:matthias/crowdinsurance.git
git clone git@github.com:benedikt-sondermann/smartbackend.git
rm -r smartbackend/100_Prototyp/src/team_modules/smartinsurance/
cp -r crowdinsurance/ExpressForDevelopment/team_modules/smartinsurance/ smartbackend/100_Prototyp/src/team_modules/smartinsurance/
cd smartbackend/
# Manually Merge the package.json dependencies :(
# then
docker build -t smartbackend:unstable .
docker run -p hostport:3000 smartbackend:unstable
```

### Misc

Hi Kids, ich bin Carlo.

## Architektur

Die Architektur ist in der folgenden Grafik dargestellt:

![build status](https://gitlab.cloudf.de/matthias/crowdinsurance/raw/master/architektur.png)
