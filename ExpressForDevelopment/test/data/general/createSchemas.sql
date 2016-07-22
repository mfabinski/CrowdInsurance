--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: borrowit; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA borrowit;


--
-- Name: smartbackend; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smartbackend;


--
-- Name: smarthandwerk; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smarthandwerk;


--
-- Name: smartinsurance; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smartinsurance;


--
-- Name: smarttourismus; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smarttourismus;


--
-- Name: smarttransport; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smarttransport;


SET search_path = public, pg_catalog;

--
-- Name: requestuserpreferencemode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE requestuserpreferencemode AS ENUM (
    'favorite',
    'ignore'
);


SET search_path = smartbackend, pg_catalog;

--
-- Name: messagetype; Type: TYPE; Schema: smartbackend; Owner: -
--

CREATE TYPE messagetype AS ENUM (
    'textmessage',
    'imagemessage',
    'filemessage'
);


SET search_path = smarthandwerk, pg_catalog;

--
-- Name: attributecatalog_inputtype; Type: TYPE; Schema: smarthandwerk; Owner: -
--

CREATE TYPE attributecatalog_inputtype AS ENUM (
    'text',
    'number',
    'meter',
    'cubicmeter',
    'squaremeter',
    'kilogram',
    'boolean'
);


--
-- Name: skill_leveltype; Type: TYPE; Schema: smarthandwerk; Owner: -
--

CREATE TYPE skill_leveltype AS ENUM (
    'hobby',
    'learned',
    'professional'
);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: auszahlungsstatus; Type: TYPE; Schema: smartinsurance; Owner: -
--

CREATE TYPE auszahlungsstatus AS ENUM (
    'ausgezahlt',
    'angezweifelt',
    'ausstehend'
);


--
-- Name: bewertung; Type: TYPE; Schema: smartinsurance; Owner: -
--

CREATE TYPE bewertung AS ENUM (
    'keine',
    'daumenHoch',
    'daumenRunter'
);


--
-- Name: kategorie; Type: TYPE; Schema: smartinsurance; Owner: -
--

CREATE TYPE kategorie AS ENUM (
    'Auto',
    'Schiff',
    'Flugzeug',
    'Haus',
    'Küchengeräte',
    'Möbel',
    'Maschinen',
    'Uhr',
    'Sonstiges'
);


SET search_path = smarttourismus, pg_catalog;

--
-- Name: location_type; Type: TYPE; Schema: smarttourismus; Owner: -
--

CREATE TYPE location_type AS ENUM (
    'Club',
    'Restaurant',
    'Bar',
    'Party'
);


--
-- Name: price; Type: TYPE; Schema: smarttourismus; Owner: -
--

CREATE TYPE price AS ENUM (
    '€',
    '€€',
    '€€€'
);


SET search_path = borrowit, pg_catalog;

--
-- Name: uuid_generate_v1mc(); Type: FUNCTION; Schema: borrowit; Owner: -
--

CREATE FUNCTION uuid_generate_v1mc() RETURNS uuid
    LANGUAGE c STRICT
    AS '$libdir/uuid-ossp', 'uuid_generate_v1mc';


SET search_path = public, pg_catalog;

