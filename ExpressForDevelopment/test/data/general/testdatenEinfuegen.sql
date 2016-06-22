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

INSERT INTO "user" (id, name, prename, email) VALUES ('e99aac00-20e4-11e6-84dc-3323f278ed3e', 'alex', 'test', 'alex@test.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('7c2d0bbc-211c-11e6-83d6-a3085a5936a7', 'Müller', 'Peter', 'peter@mueller');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa5c664-21f7-11e6-b56d-73450709a8e5', 'Cooper', 'Kelly', 'Kelly.Cooper@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa61cea-21f7-11e6-b56d-8b923d3e9760', 'Elliott', 'Edward', 'Edward.Elliott@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa673de-21f7-11e6-b56d-4b52f205267c', 'Porter', 'Howard', 'Howard.Porter@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Cock', 'Chris', 'Chris.Cock@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa71cee-21f7-11e6-b56d-7f8d96386388', 'Peterson', 'Steven', 'Steven.Peterson@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72162-21f7-11e6-b56d-7f43c37583e3', 'Jordan', 'Matthew', 'Matthew.Jordan@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa722c0-21f7-11e6-b56d-abf2eca71577', 'Reynolds', 'Donald', 'Donald.Reynolds@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa723ec-21f7-11e6-b56d-37d7a01b5dce', 'Anderson', 'Joe', 'Joe.Anderson@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa724fa-21f7-11e6-b56d-4fad22464cda', 'Gray', 'Maria', 'Maria.Gray@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7261c-21f7-11e6-b56d-874e5a05fbd2', 'Burns', 'John', 'John.Burns@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72734-21f7-11e6-b56d-93a91bf620e3', 'Torres', 'Denise', 'Denise.Torres@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7284c-21f7-11e6-b56d-5b69ee83fd33', 'Moore', 'Jane', 'Jane.Moore@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72964-21f7-11e6-b56d-8307017ae38f', 'Cunningham', 'Rose', 'Rose.Cunningham@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72ac2-21f7-11e6-b56d-ab66500b8b61', 'Akira', 'Asa', 'Asa.Akira@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72bda-21f7-11e6-b56d-67d1116191c5', 'Wood', 'Tyler', 'Tyler.Wood@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72cfc-21f7-11e6-b56d-0735fabc0fd5', 'Nelson', 'Ryan', 'Ryan.Nelson@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72e14-21f7-11e6-b56d-b3cee214d248', 'Black', 'Judy', 'Judy.Black@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa72f22-21f7-11e6-b56d-7b6976149c67', 'Morris', 'Michael', 'Michael.Morris@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73044-21f7-11e6-b56d-2b3fe81ca7de', 'Chapman', 'Jeffrey', 'Jeffrey.Chapman@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73152-21f7-11e6-b56d-573359ede64c', 'Sims', 'Christopher', 'Christopher.Sims@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73260-21f7-11e6-b56d-23707165c072', 'Mack', 'Christy', 'Christy.Mack@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7336e-21f7-11e6-b56d-67b01fd20198', 'Collins', 'Gerald', 'Gerald.Collins@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73486-21f7-11e6-b56d-976077133f5c', 'Deen', 'James', 'James.Deen@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73594-21f7-11e6-b56d-f380173597c5', 'Crawford', 'Samuel', 'Samuel.Crawford@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa736a2-21f7-11e6-b56d-bfd5f549015b', 'Jacobs', 'Andrew', 'Andrew.Jacobs@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa737ba-21f7-11e6-b56d-db1875cd5c9f', 'Jordan', 'Mary', 'Mary.Jordan@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa738c8-21f7-11e6-b56d-07036757eda0', 'Russell', 'Antonio', 'Antonio.Russell@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa739ea-21f7-11e6-b56d-23e40d5fa4fe', 'Freeman', 'Cynthia', 'Cynthia.Freeman@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Hardwood', 'Lance', 'Lance.Hardwood@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73c10-21f7-11e6-b56d-3ffae2c4d6d6', 'Cole', 'Ann', 'Ann.Cole@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73d1e-21f7-11e6-b56d-634f726bfbfe', 'Lewis', 'Carolyn', 'Carolyn.Lewis@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Beem', 'Jim', 'Jim.Beem@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa73f4e-21f7-11e6-b56d-376e6904b4e3', 'Andrews', 'Ralph', 'Ralph.Andrews@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7405c-21f7-11e6-b56d-1723c04fd473', 'Welch', 'Paula', 'Paula.Welch@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7416a-21f7-11e6-b56d-8f2a91ce2fe7', 'Fuller', 'Russell', 'Russell.Fuller@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74278-21f7-11e6-b56d-a7c7776e0c3b', 'Nguyen', 'Harry', 'Harry.Nguyen@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa743c2-21f7-11e6-b56d-c7e128bbe319', 'Spencer', 'Diana', 'Diana.Spencer@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa744d0-21f7-11e6-b56d-d78e72323a85', 'Johnston', 'Marie', 'Marie.Johnston@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa745de-21f7-11e6-b56d-631adb2789e7', 'Reyes', 'Barbara', 'Barbara.Reyes@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa746f6-21f7-11e6-b56d-f79f448181ad', 'Davis', 'Louis', 'Louis.Davis@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74804-21f7-11e6-b56d-8ff320d9df88', 'Perry', 'Nicole', 'Nicole.Perry@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74912-21f7-11e6-b56d-bf6a97634e5f', 'Oliver', 'Willie', 'Willie.Oliver@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74a2a-21f7-11e6-b56d-fbe2bb11b8ed', 'Roberts', 'Jerry', 'Jerry.Roberts@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74b42-21f7-11e6-b56d-3fc0e6222812', 'Richardson', 'Adam', 'Adam.Richardson@yahoo.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74c50-21f7-11e6-b56d-3b5596298928', 'Chavez', 'Frank', 'Frank.Chavez@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74d68-21f7-11e6-b56d-df62cde6f0a8', 'Foster', 'Donna', 'Donna.Foster@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74e76-21f7-11e6-b56d-7be658bb0ff0', 'Hunt', 'Andrea', 'Andrea.Hunt@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa74f84-21f7-11e6-b56d-c3a4656812d8', 'Kardashian', 'Kim', 'Kim.Kardashian@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7509c-21f7-11e6-b56d-2730f9ddc6fc', 'Stone', 'Paula', 'Paula.Stone@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa751aa-21f7-11e6-b56d-73ab5f16ad0b', 'Jacobs', 'Harold', 'Harold.Jacobs@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa752b8-21f7-11e6-b56d-8fb47f63c480', 'Boyd', 'Krystal', 'Krystal.Boyd@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa753d0-21f7-11e6-b56d-8fa131c47c54', 'Foster', 'Christina', 'Christina.Foster@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa754de-21f7-11e6-b56d-1bd537e1ef79', 'Berry', 'Wanda', 'Wanda.Berry@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa755ec-21f7-11e6-b56d-cf95064ed725', 'Hardwood', 'Pierre', 'Pierre.Hardwood@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa756fa-21f7-11e6-b56d-57a0dd1e90c6', 'Ivy', 'Madison', 'Madison.Ivy@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75808-21f7-11e6-b56d-87a84630126c', 'Sanders', 'Joseph', 'Joseph.Sanders@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7592a-21f7-11e6-b56d-83073ed80f77', 'Ward', 'Edward', 'Edward.Ward@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75a38-21f7-11e6-b56d-5b115f18e747', 'Cole', 'Phillip', 'Phillip.Cole@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75b78-21f7-11e6-b56d-1bdfd3b841c8', 'Cox', 'Patricia', 'Patricia.Cox@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75c86-21f7-11e6-b56d-c38795c8f6c6', 'Allen', 'Henry', 'Henry.Allen@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75d9e-21f7-11e6-b56d-9bfbaf20b470', 'Hancock', 'Scott', 'Scott.Hancock@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75eb6-21f7-11e6-b56d-4b5ece341d64', 'Powell', 'Andrew', 'Andrew.Powell@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa75fce-21f7-11e6-b56d-b3fc1177e552', 'Nichols', 'Stephanie', 'Stephanie.Nichols@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa760e6-21f7-11e6-b56d-ffcf224d1875', 'Riley', 'Jack', 'Jack.Riley@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa761fe-21f7-11e6-b56d-8f268e8feff7', 'Cole', 'Amanda', 'Amanda.Cole@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76316-21f7-11e6-b56d-dfe90a7a730e', 'Diaz', 'Margaret', 'Margaret.Diaz@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7642e-21f7-11e6-b56d-efff0f74a8da', 'Fowler', 'Aaron', 'Aaron.Fowler@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76546-21f7-11e6-b56d-9734714e149b', 'Black', 'Tori', 'Tori.Black@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76654-21f7-11e6-b56d-af7dec2cf543', 'Brooks', 'Kevin', 'Kevin.Brooks@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76780-21f7-11e6-b56d-c39065b432a6', 'Diaz', 'Tammy', 'Tammy.Diaz@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7688e-21f7-11e6-b56d-9716ecd38e0d', 'Ramirez', 'Christina', 'Christina.Ramirez@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7699c-21f7-11e6-b56d-8f27082410c2', 'Owens', 'Julie', 'Julie.Owens@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76aaa-21f7-11e6-b56d-2f49599d1ddc', 'Webb', 'Nicole', 'Nicole.Webb@yahoo.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76bc2-21f7-11e6-b56d-47050984e240', 'Andrews', 'Mary', 'Mary.Andrews@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76cd0-21f7-11e6-b56d-ef352eca08b2', 'Garrett', 'Michelle', 'Michelle.Garrett@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76dde-21f7-11e6-b56d-2b6a3bc3d508', 'Boyd', 'Brenda', 'Brenda.Boyd@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76eec-21f7-11e6-b56d-7f1a64255a9f', 'Scott', 'Harry', 'Harry.Scott@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa76ffa-21f7-11e6-b56d-f72d2384b599', 'Peterson', 'Beverly', 'Beverly.Peterson@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77112-21f7-11e6-b56d-0bfd445a9f0d', 'Carter', 'Barbara', 'Barbara.Carter@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77220-21f7-11e6-b56d-b76efa9c5485', 'Sanders', 'Doris', 'Doris.Sanders@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77342-21f7-11e6-b56d-8f50aea6f60c', 'Lane', 'Anna', 'Anna.Lane@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77482-21f7-11e6-b56d-7b19e38631a0', 'Riley', 'Angela', 'Angela.Riley@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7759a-21f7-11e6-b56d-b704d2d665c3', 'Mitchell', 'Jeremy', 'Jeremy.Mitchell@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa776a8-21f7-11e6-b56d-bf7c05f5eab4', 'Washington', 'Linda', 'Linda.Washington@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa777c0-21f7-11e6-b56d-e30f9fe96f06', 'Thomas', 'Tammy', 'Tammy.Thomas@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa778c4-21f7-11e6-b56d-5b51486b28d0', 'Lacroix', 'Remy', 'Remy.Lacroix@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa779dc-21f7-11e6-b56d-336bd235850c', 'Li', 'Alina', 'Alina.Li@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77aea-21f7-11e6-b56d-0f436e7a8736', 'Sanchez', 'Robin', 'Robin.Sanchez@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77d42-21f7-11e6-b56d-4ba8afc93eac', 'Simmons', 'Samuel', 'Samuel.Simmons@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77e82-21f7-11e6-b56d-cbcc6e4ac193', 'Phillips', 'Rose', 'Rose.Phillips@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa77f9a-21f7-11e6-b56d-af5d1f306cbe', 'Morris', 'Deborah', 'Deborah.Morris@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa780b2-21f7-11e6-b56d-cb777f36ffe1', 'Mcdonald', 'Jean', 'Jean.Mcdonald@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa78436-21f7-11e6-b56d-1b1e3447377a', 'George', 'Beverly', 'Beverly.George@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa784ea-21f7-11e6-b56d-ffc3e007f27a', 'Stone', 'Justin', 'Justin.Stone@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa78580-21f7-11e6-b56d-8be8d9a2d447', 'Torres', 'Dennis', 'Dennis.Torres@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7860c-21f7-11e6-b56d-bb83e93cae73', 'Hansen', 'Justin', 'Justin.Hansen@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa786ac-21f7-11e6-b56d-4b323c47c792', 'Bell', 'Michelle', 'Michelle.Bell@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa78dc8-21f7-11e6-b56d-ab7972e0159f', 'Carpenter', 'Brandon', 'Brandon.Carpenter@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa78e7c-21f7-11e6-b56d-9f970c91eaa1', 'Oliver', 'Beverly', 'Beverly.Oliver@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa78f12-21f7-11e6-b56d-5b2406ad2921', 'Webb', 'Shawn', 'Shawn.Webb@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa78f9e-21f7-11e6-b56d-b3d5b46f8dfd', 'Texas', 'Alexis', 'Alexis.Texas@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79034-21f7-11e6-b56d-eba8f8126895', 'Willis', 'Dennis', 'Dennis.Willis@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa790ca-21f7-11e6-b56d-af8c70eebcde', 'Bailey', 'Kenneth', 'Kenneth.Bailey@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79174-21f7-11e6-b56d-f7a449cf1508', 'Perkins', 'Louis', 'Louis.Perkins@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7920a-21f7-11e6-b56d-93cbcda2c257', 'Hudson', 'Shawn', 'Shawn.Hudson@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79296-21f7-11e6-b56d-9b3c26679592', 'Barnes', 'Stephen', 'Stephen.Barnes@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7932c-21f7-11e6-b56d-cbcfbd2f52f7', 'Ryan', 'Kimberly', 'Kimberly.Ryan@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa793c2-21f7-11e6-b56d-ff7ceff05a40', 'Hernandez', 'Christina', 'Christina.Hernandez@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7944e-21f7-11e6-b56d-1b1ee66d05d6', 'Henderson', 'Andrea', 'Andrea.Henderson@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa794ee-21f7-11e6-b56d-539b862c93e9', 'Hardwood', 'Anthony', 'Anthony.Hardwood@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79584-21f7-11e6-b56d-a33c2f3768b1', 'Fernandez', 'Justin', 'Justin.Fernandez@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7961a-21f7-11e6-b56d-9b395a3f7667', 'Reynolds', 'Teresa', 'Teresa.Reynolds@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa796a6-21f7-11e6-b56d-bbfbbfdbacdd', 'Lynch', 'Judith', 'Judith.Lynch@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79732-21f7-11e6-b56d-4b1257631efb', 'Harvey', 'Sandra', 'Sandra.Harvey@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa797be-21f7-11e6-b56d-6b0349f1a37c', 'Burke', 'Pamela', 'Pamela.Burke@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79854-21f7-11e6-b56d-df5e53ea3a24', 'Reed', 'Jessica', 'Jessica.Reed@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa798e0-21f7-11e6-b56d-037ef2c1c5d2', 'White', 'Kathryn', 'Kathryn.White@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79976-21f7-11e6-b56d-43aea9de5795', 'Turner', 'Samuel', 'Samuel.Turner@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79a0c-21f7-11e6-b56d-9f0909a93777', 'Simmons', 'Ronald', 'Ronald.Simmons@yahoo.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79a98-21f7-11e6-b56d-ff7b2041ba3b', 'Fowler', 'Alan', 'Alan.Fowler@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79b24-21f7-11e6-b56d-bff796c576e3', 'Thompson', 'Amy', 'Amy.Thompson@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79bba-21f7-11e6-b56d-cf4c1c0a1a9b', 'Cole', 'Donna', 'Donna.Cole@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79c46-21f7-11e6-b56d-e7700fec30bb', 'Schmidt', 'Helen', 'Helen.Schmidt@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79cf0-21f7-11e6-b56d-4bcfc7e7f24f', 'Dixon', 'Teresa', 'Teresa.Dixon@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79d86-21f7-11e6-b56d-57d6bc9c0740', 'Peterson', 'Fred', 'Fred.Peterson@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79e30-21f7-11e6-b56d-ffd76a13a599', 'Jacobs', 'Donald', 'Donald.Jacobs@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79ec6-21f7-11e6-b56d-075281f33c19', 'Reyes', 'Victor', 'Victor.Reyes@aol.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79f52-21f7-11e6-b56d-8f54d6ad9d56', 'Lopez', 'Nicholas', 'Nicholas.Lopez@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa79fe8-21f7-11e6-b56d-2f226afd5627', 'Diaz', 'Clarence', 'Clarence.Diaz@aol.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a074-21f7-11e6-b56d-032936c92202', 'Hall', 'Kimberly', 'Kimberly.Hall@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a10a-21f7-11e6-b56d-ff9efb68438d', 'Oliver', 'Ruth', 'Ruth.Oliver@yahoo.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a196-21f7-11e6-b56d-2327a469d47f', 'Romero', 'Nicole', 'Nicole.Romero@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a222-21f7-11e6-b56d-e701e5df3f9f', 'Dean', 'Andrew', 'Andrew.Dean@yahoo.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4', 'Black', 'Matthew', 'Matthew.Black@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a34e-21f7-11e6-b56d-fb9606c667bd', 'Dixon', 'Joseph', 'Joseph.Dixon@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a3da-21f7-11e6-b56d-4b400a09fb38', 'Griffin', 'Carolyn', 'Carolyn.Griffin@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a466-21f7-11e6-b56d-c785d5c1441d', 'Jones', 'Ashley', 'Ashley.Jones@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a4fc-21f7-11e6-b56d-33f700fd6bf3', 'Long', 'Kevin', 'Kevin.Long@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a588-21f7-11e6-b56d-c31b8df6e1e3', 'Jacobs', 'Harry', 'Harry.Jacobs@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a61e-21f7-11e6-b56d-1ff1676715f7', 'Hart', 'Walter', 'Walter.Hart@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a6aa-21f7-11e6-b56d-c363e321d6f8', 'Cox', 'Michael J', 'Michael J.Cox@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a740-21f7-11e6-b56d-8b8db926119d', 'Powell', 'James', 'James.Powell@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a7cc-21f7-11e6-b56d-b7cf9319f9fd', 'Spencer', 'Mark', 'Mark.Spencer@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a862-21f7-11e6-b56d-338b3242e48d', 'Hall', 'Brian', 'Brian.Hall@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a8f8-21f7-11e6-b56d-d3a4afcf5e5c', 'Cooper', 'Jack', 'Jack.Cooper@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7a98e-21f7-11e6-b56d-2b62cf1c52a4', 'Jenkins', 'Sarah', 'Sarah.Jenkins@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7aa1a-21f7-11e6-b56d-f70c9158d240', 'Stone', 'Rose', 'Rose.Stone@gmx.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7aaa6-21f7-11e6-b56d-bb9b1b5fdbf1', 'Knight', 'Gerald', 'Gerald.Knight@gmx.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc', 'Fox', 'Ashley', 'Ashley.Fox@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7abdc-21f7-11e6-b56d-575c4cc6adef', 'Ellis', 'Walter', 'Walter.Ellis@yahoo.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7ac72-21f7-11e6-b56d-5bf92453f6ea', 'Hernandez', 'Janice', 'Janice.Hernandez@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7acfe-21f7-11e6-b56d-cbd213c53ab6', 'Harris', 'Amy', 'Amy.Harris@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7ad94-21f7-11e6-b56d-ab03a14093af', 'Butler', 'Albert', 'Albert.Butler@yahoo.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7ae20-21f7-11e6-b56d-1f6c9e1683ba', 'George', 'James', 'James.George@gmail.com');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7aeac-21f7-11e6-b56d-d39fb0e9ca4f', 'Croft', 'Lana', 'Lana.Croft@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7af38-21f7-11e6-b56d-4b717dee22f6', 'Duncan', 'Beverly', 'Beverly.Duncan@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7afc4-21f7-11e6-b56d-6b86f154f11a', 'Evans', 'Jerry', 'Jerry.Evans@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b064-21f7-11e6-b56d-27ab8947369a', 'Ryan', 'Daniel', 'Daniel.Ryan@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b0fa-21f7-11e6-b56d-43b9f79702ef', 'Medina', 'Victor', 'Victor.Medina@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b190-21f7-11e6-b56d-fb112a74b89a', 'Murray', 'Joan', 'Joan.Murray@gmx.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b21c-21f7-11e6-b56d-1768030df228', 'Schmidt', 'Steven', 'Steven.Schmidt@gmx.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b2a8-21f7-11e6-b56d-4bd3d015a0b6', 'Lawson', 'Clarence', 'Clarence.Lawson@yahoo.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b33e-21f7-11e6-b56d-63a4947c6fe0', 'Cooper', 'Nancy', 'Nancy.Cooper@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a', 'Harris', 'Michelle', 'Michelle.Harris@aol.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b456-21f7-11e6-b56d-377143e0a9f8', 'Kelley', 'Pamela', 'Pamela.Kelley@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b4f6-21f7-11e6-b56d-dfe0dfb05a0c', 'Howell', 'Lawrence', 'Lawrence.Howell@aol.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b582-21f7-11e6-b56d-c3ae8cd74d89', 'Mason', 'Joseph', 'Joseph.Mason@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b618-21f7-11e6-b56d-3fe7b4eb1af4', 'Collins', 'Nicholas', 'Nicholas.Collins@gmail.de');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b6a4-21f7-11e6-b56d-fb2eb4daed53', 'Wood', 'Laura', 'Laura.Wood@gmail.fr');
INSERT INTO "user" (id, name, prename, email) VALUES ('bfa7b730-21f7-11e6-b56d-bf5983d67036', 'Fuller', 'Susan', 'Susan.Fuller@gmail.net');
INSERT INTO "user" (id, name, prename, email) VALUES ('04c40a52-270d-11e6-81d6-3bb78fc87071', 'Alex', 'Pankraz', 'nfgwizard1@yahoo.de');





