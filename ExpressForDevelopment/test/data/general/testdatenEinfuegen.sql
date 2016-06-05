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

SET search_path = smartbackend, pg_catalog;

--
-- Data for Name: user; Type: TABLE DATA; Schema: smartbackend; Owner: -
--

COPY "user" (id, name, prename, email) FROM stdin;
e99aac00-20e4-11e6-84dc-3323f278ed3e	alex	test	alex@test.de
7c2d0bbc-211c-11e6-83d6-a3085a5936a7	Müller	Peter	peter@mueller
bfa5c664-21f7-11e6-b56d-73450709a8e5	Cooper	Kelly	Kelly.Cooper@gmx.net
bfa61cea-21f7-11e6-b56d-8b923d3e9760	Elliott	Edward	Edward.Elliott@gmail.com
bfa673de-21f7-11e6-b56d-4b52f205267c	Porter	Howard	Howard.Porter@gmail.com
bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Cock	Chris	Chris.Cock@gmail.de
bfa71cee-21f7-11e6-b56d-7f8d96386388	Peterson	Steven	Steven.Peterson@yahoo.net
bfa72162-21f7-11e6-b56d-7f43c37583e3	Jordan	Matthew	Matthew.Jordan@gmx.net
bfa722c0-21f7-11e6-b56d-abf2eca71577	Reynolds	Donald	Donald.Reynolds@yahoo.com
bfa723ec-21f7-11e6-b56d-37d7a01b5dce	Anderson	Joe	Joe.Anderson@aol.net
bfa724fa-21f7-11e6-b56d-4fad22464cda	Gray	Maria	Maria.Gray@gmx.de
bfa7261c-21f7-11e6-b56d-874e5a05fbd2	Burns	John	John.Burns@gmail.de
bfa72734-21f7-11e6-b56d-93a91bf620e3	Torres	Denise	Denise.Torres@gmail.com
bfa7284c-21f7-11e6-b56d-5b69ee83fd33	Moore	Jane	Jane.Moore@gmx.com
bfa72964-21f7-11e6-b56d-8307017ae38f	Cunningham	Rose	Rose.Cunningham@gmx.fr
bfa72ac2-21f7-11e6-b56d-ab66500b8b61	Akira	Asa	Asa.Akira@yahoo.de
bfa72bda-21f7-11e6-b56d-67d1116191c5	Wood	Tyler	Tyler.Wood@gmx.net
bfa72cfc-21f7-11e6-b56d-0735fabc0fd5	Nelson	Ryan	Ryan.Nelson@gmail.fr
bfa72e14-21f7-11e6-b56d-b3cee214d248	Black	Judy	Judy.Black@aol.net
bfa72f22-21f7-11e6-b56d-7b6976149c67	Morris	Michael	Michael.Morris@aol.fr
bfa73044-21f7-11e6-b56d-2b3fe81ca7de	Chapman	Jeffrey	Jeffrey.Chapman@aol.net
bfa73152-21f7-11e6-b56d-573359ede64c	Sims	Christopher	Christopher.Sims@aol.fr
bfa73260-21f7-11e6-b56d-23707165c072	Mack	Christy	Christy.Mack@aol.net
bfa7336e-21f7-11e6-b56d-67b01fd20198	Collins	Gerald	Gerald.Collins@aol.fr
bfa73486-21f7-11e6-b56d-976077133f5c	Deen	James	James.Deen@aol.com
bfa73594-21f7-11e6-b56d-f380173597c5	Crawford	Samuel	Samuel.Crawford@gmx.com
bfa736a2-21f7-11e6-b56d-bfd5f549015b	Jacobs	Andrew	Andrew.Jacobs@aol.fr
bfa737ba-21f7-11e6-b56d-db1875cd5c9f	Jordan	Mary	Mary.Jordan@aol.de
bfa738c8-21f7-11e6-b56d-07036757eda0	Russell	Antonio	Antonio.Russell@aol.net
bfa739ea-21f7-11e6-b56d-23e40d5fa4fe	Freeman	Cynthia	Cynthia.Freeman@yahoo.net
bfa73b02-21f7-11e6-b56d-6ffe69564a95	Hardwood	Lance	Lance.Hardwood@gmail.net
bfa73c10-21f7-11e6-b56d-3ffae2c4d6d6	Cole	Ann	Ann.Cole@gmail.fr
bfa73d1e-21f7-11e6-b56d-634f726bfbfe	Lewis	Carolyn	Carolyn.Lewis@aol.de
bfa73e36-21f7-11e6-b56d-4b20bc587983	Beem	Jim	Jim.Beem@gmx.net
bfa73f4e-21f7-11e6-b56d-376e6904b4e3	Andrews	Ralph	Ralph.Andrews@gmx.fr
bfa7405c-21f7-11e6-b56d-1723c04fd473	Welch	Paula	Paula.Welch@yahoo.de
bfa7416a-21f7-11e6-b56d-8f2a91ce2fe7	Fuller	Russell	Russell.Fuller@gmx.de
bfa74278-21f7-11e6-b56d-a7c7776e0c3b	Nguyen	Harry	Harry.Nguyen@yahoo.com
bfa743c2-21f7-11e6-b56d-c7e128bbe319	Spencer	Diana	Diana.Spencer@yahoo.com
bfa744d0-21f7-11e6-b56d-d78e72323a85	Johnston	Marie	Marie.Johnston@yahoo.com
bfa745de-21f7-11e6-b56d-631adb2789e7	Reyes	Barbara	Barbara.Reyes@yahoo.de
bfa746f6-21f7-11e6-b56d-f79f448181ad	Davis	Louis	Louis.Davis@gmx.net
bfa74804-21f7-11e6-b56d-8ff320d9df88	Perry	Nicole	Nicole.Perry@aol.de
bfa74912-21f7-11e6-b56d-bf6a97634e5f	Oliver	Willie	Willie.Oliver@gmail.fr
bfa74a2a-21f7-11e6-b56d-fbe2bb11b8ed	Roberts	Jerry	Jerry.Roberts@aol.de
bfa74b42-21f7-11e6-b56d-3fc0e6222812	Richardson	Adam	Adam.Richardson@yahoo.fr
bfa74c50-21f7-11e6-b56d-3b5596298928	Chavez	Frank	Frank.Chavez@gmail.net
bfa74d68-21f7-11e6-b56d-df62cde6f0a8	Foster	Donna	Donna.Foster@gmail.net
bfa74e76-21f7-11e6-b56d-7be658bb0ff0	Hunt	Andrea	Andrea.Hunt@yahoo.de
bfa74f84-21f7-11e6-b56d-c3a4656812d8	Kardashian	Kim	Kim.Kardashian@yahoo.com
bfa7509c-21f7-11e6-b56d-2730f9ddc6fc	Stone	Paula	Paula.Stone@gmx.de
bfa751aa-21f7-11e6-b56d-73ab5f16ad0b	Jacobs	Harold	Harold.Jacobs@aol.de
bfa752b8-21f7-11e6-b56d-8fb47f63c480	Boyd	Krystal	Krystal.Boyd@aol.net
bfa753d0-21f7-11e6-b56d-8fa131c47c54	Foster	Christina	Christina.Foster@aol.com
bfa754de-21f7-11e6-b56d-1bd537e1ef79	Berry	Wanda	Wanda.Berry@gmx.com
bfa755ec-21f7-11e6-b56d-cf95064ed725	Hardwood	Pierre	Pierre.Hardwood@gmx.com
bfa756fa-21f7-11e6-b56d-57a0dd1e90c6	Ivy	Madison	Madison.Ivy@gmail.de
bfa75808-21f7-11e6-b56d-87a84630126c	Sanders	Joseph	Joseph.Sanders@aol.de
bfa7592a-21f7-11e6-b56d-83073ed80f77	Ward	Edward	Edward.Ward@aol.de
bfa75a38-21f7-11e6-b56d-5b115f18e747	Cole	Phillip	Phillip.Cole@gmail.com
bfa75b78-21f7-11e6-b56d-1bdfd3b841c8	Cox	Patricia	Patricia.Cox@yahoo.de
bfa75c86-21f7-11e6-b56d-c38795c8f6c6	Allen	Henry	Henry.Allen@aol.net
bfa75d9e-21f7-11e6-b56d-9bfbaf20b470	Hancock	Scott	Scott.Hancock@aol.net
bfa75eb6-21f7-11e6-b56d-4b5ece341d64	Powell	Andrew	Andrew.Powell@gmail.net
bfa75fce-21f7-11e6-b56d-b3fc1177e552	Nichols	Stephanie	Stephanie.Nichols@gmail.fr
bfa760e6-21f7-11e6-b56d-ffcf224d1875	Riley	Jack	Jack.Riley@gmx.net
bfa761fe-21f7-11e6-b56d-8f268e8feff7	Cole	Amanda	Amanda.Cole@aol.com
bfa76316-21f7-11e6-b56d-dfe90a7a730e	Diaz	Margaret	Margaret.Diaz@yahoo.net
bfa7642e-21f7-11e6-b56d-efff0f74a8da	Fowler	Aaron	Aaron.Fowler@aol.fr
bfa76546-21f7-11e6-b56d-9734714e149b	Black	Tori	Tori.Black@gmail.net
bfa76654-21f7-11e6-b56d-af7dec2cf543	Brooks	Kevin	Kevin.Brooks@gmail.net
bfa76780-21f7-11e6-b56d-c39065b432a6	Diaz	Tammy	Tammy.Diaz@yahoo.com
bfa7688e-21f7-11e6-b56d-9716ecd38e0d	Ramirez	Christina	Christina.Ramirez@gmx.de
bfa7699c-21f7-11e6-b56d-8f27082410c2	Owens	Julie	Julie.Owens@gmx.de
bfa76aaa-21f7-11e6-b56d-2f49599d1ddc	Webb	Nicole	Nicole.Webb@yahoo.fr
bfa76bc2-21f7-11e6-b56d-47050984e240	Andrews	Mary	Mary.Andrews@gmail.com
bfa76cd0-21f7-11e6-b56d-ef352eca08b2	Garrett	Michelle	Michelle.Garrett@gmx.net
bfa76dde-21f7-11e6-b56d-2b6a3bc3d508	Boyd	Brenda	Brenda.Boyd@aol.fr
bfa76eec-21f7-11e6-b56d-7f1a64255a9f	Scott	Harry	Harry.Scott@aol.fr
bfa76ffa-21f7-11e6-b56d-f72d2384b599	Peterson	Beverly	Beverly.Peterson@gmail.net
bfa77112-21f7-11e6-b56d-0bfd445a9f0d	Carter	Barbara	Barbara.Carter@gmx.net
bfa77220-21f7-11e6-b56d-b76efa9c5485	Sanders	Doris	Doris.Sanders@gmail.de
bfa77342-21f7-11e6-b56d-8f50aea6f60c	Lane	Anna	Anna.Lane@gmx.de
bfa77482-21f7-11e6-b56d-7b19e38631a0	Riley	Angela	Angela.Riley@aol.com
bfa7759a-21f7-11e6-b56d-b704d2d665c3	Mitchell	Jeremy	Jeremy.Mitchell@gmail.de
bfa776a8-21f7-11e6-b56d-bf7c05f5eab4	Washington	Linda	Linda.Washington@gmail.net
bfa777c0-21f7-11e6-b56d-e30f9fe96f06	Thomas	Tammy	Tammy.Thomas@gmail.com
bfa778c4-21f7-11e6-b56d-5b51486b28d0	Lacroix	Remy	Remy.Lacroix@aol.fr
bfa779dc-21f7-11e6-b56d-336bd235850c	Li	Alina	Alina.Li@yahoo.com
bfa77aea-21f7-11e6-b56d-0f436e7a8736	Sanchez	Robin	Robin.Sanchez@gmx.net
bfa77d42-21f7-11e6-b56d-4ba8afc93eac	Simmons	Samuel	Samuel.Simmons@yahoo.net
bfa77e82-21f7-11e6-b56d-cbcc6e4ac193	Phillips	Rose	Rose.Phillips@gmx.fr
bfa77f9a-21f7-11e6-b56d-af5d1f306cbe	Morris	Deborah	Deborah.Morris@gmail.fr
bfa780b2-21f7-11e6-b56d-cb777f36ffe1	Mcdonald	Jean	Jean.Mcdonald@gmx.de
bfa78436-21f7-11e6-b56d-1b1e3447377a	George	Beverly	Beverly.George@yahoo.net
bfa784ea-21f7-11e6-b56d-ffc3e007f27a	Stone	Justin	Justin.Stone@gmail.de
bfa78580-21f7-11e6-b56d-8be8d9a2d447	Torres	Dennis	Dennis.Torres@gmx.com
bfa7860c-21f7-11e6-b56d-bb83e93cae73	Hansen	Justin	Justin.Hansen@gmail.net
bfa786ac-21f7-11e6-b56d-4b323c47c792	Bell	Michelle	Michelle.Bell@aol.fr
bfa78dc8-21f7-11e6-b56d-ab7972e0159f	Carpenter	Brandon	Brandon.Carpenter@gmail.com
bfa78e7c-21f7-11e6-b56d-9f970c91eaa1	Oliver	Beverly	Beverly.Oliver@aol.com
bfa78f12-21f7-11e6-b56d-5b2406ad2921	Webb	Shawn	Shawn.Webb@gmail.com
bfa78f9e-21f7-11e6-b56d-b3d5b46f8dfd	Texas	Alexis	Alexis.Texas@aol.de
bfa79034-21f7-11e6-b56d-eba8f8126895	Willis	Dennis	Dennis.Willis@aol.net
bfa790ca-21f7-11e6-b56d-af8c70eebcde	Bailey	Kenneth	Kenneth.Bailey@gmx.net
bfa79174-21f7-11e6-b56d-f7a449cf1508	Perkins	Louis	Louis.Perkins@gmail.de
bfa7920a-21f7-11e6-b56d-93cbcda2c257	Hudson	Shawn	Shawn.Hudson@gmx.de
bfa79296-21f7-11e6-b56d-9b3c26679592	Barnes	Stephen	Stephen.Barnes@aol.fr
bfa7932c-21f7-11e6-b56d-cbcfbd2f52f7	Ryan	Kimberly	Kimberly.Ryan@gmx.net
bfa793c2-21f7-11e6-b56d-ff7ceff05a40	Hernandez	Christina	Christina.Hernandez@gmail.fr
bfa7944e-21f7-11e6-b56d-1b1ee66d05d6	Henderson	Andrea	Andrea.Henderson@aol.com
bfa794ee-21f7-11e6-b56d-539b862c93e9	Hardwood	Anthony	Anthony.Hardwood@gmx.net
bfa79584-21f7-11e6-b56d-a33c2f3768b1	Fernandez	Justin	Justin.Fernandez@gmail.de
bfa7961a-21f7-11e6-b56d-9b395a3f7667	Reynolds	Teresa	Teresa.Reynolds@aol.net
bfa796a6-21f7-11e6-b56d-bbfbbfdbacdd	Lynch	Judith	Judith.Lynch@gmail.com
bfa79732-21f7-11e6-b56d-4b1257631efb	Harvey	Sandra	Sandra.Harvey@gmx.com
bfa797be-21f7-11e6-b56d-6b0349f1a37c	Burke	Pamela	Pamela.Burke@gmail.com
bfa79854-21f7-11e6-b56d-df5e53ea3a24	Reed	Jessica	Jessica.Reed@aol.net
bfa798e0-21f7-11e6-b56d-037ef2c1c5d2	White	Kathryn	Kathryn.White@aol.fr
bfa79976-21f7-11e6-b56d-43aea9de5795	Turner	Samuel	Samuel.Turner@gmx.fr
bfa79a0c-21f7-11e6-b56d-9f0909a93777	Simmons	Ronald	Ronald.Simmons@yahoo.fr
bfa79a98-21f7-11e6-b56d-ff7b2041ba3b	Fowler	Alan	Alan.Fowler@aol.net
bfa79b24-21f7-11e6-b56d-bff796c576e3	Thompson	Amy	Amy.Thompson@aol.de
bfa79bba-21f7-11e6-b56d-cf4c1c0a1a9b	Cole	Donna	Donna.Cole@gmail.fr
bfa79c46-21f7-11e6-b56d-e7700fec30bb	Schmidt	Helen	Helen.Schmidt@gmx.net
bfa79cf0-21f7-11e6-b56d-4bcfc7e7f24f	Dixon	Teresa	Teresa.Dixon@gmx.fr
bfa79d86-21f7-11e6-b56d-57d6bc9c0740	Peterson	Fred	Fred.Peterson@yahoo.net
bfa79e30-21f7-11e6-b56d-ffd76a13a599	Jacobs	Donald	Donald.Jacobs@gmail.net
bfa79ec6-21f7-11e6-b56d-075281f33c19	Reyes	Victor	Victor.Reyes@aol.com
bfa79f52-21f7-11e6-b56d-8f54d6ad9d56	Lopez	Nicholas	Nicholas.Lopez@aol.de
bfa79fe8-21f7-11e6-b56d-2f226afd5627	Diaz	Clarence	Clarence.Diaz@aol.fr
bfa7a074-21f7-11e6-b56d-032936c92202	Hall	Kimberly	Kimberly.Hall@yahoo.de
bfa7a10a-21f7-11e6-b56d-ff9efb68438d	Oliver	Ruth	Ruth.Oliver@yahoo.fr
bfa7a196-21f7-11e6-b56d-2327a469d47f	Romero	Nicole	Nicole.Romero@yahoo.net
bfa7a222-21f7-11e6-b56d-e701e5df3f9f	Dean	Andrew	Andrew.Dean@yahoo.fr
bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4	Black	Matthew	Matthew.Black@gmx.fr
bfa7a34e-21f7-11e6-b56d-fb9606c667bd	Dixon	Joseph	Joseph.Dixon@gmail.com
bfa7a3da-21f7-11e6-b56d-4b400a09fb38	Griffin	Carolyn	Carolyn.Griffin@gmail.de
bfa7a466-21f7-11e6-b56d-c785d5c1441d	Jones	Ashley	Ashley.Jones@gmail.de
bfa7a4fc-21f7-11e6-b56d-33f700fd6bf3	Long	Kevin	Kevin.Long@aol.net
bfa7a588-21f7-11e6-b56d-c31b8df6e1e3	Jacobs	Harry	Harry.Jacobs@gmail.com
bfa7a61e-21f7-11e6-b56d-1ff1676715f7	Hart	Walter	Walter.Hart@yahoo.com
bfa7a6aa-21f7-11e6-b56d-c363e321d6f8	Cox	Michael J	Michael J.Cox@aol.de
bfa7a740-21f7-11e6-b56d-8b8db926119d	Powell	James	James.Powell@yahoo.com
bfa7a7cc-21f7-11e6-b56d-b7cf9319f9fd	Spencer	Mark	Mark.Spencer@gmx.de
bfa7a862-21f7-11e6-b56d-338b3242e48d	Hall	Brian	Brian.Hall@yahoo.com
bfa7a8f8-21f7-11e6-b56d-d3a4afcf5e5c	Cooper	Jack	Jack.Cooper@gmail.net
bfa7a98e-21f7-11e6-b56d-2b62cf1c52a4	Jenkins	Sarah	Sarah.Jenkins@aol.de
bfa7aa1a-21f7-11e6-b56d-f70c9158d240	Stone	Rose	Rose.Stone@gmx.de
bfa7aaa6-21f7-11e6-b56d-bb9b1b5fdbf1	Knight	Gerald	Gerald.Knight@gmx.com
bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc	Fox	Ashley	Ashley.Fox@aol.net
bfa7abdc-21f7-11e6-b56d-575c4cc6adef	Ellis	Walter	Walter.Ellis@yahoo.com
bfa7ac72-21f7-11e6-b56d-5bf92453f6ea	Hernandez	Janice	Janice.Hernandez@yahoo.net
bfa7acfe-21f7-11e6-b56d-cbd213c53ab6	Harris	Amy	Amy.Harris@yahoo.de
bfa7ad94-21f7-11e6-b56d-ab03a14093af	Butler	Albert	Albert.Butler@yahoo.net
bfa7ae20-21f7-11e6-b56d-1f6c9e1683ba	George	James	James.George@gmail.com
bfa7aeac-21f7-11e6-b56d-d39fb0e9ca4f	Croft	Lana	Lana.Croft@yahoo.de
bfa7af38-21f7-11e6-b56d-4b717dee22f6	Duncan	Beverly	Beverly.Duncan@gmail.fr
bfa7afc4-21f7-11e6-b56d-6b86f154f11a	Evans	Jerry	Jerry.Evans@aol.de
bfa7b064-21f7-11e6-b56d-27ab8947369a	Ryan	Daniel	Daniel.Ryan@aol.de
bfa7b0fa-21f7-11e6-b56d-43b9f79702ef	Medina	Victor	Victor.Medina@gmx.fr
bfa7b190-21f7-11e6-b56d-fb112a74b89a	Murray	Joan	Joan.Murray@gmx.net
bfa7b21c-21f7-11e6-b56d-1768030df228	Schmidt	Steven	Steven.Schmidt@gmx.fr
bfa7b2a8-21f7-11e6-b56d-4bd3d015a0b6	Lawson	Clarence	Clarence.Lawson@yahoo.de
bfa7b33e-21f7-11e6-b56d-63a4947c6fe0	Cooper	Nancy	Nancy.Cooper@aol.net
bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a	Harris	Michelle	Michelle.Harris@aol.de
bfa7b456-21f7-11e6-b56d-377143e0a9f8	Kelley	Pamela	Pamela.Kelley@gmail.de
bfa7b4f6-21f7-11e6-b56d-dfe0dfb05a0c	Howell	Lawrence	Lawrence.Howell@aol.net
bfa7b582-21f7-11e6-b56d-c3ae8cd74d89	Mason	Joseph	Joseph.Mason@gmail.fr
bfa7b618-21f7-11e6-b56d-3fe7b4eb1af4	Collins	Nicholas	Nicholas.Collins@gmail.de
bfa7b6a4-21f7-11e6-b56d-fb2eb4daed53	Wood	Laura	Laura.Wood@gmail.fr
bfa7b730-21f7-11e6-b56d-bf5983d67036	Fuller	Susan	Susan.Fuller@gmail.net
04c40a52-270d-11e6-81d6-3bb78fc87071	Alex	Pankraz	nfgwizard1@yahoo.de
\.