--
-- Name: db_to_csv(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION db_to_csv(path text) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
  tables RECORD;
  statement TEXT;
begin
  FOR tables IN 
    SELECT (table_schema || '.' || table_name) AS schema_table
    FROM information_schema.tables t INNER JOIN information_schema.schemata s 
    ON s.schema_name = t.table_schema 
    WHERE t.table_schema NOT IN ('pg_catalog', 'information_schema', 'configuration')
    ORDER BY schema_table
  LOOP
    statement := 'COPY ' || tables.schema_table || ' TO ''' || path || '/' || tables.schema_table || '.csv' ||''' DELIMITER '';'' CSV HEADER';
    EXECUTE statement;
  END LOOP;
  return;  
end;
$$;


--
-- Name: insert_smartbackend_user(integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION insert_smartbackend_user(email integer, prename text, name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    LOOP
        -- first try to update the key
        -- note that "a" must be unique
        UPDATE smartbackend.user SET email = email WHERE email = email;
        IF found THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO smartbackend.user(email,prename,name) VALUES (email,prename,name);
            RETURN;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$;


SET search_path = smartbackend, pg_catalog;

--
-- Name: insert_smartbackend_user(text, text, text); Type: FUNCTION; Schema: smartbackend; Owner: -
--

CREATE FUNCTION insert_smartbackend_user(email text, prename text, name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    LOOP
        -- first try to update the key
        -- note that "a" must be unique
        UPDATE smartbackend.user SET email = email WHERE email = email;
        IF found THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO smartbackend.user(email,prename,name) VALUES (email,prename,name);
            RETURN;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$;


--
-- Name: uuid_generate_v1mc(); Type: FUNCTION; Schema: smartbackend; Owner: -
--

CREATE FUNCTION uuid_generate_v1mc() RETURNS uuid
    LANGUAGE c STRICT
    AS '$libdir/uuid-ossp', 'uuid_generate_v1mc';


SET search_path = smarthandwerk, pg_catalog;

--
-- Name: uuid_generate_v1mc(); Type: FUNCTION; Schema: smarthandwerk; Owner: -
--

CREATE FUNCTION uuid_generate_v1mc() RETURNS uuid
    LANGUAGE c STRICT
    AS '$libdir/uuid-ossp', 'uuid_generate_v1mc';


SET search_path = smartinsurance, pg_catalog;

--
-- Name: createinvestition(integer, uuid, money); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION createinvestition(integer, uuid, money) RETURNS integer
    LANGUAGE sql
    AS $_$
    INSERT INTO smartinsurance."Zahlungsstrom"
       ("versicherungID", "personID", betrag)
       VALUES ($1, $2, $3);
    INSERT INTO smartinsurance."Investition"
       (id, "versicherungID", "personID", investitionshoehe) 
       VALUES (DEFAULT, $1, $2, $3) RETURNING id;
$_$;


--
-- Name: createkommentar(integer, text, uuid); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION createkommentar(integer, text, uuid) RETURNS integer
    LANGUAGE sql
    AS $_$
    INSERT INTO "Kommentar"(
            id, "versicherungID", text, zeitpunkt, "personID")
    VALUES (DEFAULT, $1, $2, now(), $3) returning id;
$_$;


--
-- Name: createschadensfall(integer, text, money); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION createschadensfall(integer, text, money) RETURNS integer
    LANGUAGE sql
    AS $_$
    INSERT INTO smartinsurance."Schadensfall"
       (id, "versicherungID", beschreibung, schadenshoehe) 
       VALUES (DEFAULT, $1, $2, $3) RETURNING id;
$_$;


--
-- Name: createschadensfall(integer, text, text, money); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION createschadensfall(integer, text, text, money) RETURNS integer
    LANGUAGE sql
    AS $_$
    INSERT INTO smartinsurance."Schadensfall"
       (id, "versicherungID", bezeichnung, beschreibung, schadenshoehe) 
       VALUES (DEFAULT, $1, $2, $3, $4) RETURNING id;
$_$;


--
-- Name: createversicherung(uuid, text, money, money, text, kategorie); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION createversicherung(uuid, text, money, money, text, kategorie) RETURNS integer
    LANGUAGE sql
    AS $_$
    INSERT INTO smartinsurance."Versicherung"
    (id, "personID", name, versicherungshoehe, beitrag, beschreibung, kategorie)
    VALUES ( DEFAULT, $1, $2, $3, $4, $5, $6) RETURNING id;
$_$;


--
-- Name: executezahlung(integer, uuid, money); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION executezahlung(integer, uuid, money) RETURNS void
    LANGUAGE sql
    AS $_$
    INSERT INTO smartinsurance."Zahlungsstrom"
      ("versicherungID", "personID", betrag)
      VALUES ($1, $2, $3);
$_$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Investition; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Investition" (
    id integer NOT NULL,
    "versicherungID" integer NOT NULL,
    investitionshoehe money,
    bewertung bewertung DEFAULT 'keine'::bewertung NOT NULL,
    "abschlussZeitpunkt" timestamp without time zone DEFAULT now(),
    "kuendigungsZeitpunkt" timestamp without time zone,
    "istGekuendigt" boolean DEFAULT false NOT NULL,
    "wirdGekuendigt" boolean DEFAULT false NOT NULL,
    "personID" uuid NOT NULL
);


--
-- Name: Versicherung; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Versicherung" (
    id integer NOT NULL,
    name text NOT NULL,
    versicherungshoehe money NOT NULL,
    beitrag money NOT NULL,
    beschreibung text,
    "abschlussZeitpunkt" timestamp without time zone DEFAULT now(),
    "kuendigungsZeitpunkt" timestamp without time zone,
    "istGekuendigt" boolean DEFAULT false,
    "wirdGekuendigt" boolean DEFAULT false,
    "personID" uuid NOT NULL,
    kategorie kategorie
);


--
-- Name: VersicherungAnzahlInvestoren; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "VersicherungAnzahlInvestoren" AS
 SELECT "Investition"."versicherungID" AS id,
    count("Investition"."personID") AS anzahl_investoren
   FROM "Investition"
  WHERE ("Investition"."istGekuendigt" = false)
  GROUP BY "Investition"."versicherungID";


--
-- Name: VersicherungDaumen; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "VersicherungDaumen" AS
 SELECT i.vid AS id,
    (sum(i.daumenhoch) - sum(i.daumenrunter)) AS bewertung
   FROM (( SELECT "Investition"."versicherungID" AS vid,
            count(
                CASE
                    WHEN ("Investition".bewertung = 'daumenHoch'::bewertung) THEN 1
                    ELSE NULL::integer
                END) AS daumenhoch,
            count(
                CASE
                    WHEN ("Investition".bewertung = 'daumenRunter'::bewertung) THEN 1
                    ELSE NULL::integer
                END) AS daumenrunter
           FROM "Investition"
          GROUP BY "Investition"."versicherungID") i
     JOIN ( SELECT "Versicherung".id,
            "Versicherung"."personID" AS versicherter
           FROM "Versicherung") v ON ((i.vid = v.id)))
  GROUP BY i.vid;


--
-- Name: VersicherungRendite; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "VersicherungRendite" AS
 SELECT "Versicherung".id,
    (("Versicherung".beitrag / "Versicherung".versicherungshoehe) * (100)::double precision) AS rendite
   FROM "Versicherung"
  WHERE ("Versicherung"."istGekuendigt" = false);


--
-- Name: VersicherungFilter; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "VersicherungFilter" AS
 SELECT v.id,
    v.name,
    v.versicherungshoehe,
    v.beitrag,
    v.beschreibung,
    v."abschlussZeitpunkt",
    v."kuendigungsZeitpunkt",
    v."istGekuendigt",
    v."wirdGekuendigt",
    v."personID",
    v.kategorie,
    COALESCE(a.anzahl_investoren, (0)::bigint) AS anzahl_investoren,
    COALESCE(b.bewertung, (0)::numeric) AS bewertung,
    COALESCE(r.rendite, (0)::double precision) AS rendite
   FROM (((( SELECT "Versicherung".id,
            "Versicherung".name,
            "Versicherung".versicherungshoehe,
            "Versicherung".beitrag,
            "Versicherung".beschreibung,
            "Versicherung"."abschlussZeitpunkt",
            "Versicherung"."kuendigungsZeitpunkt",
            "Versicherung"."istGekuendigt",
            "Versicherung"."wirdGekuendigt",
            "Versicherung"."personID",
            "Versicherung".kategorie
           FROM "Versicherung") v
     LEFT JOIN ( SELECT "VersicherungRendite".id,
            "VersicherungRendite".rendite
           FROM "VersicherungRendite") r ON ((v.id = r.id)))
     LEFT JOIN ( SELECT "VersicherungAnzahlInvestoren".id,
            "VersicherungAnzahlInvestoren".anzahl_investoren
           FROM "VersicherungAnzahlInvestoren") a ON ((v.id = a.id)))
     LEFT JOIN ( SELECT "VersicherungDaumen".id,
            "VersicherungDaumen".bewertung
           FROM "VersicherungDaumen") b ON ((a.id = b.id)));


--
-- Name: filterversicherung(kategorie, text, text, integer, integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION filterversicherung(kategorie, text, text, integer DEFAULT 0, integer DEFAULT 0) RETURNS SETOF "VersicherungFilter"
    LANGUAGE plpgsql
    AS $_$
BEGIN
if $4 > 0 then 
    RETURN QUERY EXECUTE 'SELECT "id",
       "name",
       "versicherungshoehe",
       "beitrag",
       "beschreibung",
       "abschlussZeitpunkt",
       "kuendigungsZeitpunkt",
       "istGekuendigt",
       "wirdGekuendigt",
       "personID",
       "kategorie",
       "anzahl_investoren",
       "bewertung",
       "rendite" 
    FROM smartinsurance."VersicherungFilter" 
    WHERE "kategorie" = $1 AND "istGekuendigt"=false AND "wirdGekuendigt"=false ORDER BY '
    || quote_ident($2) || ' ' || $3 || 
    ' LIMIT  $4
     OFFSET $5
    ;' USING $1,$2,$3,$4,$5;
else
    RETURN QUERY EXECUTE 'SELECT "id",
       "name",
       "versicherungshoehe",
       "beitrag",
       "beschreibung",
       "abschlussZeitpunkt",
       "kuendigungsZeitpunkt",
       "istGekuendigt",
       "wirdGekuendigt",
       "personID",
       "kategorie",
       "anzahl_investoren",
       "bewertung",
       "rendite" 
    FROM smartinsurance."VersicherungFilter" 
    WHERE "kategorie" = $1 AND "istGekuendigt"=false AND "wirdGekuendigt"=false ORDER BY '
    || quote_ident($2) || ' ' || $3 || 
    ';' USING $1,$2,$3;
end if;
END;
$_$;


--
-- Name: filterversicherungcount(kategorie, text, text, integer, integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION filterversicherungcount(kategorie DEFAULT NULL::kategorie, text DEFAULT ''::text, text DEFAULT ''::text, integer DEFAULT 0, integer DEFAULT 0) RETURNS bigint
    LANGUAGE plpgsql
    AS $_$
BEGIN
 if $1 is null then
    RETURN (SELECT count(*)
    FROM smartinsurance."VersicherungFilter" 
    WHERE "istGekuendigt"=false AND "wirdGekuendigt"=false);
 else
    RETURN (SELECT count(*)
    FROM smartinsurance."VersicherungFilter" 
    WHERE "kategorie" = $1 AND "istGekuendigt"=false AND "wirdGekuendigt"=false);
 end if;
END;
$_$;


--
-- Name: finalizeinvestitionskuendigung(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION finalizeinvestitionskuendigung() RETURNS void
    LANGUAGE sql
    AS $$
    INSERT INTO smartinsurance."Zahlungsstrom"("versicherungID", "personID", betrag)
      SELECT "versicherungID", "personID", investitionshoehe * (-1) 
      FROM smartinsurance."Investition" 
      WHERE smartinsurance."Investition"."wirdGekuendigt"=true;
    UPDATE smartinsurance."Investition"
      SET "istGekuendigt"=true, "wirdGekuendigt"=false, "kuendigungsZeitpunkt"=now() 
      WHERE "wirdGekuendigt"=true;
$$;


--
-- Name: finalizeschadensfall(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION finalizeschadensfall() RETURNS void
    LANGUAGE sql
    AS $$
   UPDATE "Schadensfall"
      SET "istAusgezahlt"=true
      WHERE "istAusgezahlt"=false;
$$;


--
-- Name: finalizeschadensfall(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION finalizeschadensfall(integer) RETURNS void
    LANGUAGE sql
    AS $_$
   UPDATE "Schadensfall"
      SET "istAusgezahlt"=true
      WHERE id=$1;
$_$;


--
-- Name: finalizeversicherungskuendigung(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION finalizeversicherungskuendigung() RETURNS void
    LANGUAGE sql
    AS $$
    UPDATE smartinsurance."Versicherung"
    SET "istGekuendigt"=true, "wirdGekuendigt"=false, "kuendigungsZeitpunkt"=now() 
    WHERE "wirdGekuendigt"=true;
$$;


SET search_path = smartbackend, pg_catalog;

--
-- Name: user; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE "user" (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    name text,
    prename text,
    email text,
    password text,
    birthday date
);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: InvestitionPerson; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "InvestitionPerson" AS
 SELECT i.id,
    i."versicherungID",
    i."personID",
    p.name AS "personName",
    p.prename AS "personPrename",
    i.investitionshoehe,
    i.bewertung,
    i."abschlussZeitpunkt",
    i."kuendigungsZeitpunkt",
    i."istGekuendigt",
    i."wirdGekuendigt"
   FROM ("Investition" i
     JOIN smartbackend."user" p ON ((i."personID" = p.id)));


--
-- Name: VersicherungPerson; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "VersicherungPerson" (
    id integer,
    name text,
    versicherungshoehe money,
    beitrag money,
    beschreibung text,
    "abschlussZeitpunkt" timestamp without time zone,
    "kuendigungsZeitpunkt" timestamp without time zone,
    "istGekuendigt" boolean,
    "wirdGekuendigt" boolean,
    "personID" uuid,
    kategorie kategorie,
    "personName" text,
    "personPrename" text,
    suminvestition money
);

ALTER TABLE ONLY "VersicherungPerson" REPLICA IDENTITY NOTHING;


--
-- Name: InvestitionKomplett; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "InvestitionKomplett" AS
 SELECT i.id,
    i."versicherungID",
    i."personID" AS "ipersonID",
    i."personName" AS "ipersonName",
    i."personPrename" AS "ipersonPrename",
    i.investitionshoehe,
    i.bewertung,
    i."abschlussZeitpunkt" AS "iabschlussZeitpunkt",
    i."kuendigungsZeitpunkt" AS "ikuendigungsZeitpunkt",
    i."istGekuendigt" AS "iistGekuendigt",
    i."wirdGekuendigt" AS "iwirdGekuendigt",
    v."personID" AS "vpersonID",
    v."personName" AS "vpersonName",
    v."personPrename" AS "vpersonPrename",
    v.name,
    v.versicherungshoehe,
    v.beitrag,
    v.beschreibung,
    v."abschlussZeitpunkt" AS "vabschlussZeitpunkt",
    v."kuendigungsZeitpunkt" AS "vkuendigungsZeitpunkt",
    v."istGekuendigt" AS "vistGekuendigt",
    v."wirdGekuendigt" AS "vwirdGekuendigt",
    v.kategorie
   FROM ("VersicherungPerson" v
     JOIN "InvestitionPerson" i ON ((i."versicherungID" = v.id)));


--
-- Name: getinvestitionkomplettbyiid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getinvestitionkomplettbyiid(integer) RETURNS "InvestitionKomplett"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "InvestitionKomplett" as ik WHERE ik.id = $1;
$_$;


--
-- Name: getinvestitionkomplettbyuid(uuid); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getinvestitionkomplettbyuid(uuid) RETURNS SETOF "InvestitionKomplett"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "InvestitionKomplett" as ik WHERE ik."ipersonID" = $1;
$_$;


--
-- Name: getinvestitionkomplettbyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getinvestitionkomplettbyvid(integer) RETURNS SETOF "InvestitionKomplett"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "InvestitionKomplett" as ik WHERE ik."versicherungID" = $1;
$_$;


--
-- Name: getinvestitionssummebyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getinvestitionssummebyvid(integer) RETURNS money
    LANGUAGE sql
    AS $_$
/*    SELECT sum(smartinsurance."Investition"."investitionshoehe") as suminvestition
     FROM smartinsurance."Versicherung" INNER JOIN smartinsurance."Investition"
     ON smartinsurance."Versicherung".id=smartinsurance."Investition"."versicherungID" 
     WHERE smartinsurance."Versicherung".id=$1
     AND smartinsurance."Investition"."istGekuendigt"=false; */
/*
     SELECT COALESCE(sum(smartinsurance."Investition"."investitionshoehe"), '0.00 €') as suminvestition
     FROM smartinsurance."Versicherung" LEFT OUTER JOIN smartinsurance."Investition"
     ON smartinsurance."Versicherung".id=smartinsurance."Investition"."versicherungID" 
     AND smartinsurance."Investition"."istGekuendigt"=false;*/
     SELECT COALESCE(sum(i."investitionshoehe"), '0.00 €') as suminvestition FROM 
            (SELECT * FROM "Versicherung") v
        LEFT OUTER JOIN
            (SELECT * FROM "Investition" WHERE "istGekuendigt"=false) i
        ON v.id = i."versicherungID"
     WHERE v.id = $1
     GROUP BY v.id;

$_$;


--
-- Name: InvestorenVonVersicherung; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "InvestorenVonVersicherung" AS
 SELECT ip."personID",
    ip."versicherungID",
    ip.name,
    ip.prename,
    ip.email,
    ip.investitionshoehe,
    ip."abschlussZeitpunkt"
   FROM ("Versicherung"
     JOIN ( SELECT i."versicherungID",
            i."personID",
            p.name,
            p.prename,
            p.email,
            i.investitionshoehe,
            i."abschlussZeitpunkt"
           FROM ("Investition" i
             JOIN smartbackend."user" p ON ((i."personID" = p.id)))) ip ON (("Versicherung".id = ip."versicherungID")))
  ORDER BY ip.investitionshoehe DESC;


--
-- Name: getinvestorenbyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getinvestorenbyvid(integer) RETURNS SETOF "InvestorenVonVersicherung"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "InvestorenVonVersicherung"
    WHERE "versicherungID"=$1;
$_$;


--
-- Name: getkategorien(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getkategorien() RETURNS kategorie[]
    LANGUAGE sql
    AS $$
    SELECT enum_range(NULL::kategorie);
$$;


--
-- Name: Kommentar; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Kommentar" (
    id integer NOT NULL,
    "versicherungID" integer NOT NULL,
    text text,
    zeitpunkt timestamp without time zone,
    "personID" uuid NOT NULL
);


--
-- Name: KommentarPerson; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "KommentarPerson" AS
 SELECT k.id,
    k."versicherungID",
    k.text,
    k.zeitpunkt,
    k."personID",
    p.name,
    p.prename
   FROM ("Kommentar" k
     JOIN smartbackend."user" p ON ((k."personID" = p.id)));


--
-- Name: getkommentarbykid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getkommentarbykid(integer) RETURNS SETOF "KommentarPerson"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "KommentarPerson" as kp WHERE kp."id" = $1;
$_$;


--
-- Name: getkommentarebyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getkommentarebyvid(integer) RETURNS SETOF "KommentarPerson"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "KommentarPerson" as kp WHERE kp."versicherungID" = $1 ORDER BY "zeitpunkt" DESC;
$_$;


--
-- Name: PersonBewertung; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "PersonBewertung" AS
 SELECT v.versicherter,
    (sum(i.daumenhoch) - sum(i.daumenrunter)) AS bewertung,
    sum(i.daumenhoch) AS daumenhoch,
    sum(i.daumenrunter) AS daumenrunter
   FROM (( SELECT "Investition"."versicherungID" AS vid,
            count(
                CASE
                    WHEN ("Investition".bewertung = 'daumenHoch'::bewertung) THEN 1
                    ELSE NULL::integer
                END) AS daumenhoch,
            count(
                CASE
                    WHEN ("Investition".bewertung = 'daumenRunter'::bewertung) THEN 1
                    ELSE NULL::integer
                END) AS daumenrunter
           FROM "Investition"
          GROUP BY "Investition"."versicherungID") i
     JOIN ( SELECT "Versicherung".id,
            "Versicherung"."personID" AS versicherter
           FROM "Versicherung") v ON ((i.vid = v.id)))
  GROUP BY v.versicherter;


--
-- Name: userbank; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE userbank (
    id uuid NOT NULL,
    iban text,
    bic text,
    bankinstitut text
);


--
-- Name: ProfilKomplett; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "ProfilKomplett" AS
 SELECT u.id,
    u.name,
    u.prename,
    u.email,
    b.iban,
    b.bic,
    b.bankinstitut,
    u.birthday,
    COALESCE(p.bewertung, (0)::numeric) AS bewertung,
    COALESCE(p.daumenhoch, (0)::numeric) AS daumenhoch,
    COALESCE(p.daumenrunter, (0)::numeric) AS daumenrunter
   FROM ((smartbackend."user" u
     LEFT JOIN "PersonBewertung" p ON ((u.id = p.versicherter)))
     LEFT JOIN userbank b ON ((u.id = b.id)));


--
-- Name: getprofilkomplettbyuid(uuid); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getprofilkomplettbyuid(uuid) RETURNS "ProfilKomplett"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "ProfilKomplett" as p WHERE p.id = $1;
$_$;


--
-- Name: ProfilPublic; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "ProfilPublic" AS
 SELECT "ProfilKomplett".id,
    "ProfilKomplett".name,
    "ProfilKomplett".prename,
    "ProfilKomplett".email,
    "ProfilKomplett".birthday,
    "ProfilKomplett".bewertung,
    "ProfilKomplett".daumenhoch,
    "ProfilKomplett".daumenrunter
   FROM "ProfilKomplett";


--
-- Name: getprofilpublicbyuid(uuid); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getprofilpublicbyuid(uuid) RETURNS "ProfilPublic"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "ProfilPublic" as p WHERE p.id = $1;
$_$;


--
-- Name: Schadensfall; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Schadensfall" (
    id integer NOT NULL,
    "versicherungID" integer NOT NULL,
    beschreibung text,
    schadenshoehe money NOT NULL,
    zeitpunkt timestamp without time zone DEFAULT now(),
    "auszahlungsZeitpunkt" timestamp without time zone,
    "istAusgezahlt" boolean DEFAULT false NOT NULL,
    bezeichnung text
);


--
-- Name: COLUMN "Schadensfall".zeitpunkt; Type: COMMENT; Schema: smartinsurance; Owner: -
--

COMMENT ON COLUMN "Schadensfall".zeitpunkt IS 'Zeitpunkt der Meldung des Schadensfalls durch den Versicherungsnehmer';


--
-- Name: getschadensfallbysid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getschadensfallbysid(integer) RETURNS "Schadensfall"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "Schadensfall" as sf WHERE sf.id = $1;
$_$;


--
-- Name: getschadensfallbyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getschadensfallbyvid(integer) RETURNS SETOF "Schadensfall"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "Schadensfall" as sf WHERE sf."versicherungID" = $1;
$_$;


--
-- Name: getversicherungpersonbyuid(uuid); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getversicherungpersonbyuid(uuid) RETURNS SETOF "VersicherungPerson"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "VersicherungPerson" as vp WHERE vp."personID" = $1;
$_$;


--
-- Name: getversicherungpersonbyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getversicherungpersonbyvid(integer) RETURNS "VersicherungPerson"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "VersicherungPerson" as vp WHERE vp.id = $1;
$_$;


--
-- Name: Versicherungsbewertungen; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "Versicherungsbewertungen" AS
 SELECT "Investition"."versicherungID",
    "Investition".bewertung,
    count("Investition".bewertung) AS count
   FROM "Investition"
  GROUP BY "Investition"."versicherungID", "Investition".bewertung
  ORDER BY "Investition"."versicherungID", "Investition".bewertung;


--
-- Name: getversicherungsbewertungenbyvid(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getversicherungsbewertungenbyvid(integer) RETURNS SETOF "Versicherungsbewertungen"
    LANGUAGE sql
    AS $_$
    SELECT * FROM "Versicherungsbewertungen" as vb WHERE vb."versicherungID" = $1;
$_$;


--
-- Name: VersicherungenUndBeitraege; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "VersicherungenUndBeitraege" AS
 SELECT v.id,
    v."personID",
    v.versicherungshoehe,
    v.beitrag,
    i.invest,
    (i.invest / v.versicherungshoehe) AS deckung,
    (v.beitrag * (i.invest / v.versicherungshoehe)) AS "echterBeitrag"
   FROM (( SELECT "Versicherung".id,
            "Versicherung"."personID",
            "Versicherung".beitrag,
            "Versicherung".versicherungshoehe
           FROM "Versicherung"
          WHERE ("Versicherung"."istGekuendigt" = false)) v
     LEFT JOIN ( SELECT "Investition"."versicherungID",
            sum("Investition".investitionshoehe) AS invest
           FROM "Investition"
          WHERE ("Investition"."istGekuendigt" = false)
          GROUP BY "Investition"."versicherungID") i ON ((v.id = i."versicherungID")));


--
-- Name: getversicherungundbeitraege(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getversicherungundbeitraege() RETURNS SETOF "VersicherungenUndBeitraege"
    LANGUAGE sql
    AS $$
    SELECT * FROM "VersicherungenUndBeitraege";
$$;


--
-- Name: ZahlungsrelevanteInvestitionen; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "ZahlungsrelevanteInvestitionen" AS
 SELECT v.id,
    i."personID",
    (v.beitrag * (i.invest / v.versicherungshoehe)) AS rendite
   FROM (( SELECT "Versicherung".id,
            "Versicherung"."personID",
            "Versicherung".beitrag,
            "Versicherung".versicherungshoehe
           FROM "Versicherung"
          WHERE ("Versicherung"."istGekuendigt" = false)) v
     RIGHT JOIN ( SELECT "Investition"."personID",
            "Investition"."versicherungID",
            sum("Investition".investitionshoehe) AS invest
           FROM "Investition"
          WHERE ("Investition"."istGekuendigt" = false)
          GROUP BY "Investition"."personID", "Investition"."versicherungID") i ON ((v.id = i."versicherungID")));


--
-- Name: getzahlungsrelevanteinvestitionen(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION getzahlungsrelevanteinvestitionen() RETURNS SETOF "ZahlungsrelevanteInvestitionen"
    LANGUAGE sql
    AS $$
    SELECT * FROM "ZahlungsrelevanteInvestitionen";
$$;


--
-- Name: orderversicherung(text, text, integer, integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION orderversicherung(text, text, integer DEFAULT 0, integer DEFAULT 0) RETURNS SETOF "VersicherungFilter"
    LANGUAGE plpgsql
    AS $_$
BEGIN
if $3 > 0 then 
    RETURN QUERY EXECUTE 'SELECT "id",
       "name",
       "versicherungshoehe",
       "beitrag",
       "beschreibung",
       "abschlussZeitpunkt",
       "kuendigungsZeitpunkt",
       "istGekuendigt",
       "wirdGekuendigt",
       "personID",
       "kategorie",
       "anzahl_investoren",
       "bewertung",
       "rendite" 
    FROM smartinsurance."VersicherungFilter" '
    || 'WHERE "istGekuendigt"=false AND "wirdGekuendigt"=false '
    || 'ORDER BY '
    || quote_ident($1) || ' ' || $2 || 
    ' LIMIT  $3
      OFFSET $4
    ;' USING $1,$2,$3,$4;
else
    RETURN QUERY EXECUTE 'SELECT "id",
       "name",
       "versicherungshoehe",
       "beitrag",
       "beschreibung",
       "abschlussZeitpunkt",
       "kuendigungsZeitpunkt",
       "istGekuendigt",
       "wirdGekuendigt",
       "personID",
       "kategorie",
       "anzahl_investoren",
       "bewertung",
       "rendite" 
    FROM smartinsurance."VersicherungFilter" '
    || 'WHERE "istGekuendigt"=false AND "wirdGekuendigt"=false '
    || 'ORDER BY '
    || quote_ident($1) || ' ' || $2 || ';';
end if;
END;
$_$;


--
-- Name: payschadensfaelle(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION payschadensfaelle() RETURNS void
    LANGUAGE sql
    AS $$
    INSERT INTO "Zahlungsstrom" ("versicherungID", betrag, "personID")
    SELECT s."versicherungID", (s.auszahlung * (-1)) AS betrag, s."personID"
    FROM "SchadensfallVersicherung" s;
$$;


--
-- Name: reduceinvestitionenwegenschaden(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION reduceinvestitionenwegenschaden() RETURNS void
    LANGUAGE sql
    AS $$
    UPDATE "Investition" 
    SET investitionshoehe = (SELECT s."neueInvestitionshoehe"
	FROM "SchadensfallAbzugDerInvestition" s
	WHERE "Investition".id = s."investitionID")
    WHERE EXISTS (SELECT *
	FROM "SchadensfallAbzugDerInvestition" s
	WHERE "Investition".id = s."investitionID");
$$;


--
-- Name: setinvestitionbewertung(integer, bewertung); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION setinvestitionbewertung("investitionID" integer, "Bewertung" bewertung) RETURNS void
    LANGUAGE sql
    AS $_$Update "Investition" 
set bewertung =$2
where id=$1;$_$;


--
-- Name: submitinvestitionskuendigung(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION submitinvestitionskuendigung(integer) RETURNS void
    LANGUAGE sql
    AS $_$
    UPDATE smartinsurance."Investition"
      SET "wirdGekuendigt"=true WHERE id=$1 AND "istGekuendigt"=false;
$_$;


--
-- Name: submitversicherungskuendigung(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION submitversicherungskuendigung(integer) RETURNS void
    LANGUAGE sql
    AS $_$
    UPDATE smartinsurance."Versicherung"
      SET "wirdGekuendigt"=true WHERE id=$1;
    UPDATE smartinsurance."Investition" 
      SET "wirdGekuendigt"=true 
      WHERE "versicherungID"=$1 AND "istGekuendigt"=false;
$_$;


--
-- Name: test_matthias(integer); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION test_matthias(param_id integer) RETURNS SETOF "Versicherung"
    LANGUAGE plpgsql
    AS $$
BEGIN
   RETURN QUERY
   SELECT *
   FROM "smartinsurance"."Versicherung"
   WHERE id = param_id;
END
$$;


--
-- Name: updateinvestition(integer, money); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION updateinvestition(integer, money) RETURNS void
    LANGUAGE sql
    AS $_$
   UPDATE "Investition"
      SET investitionshoehe=$2
      WHERE id=$1;
$_$;


--
-- Name: updateprofil(uuid, text, text, text, text, text, text); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION updateprofil(uuid, text, text, text, text, text, text) RETURNS void
    LANGUAGE sql
    AS $_$
    UPDATE smartbackend.user 
	SET name=$2, prename=$3, email=$4
	WHERE id=$1;
    UPDATE smartinsurance.userbank
        SET iban=$5, bic=$6, bankinstitut=$7
        WHERE id=$1;
    INSERT INTO smartinsurance.userbank (id, iban, bic, bankinstitut)
	SELECT $1,$5,$6,$7 FROM smartinsurance.userbank
		WHERE NOT EXISTS (SELECT 1 FROM smartinsurance.userbank WHERE id=$1);
$_$;


--
-- Name: updateprofil(uuid, text, text, text, text, text, text, date); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION updateprofil(uuid, text, text, text, text, text, text, date) RETURNS void
    LANGUAGE sql
    AS $_$
    UPDATE smartbackend.user 
	SET name=$2, prename=$3, email=$4, birthday=$8
	WHERE id=$1;
    UPDATE smartinsurance.userbank
        SET iban=$5, bic=$6, bankinstitut=$7
        WHERE id=$1;
    INSERT INTO smartinsurance.userbank (id, iban, bic, bankinstitut)
	SELECT $1,$5,$6,$7 FROM smartinsurance.userbank
		WHERE NOT EXISTS (SELECT 1 FROM smartinsurance.userbank WHERE id=$1);
$_$;


--
-- Name: updateschadensfall(integer, text, text, money); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION updateschadensfall(integer, text, text, money) RETURNS void
    LANGUAGE sql
    AS $_$
   UPDATE "Schadensfall"
      SET bezeichnung=$2, beschreibung=$3, schadenshoehe=$4
      WHERE id=$1;
$_$;


--
-- Name: updateversicherung(integer, text, text, kategorie); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION updateversicherung(integer, text, text, kategorie) RETURNS void
    LANGUAGE sql
    AS $_$
   UPDATE "Versicherung"
      SET name=$2, beschreibung=$3, kategorie=$4
      WHERE id=$1;
$_$;


--
-- Name: uuid_generate_v1mc(); Type: FUNCTION; Schema: smartinsurance; Owner: -
--

CREATE FUNCTION uuid_generate_v1mc() RETURNS uuid
    LANGUAGE c STRICT
    AS '$libdir/uuid-ossp', 'uuid_generate_v1mc';


SET search_path = smarttourismus, pg_catalog;

--
-- Name: uuid_generate_v1mc(); Type: FUNCTION; Schema: smarttourismus; Owner: -
--

CREATE FUNCTION uuid_generate_v1mc() RETURNS uuid
    LANGUAGE c STRICT
    AS '$libdir/uuid-ossp', 'uuid_generate_v1mc';


SET search_path = smarttransport, pg_catalog;

--
-- Name: uuid_generate_v1mc(); Type: FUNCTION; Schema: smarttransport; Owner: -
--

CREATE FUNCTION uuid_generate_v1mc() RETURNS uuid
    LANGUAGE c STRICT
    AS '$libdir/uuid-ossp', 'uuid_generate_v1mc';


SET search_path = borrowit, pg_catalog;

--
-- Name: address; Type: TABLE; Schema: borrowit; Owner: -
--

CREATE TABLE address (
    uid uuid NOT NULL,
    aid uuid NOT NULL
);


SET search_path = smartbackend, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE rating (
    userid uuid NOT NULL,
    rating numeric NOT NULL,
    ratingid integer NOT NULL,
    creationdate date NOT NULL,
    CONSTRAINT rating_rating_check CHECK (((rating >= (1)::numeric) AND (rating <= (5)::numeric)))
);


SET search_path = borrowit, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: borrowit; Owner: -
--

CREATE TABLE rating (
    request integer,
    rated_by uuid
)
INHERITS (smartbackend.rating);


--
-- Name: request; Type: TABLE; Schema: borrowit; Owner: -
--

CREATE TABLE request (
    rid integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    borrower uuid NOT NULL,
    lender uuid,
    category text NOT NULL,
    enddate timestamp with time zone NOT NULL,
    startdate timestamp with time zone DEFAULT now() NOT NULL,
    offered boolean DEFAULT false NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    location text
);


--
-- Name: request_rid_seq; Type: SEQUENCE; Schema: borrowit; Owner: -
--

CREATE SEQUENCE request_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_rid_seq; Type: SEQUENCE OWNED BY; Schema: borrowit; Owner: -
--

ALTER SEQUENCE request_rid_seq OWNED BY request.rid;


--
-- Name: user; Type: TABLE; Schema: borrowit; Owner: -
--

CREATE TABLE "user" (
    uid uuid NOT NULL,
    username text NOT NULL,
    telephone text NOT NULL,
    picture text,
    currentaddress uuid,
    push boolean DEFAULT true,
    location boolean DEFAULT true,
    currentlocation text
);


SET search_path = public, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rating (
    userid uuid,
    rating numeric
);


SET search_path = smartbackend, pg_catalog;

--
-- Name: address; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE address (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    street text NOT NULL,
    city text NOT NULL,
    state text,
    country text NOT NULL,
    extra text,
    house_number text,
    postal_code text
);


--
-- Name: chat_message; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE chat_message (
    roomid uuid NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now(),
    messagetype messagetype NOT NULL,
    text text,
    senderid uuid NOT NULL
);


--
-- Name: chat_room; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE chat_room (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    "isGeneric" boolean DEFAULT false NOT NULL,
    title text
);


--
-- Name: chat_room_user; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE chat_room_user (
    roomid uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    isadmin boolean DEFAULT false NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: fileupload; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE fileupload (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    "creationDate" timestamp(0) without time zone DEFAULT now(),
    url text NOT NULL,
    "accessType" integer,
    deleted boolean,
    "userId" uuid
);


--
-- Name: push_notification; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE push_notification (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    urls_to_fetch text,
    userid uuid
);


--
-- Name: push_user_device; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE push_user_device (
    userid uuid NOT NULL,
    deviceid text NOT NULL
);


--
-- Name: rating_ratingid_seq; Type: SEQUENCE; Schema: smartbackend; Owner: -
--

CREATE SEQUENCE rating_ratingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rating_ratingid_seq; Type: SEQUENCE OWNED BY; Schema: smartbackend; Owner: -
--

ALTER SEQUENCE rating_ratingid_seq OWNED BY rating.ratingid;


--
-- Name: user_token; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE user_token (
    access_token text NOT NULL,
    fk_user uuid NOT NULL,
    access_provider text NOT NULL
);


--
-- Name: user_access_view; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_access_view AS
 SELECT "user".id,
    "user".name,
    "user".prename,
    "user".email,
    user_token.access_token
   FROM "user",
    user_token
  WHERE ("user".id = user_token.fk_user);


--
-- Name: user_password; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE user_password (
    id uuid NOT NULL,
    salt text,
    password text
);


--
-- Name: user_accesstoken_password; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_accesstoken_password AS
 SELECT "user".id,
    user_token.access_token,
    user_password.password,
    "user".email
   FROM "user",
    user_token,
    user_password
  WHERE (("user".id = user_token.fk_user) AND ("user".id = user_password.id));


--
-- Name: user_friends; Type: TABLE; Schema: smartbackend; Owner: -
--

CREATE TABLE user_friends (
    userid uuid NOT NULL,
    friendid uuid NOT NULL,
    isfriend boolean DEFAULT false,
    requestdate date,
    acceptdate date
);


--
-- Name: user_getfriends_view; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_getfriends_view AS
 SELECT user_friends.userid,
    user_friends.friendid,
    user_friends.isfriend,
    user_friends.acceptdate,
    (json_build_object('name', "user".name, 'prename', "user".prename, 'email', "user".email, 'birthday', "user".birthday))::jsonb AS friend
   FROM user_friends,
    "user"
  WHERE (("user".id = user_friends.friendid) AND (user_friends.isfriend = true));


--
-- Name: user_getfriendsrequests_view; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_getfriendsrequests_view AS
 SELECT user_friends.userid,
    user_friends.friendid,
    user_friends.isfriend,
    user_friends.requestdate,
    (json_build_object('name', "user".name, 'prename', "user".prename, 'email', "user".email, 'birthday', "user".birthday))::jsonb AS friend
   FROM user_friends,
    "user"
  WHERE (("user".id = user_friends.friendid) AND (user_friends.isfriend = false));


SET search_path = smarthandwerk, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE rating (
    userid uuid,
    rating numeric,
    ratingid integer DEFAULT nextval('smartbackend.rating_ratingid_seq'::regclass),
    creationdate date,
    evaluator_user_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    comment text,
    package_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    CONSTRAINT rating_rating_check CHECK (((rating >= (1)::numeric) AND (rating <= (5)::numeric)))
)
INHERITS (smartbackend.rating);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE rating (
)
INHERITS (smartbackend.rating);


SET search_path = smarttourismus, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE rating (
)
INHERITS (smartbackend.rating);


SET search_path = smarttransport, pg_catalog;

--
-- Name: rating; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE rating (
    "order" integer NOT NULL,
    comment text,
    notrated boolean,
    role text
)
INHERITS (smartbackend.rating);


SET search_path = smartbackend, pg_catalog;

--
-- Name: user_globalrating; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_globalrating AS
 SELECT round(avg(rating.rating), 2) AS rating,
    count(rating.ratingid) AS ratingcount,
    rating.userid,
    rating.source
   FROM ( SELECT "user".id AS userid,
            rating_1.ratingid,
            rating_1.rating,
            rating_1.creationdate,
            'smarthandwerk'::text AS source
           FROM ("user"
             JOIN smarthandwerk.rating rating_1 ON ((rating_1.userid = "user".id)))
        UNION
         SELECT "user".id AS userid,
            rating_1.ratingid,
            rating_1.rating,
            rating_1.creationdate,
            'smartinsurance'::text AS source
           FROM ("user"
             JOIN smartinsurance.rating rating_1 ON ((rating_1.userid = "user".id)))
        UNION
         SELECT "user".id AS userid,
            rating_1.ratingid,
            rating_1.rating,
            rating_1.creationdate,
            'smarttourismus'::text AS source
           FROM ("user"
             JOIN smarttourismus.rating rating_1 ON ((rating_1.userid = "user".id)))
        UNION
         SELECT "user".id AS userid,
            rating_1.ratingid,
            rating_1.rating,
            rating_1.creationdate,
            'smarttransport'::text AS source
           FROM ("user"
             JOIN smarttransport.rating rating_1 ON ((rating_1.userid = "user".id)))
        UNION
         SELECT "user".id AS userid,
            rating_1.ratingid,
            rating_1.rating,
            rating_1.creationdate,
            'borrowit'::text AS source
           FROM ("user"
             JOIN borrowit.rating rating_1 ON ((rating_1.userid = "user".id)))) rating
  GROUP BY rating.userid, rating.source;


--
-- Name: user_password_view; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_password_view AS
 SELECT "user".email,
    "user".id,
    user_password.salt
   FROM "user",
    user_password
  WHERE ("user".id = user_password.id);


SET search_path = smarthandwerk, pg_catalog;

--
-- Name: offer; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE offer (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    user_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    discounttotalprice money NOT NULL
);


--
-- Name: offeritem; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE offeritem (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    offer_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    requestitem_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    price money NOT NULL
);


--
-- Name: package; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE package (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    request_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL
);


--
-- Name: packageitem; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE packageitem (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    offeritem_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    package_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL
);


--
-- Name: package_offer_user_match; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW package_offer_user_match AS
 SELECT DISTINCT t1.id AS package_id,
    t4.user_id AS bidder_user_id
   FROM (((package t1
     JOIN packageitem t2 ON ((t1.id = t2.package_id)))
     JOIN offeritem t3 ON ((t2.offeritem_id = t3.id)))
     JOIN offer t4 ON ((t3.offer_id = t4.id)));


--
-- Name: request; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE request (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    user_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    titel text NOT NULL,
    minprice money,
    maxprice money,
    comment text,
    localflag boolean DEFAULT false NOT NULL,
    skilllevel skill_leveltype,
    begin date,
    "end" date
);


--
-- Name: all_involved_in_package; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW all_involved_in_package AS
 SELECT DISTINCT package_offer_user_match.package_id,
    package_offer_user_match.bidder_user_id AS user_id
   FROM package_offer_user_match
UNION
 SELECT t1.id AS package_id,
    t2.user_id
   FROM (package t1
     JOIN request t2 ON ((t1.request_id = t2.id)))
  ORDER BY 1, 2;


--
-- Name: all_partners_in_package; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW all_partners_in_package AS
 SELECT t1.package_id,
    t1.user_id AS user1_id,
    t2.user_id AS user2_id
   FROM (all_involved_in_package t1
     JOIN all_involved_in_package t2 ON ((t1.package_id = t2.package_id)));


--
-- Name: attributecatalog; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE attributecatalog (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    productcatalog_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    description text NOT NULL,
    userinputtype attributecatalog_inputtype NOT NULL
);


--
-- Name: attributeitem; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE attributeitem (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    value text NOT NULL,
    requestitem uuid NOT NULL,
    attributcatalog uuid NOT NULL
);


--
-- Name: offer_discount_check; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW offer_discount_check AS
 SELECT DISTINCT o.id AS offer_id,
    (( SELECT count(pi.offeritem_id) AS count
           FROM packageitem pi
          WHERE (pi.offeritem_id = oi.id)) = ( SELECT count(oi_1.id) AS count
           FROM offeritem oi_1
          WHERE (oi_1.offer_id = o.id))) AS discount_check,
    o.discounttotalprice AS discount
   FROM (offer o
     JOIN offeritem oi ON ((o.id = oi.offer_id)));


--
-- Name: VIEW offer_discount_check; Type: COMMENT; Schema: smarthandwerk; Owner: -
--

COMMENT ON VIEW offer_discount_check IS 'Zeigt die Angebote an und ob Rabatt gewährleistet wird oder nicht';


--
-- Name: offer_user_match; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW offer_user_match AS
 SELECT oi.id AS offer_item_id,
    o.user_id AS bidder_user_id,
    u.prename,
    u.name
   FROM ((offeritem oi
     JOIN offer o ON ((oi.offer_id = o.id)))
     JOIN smartbackend."user" u ON ((o.user_id = u.id)));


--
-- Name: package_details; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW package_details AS
 SELECT p.id AS package_id,
    p.request_id,
    pi.offeritem_id,
    oi.offer_id,
    oi.price,
    r.user_id AS request_user_id
   FROM (((package p
     JOIN packageitem pi ON ((p.id = pi.package_id)))
     JOIN offeritem oi ON ((pi.offeritem_id = oi.id)))
     JOIN request r ON ((p.request_id = r.id)));


--
-- Name: VIEW package_details; Type: COMMENT; Schema: smarthandwerk; Owner: -
--

COMMENT ON VIEW package_details IS 'Alle Pakete mit ihren jeweiligen Angebotsposten und dem Preis des Angebots und dem User, dem das Paket gehört';


--
-- Name: productcatalog; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE productcatalog (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    description text NOT NULL,
    productcategorycatalog_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL
);


--
-- Name: productcategorycatalog; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE productcategorycatalog (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    description text NOT NULL
);


--
-- Name: requestitem; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE requestitem (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    request_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL
);


--
-- Name: request_item_category_match; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW request_item_category_match AS
 SELECT DISTINCT r.user_id,
    ri.id AS requestitem_id,
    ri.request_id,
    pcc.description
   FROM (((((requestitem ri
     JOIN attributeitem ai ON ((ri.id = ai.requestitem)))
     JOIN attributecatalog ac ON ((ai.attributcatalog = ac.id)))
     JOIN productcatalog pc ON ((ac.productcatalog_id = pc.id)))
     JOIN productcategorycatalog pcc ON ((pc.productcategorycatalog_id = pcc.id)))
     JOIN request r ON ((r.id = ri.request_id)))
  ORDER BY ri.request_id;


--
-- Name: request_category_match; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW request_category_match AS
 SELECT DISTINCT ON (t2.request_id) t2.user_id,
    t2.requestitem_id,
    t2.request_id,
    t2.description,
    t1.cnt,
        CASE
            WHEN (t1.cnt > 1) THEN 'Zimmer'::text
            ELSE t2.description
        END AS image
   FROM (( SELECT request_item_category_match.request_id,
            count(*) AS cnt
           FROM request_item_category_match
          GROUP BY request_item_category_match.request_id) t1
     JOIN ( SELECT request_item_category_match.user_id,
            request_item_category_match.requestitem_id,
            request_item_category_match.request_id,
            request_item_category_match.description
           FROM request_item_category_match) t2 ON ((t1.request_id = t2.request_id)));


--
-- Name: requestitem_details_match; Type: VIEW; Schema: smarthandwerk; Owner: -
--

CREATE VIEW requestitem_details_match AS
 SELECT ri.request_id,
    ri.id AS requestitem_id,
    pc.description AS item_discription,
    ac.description AS attribute_description,
    ai.value,
    ac.userinputtype
   FROM (((((requestitem ri
     JOIN attributeitem ai ON ((ri.id = ai.requestitem)))
     JOIN attributecatalog ac ON ((ai.attributcatalog = ac.id)))
     JOIN productcatalog pc ON ((ac.productcatalog_id = pc.id)))
     JOIN productcategorycatalog pcc ON ((pc.productcategorycatalog_id = pcc.id)))
     JOIN request r ON ((r.id = ri.request_id)))
  ORDER BY ri.request_id, ri.id;


--
-- Name: VIEW requestitem_details_match; Type: COMMENT; Schema: smarthandwerk; Owner: -
--

COMMENT ON VIEW requestitem_details_match IS 'Attribute zu jeden Requestitem';


--
-- Name: requestuserpreference; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE requestuserpreference (
    user_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    request_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    mode public.requestuserpreferencemode NOT NULL
);


--
-- Name: skill; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE skill (
    user_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    skillcatalog_id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    level skill_leveltype NOT NULL
);


--
-- Name: skillcatalog; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE skillcatalog (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    description text NOT NULL
);


--
-- Name: user; Type: TABLE; Schema: smarthandwerk; Owner: -
--

CREATE TABLE "user" (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    phoneno text,
    setting_allow_geolocation boolean DEFAULT true NOT NULL,
    setting_allow_notification boolean DEFAULT true NOT NULL,
    address_id uuid
);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: Gewinnberechnung; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Gewinnberechnung" (
    prename text,
    name text,
    id uuid,
    gewinn money
);

ALTER TABLE ONLY "Gewinnberechnung" REPLICA IDENTITY NOTHING;


--
-- Name: InvestitionBewertung; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "InvestitionBewertung" AS
 SELECT "Investition".id,
    "Investition".bewertung
   FROM "Investition"
  ORDER BY "Investition".id;


--
-- Name: Investition_id_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Investition_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Investition_id_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Investition_id_seq" OWNED BY "Investition".id;


--
-- Name: Investition_versicherungID_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Investition_versicherungID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Investition_versicherungID_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Investition_versicherungID_seq" OWNED BY "Investition"."versicherungID";


--
-- Name: Kommentar_id_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Kommentar_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Kommentar_id_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Kommentar_id_seq" OWNED BY "Kommentar".id;


--
-- Name: Kommentar_versicherungID_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Kommentar_versicherungID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Kommentar_versicherungID_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Kommentar_versicherungID_seq" OWNED BY "Kommentar"."versicherungID";


--
-- Name: SchadensfallVersicherung; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "SchadensfallVersicherung" AS
 SELECT s.schadenssumme,
    s."versicherungID",
    i.investitionssumme,
        CASE
            WHEN (s.schadenssumme > i.investitionssumme) THEN i.investitionssumme
            ELSE s.schadenssumme
        END AS auszahlung,
        CASE
            WHEN (s.schadenssumme > i.investitionssumme) THEN (1)::double precision
            ELSE (s.schadenssumme / i.investitionssumme)
        END AS abgabeanteil,
    v."personID"
   FROM ((( SELECT s_1."versicherungID",
            sum(s_1.schadenshoehe) AS schadenssumme
           FROM "Schadensfall" s_1
          WHERE (s_1."istAusgezahlt" = false)
          GROUP BY s_1."versicherungID") s
     JOIN ( SELECT i_1."versicherungID",
            sum(i_1.investitionshoehe) AS investitionssumme
           FROM "Investition" i_1
          WHERE (i_1."istGekuendigt" = false)
          GROUP BY i_1."versicherungID") i ON ((i."versicherungID" = s."versicherungID")))
     JOIN "Versicherung" v ON ((v.id = s."versicherungID")));


--
-- Name: SchadensfallAbzugDerInvestition; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "SchadensfallAbzugDerInvestition" AS
 SELECT i.id AS "investitionID",
    i."versicherungID",
    (i.investitionshoehe * ((1)::double precision - sv.abgabeanteil)) AS "neueInvestitionshoehe",
    sv.schadenssumme,
    sv.investitionssumme,
    sv.auszahlung,
    sv.abgabeanteil,
    sv."personID"
   FROM ("Investition" i
     JOIN "SchadensfallVersicherung" sv ON ((i."versicherungID" = sv."versicherungID")))
  WHERE (i."istGekuendigt" = false);


--
-- Name: SchadensfallBerechnungKomplett; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "SchadensfallBerechnungKomplett" AS
 SELECT s."versicherungID",
    sum(s."neueInvestitionshoehe") AS "summeGerundeteInvestitionshoehe",
    (s.investitionssumme - s.auszahlung) AS "summeBerechneteInvestitionshoehe",
    ((s.investitionssumme - s.auszahlung) - sum(s."neueInvestitionshoehe")) AS "auszahlungsUeberschuss",
    s.schadenssumme,
    s.investitionssumme,
    s.auszahlung,
    s.abgabeanteil,
    s."personID"
   FROM "SchadensfallAbzugDerInvestition" s
  GROUP BY s."versicherungID", s.schadenssumme, s.investitionssumme, s.auszahlung, s.abgabeanteil, s."personID";


--
-- Name: Schadensfall_Bild; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Schadensfall_Bild" (
    id integer NOT NULL,
    "schadensfallID" integer NOT NULL,
    "bildUrl" text
);


--
-- Name: Schadensfall_Bild_ID_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Schadensfall_Bild_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Schadensfall_Bild_ID_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Schadensfall_Bild_ID_seq" OWNED BY "Schadensfall_Bild".id;


--
-- Name: Schadensfall_Bild_schadensfallID_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Schadensfall_Bild_schadensfallID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Schadensfall_Bild_schadensfallID_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Schadensfall_Bild_schadensfallID_seq" OWNED BY "Schadensfall_Bild"."schadensfallID";


--
-- Name: Schadensfall_id_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Schadensfall_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Schadensfall_id_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Schadensfall_id_seq" OWNED BY "Schadensfall".id;


--
-- Name: Schadensfall_versicherungID_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Schadensfall_versicherungID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Schadensfall_versicherungID_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Schadensfall_versicherungID_seq" OWNED BY "Schadensfall"."versicherungID";


--
-- Name: UserDaumen; Type: VIEW; Schema: smartinsurance; Owner: -
--

CREATE VIEW "UserDaumen" AS
 SELECT v.versicherter,
    (sum(i.daumenhoch) - sum(i.daumenrunter)) AS bewertung
   FROM (( SELECT "Investition"."versicherungID" AS vid,
            count(
                CASE
                    WHEN ("Investition".bewertung = 'daumenHoch'::bewertung) THEN 1
                    ELSE NULL::integer
                END) AS daumenhoch,
            count(
                CASE
                    WHEN ("Investition".bewertung = 'daumenRunter'::bewertung) THEN 1
                    ELSE NULL::integer
                END) AS daumenrunter
           FROM "Investition"
          GROUP BY "Investition"."versicherungID") i
     JOIN ( SELECT "Versicherung".id,
            "Versicherung"."personID" AS versicherter
           FROM "Versicherung") v ON ((i.vid = v.id)))
  GROUP BY v.versicherter;


--
-- Name: Versicherung_id_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Versicherung_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Versicherung_id_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Versicherung_id_seq" OWNED BY "Versicherung".id;


--
-- Name: Zahlungsstrom; Type: TABLE; Schema: smartinsurance; Owner: -
--

CREATE TABLE "Zahlungsstrom" (
    id integer NOT NULL,
    "versicherungID" integer NOT NULL,
    zeitpunkt timestamp without time zone DEFAULT now(),
    betrag money NOT NULL,
    "personID" uuid NOT NULL
);


--
-- Name: Zahlungsstrom_id_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Zahlungsstrom_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Zahlungsstrom_id_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Zahlungsstrom_id_seq" OWNED BY "Zahlungsstrom".id;


--
-- Name: Zahlungsstrom_versicherungID_seq; Type: SEQUENCE; Schema: smartinsurance; Owner: -
--

CREATE SEQUENCE "Zahlungsstrom_versicherungID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Zahlungsstrom_versicherungID_seq; Type: SEQUENCE OWNED BY; Schema: smartinsurance; Owner: -
--

ALTER SEQUENCE "Zahlungsstrom_versicherungID_seq" OWNED BY "Zahlungsstrom"."versicherungID";


SET search_path = smarttourismus, pg_catalog;

--
-- Name: location; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE location (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    name text NOT NULL,
    description text,
    location_price price NOT NULL,
    picture text,
    provider uuid NOT NULL,
    address uuid NOT NULL,
    type location_type NOT NULL
);


--
-- Name: match; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE match (
    type location_type NOT NULL,
    date date NOT NULL,
    location uuid,
    party uuid,
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL
);


--
-- Name: match2user; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE match2user (
    match uuid NOT NULL,
    user_id uuid NOT NULL,
    ready boolean
);


--
-- Name: party; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE party (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    name text NOT NULL,
    description text,
    party_date date NOT NULL,
    party_time time without time zone NOT NULL,
    repeat boolean,
    party_price price NOT NULL,
    party_picture text,
    address uuid NOT NULL,
    location uuid
);


--
-- Name: tags; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE tags (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    tag text NOT NULL
);


--
-- Name: tags2location; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE tags2location (
    tagid uuid NOT NULL,
    locationid uuid NOT NULL
);


--
-- Name: tags2party; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE tags2party (
    tagid uuid NOT NULL,
    partyid uuid NOT NULL
);


--
-- Name: user_rating; Type: TABLE; Schema: smarttourismus; Owner: -
--

CREATE TABLE user_rating (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    rating real NOT NULL,
    from_user uuid NOT NULL,
    for_user uuid NOT NULL,
    for_match uuid NOT NULL
);


SET search_path = smarttransport, pg_catalog;

--
-- Name: category; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE category (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    category_json jsonb,
    value text,
    image text
);


--
-- Name: creditcard; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE creditcard (
    cvc text,
    creditcardnumber text,
    creditid integer NOT NULL,
    "user" uuid,
    validthrough date
);


--
-- Name: creditcard_creditid_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE creditcard_creditid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: creditcard_creditid_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE creditcard_creditid_seq OWNED BY creditcard.creditid;


--
-- Name: customer_order_machting_supplier; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE customer_order_machting_supplier (
    "order" integer NOT NULL,
    user_supplier uuid NOT NULL,
    dismissed boolean,
    deleted boolean,
    createdfirstoffer boolean
);


--
-- Name: honey; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE honey (
    honey integer NOT NULL,
    honey_type integer NOT NULL,
    creationdate date,
    userid uuid
);


--
-- Name: honey_honey_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE honey_honey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: honey_honey_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE honey_honey_seq OWNED BY honey.honey;


--
-- Name: honey_honey_type_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE honey_honey_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: honey_honey_type_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE honey_honey_type_seq OWNED BY honey.honey_type;


--
-- Name: honey_type; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE honey_type (
    honey integer NOT NULL,
    name text,
    description text,
    honeyvalue integer NOT NULL,
    route text,
    valid_from date,
    valid_to date
);


--
-- Name: honey_type_honey_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE honey_type_honey_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: honey_type_honey_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE honey_type_honey_seq OWNED BY honey_type.honey;


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 124
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offer; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE offer (
    price jsonb,
    date_start date,
    orderid integer,
    user_supplier uuid,
    id integer DEFAULT nextval('order_id_seq'::regclass) NOT NULL,
    date_end date,
    offer_state integer,
    note text
);


--
-- Name: offer_id_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE offer_id_seq
    START WITH 124
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offer_state; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE offer_state (
    status integer NOT NULL,
    value text,
    image text,
    description text
);


--
-- Name: offer_view; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW offer_view AS
 SELECT array_to_json(array_agg(row_to_json(t.*))) AS offers,
    t.orderid
   FROM ( SELECT o.price,
            o.date_start,
            o.date_end,
            o.orderid,
            o.id,
            o.note,
            ( SELECT row_to_json(e.*) AS row_to_json
                   FROM ( SELECT os.status,
                            os.value,
                            os.image,
                            os.description
                           FROM offer_state os
                          WHERE (os.status = o.offer_state)) e) AS offer_state,
            ( SELECT row_to_json(d.*) AS row_to_json
                   FROM ( SELECT u.id,
                            u.name,
                            u.prename,
                            u.email,
                            u.password,
                            u.birthday
                           FROM smartbackend."user" u
                          WHERE (u.id = o.user_supplier)) d) AS user_supplier
           FROM offer o) t
  GROUP BY t.orderid;


--
-- Name: offer_view_supplier; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW offer_view_supplier AS
 SELECT array_to_json(array_agg(row_to_json(t.*))) AS offers,
    t.orderid,
    t.supplier
   FROM ( SELECT o.price,
            o.date_start,
            o.date_end,
            o.orderid,
            o.id,
            o.note,
            o.user_supplier AS supplier,
            ( SELECT row_to_json(e.*) AS row_to_json
                   FROM ( SELECT os.status,
                            os.value,
                            os.image,
                            os.description
                           FROM offer_state os
                          WHERE (os.status = o.offer_state)) e) AS offer_state,
            ( SELECT row_to_json(d.*) AS row_to_json
                   FROM ( SELECT u.id,
                            u.name,
                            u.prename,
                            u.email,
                            u.password,
                            u.birthday
                           FROM smartbackend."user" u
                          WHERE (u.id = o.user_supplier)) d) AS user_supplier
           FROM offer o) t
  GROUP BY t.orderid, t.supplier;


--
-- Name: profile; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE profile (
    id uuid DEFAULT smartbackend.uuid_generate_v1mc() NOT NULL,
    role text NOT NULL,
    address uuid,
    creditid integer,
    current boolean
);


--
-- Name: profile_view; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW profile_view AS
 SELECT useritem.id,
    profile.role,
    json_build_object('name', useritem.name, 'prename', useritem.prename, 'email', useritem.email, 'birthday', useritem.birthday) AS user_information,
    json_build_object('id', address.id, 'street', address.street, 'house_number', address.house_number, 'postal_code', address.postal_code, 'city', address.city, 'extra', address.extra, 'country', address.country, 'state', address.state, 'user', useritem.id) AS address,
    ( SELECT count(*) AS count
           FROM smartbackend."user"
          WHERE ("user".id = useritem.id)) AS rolecounter,
    json_build_object('cvc', creditcard.cvc, 'creditcardnumber', creditcard.creditcardnumber, 'validthrough', creditcard.validthrough) AS creditcard,
    profile.current
   FROM smartbackend."user" useritem,
    ((profile
     FULL JOIN smartbackend.address ON ((address.id = profile.address)))
     FULL JOIN creditcard ON ((profile.creditid = creditcard.creditid)))
  WHERE (useritem.id = profile.id);


--
-- Name: offersupplier_view; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW offersupplier_view AS
 SELECT profile_view.address,
    profile_view.user_information,
    offer.id AS offerid,
    profile_view.id AS user_supplier
   FROM profile_view,
    offer
  WHERE ((offer.user_supplier = profile_view.id) AND (profile_view.role = 'supplier'::text));


--
-- Name: order; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE "order" (
    order_data jsonb,
    category uuid,
    user_customer uuid,
    user_supplier uuid,
    address_to uuid,
    address_from uuid,
    order_state integer,
    id integer DEFAULT nextval('order_id_seq'::regclass) NOT NULL,
    selected_offer integer
);


--
-- Name: order_state; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE order_state (
    status integer NOT NULL,
    value text,
    image text,
    description text
);


--
-- Name: order_view; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW order_view AS
 SELECT json_build_object('id', category.id, 'value', category.value, 'image', category.image) AS category,
    json_build_object('status', order_state.status, 'value', order_state.value, 'image', order_state.image, 'description', order_state.description) AS order_state,
    json_build_object('id', address_to.id, 'city', address_to.city, 'street', address_to.street, 'house_number', address_to.house_number, 'postal_code', address_to.postal_code, 'extra', address_to.extra, 'country', address_to.country, 'state', address_to.state, 'user', user_customer.id) AS address_to,
    json_build_object('id', address_from.id, 'city', address_from.city, 'street', address_from.street, 'house_number', address_from.house_number, 'postal_code', address_from.postal_code, 'extra', address_from.extra, 'country', address_from.country, 'state', address_from.state, 'user', user_customer.id) AS address_from,
    json_build_object('id', user_customer.id, 'role', user_customer.role) AS user_customer,
    ((json_build_object('id', orderitem.id))::jsonb || orderitem.order_data) AS order_data,
    ( SELECT o.offers
           FROM offer_view o
          WHERE (orderitem.id = o.orderid)) AS offers,
    orderitem.user_customer AS user_customer_id,
    orderitem.order_state AS order_state_status,
    orderitem.id
   FROM "order" orderitem,
    order_state,
    category,
    profile user_customer,
    smartbackend.address address_to,
    smartbackend.address address_from
  WHERE ((orderitem.category = category.id) AND (orderitem.user_customer = user_customer.id) AND (user_customer.role = 'customer'::text) AND (orderitem.address_to = address_to.id) AND (orderitem.address_from = address_from.id) AND (orderitem.order_state = order_state.status))
  ORDER BY orderitem.id;


--
-- Name: ordercustomer_view; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW ordercustomer_view AS
 SELECT profile_view.id AS user_customer,
    "order".id AS orderid,
    profile_view.address,
    profile_view.user_information
   FROM profile_view,
    "order"
  WHERE (("order".user_customer = profile_view.id) AND (profile_view.role = 'customer'::text));


--
-- Name: preference; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE preference (
    id integer NOT NULL,
    userid uuid,
    pref_type integer NOT NULL,
    chosenspec text,
    preforder integer
);


--
-- Name: preference_id_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE preference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preference_id_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE preference_id_seq OWNED BY preference.id;


--
-- Name: preference_type; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE preference_type (
    id integer NOT NULL,
    name text,
    spec json
);


--
-- Name: preference_type_id_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE preference_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preference_type_id_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE preference_type_id_seq OWNED BY preference_type.id;


--
-- Name: profile_address; Type: TABLE; Schema: smarttransport; Owner: -
--

CREATE TABLE profile_address (
    role text NOT NULL,
    address uuid NOT NULL,
    "user" uuid NOT NULL
);


--
-- Name: profile_address_view; Type: VIEW; Schema: smarttransport; Owner: -
--

CREATE VIEW profile_address_view AS
 SELECT address.street,
    address.postal_code,
    address.house_number,
    address.city,
    address.state,
    address.country,
    address.extra,
    address.id,
    profile_address."user"
   FROM profile_address,
    smartbackend.address
  WHERE (address.id = profile_address.address);


--
-- Name: rating_order_seq; Type: SEQUENCE; Schema: smarttransport; Owner: -
--

CREATE SEQUENCE rating_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rating_order_seq; Type: SEQUENCE OWNED BY; Schema: smarttransport; Owner: -
--

ALTER SEQUENCE rating_order_seq OWNED BY rating."order";


SET search_path = borrowit, pg_catalog;

--
-- Name: ratingid; Type: DEFAULT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY rating ALTER COLUMN ratingid SET DEFAULT nextval('smartbackend.rating_ratingid_seq'::regclass);


--
-- Name: rid; Type: DEFAULT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY request ALTER COLUMN rid SET DEFAULT nextval('request_rid_seq'::regclass);


SET search_path = smartbackend, pg_catalog;

--
-- Name: ratingid; Type: DEFAULT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY rating ALTER COLUMN ratingid SET DEFAULT nextval('rating_ratingid_seq'::regclass);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Investition" ALTER COLUMN id SET DEFAULT nextval('"Investition_id_seq"'::regclass);


--
-- Name: versicherungID; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Investition" ALTER COLUMN "versicherungID" SET DEFAULT nextval('"Investition_versicherungID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Kommentar" ALTER COLUMN id SET DEFAULT nextval('"Kommentar_id_seq"'::regclass);


--
-- Name: versicherungID; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Kommentar" ALTER COLUMN "versicherungID" SET DEFAULT nextval('"Kommentar_versicherungID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall" ALTER COLUMN id SET DEFAULT nextval('"Schadensfall_id_seq"'::regclass);


--
-- Name: versicherungID; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall" ALTER COLUMN "versicherungID" SET DEFAULT nextval('"Schadensfall_versicherungID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall_Bild" ALTER COLUMN id SET DEFAULT nextval('"Schadensfall_Bild_ID_seq"'::regclass);


--
-- Name: schadensfallID; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall_Bild" ALTER COLUMN "schadensfallID" SET DEFAULT nextval('"Schadensfall_Bild_schadensfallID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Versicherung" ALTER COLUMN id SET DEFAULT nextval('"Versicherung_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Zahlungsstrom" ALTER COLUMN id SET DEFAULT nextval('"Zahlungsstrom_id_seq"'::regclass);


--
-- Name: versicherungID; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Zahlungsstrom" ALTER COLUMN "versicherungID" SET DEFAULT nextval('"Zahlungsstrom_versicherungID_seq"'::regclass);


--
-- Name: ratingid; Type: DEFAULT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY rating ALTER COLUMN ratingid SET DEFAULT nextval('smartbackend.rating_ratingid_seq'::regclass);


SET search_path = smarttourismus, pg_catalog;

--
-- Name: ratingid; Type: DEFAULT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY rating ALTER COLUMN ratingid SET DEFAULT nextval('smartbackend.rating_ratingid_seq'::regclass);


SET search_path = smarttransport, pg_catalog;

--
-- Name: creditid; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY creditcard ALTER COLUMN creditid SET DEFAULT nextval('creditcard_creditid_seq'::regclass);


--
-- Name: honey; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey ALTER COLUMN honey SET DEFAULT nextval('honey_honey_seq'::regclass);


--
-- Name: honey_type; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey ALTER COLUMN honey_type SET DEFAULT nextval('honey_honey_type_seq'::regclass);


--
-- Name: honey; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey_type ALTER COLUMN honey SET DEFAULT nextval('honey_type_honey_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY preference ALTER COLUMN id SET DEFAULT nextval('preference_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY preference_type ALTER COLUMN id SET DEFAULT nextval('preference_type_id_seq'::regclass);


--
-- Name: ratingid; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY rating ALTER COLUMN ratingid SET DEFAULT nextval('smartbackend.rating_ratingid_seq'::regclass);


--
-- Name: order; Type: DEFAULT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY rating ALTER COLUMN "order" SET DEFAULT nextval('rating_order_seq'::regclass);


SET search_path = borrowit, pg_catalog;

--
-- Name: address_pkey; Type: CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (uid, aid);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (ratingid);


--
-- Name: request_pkey; Type: CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (rid);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (uid);


--
-- Name: user_unique_telephone; Type: CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_unique_telephone UNIQUE (telephone);


SET search_path = smartbackend, pg_catalog;

--
-- Name: address_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: chat_room_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY chat_room
    ADD CONSTRAINT chat_room_pkey PRIMARY KEY (id);


--
-- Name: chat_room_user_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY chat_room_user
    ADD CONSTRAINT chat_room_user_pkey PRIMARY KEY (roomid, user_id);


--
-- Name: fileupload_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY fileupload
    ADD CONSTRAINT fileupload_pkey PRIMARY KEY (id);


--
-- Name: id_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY push_notification
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (ratingid);


--
-- Name: user_device_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY push_user_device
    ADD CONSTRAINT user_device_pkey PRIMARY KEY (userid, deviceid);


--
-- Name: user_email_key; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user_friends_pkey2; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY user_friends
    ADD CONSTRAINT user_friends_pkey2 PRIMARY KEY (userid, friendid);


--
-- Name: user_password_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY user_password
    ADD CONSTRAINT user_password_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_token_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY user_token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (fk_user, access_provider);


SET search_path = smarthandwerk, pg_catalog;

--
-- Name: attributecatalog_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY attributecatalog
    ADD CONSTRAINT attributecatalog_pkey PRIMARY KEY (id);


--
-- Name: attributeitem_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY attributeitem
    ADD CONSTRAINT attributeitem_pkey PRIMARY KEY (id);


--
-- Name: offer_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY offer
    ADD CONSTRAINT offer_pkey PRIMARY KEY (id);


--
-- Name: offeritem_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY offeritem
    ADD CONSTRAINT offeritem_pkey PRIMARY KEY (id);


--
-- Name: package_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: packageitem_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY packageitem
    ADD CONSTRAINT packageitem_pkey PRIMARY KEY (id);


--
-- Name: productcatalog_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY productcatalog
    ADD CONSTRAINT productcatalog_pkey PRIMARY KEY (id);


--
-- Name: productcategorycatalog_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY productcategorycatalog
    ADD CONSTRAINT productcategorycatalog_pkey PRIMARY KEY (id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (ratingid);


--
-- Name: request_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- Name: requestitem_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY requestitem
    ADD CONSTRAINT requestitem_pkey PRIMARY KEY (id);


--
-- Name: requestuserpreference_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY requestuserpreference
    ADD CONSTRAINT requestuserpreference_pkey PRIMARY KEY (user_id, request_id);


--
-- Name: skill_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (user_id, skillcatalog_id);


--
-- Name: skillcatalog_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY skillcatalog
    ADD CONSTRAINT skillcatalog_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: Investition_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Investition"
    ADD CONSTRAINT "Investition_pkey" PRIMARY KEY (id);


--
-- Name: Kommentar_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Kommentar"
    ADD CONSTRAINT "Kommentar_pkey" PRIMARY KEY (id);


--
-- Name: Schadensfall_Bild_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall_Bild"
    ADD CONSTRAINT "Schadensfall_Bild_pkey" PRIMARY KEY (id);


--
-- Name: Schadensfall_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall"
    ADD CONSTRAINT "Schadensfall_pkey" PRIMARY KEY (id);


--
-- Name: Versicherung_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Versicherung"
    ADD CONSTRAINT "Versicherung_pkey" PRIMARY KEY (id);


--
-- Name: Zahlungsstrom_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Zahlungsstrom"
    ADD CONSTRAINT "Zahlungsstrom_pkey" PRIMARY KEY (id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (ratingid);


--
-- Name: userbank_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY userbank
    ADD CONSTRAINT userbank_pkey PRIMARY KEY (id);


SET search_path = smarttourismus, pg_catalog;

--
-- Name: location_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pk PRIMARY KEY (id);


--
-- Name: match_id_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY match
    ADD CONSTRAINT match_id_pk PRIMARY KEY (id);


--
-- Name: match_user_id_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY match2user
    ADD CONSTRAINT match_user_id_pk PRIMARY KEY (user_id, match);


--
-- Name: party_pkey; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_pkey PRIMARY KEY (id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (ratingid);


--
-- Name: tag_id_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tag_id_pk PRIMARY KEY (id);


--
-- Name: tags2location_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags2location
    ADD CONSTRAINT tags2location_pk PRIMARY KEY (tagid, locationid);


--
-- Name: tags2party_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags2party
    ADD CONSTRAINT tags2party_pk PRIMARY KEY (tagid, partyid);


--
-- Name: userratingid_pk; Type: CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY user_rating
    ADD CONSTRAINT userratingid_pk PRIMARY KEY (id);


SET search_path = smarttransport, pg_catalog;

--
-- Name: creditcard_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY creditcard
    ADD CONSTRAINT creditcard_pkey PRIMARY KEY (creditid);


--
-- Name: customer_order_machting_supplier_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY customer_order_machting_supplier
    ADD CONSTRAINT customer_order_machting_supplier_pkey PRIMARY KEY ("order", user_supplier);


--
-- Name: honey_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey
    ADD CONSTRAINT honey_pkey PRIMARY KEY (honey);


--
-- Name: honey_type_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey_type
    ADD CONSTRAINT honey_type_pkey PRIMARY KEY (honey);


--
-- Name: offer_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY offer
    ADD CONSTRAINT offer_pkey PRIMARY KEY (id);


--
-- Name: offer_status_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY offer_state
    ADD CONSTRAINT offer_status_pkey PRIMARY KEY (status);


--
-- Name: order_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_status_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY order_state
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (status);


--
-- Name: preference_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY preference
    ADD CONSTRAINT preference_pkey PRIMARY KEY (id);


--
-- Name: preference_type_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY preference_type
    ADD CONSTRAINT preference_type_pkey PRIMARY KEY (id);


--
-- Name: profile_address_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile_address
    ADD CONSTRAINT profile_address_pkey PRIMARY KEY (role, address);


--
-- Name: profile_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id, role);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (ratingid);


--
-- Name: smarttransport_order_category_pkey; Type: CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY category
    ADD CONSTRAINT smarttransport_order_category_pkey PRIMARY KEY (id);


SET search_path = borrowit, pg_catalog;

--
-- Name: fki_rating_fkey_rated_by; Type: INDEX; Schema: borrowit; Owner: -
--

CREATE INDEX fki_rating_fkey_rated_by ON rating USING btree (rated_by);


--
-- Name: fki_rating_fkey_request; Type: INDEX; Schema: borrowit; Owner: -
--

CREATE INDEX fki_rating_fkey_request ON rating USING btree (request);


SET search_path = smarttourismus, pg_catalog;

--
-- Name: fki_address_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_address_fk ON party USING btree (address);


--
-- Name: fki_for_user_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_for_user_fk ON user_rating USING btree (for_user);


--
-- Name: fki_from_user_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_from_user_fk ON user_rating USING btree (from_user);


--
-- Name: fki_location_address_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_location_address_fk ON location USING btree (address);


--
-- Name: fki_location_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_location_fk ON tags2location USING btree (locationid);


--
-- Name: fki_location_party_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_location_party_fk ON party USING btree (location);


--
-- Name: fki_match2user_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_match2user_fk ON match2user USING btree (match);


--
-- Name: fki_match_location_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_match_location_fk ON match USING btree (location);


--
-- Name: fki_match_party; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_match_party ON match USING btree (party);


--
-- Name: fki_partyId_fk; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX "fki_partyId_fk" ON tags2party USING btree (partyid);


--
-- Name: fki_provider_user; Type: INDEX; Schema: smarttourismus; Owner: -
--

CREATE INDEX fki_provider_user ON location USING btree (provider);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: _RETURN; Type: RULE; Schema: smartinsurance; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO "VersicherungPerson" DO INSTEAD  SELECT v.id,
    v.name,
    v.versicherungshoehe,
    v.beitrag,
    v.beschreibung,
    v."abschlussZeitpunkt",
    v."kuendigungsZeitpunkt",
    v."istGekuendigt",
    v."wirdGekuendigt",
    v."personID",
    v.kategorie,
    p.name AS "personName",
    p.prename AS "personPrename",
    COALESCE(sum(i.investitionshoehe), '0,00 €'::money) AS suminvestition
   FROM (("Versicherung" v
     JOIN smartbackend."user" p ON ((v."personID" = p.id)))
     LEFT JOIN ( SELECT "Investition"."versicherungID",
            "Investition".investitionshoehe
           FROM "Investition"
          WHERE ("Investition"."istGekuendigt" = false)) i ON ((v.id = i."versicherungID")))
  GROUP BY v.id, p.name, p.prename
  ORDER BY v."istGekuendigt", COALESCE(sum(i.investitionshoehe), '0,00 €'::money) DESC, v.versicherungshoehe DESC;


--
-- Name: _RETURN; Type: RULE; Schema: smartinsurance; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO "Gewinnberechnung" DO INSTEAD  SELECT p.prename,
    p.name,
    p.id,
    (('-1'::integer * sum(z.betrag)) - ip.investitionssumme) AS gewinn
   FROM (("Zahlungsstrom" z
     JOIN smartbackend."user" p ON ((z."personID" = p.id)))
     JOIN ( SELECT sum("Investition".investitionshoehe) AS investitionssumme,
            "Investition"."personID"
           FROM "Investition"
          GROUP BY "Investition"."personID") ip ON ((ip."personID" = z."personID")))
  GROUP BY p.id, ip.investitionssumme;


SET search_path = borrowit, pg_catalog;

--
-- Name: address_fkey_aid; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_fkey_aid FOREIGN KEY (aid) REFERENCES smartbackend.address(id) ON DELETE CASCADE;


--
-- Name: address_fkey_uid; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_fkey_uid FOREIGN KEY (uid) REFERENCES smartbackend."user"(id) ON DELETE CASCADE;


--
-- Name: rating_fkey_rated_by; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_fkey_rated_by FOREIGN KEY (rated_by) REFERENCES smartbackend."user"(id);


--
-- Name: rating_fkey_request; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_fkey_request FOREIGN KEY (request) REFERENCES request(rid);


--
-- Name: rating_userid_fkey; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- Name: request_fkey_borrower; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_fkey_borrower FOREIGN KEY (borrower) REFERENCES smartbackend."user"(id);


--
-- Name: request_fkey_lender; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_fkey_lender FOREIGN KEY (lender) REFERENCES smartbackend."user"(id);


--
-- Name: user_fkey_current_address; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_fkey_current_address FOREIGN KEY (currentaddress) REFERENCES smartbackend.address(id) ON DELETE CASCADE;


--
-- Name: user_fkey_uid; Type: FK CONSTRAINT; Schema: borrowit; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_fkey_uid FOREIGN KEY (uid) REFERENCES smartbackend."user"(id) ON DELETE CASCADE;


SET search_path = smartbackend, pg_catalog;

--
-- Name: chat_message_roomid_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY chat_message
    ADD CONSTRAINT chat_message_roomid_fkey FOREIGN KEY (roomid) REFERENCES chat_room(id);


--
-- Name: chat_message_senderid_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY chat_message
    ADD CONSTRAINT chat_message_senderid_fkey FOREIGN KEY (senderid) REFERENCES "user"(id);


--
-- Name: chat_room_user_roomid_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY chat_room_user
    ADD CONSTRAINT chat_room_user_roomid_fkey FOREIGN KEY (roomid) REFERENCES chat_room(id) ON DELETE CASCADE;


--
-- Name: chat_room_user_user_id_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY chat_room_user
    ADD CONSTRAINT chat_room_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;


--
-- Name: fileupload_userId_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY fileupload
    ADD CONSTRAINT "fileupload_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"(id);


--
-- Name: rating_userid_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_userid_fkey FOREIGN KEY (userid) REFERENCES "user"(id);


--
-- Name: user_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY push_user_device
    ADD CONSTRAINT user_fkey FOREIGN KEY (userid) REFERENCES "user"(id) ON DELETE CASCADE;


--
-- Name: user_friends_friendid_fkey2; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY user_friends
    ADD CONSTRAINT user_friends_friendid_fkey2 FOREIGN KEY (friendid) REFERENCES "user"(id);


--
-- Name: user_friends_userid_fkey2; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY user_friends
    ADD CONSTRAINT user_friends_userid_fkey2 FOREIGN KEY (userid) REFERENCES "user"(id);


--
-- Name: user_token_fk_user_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY user_token
    ADD CONSTRAINT user_token_fk_user_fkey FOREIGN KEY (fk_user) REFERENCES "user"(id);


--
-- Name: userid_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY push_notification
    ADD CONSTRAINT userid_fkey FOREIGN KEY (userid) REFERENCES "user"(id) ON DELETE CASCADE;


SET search_path = smarthandwerk, pg_catalog;

--
-- Name: address_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT address_id_fkey FOREIGN KEY (address_id) REFERENCES smartbackend.address(id);


--
-- Name: attrcatalog_id; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY attributeitem
    ADD CONSTRAINT attrcatalog_id FOREIGN KEY (attributcatalog) REFERENCES attributecatalog(id);


--
-- Name: attributecatalog_productcatalog_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY attributecatalog
    ADD CONSTRAINT attributecatalog_productcatalog_id_fkey FOREIGN KEY (productcatalog_id) REFERENCES productcatalog(id);


--
-- Name: offer_user_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY offer
    ADD CONSTRAINT offer_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: offeritem_offer_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY offeritem
    ADD CONSTRAINT offeritem_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES offer(id);


--
-- Name: offeritem_requestitem_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY offeritem
    ADD CONSTRAINT offeritem_requestitem_id_fkey FOREIGN KEY (requestitem_id) REFERENCES requestitem(id);


--
-- Name: package_request_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY package
    ADD CONSTRAINT package_request_id_fkey FOREIGN KEY (request_id) REFERENCES request(id);


--
-- Name: packageitem_offeritem_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY packageitem
    ADD CONSTRAINT packageitem_offeritem_id_fkey FOREIGN KEY (offeritem_id) REFERENCES offeritem(id);


--
-- Name: packageitem_package_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY packageitem
    ADD CONSTRAINT packageitem_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: productcatalog_productcategorycatalog_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY productcatalog
    ADD CONSTRAINT productcatalog_productcategorycatalog_id_fkey FOREIGN KEY (productcategorycatalog_id) REFERENCES productcategorycatalog(id);


--
-- Name: rating_evaluator_user_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_evaluator_user_id_fkey FOREIGN KEY (evaluator_user_id) REFERENCES smartbackend."user"(id);


--
-- Name: rating_package_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: rating_userid_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- Name: request_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_id_fkey FOREIGN KEY (user_id) REFERENCES smartbackend."user"(id);


--
-- Name: requestitem_id; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY attributeitem
    ADD CONSTRAINT requestitem_id FOREIGN KEY (requestitem) REFERENCES requestitem(id);


--
-- Name: requestitem_request_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY requestitem
    ADD CONSTRAINT requestitem_request_id_fkey FOREIGN KEY (request_id) REFERENCES request(id);


--
-- Name: requestuserpreference_request_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY requestuserpreference
    ADD CONSTRAINT requestuserpreference_request_id_fkey FOREIGN KEY (request_id) REFERENCES request(id);


--
-- Name: requestuserpreference_user_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY requestuserpreference
    ADD CONSTRAINT requestuserpreference_user_id_fkey FOREIGN KEY (user_id) REFERENCES smartbackend."user"(id);


--
-- Name: skill_skillcatalog_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_skillcatalog_id_fkey FOREIGN KEY (skillcatalog_id) REFERENCES skillcatalog(id);


--
-- Name: skill_user_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: user_id_fkey; Type: FK CONSTRAINT; Schema: smarthandwerk; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (id) REFERENCES smartbackend."user"(id);


SET search_path = smartinsurance, pg_catalog;

--
-- Name: Investition_personID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Investition"
    ADD CONSTRAINT "Investition_personID_fkey" FOREIGN KEY ("personID") REFERENCES smartbackend."user"(id);


--
-- Name: Investition_versicherungID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Investition"
    ADD CONSTRAINT "Investition_versicherungID_fkey" FOREIGN KEY ("versicherungID") REFERENCES "Versicherung"(id);


--
-- Name: Kommentar_personID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Kommentar"
    ADD CONSTRAINT "Kommentar_personID_fkey" FOREIGN KEY ("personID") REFERENCES smartbackend."user"(id);


--
-- Name: Kommentar_versicherungID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Kommentar"
    ADD CONSTRAINT "Kommentar_versicherungID_fkey" FOREIGN KEY ("versicherungID") REFERENCES "Versicherung"(id);


--
-- Name: Schadensfall_Bild_schadensfallID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall_Bild"
    ADD CONSTRAINT "Schadensfall_Bild_schadensfallID_fkey" FOREIGN KEY ("schadensfallID") REFERENCES "Schadensfall"(id);


--
-- Name: Schadensfall_versicherungID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Schadensfall"
    ADD CONSTRAINT "Schadensfall_versicherungID_fkey" FOREIGN KEY ("versicherungID") REFERENCES "Versicherung"(id);


--
-- Name: Versicherung_personID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Versicherung"
    ADD CONSTRAINT "Versicherung_personID_fkey" FOREIGN KEY ("personID") REFERENCES smartbackend."user"(id);


--
-- Name: Zahlungsstrom_personID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Zahlungsstrom"
    ADD CONSTRAINT "Zahlungsstrom_personID_fkey" FOREIGN KEY ("personID") REFERENCES smartbackend."user"(id);


--
-- Name: Zahlungsstrom_versicherungID_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY "Zahlungsstrom"
    ADD CONSTRAINT "Zahlungsstrom_versicherungID_fkey" FOREIGN KEY ("versicherungID") REFERENCES "Versicherung"(id);


--
-- Name: rating_userid_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- Name: userbank_id_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY userbank
    ADD CONSTRAINT userbank_id_fkey FOREIGN KEY (id) REFERENCES smartbackend."user"(id);


SET search_path = smarttourismus, pg_catalog;

--
-- Name: address_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY party
    ADD CONSTRAINT address_fk FOREIGN KEY (address) REFERENCES smartbackend.address(id);


--
-- Name: for_user_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY user_rating
    ADD CONSTRAINT for_user_fk FOREIGN KEY (for_user) REFERENCES smartbackend."user"(id);


--
-- Name: from_user_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY user_rating
    ADD CONSTRAINT from_user_fk FOREIGN KEY (from_user) REFERENCES smartbackend."user"(id);


--
-- Name: location_address_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_address_fk FOREIGN KEY (address) REFERENCES smartbackend.address(id);


--
-- Name: location_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags2location
    ADD CONSTRAINT location_fk FOREIGN KEY (locationid) REFERENCES location(id);


--
-- Name: location_party_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY party
    ADD CONSTRAINT location_party_fk FOREIGN KEY (location) REFERENCES location(id);


--
-- Name: match2user_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY match2user
    ADD CONSTRAINT match2user_fk FOREIGN KEY (match) REFERENCES match(id);


--
-- Name: match_location_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY match
    ADD CONSTRAINT match_location_fk FOREIGN KEY (location) REFERENCES location(id);


--
-- Name: match_party; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY match
    ADD CONSTRAINT match_party FOREIGN KEY (party) REFERENCES party(id);


--
-- Name: partyId_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags2party
    ADD CONSTRAINT "partyId_fk" FOREIGN KEY (partyid) REFERENCES party(id);


--
-- Name: party_address_fkey; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_address_fkey FOREIGN KEY (address) REFERENCES smartbackend.address(id);


--
-- Name: provider_user; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY location
    ADD CONSTRAINT provider_user FOREIGN KEY (provider) REFERENCES smartbackend."user"(id);


--
-- Name: rating_userid_fkey; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- Name: tagId_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags2location
    ADD CONSTRAINT "tagId_fk" FOREIGN KEY (tagid) REFERENCES tags(id);


--
-- Name: tagsid_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY tags2party
    ADD CONSTRAINT tagsid_fk FOREIGN KEY (tagid) REFERENCES tags(id);


--
-- Name: user2match_fk; Type: FK CONSTRAINT; Schema: smarttourismus; Owner: -
--

ALTER TABLE ONLY match2user
    ADD CONSTRAINT user2match_fk FOREIGN KEY (user_id) REFERENCES smartbackend."user"(id);


SET search_path = smarttransport, pg_catalog;

--
-- Name: creditcard_userid_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY creditcard
    ADD CONSTRAINT creditcard_userid_fkey FOREIGN KEY ("user") REFERENCES smartbackend."user"(id);


--
-- Name: customer_order_machting_supplier_order_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY customer_order_machting_supplier
    ADD CONSTRAINT customer_order_machting_supplier_order_fkey FOREIGN KEY ("order") REFERENCES "order"(id);


--
-- Name: honey_honey_type_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey
    ADD CONSTRAINT honey_honey_type_fkey FOREIGN KEY (honey_type) REFERENCES honey_type(honey);


--
-- Name: honey_userid_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY honey
    ADD CONSTRAINT honey_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- Name: offer_offer_state_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY offer
    ADD CONSTRAINT offer_offer_state_fkey FOREIGN KEY (offer_state) REFERENCES offer_state(status);


--
-- Name: offer_order_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY offer
    ADD CONSTRAINT offer_order_fkey FOREIGN KEY (orderid) REFERENCES "order"(id);


--
-- Name: offer_user_supplier_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY offer
    ADD CONSTRAINT offer_user_supplier_fkey FOREIGN KEY (user_supplier) REFERENCES smartbackend."user"(id);


--
-- Name: order_fk_address_from_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk_address_from_fkey FOREIGN KEY (address_from) REFERENCES smartbackend.address(id);


--
-- Name: order_fk_address_to_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk_address_to_fkey FOREIGN KEY (address_to) REFERENCES smartbackend.address(id);


--
-- Name: order_fk_category_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk_category_fkey FOREIGN KEY (category) REFERENCES category(id);


--
-- Name: order_order_state_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_order_state_fkey FOREIGN KEY (order_state) REFERENCES order_state(status);


--
-- Name: order_user_supplier_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_user_supplier_fkey FOREIGN KEY (user_supplier) REFERENCES smartbackend."user"(id);


--
-- Name: preference_pref_type_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY preference
    ADD CONSTRAINT preference_pref_type_fkey FOREIGN KEY (pref_type) REFERENCES preference_type(id);


--
-- Name: preference_userid_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY preference
    ADD CONSTRAINT preference_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- Name: profile_address_address_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile_address
    ADD CONSTRAINT profile_address_address_fkey FOREIGN KEY (address) REFERENCES smartbackend.address(id);


--
-- Name: profile_address_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_address_fkey FOREIGN KEY (address) REFERENCES smartbackend.address(id);


--
-- Name: profile_address_user_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile_address
    ADD CONSTRAINT profile_address_user_fkey FOREIGN KEY ("user") REFERENCES smartbackend."user"(id);


--
-- Name: profile_creditid_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_creditid_fkey FOREIGN KEY (creditid) REFERENCES creditcard(creditid);


--
-- Name: profile_id_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_id_fkey FOREIGN KEY (id) REFERENCES smartbackend."user"(id);


--
-- Name: rating_userid_fkey; Type: FK CONSTRAINT; Schema: smarttransport; Owner: -
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_userid_fkey FOREIGN KEY (userid) REFERENCES smartbackend."user"(id);


--
-- PostgreSQL database dump complete
--

