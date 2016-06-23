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
-- Name: smartbackend; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smartbackend;


--
-- Name: smartinsurance; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA smartinsurance;


SET search_path = smartbackend, pg_catalog;

--
-- Name: messagetype; Type: TYPE; Schema: smartbackend; Owner: -
--

CREATE TYPE messagetype AS ENUM (
    'textmessage',
    'imagemessage',
    'filemessage'
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
    user_id integer NOT NULL
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
-- Name: user_password_view; Type: VIEW; Schema: smartbackend; Owner: -
--

CREATE VIEW user_password_view AS
 SELECT "user".email,
    "user".id,
    user_password.salt
   FROM "user",
    user_password
  WHERE ("user".id = user_password.id);


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
-- Name: id_pkey; Type: CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY push_notification
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);


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
-- Name: userbank_pkey; Type: CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY userbank
    ADD CONSTRAINT userbank_pkey PRIMARY KEY (id);


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
-- Name: user_fkey; Type: FK CONSTRAINT; Schema: smartbackend; Owner: -
--

ALTER TABLE ONLY push_user_device
    ADD CONSTRAINT user_fkey FOREIGN KEY (userid) REFERENCES "user"(id) ON DELETE CASCADE;


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
-- Name: userbank_id_fkey; Type: FK CONSTRAINT; Schema: smartinsurance; Owner: -
--

ALTER TABLE ONLY userbank
    ADD CONSTRAINT userbank_id_fkey FOREIGN KEY (id) REFERENCES smartbackend."user"(id);


--
-- PostgreSQL database dump complete
--