SET search_path = smartinsurance, pg_catalog;

--
-- Data for Name: Versicherung; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

COPY "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) FROM stdin;
85	Porsche	21.877,00 €	1.313,00 €	Das Produkt Porsche ist in excellenten Zustand	2016-05-24 23:48:05.240954	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Auto
91	Adventure of the Seas	79.212.149,00 €	6.336.972,00 €	Das Produkt Adventure of the Seas ist in sehr gutem Zustand	2016-05-24 23:48:06.200305	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Schiff
92	Aegean Odyssey	48.408.290,00 €	7.745.326,00 €	Das Produkt Aegean Odyssey ist in sehr gutem Zustand	2016-05-24 23:48:06.360261	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Schiff
93	Aegean Paradise	56.858.762,00 €	6.823.051,00 €	Das Produkt Aegean Paradise ist in excellenten Zustand	2016-05-24 23:48:06.508677	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Schiff
98	AIDAdiva	99.142.830,00 €	14.871.425,00 €	Das Produkt AIDAdiva ist in miserablem Zustand	2016-05-24 23:48:07.241632	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Schiff
103	AIDAsol	6.384.621,00 €	1.276.924,00 €	Das Produkt AIDAsol ist in miserablem Zustand	2016-05-24 23:48:08.019588	2016-06-05 12:26:20.742378	t	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
62	MOQQA Glow Strawberry	35.186,00 €	5.278,00 €	Das Produkt MOQQA Glow Strawberry ist in miserablem Zustand	2016-05-24 23:48:01.90081	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Küchengeräte
64	CUPE Mister Zoom	5.680,00 €	511,00 €	Das Produkt CUPE Mister Zoom ist in gutem Zustand	2016-05-24 23:48:02.191238	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Küchengeräte
65	CUPE Dr. Deep	39.798,00 €	7.562,00 €	Das Produkt CUPE Dr. Deep ist in excellenten Zustand	2016-05-24 23:48:02.331282	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Küchengeräte
66	Je Joue Ami Purple	9.185,00 €	551,00 €	Das Produkt Je Joue Ami Purple ist in sehr gutem Zustand	2016-05-24 23:48:02.473537	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Küchengeräte
67	aluna Lalita Lila	17.946,00 €	2.871,00 €	Das Produkt aluna Lalita Lila ist in gutem Zustand	2016-05-24 23:48:02.609945	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Küchengeräte
70	NJOY Eleven	31.831,00 €	4.138,00 €	Das Produkt NJOY Eleven ist in miserablem Zustand	2016-05-24 23:48:03.052156	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Küchengeräte
68	Lelo Hula Beads	26.697,00 €	4.538,00 €	Das Produkt Lelo Hula Beads ist in miserablem Zustand	2016-05-24 23:48:02.768879	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Küchengeräte
71	Crave Leather Cuffs	35.693,00 €	6.068,00 €	Das Produkt Crave Leather Cuffs ist in gutem Zustand	2016-05-24 23:48:03.18225	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Küchengeräte
86	Lamborghini	1.201.277,00 €	108.115,00 €	Das Produkt Lamborghini ist in sehr gutem Zustand	2016-05-24 23:48:05.380088	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Auto
87	Mazda	122.338,00 €	17.127,00 €	Das Produkt Mazda ist in miserablem Zustand	2016-05-24 23:48:05.549216	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Auto
89	Adonia	54.761.185,00 €	7.666.566,00 €	Das Produkt Adonia ist in sehr gutem Zustand	2016-05-24 23:48:05.830388	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Schiff
90	Adriana	64.713.262,00 €	11.648.387,00 €	Das Produkt Adriana ist in gutem Zustand	2016-05-24 23:48:06.049452	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Schiff
88	Achille Lauro	81.220.236,00 €	16.244.047,00 €	Das Produkt Achille Lauro ist in miserablem Zustand	2016-05-24 23:48:05.691115	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Schiff
94	ADIAaura	23.373.437,00 €	3.038.547,00 €	Das Produkt ADIAaura ist in gutem Zustand	2016-05-24 23:48:06.643839	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
99	AIDAluna	76.742.102,00 €	4.604.526,00 €	Das Produkt AIDAluna ist in sehr gutem Zustand	2016-05-24 23:48:07.381214	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Schiff
100	AIDAmar	97.473.721,00 €	10.722.109,00 €	Das Produkt AIDAmar ist in excellenten Zustand	2016-05-24 23:48:07.531222	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Schiff
101	AIDAprima	41.387.537,00 €	7.035.881,00 €	Das Produkt AIDAprima ist in gutem Zustand	2016-05-24 23:48:07.670298	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Schiff
102	AIDAperla	27.283.714,00 €	4.638.231,00 €	Das Produkt AIDAperla ist in sehr gutem Zustand	2016-05-24 23:48:07.809225	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Schiff
77	Opel	1.299.395,00 €	116.946,00 €	Das Produkt Opel ist in gutem Zustand	2016-05-24 23:48:04.081199	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Auto
78	Ford	2.374.076,00 €	379.852,00 €	Das Produkt Ford ist in miserablem Zustand	2016-05-24 23:48:04.221476	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
76	Mercedes-Benz	5.663.231,00 €	396.426,00 €	Das Produkt Mercedes-Benz ist in miserablem Zustand	2016-05-24 23:48:03.939197	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Auto
74	Audi	7.380.779,00 €	1.402.348,00 €	Das Produkt Audi ist in gutem Zustand	2016-05-24 23:48:03.641265	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
60	MOQQA Skipper Raspberry	46.736,00 €	4.674,00 €	Das Produkt MOQQA Skipper Raspberry ist in sehr gutem Zustand	2016-05-24 23:48:01.57067	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Küchengeräte
63	CUPE Finger Fighter	47.246,00 €	12.300,00 €	Das Produkt CUPE Finger Fighter ist in sehr gutem Zustand	2016-05-24 23:48:02.051652	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Küchengeräte
72	Renault	1.500.509,00 €	75.025,00 €	Das Produkt Renault ist in gutem Zustand	2016-05-24 23:48:03.32262	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
73	VW	2.393.932,00 €	167.575,00 €	Das Produkt VW ist in gutem Zustand	2016-05-24 23:48:03.493036	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Auto
75	BMW	5.940.360,00 €	891.054,00 €	Das Produkt BMW ist in sehr gutem Zustand	2016-05-24 23:48:03.798786	\N	f	f	bfa76546-21f7-11e6-b56d-9734714e149b	Auto
79	Skoda	519.643,00 €	31.179,00 €	Das Produkt Skoda ist in excellenten Zustand	2016-05-24 23:48:04.378938	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
80	Hyundai	8.659.918,00 €	1.212.389,00 €	Das Produkt Hyundai ist in excellenten Zustand	2016-05-24 23:48:04.538891	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
81	Toyota	3.100.420,00 €	465.063,00 €	Das Produkt Toyota ist in miserablem Zustand	2016-05-24 23:48:04.688815	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
82	Seat	5.447.462,00 €	544.746,00 €	Das Produkt Seat ist in gutem Zustand	2016-05-24 23:48:04.830474	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
83	Bugatti	1.028.617,00 €	164.579,00 €	Das Produkt Bugatti ist in gutem Zustand	2016-05-24 23:48:04.968255	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
84	Ferrari	4.165.645,00 €	749.816,00 €	Das Produkt Ferrari ist in excellenten Zustand	2016-05-24 23:48:05.100807	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Auto
95	AIDAbella	55.153.497,00 €	9.927.629,00 €	Das Produkt AIDAbella ist in gutem Zustand	2016-05-24 23:48:06.822631	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
96	AIDAblu	99.179.773,00 €	10.909.775,00 €	Das Produkt AIDAblu ist in excellenten Zustand	2016-05-24 23:48:06.960496	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
97	AIDAcara	52.375.392,00 €	10.475.078,00 €	Das Produkt AIDAcara ist in sehr gutem Zustand	2016-05-24 23:48:07.102378	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace	Schiff
104	Costa Convordia	50.188.313,00 €	5.018.831,00 €	Das Produkt Costa Convordia ist in sehr gutem Zustand	2016-05-24 23:48:08.247887	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
105	Costa Allegra	55.197.571,00 €	4.415.806,00 €	Das Produkt Costa Allegra ist in gutem Zustand	2016-05-24 23:48:08.38822	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
106	Audi A8	5.000,00 €	100,00 €	schoenes auto	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
107	VW Polo	1.000,00 €	40,00 €	toller wagen	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
108	Renault 206	500,00 €	8,00 €	schnelles auto	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
109	Reihenhaus in Mannheim	10.000,00 €	100,00 €	schoene gegend	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Haus
110	Villa in Bel Air	200.000,00 €	1.000,00 €	pompoes	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Haus
111	Wohnung in Kreuzberg	3.000,00 €	10,00 €	heruntergekommen	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Haus
112	Rolex Daytona	500,00 €	5,00 €	geht nicht kaputt	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Uhr
59	MOQQA Skipper Raspberry	46.736,00 €	4.674,00 €	Das Produkt MOQQA Skipper Raspberry ist in sehr gutem Zustand	2016-05-24 23:47:48.229686	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Küchengeräte
69	Nomi Tang Intimate Kegel Set	44.244,00 €	8.406,00 €	Das Produkt Nomi Tang Intimate Kegel Set ist in miserablem Zustand	2016-05-24 23:48:02.90803	\N	f	f	bfa73e36-21f7-11e6-b56d-4b20bc587983	Küchengeräte
113	Breitling Superocean	1.000,00 €	10,00 €	superlanges Megaarmband dass mehr Zeichen hat als du ueberhaupt schreiben kannst	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Uhr
114	Boot	250.000,00 €	1.000,00 €	Guter Rumpf	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Schiff
115	Tuer zu meinem Buero	20,00 €	1,00 €	Tuechtige Tuer	2016-06-01 16:21:24.164791	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Möbel
116	blub	10,00 €	1,00 €	blubalksfdösafh	2016-06-02 13:41:43.96867	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95	Auto
\.