SET search_path = smartinsurance, pg_catalog;

--
-- Data for Name: Versicherung; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (85, 'Porsche', '21.877,00 €', '1.313,00 €', 'Das Produkt Porsche ist in excellenten Zustand', '2016-05-24 23:48:05.240954', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (91, 'Adventure of the Seas', '79.212.149,00 €', '6.336.972,00 €', 'Das Produkt Adventure of the Seas ist in sehr gutem Zustand', '2016-05-24 23:48:06.200305', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (92, 'Aegean Odyssey', '48.408.290,00 €', '7.745.326,00 €', 'Das Produkt Aegean Odyssey ist in sehr gutem Zustand', '2016-05-24 23:48:06.360261', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (93, 'Aegean Paradise', '56.858.762,00 €', '6.823.051,00 €', 'Das Produkt Aegean Paradise ist in excellenten Zustand', '2016-05-24 23:48:06.508677', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (98, 'AIDAdiva', '99.142.830,00 €', '14.871.425,00 €', 'Das Produkt AIDAdiva ist in miserablem Zustand', '2016-05-24 23:48:07.241632', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (103, 'AIDAsol', '6.384.621,00 €', '1.276.924,00 €', 'Das Produkt AIDAsol ist in miserablem Zustand', '2016-05-24 23:48:08.019588', '2016-06-05 12:26:20.742378', true, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (62, 'MOQQA Glow Strawberry', '35.186,00 €', '5.278,00 €', 'Das Produkt MOQQA Glow Strawberry ist in miserablem Zustand', '2016-05-24 23:48:01.90081', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (64, 'CUPE Mister Zoom', '5.680,00 €', '511,00 €', 'Das Produkt CUPE Mister Zoom ist in gutem Zustand', '2016-05-24 23:48:02.191238', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (65, 'CUPE Dr. Deep', '39.798,00 €', '7.562,00 €', 'Das Produkt CUPE Dr. Deep ist in excellenten Zustand', '2016-05-24 23:48:02.331282', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (66, 'Je Joue Ami Purple', '9.185,00 €', '551,00 €', 'Das Produkt Je Joue Ami Purple ist in sehr gutem Zustand', '2016-05-24 23:48:02.473537', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (67, 'aluna Lalita Lila', '17.946,00 €', '2.871,00 €', 'Das Produkt aluna Lalita Lila ist in gutem Zustand', '2016-05-24 23:48:02.609945', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (70, 'NJOY Eleven', '31.831,00 €', '4.138,00 €', 'Das Produkt NJOY Eleven ist in miserablem Zustand', '2016-05-24 23:48:03.052156', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (68, 'Lelo Hula Beads', '26.697,00 €', '4.538,00 €', 'Das Produkt Lelo Hula Beads ist in miserablem Zustand', '2016-05-24 23:48:02.768879', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (71, 'Crave Leather Cuffs', '35.693,00 €', '6.068,00 €', 'Das Produkt Crave Leather Cuffs ist in gutem Zustand', '2016-05-24 23:48:03.18225', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (86, 'Lamborghini', '1.201.277,00 €', '108.115,00 €', 'Das Produkt Lamborghini ist in sehr gutem Zustand', '2016-05-24 23:48:05.380088', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (87, 'Mazda', '122.338,00 €', '17.127,00 €', 'Das Produkt Mazda ist in miserablem Zustand', '2016-05-24 23:48:05.549216', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (89, 'Adonia', '54.761.185,00 €', '7.666.566,00 €', 'Das Produkt Adonia ist in sehr gutem Zustand', '2016-05-24 23:48:05.830388', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (90, 'Adriana', '64.713.262,00 €', '11.648.387,00 €', 'Das Produkt Adriana ist in gutem Zustand', '2016-05-24 23:48:06.049452', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (88, 'Achille Lauro', '81.220.236,00 €', '16.244.047,00 €', 'Das Produkt Achille Lauro ist in miserablem Zustand', '2016-05-24 23:48:05.691115', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (94, 'ADIAaura', '23.373.437,00 €', '3.038.547,00 €', 'Das Produkt ADIAaura ist in gutem Zustand', '2016-05-24 23:48:06.643839', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (99, 'AIDAluna', '76.742.102,00 €', '4.604.526,00 €', 'Das Produkt AIDAluna ist in sehr gutem Zustand', '2016-05-24 23:48:07.381214', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (100, 'AIDAmar', '97.473.721,00 €', '10.722.109,00 €', 'Das Produkt AIDAmar ist in excellenten Zustand', '2016-05-24 23:48:07.531222', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (101, 'AIDAprima', '41.387.537,00 €', '7.035.881,00 €', 'Das Produkt AIDAprima ist in gutem Zustand', '2016-05-24 23:48:07.670298', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (102, 'AIDAperla', '27.283.714,00 €', '4.638.231,00 €', 'Das Produkt AIDAperla ist in sehr gutem Zustand', '2016-05-24 23:48:07.809225', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (77, 'Opel', '1.299.395,00 €', '116.946,00 €', 'Das Produkt Opel ist in gutem Zustand', '2016-05-24 23:48:04.081199', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (78, 'Ford', '2.374.076,00 €', '379.852,00 €', 'Das Produkt Ford ist in miserablem Zustand', '2016-05-24 23:48:04.221476', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (76, 'Mercedes-Benz', '5.663.231,00 €', '396.426,00 €', 'Das Produkt Mercedes-Benz ist in miserablem Zustand', '2016-05-24 23:48:03.939197', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (74, 'Audi', '7.380.779,00 €', '1.402.348,00 €', 'Das Produkt Audi ist in gutem Zustand', '2016-05-24 23:48:03.641265', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (60, 'MOQQA Skipper Raspberry', '46.736,00 €', '4.674,00 €', 'Das Produkt MOQQA Skipper Raspberry ist in sehr gutem Zustand', '2016-05-24 23:48:01.57067', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (63, 'CUPE Finger Fighter', '47.246,00 €', '12.300,00 €', 'Das Produkt CUPE Finger Fighter ist in sehr gutem Zustand', '2016-05-24 23:48:02.051652', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (72, 'Renault', '1.500.509,00 €', '75.025,00 €', 'Das Produkt Renault ist in gutem Zustand', '2016-05-24 23:48:03.32262', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (73, 'VW', '2.393.932,00 €', '167.575,00 €', 'Das Produkt VW ist in gutem Zustand', '2016-05-24 23:48:03.493036', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (75, 'BMW', '5.940.360,00 €', '891.054,00 €', 'Das Produkt BMW ist in sehr gutem Zustand', '2016-05-24 23:48:03.798786', NULL, false, false, 'bfa76546-21f7-11e6-b56d-9734714e149b', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (79, 'Skoda', '519.643,00 €', '31.179,00 €', 'Das Produkt Skoda ist in excellenten Zustand', '2016-05-24 23:48:04.378938', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (80, 'Hyundai', '8.659.918,00 €', '1.212.389,00 €', 'Das Produkt Hyundai ist in excellenten Zustand', '2016-05-24 23:48:04.538891', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (81, 'Toyota', '3.100.420,00 €', '465.063,00 €', 'Das Produkt Toyota ist in miserablem Zustand', '2016-05-24 23:48:04.688815', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (82, 'Seat', '5.447.462,00 €', '544.746,00 €', 'Das Produkt Seat ist in gutem Zustand', '2016-05-24 23:48:04.830474', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (83, 'Bugatti', '1.028.617,00 €', '164.579,00 €', 'Das Produkt Bugatti ist in gutem Zustand', '2016-05-24 23:48:04.968255', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (84, 'Ferrari', '4.165.645,00 €', '749.816,00 €', 'Das Produkt Ferrari ist in excellenten Zustand', '2016-05-24 23:48:05.100807', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (95, 'AIDAbella', '55.153.497,00 €', '9.927.629,00 €', 'Das Produkt AIDAbella ist in gutem Zustand', '2016-05-24 23:48:06.822631', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (96, 'AIDAblu', '99.179.773,00 €', '10.909.775,00 €', 'Das Produkt AIDAblu ist in excellenten Zustand', '2016-05-24 23:48:06.960496', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (97, 'AIDAcara', '52.375.392,00 €', '10.475.078,00 €', 'Das Produkt AIDAcara ist in sehr gutem Zustand', '2016-05-24 23:48:07.102378', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (104, 'Costa Convordia', '50.188.313,00 €', '5.018.831,00 €', 'Das Produkt Costa Convordia ist in sehr gutem Zustand', '2016-05-24 23:48:08.247887', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (105, 'Costa Allegra', '55.197.571,00 €', '4.415.806,00 €', 'Das Produkt Costa Allegra ist in gutem Zustand', '2016-05-24 23:48:08.38822', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (106, 'Audi A8', '5.000,00 €', '100,00 €', 'schoenes auto', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (107, 'VW Polo', '1.000,00 €', '40,00 €', 'toller wagen', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (108, 'Renault 206', '500,00 €', '8,00 €', 'schnelles auto', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (109, 'Reihenhaus in Mannheim', '10.000,00 €', '100,00 €', 'schoene gegend', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Haus');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (110, 'Villa in Bel Air', '200.000,00 €', '1.000,00 €', 'pompoes', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Haus');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (111, 'Wohnung in Kreuzberg', '3.000,00 €', '10,00 €', 'heruntergekommen', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Haus');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (112, 'Rolex Daytona', '500,00 €', '5,00 €', 'geht nicht kaputt', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Uhr');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (59, 'MOQQA Skipper Raspberry', '46.736,00 €', '4.674,00 €', 'Das Produkt MOQQA Skipper Raspberry ist in sehr gutem Zustand', '2016-05-24 23:47:48.229686', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (69, 'Nomi Tang Intimate Kegel Set', '44.244,00 €', '8.406,00 €', 'Das Produkt Nomi Tang Intimate Kegel Set ist in miserablem Zustand', '2016-05-24 23:48:02.90803', NULL, false, false, 'bfa73e36-21f7-11e6-b56d-4b20bc587983', 'Küchengeräte');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (113, 'Breitling Superocean', '1.000,00 €', '10,00 €', 'superlanges Megaarmband dass mehr Zeichen hat als du ueberhaupt schreiben kannst', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Uhr');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (114, 'Boot', '250.000,00 €', '1.000,00 €', 'Guter Rumpf', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Schiff');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (115, 'Tuer zu meinem Buero', '20,00 €', '1,00 €', 'Tuechtige Tuer', '2016-06-01 16:21:24.164791', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Möbel');
INSERT INTO "Versicherung" (id, name, versicherungshoehe, beitrag, beschreibung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID", kategorie) VALUES (116, 'blub', '10,00 €', '1,00 €', 'blubalksfdösafh', '2016-06-02 13:41:43.96867', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95', 'Auto');


--
-- Data for Name: Investition; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--

INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (20, 69, '24.350,00 €', 'keine', '2016-05-25 00:01:42.629789', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (21, 73, '24.350,00 €', 'keine', '2016-05-25 00:01:48.530683', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (37, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:48.727874', NULL, false, false, 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (36, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:48.151844', NULL, false, false, 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (34, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:46.969559', NULL, false, false, 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (33, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:46.401182', NULL, false, false, 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (31, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:45.318352', NULL, false, false, 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (30, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:44.716408', NULL, false, false, 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (28, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:43.571276', NULL, false, false, 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (27, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:42.998331', NULL, false, false, 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (26, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:42.397966', NULL, false, false, 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (24, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:40.978206', NULL, false, false, 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (23, 89, '125.120,00 €', 'keine', '2016-05-25 00:02:40.271227', NULL, false, false, 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (13, 60, '1.750,00 €', 'daumenHoch', '2016-05-24 23:59:56.076138', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (14, 63, '1.750,00 €', 'daumenHoch', '2016-05-25 00:00:16.640237', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (15, 64, '1.750,00 €', 'daumenHoch', '2016-05-25 00:00:20.892433', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (16, 65, '1.750,00 €', 'daumenHoch', '2016-05-25 00:01:19.529749', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (17, 66, '1.750,00 €', 'daumenHoch', '2016-05-25 00:01:22.50028', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (18, 67, '1.750,00 €', 'daumenRunter', '2016-05-25 00:01:26.601777', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (19, 68, '350,00 €', 'daumenRunter', '2016-05-25 00:01:35.930504', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (22, 75, '24.350,00 €', 'daumenHoch', '2016-05-25 00:01:53.814117', NULL, false, false, 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (25, 89, '125.120,00 €', 'daumenHoch', '2016-05-25 00:02:41.788962', NULL, false, false, 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (29, 89, '125.120,00 €', 'daumenHoch', '2016-05-25 00:02:44.140078', NULL, false, false, 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (32, 89, '125.120,00 €', 'daumenRunter', '2016-05-25 00:02:45.810089', NULL, false, false, 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (35, 89, '125.120,00 €', 'daumenRunter', '2016-05-25 00:02:47.550925', NULL, false, false, 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (38, 89, '125.120,00 €', 'daumenRunter', '2016-05-25 00:02:49.388317', NULL, false, false, 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Investition" (id, "versicherungID", investitionshoehe, bewertung, "abschlussZeitpunkt", "kuendigungsZeitpunkt", "istGekuendigt", "wirdGekuendigt", "personID") VALUES (39, 115, '1,00 €', 'keine', '2016-06-03 18:01:10.357074', NULL, false, false, 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');


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

INSERT INTO "Kommentar"(id, "versicherungID", text, "personID") VALUES (100, 89, 'Ich bin ein Kommentar.', 'bfa79174-21f7-11e6-b56d-f7a449cf1508');

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

INSERT INTO "Schadensfall"(id, "versicherungID", beschreibung, schadenshoehe, bezeichnung) VALUES (100, 89, 'Sehr sehr große Delle', '10,00 €', 'Delle');


--
-- Data for Name: Schadensfall_Bild; Type: TABLE DATA; Schema: smartinsurance; Owner: -
--



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

INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470259, 64, '2016-06-06 01:14:36.212205', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470260, 66, '2016-06-06 01:14:36.216787', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470261, 65, '2016-06-06 01:14:36.216805', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470262, 67, '2016-06-06 01:14:36.220901', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470264, 68, '2016-06-06 01:14:36.227273', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470268, 89, '2016-06-06 01:14:36.246105', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470279, 60, '2016-06-06 01:14:36.310491', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470281, 63, '2016-06-06 01:14:36.326384', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470283, 73, '2016-06-06 01:14:36.3489', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470284, 75, '2016-06-06 01:14:36.374043', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470305, 115, '2016-06-06 01:14:36.435125', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470306, 69, '2016-06-06 01:14:36.43521', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470309, 67, '2016-06-06 01:14:36.459676', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470310, 68, '2016-06-06 01:14:36.459757', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470311, 89, '2016-06-06 01:14:36.459657', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470312, 89, '2016-06-06 01:14:36.460032', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470313, 66, '2016-06-06 01:14:36.460107', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470314, 65, '2016-06-06 01:14:36.46019', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470316, 64, '2016-06-06 01:14:36.460331', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470315, 89, '2016-06-06 01:14:36.460077', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470317, 89, '2016-06-06 01:14:36.468894', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470318, 89, '2016-06-06 01:14:36.46891', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470319, 89, '2016-06-06 01:14:36.488586', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470322, 89, '2016-06-06 01:14:36.503154', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470320, 89, '2016-06-06 01:14:36.503172', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470321, 89, '2016-06-06 01:14:36.503159', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470323, 89, '2016-06-06 01:14:36.503257', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470324, 89, '2016-06-06 01:14:36.503494', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470325, 89, '2016-06-06 01:14:36.503541', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470326, 89, '2016-06-06 01:14:36.503641', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470327, 89, '2016-06-06 01:14:36.504442', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470328, 89, '2016-06-06 01:14:36.504499', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470329, 89, '2016-06-06 01:14:36.513614', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470330, 60, '2016-06-06 01:14:36.532209', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470331, 69, '2016-06-06 01:14:36.539979', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470332, 75, '2016-06-06 01:14:36.540084', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470333, 115, '2016-06-06 01:14:36.540091', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470334, 63, '2016-06-06 01:14:36.539988', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470335, 73, '2016-06-06 01:14:36.539979', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470342, 64, '2016-06-06 01:15:36.197198', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470343, 65, '2016-06-06 01:15:36.209028', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470344, 66, '2016-06-06 01:15:36.216927', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470345, 67, '2016-06-06 01:15:36.391974', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470346, 68, '2016-06-06 01:15:36.422317', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470351, 89, '2016-06-06 01:15:36.445792', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470363, 60, '2016-06-06 01:15:36.468401', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470364, 63, '2016-06-06 01:15:36.469641', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470367, 75, '2016-06-06 01:15:36.473738', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470368, 73, '2016-06-06 01:15:36.474049', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470388, 69, '2016-06-06 01:15:36.521231', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470390, 115, '2016-06-06 01:15:36.530822', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470393, 64, '2016-06-06 01:15:36.556754', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470394, 89, '2016-06-06 01:15:36.556872', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470395, 67, '2016-06-06 01:15:36.556888', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470396, 89, '2016-06-06 01:15:36.556731', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470392, 65, '2016-06-06 01:15:36.556766', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470397, 89, '2016-06-06 01:15:36.557364', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470398, 66, '2016-06-06 01:15:36.557688', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470399, 89, '2016-06-06 01:15:36.557941', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470400, 89, '2016-06-06 01:15:36.558166', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470401, 68, '2016-06-06 01:15:36.55861', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470402, 89, '2016-06-06 01:15:36.584312', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470403, 89, '2016-06-06 01:15:36.594585', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470404, 89, '2016-06-06 01:15:36.594815', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470405, 89, '2016-06-06 01:15:36.594975', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470406, 89, '2016-06-06 01:15:36.595771', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470407, 89, '2016-06-06 01:15:36.595776', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470408, 89, '2016-06-06 01:15:36.595948', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470409, 89, '2016-06-06 01:15:36.596', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470410, 89, '2016-06-06 01:15:36.596094', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470411, 89, '2016-06-06 01:15:36.597163', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470412, 89, '2016-06-06 01:15:36.612973', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470413, 60, '2016-06-06 01:15:36.623456', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470414, 115, '2016-06-06 01:15:36.623499', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470415, 69, '2016-06-06 01:15:36.623585', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470416, 75, '2016-06-06 01:15:36.623694', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470417, 73, '2016-06-06 01:15:36.623751', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470418, 63, '2016-06-06 01:15:36.623831', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470425, 65, '2016-06-06 01:16:36.2011', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470426, 64, '2016-06-06 01:16:36.201912', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470427, 66, '2016-06-06 01:16:36.206334', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470429, 67, '2016-06-06 01:16:36.211591', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470431, 68, '2016-06-06 01:16:36.212279', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470434, 89, '2016-06-06 01:16:36.217207', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470446, 60, '2016-06-06 01:16:36.278763', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470447, 63, '2016-06-06 01:16:36.287843', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470449, 73, '2016-06-06 01:16:36.297048', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470453, 75, '2016-06-06 01:16:36.302527', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470468, 69, '2016-06-06 01:16:36.343215', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470473, 115, '2016-06-06 01:16:36.353655', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470475, 89, '2016-06-06 01:16:36.382749', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470476, 66, '2016-06-06 01:16:36.382794', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470478, 67, '2016-06-06 01:16:36.382911', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470477, 64, '2016-06-06 01:16:36.382822', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470479, 89, '2016-06-06 01:16:36.383861', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470480, 68, '2016-06-06 01:16:36.383862', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470481, 89, '2016-06-06 01:16:36.384054', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470482, 89, '2016-06-06 01:16:36.384124', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470483, 89, '2016-06-06 01:16:36.384248', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470484, 65, '2016-06-06 01:16:36.384473', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470485, 89, '2016-06-06 01:16:36.410347', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470486, 89, '2016-06-06 01:16:36.419311', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470487, 89, '2016-06-06 01:16:36.4205', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470488, 89, '2016-06-06 01:16:36.420583', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470489, 89, '2016-06-06 01:16:36.420655', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470490, 89, '2016-06-06 01:16:36.420816', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470491, 89, '2016-06-06 01:16:36.42087', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470492, 89, '2016-06-06 01:16:36.421044', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470493, 89, '2016-06-06 01:16:36.421166', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470494, 89, '2016-06-06 01:16:36.426044', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470495, 89, '2016-06-06 01:16:36.439199', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470496, 75, '2016-06-06 01:16:36.449736', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470497, 63, '2016-06-06 01:16:36.449843', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470498, 73, '2016-06-06 01:16:36.449849', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470499, 69, '2016-06-06 01:16:36.44974', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470500, 115, '2016-06-06 01:16:36.449754', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470501, 60, '2016-06-06 01:16:36.450005', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470508, 64, '2016-06-06 01:17:36.204052', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470509, 65, '2016-06-06 01:17:36.208801', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470510, 66, '2016-06-06 01:17:36.212806', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470511, 67, '2016-06-06 01:17:36.218219', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470513, 68, '2016-06-06 01:17:36.219191', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470515, 89, '2016-06-06 01:17:36.223341', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470529, 60, '2016-06-06 01:17:36.281614', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470530, 63, '2016-06-06 01:17:36.297816', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470532, 73, '2016-06-06 01:17:36.304648', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470533, 75, '2016-06-06 01:17:36.320502', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470551, 69, '2016-06-06 01:17:36.369863', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470557, 115, '2016-06-06 01:17:36.376625', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470558, 89, '2016-06-06 01:17:36.401539', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470559, 66, '2016-06-06 01:17:36.401637', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470562, 68, '2016-06-06 01:17:36.401539', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470563, 64, '2016-06-06 01:17:36.40182', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470565, 89, '2016-06-06 01:17:36.402043', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470566, 65, '2016-06-06 01:17:36.402152', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470567, 89, '2016-06-06 01:17:36.406995', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470568, 89, '2016-06-06 01:17:36.430384', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470570, 89, '2016-06-06 01:17:36.438354', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470573, 89, '2016-06-06 01:17:36.439761', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470572, 89, '2016-06-06 01:17:36.439632', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470574, 89, '2016-06-06 01:17:36.439945', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470575, 89, '2016-06-06 01:17:36.440109', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470577, 89, '2016-06-06 01:17:36.440994', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470578, 89, '2016-06-06 01:17:36.460784', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470581, 75, '2016-06-06 01:17:36.470192', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470582, 115, '2016-06-06 01:17:36.470067', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470583, 69, '2016-06-06 01:17:36.470384', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470584, 63, '2016-06-06 01:17:36.470681', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470560, 89, '2016-06-06 01:17:36.401641', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470576, 89, '2016-06-06 01:17:36.440999', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470561, 89, '2016-06-06 01:17:36.401557', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470571, 89, '2016-06-06 01:17:36.439629', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470580, 73, '2016-06-06 01:17:36.470067', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470564, 67, '2016-06-06 01:17:36.401969', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470569, 89, '2016-06-06 01:17:36.438364', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470579, 60, '2016-06-06 01:17:36.468811', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470591, 64, '2016-06-06 01:18:36.220861', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470592, 65, '2016-06-06 01:18:36.224871', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470593, 66, '2016-06-06 01:18:36.23015', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470595, 67, '2016-06-06 01:18:36.235323', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470598, 68, '2016-06-06 01:18:36.242237', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470600, 89, '2016-06-06 01:18:36.244249', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470612, 60, '2016-06-06 01:18:36.28059', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470613, 63, '2016-06-06 01:18:36.281851', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470616, 75, '2016-06-06 01:18:36.286702', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470617, 73, '2016-06-06 01:18:36.287041', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470635, 69, '2016-06-06 01:18:36.335432', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470639, 115, '2016-06-06 01:18:36.344705', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470642, 65, '2016-06-06 01:18:36.36968', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470645, 67, '2016-06-06 01:18:36.369798', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470646, 89, '2016-06-06 01:18:36.369807', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470644, 89, '2016-06-06 01:18:36.369792', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470647, 66, '2016-06-06 01:18:36.369706', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470641, 68, '2016-06-06 01:18:36.369692', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470643, 64, '2016-06-06 01:18:36.36971', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470648, 89, '2016-06-06 01:18:36.370194', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470649, 89, '2016-06-06 01:18:36.370731', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470650, 89, '2016-06-06 01:18:36.375153', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470651, 89, '2016-06-06 01:18:36.395826', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470652, 89, '2016-06-06 01:18:36.406403', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470653, 89, '2016-06-06 01:18:36.406402', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470654, 89, '2016-06-06 01:18:36.406428', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470655, 89, '2016-06-06 01:18:36.406676', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470656, 89, '2016-06-06 01:18:36.406672', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470657, 89, '2016-06-06 01:18:36.406803', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470658, 89, '2016-06-06 01:18:36.406887', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470659, 89, '2016-06-06 01:18:36.4075', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470660, 89, '2016-06-06 01:18:36.407499', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470661, 89, '2016-06-06 01:18:36.422166', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470662, 60, '2016-06-06 01:18:36.44057', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470664, 73, '2016-06-06 01:18:36.446922', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470663, 63, '2016-06-06 01:18:36.446929', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470665, 75, '2016-06-06 01:18:36.452393', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470666, 115, '2016-06-06 01:18:36.452496', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470667, 69, '2016-06-06 01:18:36.452388', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470674, 64, '2016-06-06 01:19:36.197076', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470675, 65, '2016-06-06 01:19:36.205817', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470677, 67, '2016-06-06 01:19:36.211142', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470676, 66, '2016-06-06 01:19:36.211142', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470679, 68, '2016-06-06 01:19:36.215217', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470683, 89, '2016-06-06 01:19:36.234719', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470695, 60, '2016-06-06 01:19:36.325582', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470696, 75, '2016-06-06 01:19:36.325654', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470697, 63, '2016-06-06 01:19:36.325744', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470699, 73, '2016-06-06 01:19:36.325542', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470719, 69, '2016-06-06 01:19:36.415935', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470722, 115, '2016-06-06 01:19:36.426515', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470724, 89, '2016-06-06 01:19:36.45817', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470725, 64, '2016-06-06 01:19:36.458191', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470726, 89, '2016-06-06 01:19:36.458253', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470727, 68, '2016-06-06 01:19:36.458385', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470728, 89, '2016-06-06 01:19:36.458465', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470729, 66, '2016-06-06 01:19:36.45863', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470730, 67, '2016-06-06 01:19:36.45817', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470732, 65, '2016-06-06 01:19:36.458897', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470731, 89, '2016-06-06 01:19:36.458737', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470733, 89, '2016-06-06 01:19:36.463325', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470734, 89, '2016-06-06 01:19:36.485938', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470735, 89, '2016-06-06 01:19:36.500202', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470736, 89, '2016-06-06 01:19:36.500188', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470737, 89, '2016-06-06 01:19:36.500464', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470738, 89, '2016-06-06 01:19:36.500477', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470739, 89, '2016-06-06 01:19:36.500774', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470740, 89, '2016-06-06 01:19:36.500862', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470741, 89, '2016-06-06 01:19:36.500861', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470742, 89, '2016-06-06 01:19:36.501131', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470743, 89, '2016-06-06 01:19:36.501121', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470744, 89, '2016-06-06 01:19:36.516591', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470745, 60, '2016-06-06 01:19:36.529616', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470747, 75, '2016-06-06 01:19:36.557208', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470748, 73, '2016-06-06 01:19:36.557308', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470749, 115, '2016-06-06 01:19:36.557326', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470750, 63, '2016-06-06 01:19:36.557208', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470746, 69, '2016-06-06 01:19:36.557211', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470757, 64, '2016-06-06 01:20:36.186748', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470758, 65, '2016-06-06 01:20:36.190283', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470759, 66, '2016-06-06 01:20:36.195633', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470760, 67, '2016-06-06 01:20:36.199587', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470762, 68, '2016-06-06 01:20:36.206087', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470766, 89, '2016-06-06 01:20:36.225516', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470778, 60, '2016-06-06 01:20:36.261088', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470779, 63, '2016-06-06 01:20:36.266344', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470781, 73, '2016-06-06 01:20:36.271862', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470782, 75, '2016-06-06 01:20:36.277061', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470802, 69, '2016-06-06 01:20:36.340411', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470805, 115, '2016-06-06 01:20:36.353354', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470807, 68, '2016-06-06 01:20:36.374344', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470808, 89, '2016-06-06 01:20:36.374349', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470809, 66, '2016-06-06 01:20:36.374509', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470810, 65, '2016-06-06 01:20:36.374524', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470812, 67, '2016-06-06 01:20:36.374344', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470811, 64, '2016-06-06 01:20:36.374362', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470813, 89, '2016-06-06 01:20:36.384724', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470814, 89, '2016-06-06 01:20:36.40458', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470815, 89, '2016-06-06 01:20:36.413626', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470816, 89, '2016-06-06 01:20:36.413615', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470817, 89, '2016-06-06 01:20:36.413615', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470818, 89, '2016-06-06 01:20:36.413965', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470819, 89, '2016-06-06 01:20:36.413747', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470820, 89, '2016-06-06 01:20:36.413858', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470821, 89, '2016-06-06 01:20:36.428423', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470822, 89, '2016-06-06 01:20:36.428406', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470823, 89, '2016-06-06 01:20:36.429956', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470824, 89, '2016-06-06 01:20:36.435051', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470825, 89, '2016-06-06 01:20:36.442838', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470826, 89, '2016-06-06 01:20:36.442903', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470827, 89, '2016-06-06 01:20:36.442842', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470829, 63, '2016-06-06 01:20:36.444181', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470828, 60, '2016-06-06 01:20:36.444166', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470830, 73, '2016-06-06 01:20:36.444178', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470831, 75, '2016-06-06 01:20:36.459962', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470832, 115, '2016-06-06 01:20:36.47158', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470833, 69, '2016-06-06 01:20:36.471558', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470840, 64, '2016-06-06 01:21:36.190931', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470841, 65, '2016-06-06 01:21:36.200214', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470842, 66, '2016-06-06 01:21:36.20533', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470844, 67, '2016-06-06 01:21:36.214573', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470845, 68, '2016-06-06 01:21:36.219832', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470847, 89, '2016-06-06 01:21:36.232874', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470860, 60, '2016-06-06 01:21:36.253824', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470862, 63, '2016-06-06 01:21:36.256258', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470864, 73, '2016-06-06 01:21:36.265405', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470866, 75, '2016-06-06 01:21:36.272264', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470885, 69, '2016-06-06 01:21:36.309928', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470887, 115, '2016-06-06 01:21:36.315205', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470890, 65, '2016-06-06 01:21:36.345473', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470892, 66, '2016-06-06 01:21:36.345458', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470891, 68, '2016-06-06 01:21:36.345475', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470893, 67, '2016-06-06 01:21:36.34581', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470894, 64, '2016-06-06 01:21:36.346756', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470895, 89, '2016-06-06 01:21:36.346815', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470896, 89, '2016-06-06 01:21:36.347045', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470897, 89, '2016-06-06 01:21:36.347087', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470898, 89, '2016-06-06 01:21:36.347395', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470899, 89, '2016-06-06 01:21:36.347684', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470900, 89, '2016-06-06 01:21:36.371414', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470901, 89, '2016-06-06 01:21:36.385318', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470902, 89, '2016-06-06 01:21:36.386449', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470903, 89, '2016-06-06 01:21:36.386434', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470904, 89, '2016-06-06 01:21:36.386434', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470905, 89, '2016-06-06 01:21:36.386622', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470906, 89, '2016-06-06 01:21:36.38666', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470907, 89, '2016-06-06 01:21:36.386672', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470908, 89, '2016-06-06 01:21:36.386799', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470909, 89, '2016-06-06 01:21:36.386831', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470910, 89, '2016-06-06 01:21:36.396906', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470911, 60, '2016-06-06 01:21:36.415641', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470912, 69, '2016-06-06 01:21:36.423274', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470913, 63, '2016-06-06 01:21:36.423334', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470914, 75, '2016-06-06 01:21:36.423493', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470915, 73, '2016-06-06 01:21:36.42348', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470916, 115, '2016-06-06 01:21:36.423626', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470923, 64, '2016-06-06 01:22:36.193955', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470924, 65, '2016-06-06 01:22:36.196743', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470925, 66, '2016-06-06 01:22:36.206215', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470926, 67, '2016-06-06 01:22:36.21156', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470928, 68, '2016-06-06 01:22:36.236387', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470933, 89, '2016-06-06 01:22:36.294287', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470943, 60, '2016-06-06 01:22:36.343295', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470945, 63, '2016-06-06 01:22:36.347269', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470947, 73, '2016-06-06 01:22:36.357762', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470948, 75, '2016-06-06 01:22:36.361739', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470968, 69, '2016-06-06 01:22:36.437568', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470970, 115, '2016-06-06 01:22:36.438139', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470973, 89, '2016-06-06 01:22:36.469151', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470974, 64, '2016-06-06 01:22:36.469163', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470975, 65, '2016-06-06 01:22:36.469926', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470976, 89, '2016-06-06 01:22:36.470352', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470978, 67, '2016-06-06 01:22:36.470519', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470977, 68, '2016-06-06 01:22:36.470389', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470979, 66, '2016-06-06 01:22:36.47073', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470980, 89, '2016-06-06 01:22:36.47123', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470981, 89, '2016-06-06 01:22:36.471564', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470982, 89, '2016-06-06 01:22:36.473105', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470983, 89, '2016-06-06 01:22:36.497968', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470986, 89, '2016-06-06 01:22:36.507119', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470985, 89, '2016-06-06 01:22:36.507119', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470984, 89, '2016-06-06 01:22:36.507119', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470987, 89, '2016-06-06 01:22:36.512553', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470989, 89, '2016-06-06 01:22:36.512688', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470988, 89, '2016-06-06 01:22:36.512563', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470990, 89, '2016-06-06 01:22:36.51286', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470991, 89, '2016-06-06 01:22:36.513077', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470992, 89, '2016-06-06 01:22:36.513872', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470993, 89, '2016-06-06 01:22:36.528231', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470994, 60, '2016-06-06 01:22:36.537624', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470995, 73, '2016-06-06 01:22:36.537717', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470996, 63, '2016-06-06 01:22:36.537612', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470997, 69, '2016-06-06 01:22:36.551997', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470998, 115, '2016-06-06 01:22:36.551987', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (470999, 75, '2016-06-06 01:22:36.551996', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471006, 64, '2016-06-06 01:23:36.201418', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471007, 65, '2016-06-06 01:23:36.202273', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471008, 66, '2016-06-06 01:23:36.204988', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471009, 67, '2016-06-06 01:23:36.210149', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471011, 68, '2016-06-06 01:23:36.220598', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471015, 89, '2016-06-06 01:23:36.250586', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471027, 60, '2016-06-06 01:23:36.316162', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471028, 75, '2016-06-06 01:23:36.317306', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471029, 63, '2016-06-06 01:23:36.317327', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471030, 73, '2016-06-06 01:23:36.3178', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471051, 69, '2016-06-06 01:23:36.389483', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471054, 115, '2016-06-06 01:23:36.405567', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471056, 68, '2016-06-06 01:23:36.429157', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471057, 67, '2016-06-06 01:23:36.429145', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471058, 66, '2016-06-06 01:23:36.429326', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471059, 89, '2016-06-06 01:23:36.429527', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471060, 65, '2016-06-06 01:23:36.429581', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471061, 64, '2016-06-06 01:23:36.429806', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471062, 89, '2016-06-06 01:23:36.438051', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471063, 89, '2016-06-06 01:23:36.438051', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471064, 89, '2016-06-06 01:23:36.43814', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471065, 89, '2016-06-06 01:23:36.43831', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471066, 89, '2016-06-06 01:23:36.456415', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471067, 89, '2016-06-06 01:23:36.466724', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471068, 89, '2016-06-06 01:23:36.467962', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471069, 89, '2016-06-06 01:23:36.468655', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471070, 89, '2016-06-06 01:23:36.469075', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471071, 89, '2016-06-06 01:23:36.468015', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471072, 89, '2016-06-06 01:23:36.478608', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471073, 89, '2016-06-06 01:23:36.478571', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471074, 89, '2016-06-06 01:23:36.478644', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471075, 89, '2016-06-06 01:23:36.478846', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471076, 89, '2016-06-06 01:23:36.487229', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471077, 60, '2016-06-06 01:23:36.497651', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471078, 63, '2016-06-06 01:23:36.497841', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471079, 73, '2016-06-06 01:23:36.505311', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471080, 69, '2016-06-06 01:23:36.506724', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471081, 75, '2016-06-06 01:23:36.506907', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471082, 115, '2016-06-06 01:23:36.515972', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471089, 64, '2016-06-06 01:24:36.182798', '157,43 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471090, 65, '2016-06-06 01:24:36.191299', '332,51 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471091, 66, '2016-06-06 01:24:36.196562', '104,98 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471092, 67, '2016-06-06 01:24:36.200408', '279,96 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471094, 68, '2016-06-06 01:24:36.2055', '59,49 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471111, 63, '2016-06-06 01:24:36.26225', '455,59 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471135, 69, '2016-06-06 01:24:36.337845', '4.626,30 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471140, 67, '2016-06-06 01:24:36.37185', '-279,96 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471143, 89, '2016-06-06 01:24:36.37241', '-17.516,80 €', 'bfa7a2b8-21f7-11e6-b56d-a7bd6b5c5ec4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471146, 89, '2016-06-06 01:24:36.399722', '-17.516,80 €', 'bfa79a98-21f7-11e6-b56d-ff7b2041ba3b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471151, 89, '2016-06-06 01:24:36.412486', '-17.516,80 €', 'bfa7b33e-21f7-11e6-b56d-63a4947c6fe0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471156, 89, '2016-06-06 01:24:36.428556', '-17.516,80 €', 'bfa7a074-21f7-11e6-b56d-032936c92202');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471161, 63, '2016-06-06 01:24:36.448154', '-455,59 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471098, 89, '2016-06-06 01:24:36.224285', '280.268,80 €', 'bfa73e36-21f7-11e6-b56d-4b20bc587983');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471110, 60, '2016-06-06 01:24:36.258353', '175,01 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471142, 68, '2016-06-06 01:24:36.372193', '-59,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471139, 65, '2016-06-06 01:24:36.371851', '-332,51 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471148, 89, '2016-06-06 01:24:36.408876', '-17.516,80 €', 'bfa76aaa-21f7-11e6-b56d-2f49599d1ddc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471150, 89, '2016-06-06 01:24:36.410035', '-17.516,80 €', 'bfa76eec-21f7-11e6-b56d-7f1a64255a9f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471157, 89, '2016-06-06 01:24:36.437597', '-17.516,80 €', 'bfa79fe8-21f7-11e6-b56d-2f226afd5627');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471160, 60, '2016-06-06 01:24:36.439151', '-175,01 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471114, 73, '2016-06-06 01:24:36.273391', '1.704,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471137, 115, '2016-06-06 01:24:36.346521', '0,05 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471145, 89, '2016-06-06 01:24:36.37472', '-17.516,80 €', 'bfa7a3da-21f7-11e6-b56d-4b400a09fb38');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471149, 89, '2016-06-06 01:24:36.410028', '-17.516,80 €', 'bfa779dc-21f7-11e6-b56d-336bd235850c');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471159, 89, '2016-06-06 01:24:36.43888', '-17.516,80 €', 'bfa7a196-21f7-11e6-b56d-2327a469d47f');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471115, 75, '2016-06-06 01:24:36.274604', '3.652,49 €', 'bfa76546-21f7-11e6-b56d-9734714e149b');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471141, 66, '2016-06-06 01:24:36.371949', '-104,98 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471144, 64, '2016-06-06 01:24:36.37259', '-157,43 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471147, 89, '2016-06-06 01:24:36.408887', '-17.516,80 €', 'bfa776a8-21f7-11e6-b56d-bf7c05f5eab4');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471152, 89, '2016-06-06 01:24:36.413844', '-17.516,80 €', 'bfa778c4-21f7-11e6-b56d-5b51486b28d0');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471154, 89, '2016-06-06 01:24:36.419473', '-17.516,80 €', 'bfa7ab50-21f7-11e6-b56d-1f3bef30c3cc');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471155, 89, '2016-06-06 01:24:36.419866', '-17.516,80 €', 'bfa79f52-21f7-11e6-b56d-8f54d6ad9d56');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471153, 89, '2016-06-06 01:24:36.419473', '-17.516,80 €', 'bfa7b3ca-21f7-11e6-b56d-17b5af93fd5a');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471158, 89, '2016-06-06 01:24:36.438899', '-17.516,80 €', 'bfa7a740-21f7-11e6-b56d-8b8db926119d');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471162, 75, '2016-06-06 01:24:36.448341', '-3.652,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471163, 73, '2016-06-06 01:24:36.448346', '-1.704,49 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471164, 69, '2016-06-06 01:24:36.448398', '-4.626,30 €', 'bfa73b02-21f7-11e6-b56d-6ffe69564a95');
INSERT INTO "Zahlungsstrom" (id, "versicherungID", zeitpunkt, betrag, "personID") VALUES (471165, 115, '2016-06-06 01:24:36.449734', '-0,05 €', 'bfa6c82a-21f7-11e6-b56d-e7aac0eb4ace');


--
-- Name: Zahlungsstrom_id_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Zahlungsstrom_id_seq"', 471165, true);


--
-- Name: Zahlungsstrom_versicherungID_seq; Type: SEQUENCE SET; Schema: smartinsurance; Owner: -
--

SELECT pg_catalog.setval('"Zahlungsstrom_versicherungID_seq"', 1, false);


--
-- PostgreSQL database dump complete
--
