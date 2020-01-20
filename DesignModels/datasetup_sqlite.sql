------------------------------------------------------------
--        Script SQLite  
------------------------------------------------------------


------------------------------------------------------------
-- Table: patient
------------------------------------------------------------
CREATE TABLE patient(
	id_pa           INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	username        TEXT NOT NULL ,
	password        TEXT NOT NULL ,
	pname           TEXT NOT NULL ,
	forname         TEXT NOT NULL ,
	birthDate       NUMERIC NOT NULL ,
	knowing         INTEGER NOT NULL ,
	typep           TEXT NOT NULL ,
	relationship    INTEGER NOT NULL
);


------------------------------------------------------------
-- Table: profession
------------------------------------------------------------
CREATE TABLE profession(
	id_pr    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	label    TEXT NOT NULL
);


------------------------------------------------------------
-- Table: creneau_horaire
------------------------------------------------------------
CREATE TABLE creneau_horaire(
	id_creneau_horaire    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	h_debut               TEXT NOT NULL ,
	h_fin                 TEXT NOT NULL
);


------------------------------------------------------------
-- Table: consultation
------------------------------------------------------------
CREATE TABLE consultation(
	id_co                 INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	date_c                NUMERIC NOT NULL ,
	anxiety               INTEGER NOT NULL ,
	type_c                INTEGER NOT NULL ,
	payment               INTEGER NOT NULL ,
	price                 INTEGER NOT NULL ,
	keywords              TEXT NOT NULL ,
	behaviors             TEXT NOT NULL ,
	postures              TEXT NOT NULL ,
	id_creneau_horaire    INTEGER NOT NULL

	,CONSTRAINT FK_consultation_creneau_horaire FOREIGN KEY (id_creneau_horaire) REFERENCES creneau_horaire(id_creneau_horaire)
);


------------------------------------------------------------
-- Table: a_exerce
------------------------------------------------------------
CREATE TABLE a_exerce(
	id_pr    INTEGER NOT NULL ,
	id_pa    INTEGER NOT NULL,
	CONSTRAINT PK_a_exerce PRIMARY KEY (id_pr,id_pa)

	,CONSTRAINT FK_a_exerce_profession FOREIGN KEY (id_pr) REFERENCES profession(id_pr)
	,CONSTRAINT FK_a_exerce_patient0 FOREIGN KEY (id_pa) REFERENCES patient(id_pa)
);


------------------------------------------------------------
-- Table: Seance
------------------------------------------------------------
CREATE TABLE Seance(
	id_co    INTEGER NOT NULL ,
	id_pa    INTEGER NOT NULL,
	CONSTRAINT PK_Seance PRIMARY KEY (id_co,id_pa)

	,CONSTRAINT FK_Seance_consultation FOREIGN KEY (id_co) REFERENCES consultation(id_co)
	,CONSTRAINT FK_Seance_patient0 FOREIGN KEY (id_pa) REFERENCES patient(id_pa)
);