--
-- Data for Name: Investition; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

COPY "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") FROM stdin;
20	69	24.350,00 €	keine	2016-05-25 00:01:42.629789	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
21	73	24.350,00 €	keine	2016-05-25 00:01:48.530683	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
37	89	125.120,00 €	keine	2016-05-25 00:02:48.727874	\N	f	f	bfa778c4-21f7-11e6-b56d-5b51486b28d0
36	89	125.120,00 €	keine	2016-05-25 00:02:48.151844	\N	f	f	bfa776a8-21f7-11e6-b56d-bf7c05f5eab4
34	89	125.120,00 €	keine	2016-05-25 00:02:46.969559	\N	f	f	bfa76aaa-21f7-11e6-b56d-2f49599d1ddc
33	89	125.120,00 €	keine	2016-05-25 00:02:46.401182	\N	f	f	bfa79a98-21f7-11e6-b56d-ff7b2041ba3b
31	89	125.120,00 €	keine	2016-05-25 00:02:45.318352	\N	f	f	bfa79fe8-21f7-11e6-b56d-2f226afd5627
30	89	125.120,00 €	keine	2016-05-25 00:02:44.716408	\N	f	f	bfa7a074-21f7-11e6-b56d-032936c92202
28	89	125.120,00 €	keine	2016-05-25 00:02:43.571276	\N	f	f	bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4
27	89	125.120,00 €	keine	2016-05-25 00:02:42.998331	\N	f	f	bfa7a3da-21f7-11e6-b56d-4b400a09fb38
26	89	125.120,00 €	keine	2016-05-25 00:02:42.397966	\N	f	f	bfa7a740-21f7-11e6-b56d-8b8db926119d
24	89	125.120,00 €	keine	2016-05-25 00:02:40.978206	\N	f	f	bfa7b33e-21f7-11e6-b56d-63a4947c6fe0
23	89	125.120,00 €	keine	2016-05-25 00:02:40.271227	\N	f	f	bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a
13	60	1.750,00 €	daumenHoch	2016-05-24 23:59:56.076138	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
14	63	1.750,00 €	daumenHoch	2016-05-25 00:00:16.640237	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
15	64	1.750,00 €	daumenHoch	2016-05-25 00:00:20.892433	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
16	65	1.750,00 €	daumenHoch	2016-05-25 00:01:19.529749	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
17	66	1.750,00 €	daumenHoch	2016-05-25 00:01:22.50028	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
18	67	1.750,00 €	daumenRunter	2016-05-25 00:01:26.601777	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
19	68	350,00 €	daumenRunter	2016-05-25 00:01:35.930504	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
22	75	24.350,00 €	daumenHoch	2016-05-25 00:01:53.814117	\N	f	f	bfa73b02-21f7-11e6-b56d-6ffe69564a95
25	89	125.120,00 €	daumenHoch	2016-05-25 00:02:41.788962	\N	f	f	bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc
29	89	125.120,00 €	daumenHoch	2016-05-25 00:02:44.140078	\N	f	f	bfa7a196-21f7-11e6-b56d-2327a469d47f
32	89	125.120,00 €	daumenRunter	2016-05-25 00:02:45.810089	\N	f	f	bfa79f52-21f7-11e6-b56d-8f54d6ad9d56
35	89	125.120,00 €	daumenRunter	2016-05-25 00:02:47.550925	\N	f	f	bfa76eec-21f7-11e6-b56d-7f1a64255a9f
38	89	125.120,00 €	daumenRunter	2016-05-25 00:02:49.388317	\N	f	f	bfa779dc-21f7-11e6-b56d-336bd235850c
39	115	1,00 €	keine	2016-06-03 18:01:10.357074	\N	f	f	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
\.


