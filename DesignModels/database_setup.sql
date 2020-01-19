 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------
set sqlblanklines on
------------------------------------------------------------
-- Table: profession
------------------------------------------------------------
CREATE TABLE profession(
	id_profession  NUMBER NOT NULL ,
	profession     VARCHAR2 (50) NOT NULL  ,
	CONSTRAINT PK_profession PRIMARY KEY (id_profession)
);
------------------------------------------------------------
-- Table: patient
------------------------------------------------------------
CREATE TABLE patient(
	email           VARCHAR2 (50) NOT NULL  ,
	nom             VARCHAR2 (50) NOT NULL  ,
	prenom          VARCHAR2 (50) NOT NULL  ,
	age             NUMBER(10,0)  NOT NULL  ,
	adresse         VARCHAR2 (128) NOT NULL  ,
	connaissance    VARCHAR2 (30) NOT NULL  ,
	classification  VARCHAR2 (10) NOT NULL  ,
	id_profession   NUMBER(10,0)   ,
	CONSTRAINT PK_patient PRIMARY KEY (email)
	,CONSTRAINT FK_patient_profession FOREIGN KEY (id_profession) REFERENCES profession(id_profession)
);
------------------------------------------------------------
-- Table: creneau_horaire
------------------------------------------------------------
CREATE TABLE creneau_horaire(
	id_creneau_horaire  NUMBER NOT NULL ,
	date_debut_creneau  NUMBER(10,0)  NOT NULL  ,
	date_fin_creneau    NUMBER(10,0)  NOT NULL  ,
	jour_de_la_semaine  VARCHAR2 (50) NOT NULL  ,
	CONSTRAINT PK_creneau_horaire PRIMARY KEY (id_creneau_horaire)
);
------------------------------------------------------------
-- Table: consultation
------------------------------------------------------------
CREATE TABLE consultation(
	id_consultation     NUMBER NOT NULL ,
	date_consultation   DATE  NOT NULL  ,
	comportement        VARCHAR2 (20) NOT NULL  ,
	remarque            VARCHAR2 (200) NOT NULL  ,
	anxiete             NUMBER(10,0)  NOT NULL  ,
	posture             VARCHAR2 (20) NOT NULL  ,
	id_creneau_horaire  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT PK_consultation PRIMARY KEY (id_consultation)
	,CONSTRAINT FK_consultation_creneau_horaire FOREIGN KEY (id_creneau_horaire) REFERENCES creneau_horaire(id_creneau_horaire)
);
------------------------------------------------------------
-- Table: a_exerce
------------------------------------------------------------
CREATE TABLE a_exerce(
	id_profession  NUMBER(10,0)  NOT NULL  ,
	email          VARCHAR2 (50) NOT NULL  ,
	CONSTRAINT PK_a_exerce PRIMARY KEY (id_profession,email)
	,CONSTRAINT FK_a_exerce_profession FOREIGN KEY (id_profession) REFERENCES profession(id_profession)
	,CONSTRAINT FK_a_exerce_patient0 FOREIGN KEY (email) REFERENCES patient(email)
);
------------------------------------------------------------
-- Table: Seance
------------------------------------------------------------
CREATE TABLE Seance(
	id_consultation  NUMBER(10,0)  NOT NULL  ,
	email            VARCHAR2 (50) NOT NULL  ,
	CONSTRAINT PK_Seance PRIMARY KEY (id_consultation,email)
	,CONSTRAINT FK_Seance_consultation FOREIGN KEY (id_consultation) REFERENCES consultation(id_consultation)
	,CONSTRAINT FK_Seance_patient0 FOREIGN KEY (email) REFERENCES patient(email)
);
CREATE SEQUENCE Seq_profession_id_profession START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_creneau_horaire_id_creneau_horaire START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_consultation_id_consultation START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE OR REPLACE TRIGGER profession_id_profession
	BEFORE INSERT ON profession 
  FOR EACH ROW 
	WHEN (NEW.id_profession IS NULL) 
	BEGIN
		 select Seq_profession_id_profession.NEXTVAL INTO :NEW.id_profession from DUAL; 
	END;
CREATE OR REPLACE TRIGGER creneau_horaire_id_creneau_horaire
	BEFORE INSERT ON creneau_horaire 
  FOR EACH ROW 
	WHEN (NEW.id_creneau_horaire IS NULL) 
	BEGIN
		 select Seq_creneau_horaire_id_creneau_horaire.NEXTVAL INTO :NEW.id_creneau_horaire from DUAL; 
	END;
CREATE OR REPLACE TRIGGER consultation_id_consultation
	BEFORE INSERT ON consultation 
  FOR EACH ROW 
	WHEN (NEW.id_consultation IS NULL) 
	BEGIN
		 select Seq_consultation_id_consultation.NEXTVAL INTO :NEW.id_consultation from DUAL; 
	END;

