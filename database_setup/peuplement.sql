set sqlblanklines on


-- Insertion de professions --
INSERT INTO PROFESSION(label)
VALUES('Plombier');

INSERT INTO PROFESSION(label)
VALUES('Chauffagiste');

INSERT INTO PROFESSION(label)
VALUES('Commercial');

INSERT INTO PROFESSION(label)
VALUES('Peintre');

INSERT INTO PROFESSION(label)
VALUES('Professeur');

INSERT INTO PROFESSION(label)
VALUES('Electricien');

INSERT INTO PROFESSION(label)
VALUES('Banquier');

INSERT INTO PROFESSION(label)
VALUES('Agriculteur');

INSERT INTO PROFESSION(label)
VALUES('Etudiant');


-- Insertion de patients --
INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP)
VALUES ('martin.segoul@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Segoul','Martin', TO_DATE('1998-08-20', 'YYYY-MM-DD'),0, 'M.');

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP, RELATIONSHIP)
VALUES ('bernard.issix@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Issix','Bernard', TO_DATE('1998-08-20', 'YYYY-MM-DD'),1, 'M.', 6);

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP)
VALUES ('valerie.ertue@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Ertue','Valerie', TO_DATE('1998-08-20', 'YYYY-MM-DD'),2, 'Mme');

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP, RELATIONSHIP)
VALUES ('carl.hagrou@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Hagrou','Carl', TO_DATE('1998-08-20', 'YYYY-MM-DD'),2, 'M', 5);

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP, RELATIONSHIP)
VALUES ('catherine.moreau@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Moreau','Catherine', TO_DATE('1998-08-20', 'YYYY-MM-DD'),0, 'Mme',4);

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP, RELATIONSHIP)
VALUES ('sylvie.dubois@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Dubois','Sylvie', TO_DATE('1998-08-20', 'YYYY-MM-DD'),1, 'Mme',2);

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP)
VALUES ('thomas.charbona@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Charbona','Thomas', TO_DATE('1998-08-20', 'YYYY-MM-DD'), 5, 'Enfant');

INSERT INTO PATIENT(USERNAME, PASSWORD, PNAME, FORNAME, BIRTHDATE, KNOWING, TYPEP)
VALUES ('mathilde.cassil@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Cassil','Mathilde', TO_DATE('1998-08-20', 'YYYY-MM-DD'), 4, 'Enfant');
-------------------------
-------------------------

-- Insertion dans a_exerce --
INSERT INTO A_EXERCE(ID_PR, ID_PA)
VALUES(1,1);

INSERT INTO A_EXERCE(ID_PR, ID_PA)
VALUES(2,2);

INSERT INTO A_EXERCE(ID_PR, ID_PA)
VALUES(3,2);

INSERT INTO A_EXERCE(ID_PR, ID_PA)
VALUES(4,1);

INSERT INTO A_EXERCE(ID_PR, ID_PA)
VALUES(1,3);

INSERT INTO A_EXERCE(ID_PR, ID_PA)
VALUES(5,1);
-------------------------
-------------------------




-- Insertion historique profession
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('800','830');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('830','900');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('900','930');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('930','1000');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1000','1030');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1030','1100');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1100','1130');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1130','1200');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1400','1430');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1430','1500');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1500','1530');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1530','1600');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1600','1630');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1630','1700');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1700','1730');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1730','1800');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1800','1830');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1830','1900');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1900','1930');
INSERT INTO CRENEAU_HORAIRE(H_DEBUT, H_FIN)
VALUES('1930','2000');
-------------------------
-------------------------

-- Insertion dans consultation --
INSERT INTO consultation(DATEC, ANXIETY,TYPEC,PAYMENT,PRICE,KEYWORDS,BEHAVIORS,POSTURES,ID_CRENEAU_HORAIRE)
VALUES (TO_DATE('2019-01-30', 'YYYY-MM-DD'),1,0,0,45,'Anxieux, tyranique', 'Stresse a l idee de parler de son passe', 'allonge', 2);


INSERT INTO CONSULTATION(DATEC, ANXIETY,TYPEC,PAYMENT,PRICE,KEYWORDS,BEHAVIORS,POSTURES,ID_CRENEAU_HORAIRE)
VALUES (TO_DATE('2019-01-31', 'YYYY-MM-DD'),3,1,0,45,'Anxieux, tyranique', 'Stresse a l idee de parler de son passe', 'allonge', 2);


INSERT INTO CONSULTATION(DATEC, ANXIETY,TYPEC,PAYMENT,PRICE,KEYWORDS,BEHAVIORS,POSTURES,ID_CRENEAU_HORAIRE)
VALUES (TO_DATE('2019-01-25', 'YYYY-MM-DD'),5,2,0,45,'Anxieux, tyranique', 'Stresse a l idee de parler de son passe', 'allonge', 2);


INSERT INTO CONSULTATION(DATEC, ANXIETY,TYPEC,PAYMENT,PRICE,KEYWORDS,BEHAVIORS,POSTURES,ID_CRENEAU_HORAIRE)
VALUES (TO_DATE('2019-01-26', 'YYYY-MM-DD'),10,2,0,45,'Anxieux, tyranique', 'Stresse a l idee de parler de son passe', 'allonge', 2);


-- Insertion de Seances --
INSERT INTO SEANCE(ID_CO, ID_PA)
VALUES(1,1);

INSERT INTO SEANCE(ID_CO, ID_PA)
VALUES(2,2);

INSERT INTO SEANCE(ID_CO, ID_PA)
VALUES(3,3);
-------------------------