--
-- Name: Investition_id_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Investition_id_seq"', 39, true);


--
-- Name: Investition_versicherungID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Investition_versicherungID_seq"', 1, false);


--
-- Data for Name: Kommentar; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

COPY "Kommentar" (id, "versicherungID", text, zeitpunkt, "personID") FROM stdin;
\.


--
-- Name: Kommentar_id_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Kommentar_id_seq"', 1, false);


--
-- Name: Kommentar_versicherungID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Kommentar_versicherungID_seq"', 1, false);


--
-- Data for Name: Schadensfall; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

COPY "Schadensfall" (id, "versicherungID", beschreibung, schadenshoehe, zeitpunkt, "auszahlungsZeitpunkt", "istAusgezahlt") FROM stdin;
\.


--
-- Data for Name: Schadensfall_Bild; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

COPY "Schadensfall_Bild" (id, "schadensfallID", "bildUrl") FROM stdin;
\.


--
-- Name: Schadensfall_Bild_ID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Schadensfall_Bild_ID_seq"', 1, false);


--
-- Name: Schadensfall_Bild_schadensfallID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Schadensfall_Bild_schadensfallID_seq"', 1, false);


--
-- Name: Schadensfall_id_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Schadensfall_id_seq"', 1, false);


--
-- Name: Schadensfall_versicherungID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Schadensfall_versicherungID_seq"', 1, false);


