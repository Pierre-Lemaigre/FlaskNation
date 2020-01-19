set sqlblanklines on


-- Insertion de professions --
INSERT INTO PROFESSION(PROFESSION)
VALUES('Plombier');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Chauffagiste');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Commercial');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Peintre');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Ingénieur Informatique');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Electricien');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Banquier');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Agriculteur');

INSERT INTO PROFESSION(PROFESSION)
VALUES('Etudiant');


-- Insertion de patients --
INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('martin.segoul@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Segoul','Martin', 25, '11 rue du champ, 75012 Paris', 'Internet', 'Homme',4);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('bernard.issix@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Issix','Bernard', 42, '11 rue du champ, 75012 Paris', 'Pages jaunes', 'Homme',1);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('valerie.ertue@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Ertue','Valerie', 32, '11 rue du champ, 75012 Paris', 'Amis', 'Femme',3);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('carl.hagrou@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Hagrou','Carl', 28, '11 rue du champ, 75012 Paris', 'Internet, publicite', 'Homme',7);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('catherine.moreau@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Moreau','Catherine', 24, '11 rue du champ, 75012 Paris', 'Amis', 'Femme',5);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('sylvie.dubois@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Dubois','Sylvie', 43, '11 rue du champ, 75012 Paris', 'Medecin', 'Femme',6);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('thomas.charbona@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Charbona','Thomas', 16, '11 rue du champ, 75012 Paris', 'Internet', 'Adolescent',9);

INSERT INTO PATIENT(EMAIL, MOT_DE_PASSE, NOM, PRENOM, AGE, ADRESSE, CONNAISSANCE, CLASSIFICATION, ID_PROFESSION)
VALUES ('mathilde.cassil@gmail.com', '$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU','Cassil','Mathilde', 14, '11 rue du champ, 75012 Paris', 'Internet', 'Adolescent',9);
-------------------------
-------------------------


-- Insertion historique profession
INSERT INTO a_exerce(ID_PROFESSION, EMAIL)
VALUES (9,'martin.segoul@gmail.com');

INSERT INTO a_exerce(ID_PROFESSION, EMAIL)
VALUES (9,'carl.hagrou@gmail.com');

INSERT INTO a_exerce(ID_PROFESSION, EMAIL)
VALUES (9,'sylvie.dubois@gmail.com');

INSERT INTO a_exerce(ID_PROFESSION, EMAIL)
VALUES (9,'valerie.ertue@gmail.com');
-------------------------
-------------------------


-- Insertion creneaux horaires --
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (800,830,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (830,900,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (900,930,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (930,1000,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1000,1030,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1030,1100,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1100,1130,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1130,1200,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1400,1430,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1430,1500,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1500,1530,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1530,1600,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1600,1630,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1630,1700,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1700,1730,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1730,1800,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1800,1830,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1830,1900,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1900,1930,'LUNDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1930,2000,'LUNDI');

INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (800,830,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (830,900,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (900,930,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (930,1000,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1000,1030,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1030,1100,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1100,1130,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1130,1200,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1400,1430,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1430,1500,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1500,1530,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1530,1600,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1600,1630,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1630,1700,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1700,1730,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1730,1800,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1800,1830,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1830,1900,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1900,1930,'MARDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1930,2000,'MARDI');

INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (800,830,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (830,900,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (900,930,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (930,1000,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1000,1030,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1030,1100,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1100,1130,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1130,1200,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1400,1430,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1430,1500,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1500,1530,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1530,1600,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1600,1630,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1630,1700,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1700,1730,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1730,1800,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1800,1830,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1830,1900,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1900,1930,'MERCREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1930,2000,'MERCREDI');

INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (800,830,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (830,900,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (900,930,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (930,1000,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1000,1030,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1030,1100,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1100,1130,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1130,1200,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1400,1430,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1430,1500,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1500,1530,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1530,1600,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1600,1630,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1630,1700,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1700,1730,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1730,1800,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1800,1830,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1830,1900,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1900,1930,'JEUDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1930,2000,'JEUDI');

INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (800,830,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (830,900,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (900,930,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (930,1000,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1000,1030,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1030,1100,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1100,1130,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1130,1200,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1400,1430,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1430,1500,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1500,1530,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1530,1600,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1600,1630,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1630,1700,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1700,1730,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1730,1800,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1800,1830,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1830,1900,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1900,1930,'VENDREDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1930,2000,'VENDREDI');

INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (800,830,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (830,900,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (900,930,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (930,1000,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1000,1030,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1030,1100,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1100,1130,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1130,1200,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1400,1430,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1430,1500,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1500,1530,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1530,1600,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1600,1630,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1630,1700,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1700,1730,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1730,1800,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1800,1830,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1830,1900,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1900,1930,'SAMEDI');
INSERT INTO CRENEAU_HORAIRE(HEURE_DEBUT_CRENEAU, HEURE_FIN_CRENEAU, JOUR_DE_LA_SEMAINE)
VALUES (1930,2000,'SAMEDI');
-------------------------
-------------------------


-- Insertion de Consultation --
INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200106','YYYYMMDD'), 'Normal', 'Aborder le stress au travail prochaine seance', 4, 'allonge', 1);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200106','YYYYMMDD'), 'Stresse', 'Decouvrir les facteurs du stress et de l anxiete', 7, 'assis', 15);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200107','YYYYMMDD'), 'Insolent', 'R.A.S', 2, 'allonge', 27);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200107','YYYYMMDD'), 'Inquiet', 'Reste trop evasif, il faut creuser les expériences du passe', 2, 'allonge', 32);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200107','YYYYMMDD'), 'Peur', 'Les peurs sont trop importantes, traitement obligatoire', 8, 'allonge', 37);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200108','YYYYMMDD'), 'Excite', 'Sa rencontre peut le sortir de ses crises d angoisses', 2, 'assis', 50);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200108','YYYYMMDD'), 'Normal', 'La derniere seance est prometteuse pour l avenir du patient', 1, 'assis', 57);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200109','YYYYMMDD'), 'Rassure', 'Contrairement a la premiere seance, le patient est moins stresse', 3, 'allonge', 65);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200110','YYYYMMDD'), 'Caricatural', 'Le besoin de s exprimer de ce patient est important mais il a du mal a s expliquer', 2, 'assis', 81);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200110','YYYYMMDD'), 'Vertueux', 'Les seances permettent une amelioration de comportement chez le patient', 4, 'allonge', 84);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200110','YYYYMMDD'), 'Normal', 'Le patient pourra bientot envisage l arret du traitement medicamenteux', 2, 'allonge', 87);

INSERT INTO CONSULTATION(DATE_CONSULTATION, COMPORTEMENT, REMARQUE, ANXIETE, POSTURE, ID_CRENEAU_HORAIRE)
VALUES(TO_DATE('20200111','YYYYMMDD'), 'Inquietant', 'Le patient est de plus en plus dangereux, un internement est conseile', 9, 'Allonge', 110);
-------------------------
-------------------------


-- Insertion de Seances --
INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(1,'martin.segoul@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(2,'bernard.issix@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(3,'thomas.charbona@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(4,'valerie.ertue@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(5,'sylvie.dubois@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(6,'thomas.charbona@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(7,'martin.segoul@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(8,'bernard.issix@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(9,'mathilde.cassil@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(10,'thomas.charbona@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(11,'catherine.moreau@gmail.com');

INSERT INTO SEANCE(ID_CONSULTATION, EMAIL)
VALUES(12,'carl.hagrou@gmail.com');
-------------------------
-------------------------