--
-- Name: Versicherung_id_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Versicherung_id_seq"', 116, true);


--
-- Data for Name: Zahlungsstrom; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

COPY "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") FROM stdin;
470259	64	2016-06-06 01:14:36.212205	157,43 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470260	66	2016-06-06 01:14:36.216787	104,98 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470261	65	2016-06-06 01:14:36.216805	332,51 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470262	67	2016-06-06 01:14:36.220901	279,96 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470264	68	2016-06-06 01:14:36.227273	59,49 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470268	89	2016-06-06 01:14:36.246105	280.268,80 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470279	60	2016-06-06 01:14:36.310491	175,01 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470281	63	2016-06-06 01:14:36.326384	455,59 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470283	73	2016-06-06 01:14:36.3489	1.704,49 €	bfa76546-21f7-11e6-b56d-9734714e149b
470284	75	2016-06-06 01:14:36.374043	3.652,49 €	bfa76546-21f7-11e6-b56d-9734714e149b
470305	115	2016-06-06 01:14:36.435125	0,05 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470306	69	2016-06-06 01:14:36.43521	4.626,30 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470309	67	2016-06-06 01:14:36.459676	-279,96 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470310	68	2016-06-06 01:14:36.459757	-59,49 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470311	89	2016-06-06 01:14:36.459657	-17.516,80 €	bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4
470312	89	2016-06-06 01:14:36.460032	-17.516,80 €	bfa79a98-21f7-11e6-b56d-ff7b2041ba3b
470313	66	2016-06-06 01:14:36.460107	-104,98 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470314	65	2016-06-06 01:14:36.46019	-332,51 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470316	64	2016-06-06 01:14:36.460331	-157,43 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470315	89	2016-06-06 01:14:36.460077	-17.516,80 €	bfa7a3da-21f7-11e6-b56d-4b400a09fb38
470317	89	2016-06-06 01:14:36.468894	-17.516,80 €	bfa76aaa-21f7-11e6-b56d-2f49599d1ddc
470318	89	2016-06-06 01:14:36.46891	-17.516,80 €	bfa776a8-21f7-11e6-b56d-bf7c05f5eab4
470319	89	2016-06-06 01:14:36.488586	-17.516,80 €	bfa779dc-21f7-11e6-b56d-336bd235850c
470322	89	2016-06-06 01:14:36.503154	-17.516,80 €	bfa7a196-21f7-11e6-b56d-2327a469d47f
470320	89	2016-06-06 01:14:36.503172	-17.516,80 €	bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc
470321	89	2016-06-06 01:14:36.503159	-17.516,80 €	bfa79f52-21f7-11e6-b56d-8f54d6ad9d56
470323	89	2016-06-06 01:14:36.503257	-17.516,80 €	bfa7a074-21f7-11e6-b56d-032936c92202
470324	89	2016-06-06 01:14:36.503494	-17.516,80 €	bfa778c4-21f7-11e6-b56d-5b51486b28d0
470325	89	2016-06-06 01:14:36.503541	-17.516,80 €	bfa7b33e-21f7-11e6-b56d-63a4947c6fe0
470326	89	2016-06-06 01:14:36.503641	-17.516,80 €	bfa76eec-21f7-11e6-b56d-7f1a64255a9f
470327	89	2016-06-06 01:14:36.504442	-17.516,80 €	bfa79fe8-21f7-11e6-b56d-2f226afd5627
470328	89	2016-06-06 01:14:36.504499	-17.516,80 €	bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a
470329	89	2016-06-06 01:14:36.513614	-17.516,80 €	bfa7a740-21f7-11e6-b56d-8b8db926119d
470330	60	2016-06-06 01:14:36.532209	-175,01 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470331	69	2016-06-06 01:14:36.539979	-4.626,30 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470332	75	2016-06-06 01:14:36.540084	-3.652,49 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470333	115	2016-06-06 01:14:36.540091	-0,05 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470334	63	2016-06-06 01:14:36.539988	-455,59 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470335	73	2016-06-06 01:14:36.539979	-1.704,49 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470342	64	2016-06-06 01:15:36.197198	157,43 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470343	65	2016-06-06 01:15:36.209028	332,51 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470344	66	2016-06-06 01:15:36.216927	104,98 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470345	67	2016-06-06 01:15:36.391974	279,96 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470346	68	2016-06-06 01:15:36.422317	59,49 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470351	89	2016-06-06 01:15:36.445792	280.268,80 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470363	60	2016-06-06 01:15:36.468401	175,01 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470364	63	2016-06-06 01:15:36.469641	455,59 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470367	75	2016-06-06 01:15:36.473738	3.652,49 €	bfa76546-21f7-11e6-b56d-9734714e149b
470368	73	2016-06-06 01:15:36.474049	1.704,49 €	bfa76546-21f7-11e6-b56d-9734714e149b
470388	69	2016-06-06 01:15:36.521231	4.626,30 €	bfa73e36-21f7-11e6-b56d-4b20bc587983
470390	115	2016-06-06 01:15:36.530822	0,05 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470393	64	2016-06-06 01:15:36.556754	-157,43 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470394	89	2016-06-06 01:15:36.556872	-17.516,80 €	bfa7a3da-21f7-11e6-b56d-4b400a09fb38
470395	67	2016-06-06 01:15:36.556888	-279,96 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470396	89	2016-06-06 01:15:36.556731	-17.516,80 €	bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4
470392	65	2016-06-06 01:15:36.556766	-332,51 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470397	89	2016-06-06 01:15:36.557364	-17.516,80 €	bfa79a98-21f7-11e6-b56d-ff7b2041ba3b
470398	66	2016-06-06 01:15:36.557688	-104,98 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470399	89	2016-06-06 01:15:36.557941	-17.516,80 €	bfa76aaa-21f7-11e6-b56d-2f49599d1ddc
470400	89	2016-06-06 01:15:36.558166	-17.516,80 €	bfa776a8-21f7-11e6-b56d-bf7c05f5eab4
470401	68	2016-06-06 01:15:36.55861	-59,49 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470402	89	2016-06-06 01:15:36.584312	-17.516,80 €	bfa779dc-21f7-11e6-b56d-336bd235850c
470403	89	2016-06-06 01:15:36.594585	-17.516,80 €	bfa778c4-21f7-11e6-b56d-5b51486b28d0
470404	89	2016-06-06 01:15:36.594815	-17.516,80 €	bfa7b33e-21f7-11e6-b56d-63a4947c6fe0
470405	89	2016-06-06 01:15:36.594975	-17.516,80 €	bfa76eec-21f7-11e6-b56d-7f1a64255a9f
470406	89	2016-06-06 01:15:36.595771	-17.516,80 €	bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc
470407	89	2016-06-06 01:15:36.595776	-17.516,80 €	bfa7a074-21f7-11e6-b56d-032936c92202
470408	89	2016-06-06 01:15:36.595948	-17.516,80 €	bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a
470409	89	2016-06-06 01:15:36.596	-17.516,80 €	bfa79f52-21f7-11e6-b56d-8f54d6ad9d56
470410	89	2016-06-06 01:15:36.596094	-17.516,80 €	bfa79fe8-21f7-11e6-b56d-2f226afd5627
470411	89	2016-06-06 01:15:36.597163	-17.516,80 €	bfa7a196-21f7-11e6-b56d-2327a469d47f
470412	89	2016-06-06 01:15:36.612973	-17.516,80 €	bfa7a740-21f7-11e6-b56d-8b8db926119d
470413	60	2016-06-06 01:15:36.623456	-175,01 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470414	115	2016-06-06 01:15:36.623499	-0,05 €	bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace
470415	69	2016-06-06 01:15:36.623585	-4.626,30 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470416	75	2016-06-06 01:15:36.623694	-3.652,49 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470417	73	2016-06-06 01:15:36.623751	-1.704,49 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
470418	63	2016-06-06 01:15:36.623831	-455,59 €	bfa73b02-21f7-11e6-b56d-6ffe69564a95
\.


--
-- Name: Zahlungsstrom_id_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Zahlungsstrom_id_seq"', 470501, true);


--
-- Name: Zahlungsstrom_versicherungID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Zahlungsstrom_versicherungID_seq"', 1, false);


--
-- PostgreSQL database dump complete
--
