 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------
set sqlblanklines on
------------------------------------------------------------
-- Table: patient
------------------------------------------------------------
CREATE TABLE patient(
	id_pa            NUMBER NOT NULL ,
	username	  VARCHAR2 (50) NOT NULL  ,
	password	  VARCHAR2 (88) NOT NULL  ,
	pname         VARCHAR2 (20) NOT NULL  ,
	forname       VARCHAR2 (20) NOT NULL  ,
	birthDate     DATE  NOT NULL  ,
	knowing       NUMBER(10,0)  NOT NULL  ,
	typep		  VARCHAR2 (19)	NOT NULL,
	relationship  NUMBER(10,0),
	CONSTRAINT PK_patient PRIMARY KEY (id_pa)
);
------------------------------------------------------------
-- Table: profession
------------------------------------------------------------
CREATE TABLE profession(
	id_pr    NUMBER NOT NULL ,
	label  VARCHAR2 (20) NOT NULL  ,
	CONSTRAINT PK_profession PRIMARY KEY (id_pr)
);
------------------------------------------------------------
-- Table: creneau_horaire
------------------------------------------------------------
CREATE TABLE creneau_horaire(
	id_creneau_horaire  NUMBER NOT NULL ,
	h_debut             VARCHAR2 (10) NOT NULL  ,
	h_fin               VARCHAR2 (10) NOT NULL  ,
	CONSTRAINT PK_creneau_horaire PRIMARY KEY (id_creneau_horaire)
);
------------------------------------------------------------
-- Table: consultation
------------------------------------------------------------
CREATE TABLE consultation(
	id_co                  NUMBER NOT NULL ,
	datec				DATE NOT NULL ,
	anxiety             NUMBER(10,0)  NOT NULL  ,
	typec               NUMBER(10,0)  NOT NULL  ,
	payment             NUMBER(10,0)  NOT NULL  ,
	price               NUMBER(10,0)  NOT NULL  ,
	keywords			VARCHAR2(255)  NOT NULL	,
	behaviors			VARCHAR2(255)  NOT NULL	,
	postures			VARCHAR2(255)  NOT NULL ,
	id_creneau_horaire  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT PK_consultation PRIMARY KEY (id_co)
	,CONSTRAINT FK_consultation_creneau_horaire FOREIGN KEY (id_creneau_horaire) REFERENCES creneau_horaire(id_creneau_horaire)
);
------------------------------------------------------------
-- Table: a_exerce
------------------------------------------------------------
CREATE TABLE a_exerce(
	id_pr          NUMBER(10,0)  NOT NULL  ,
	id_pa  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT PK_a_exerce PRIMARY KEY (id_pr,id_pa)
	,CONSTRAINT FK_a_exerce_profession FOREIGN KEY (id_pr) REFERENCES profession(id_pr)
	,CONSTRAINT FK_a_exerce_patient0 FOREIGN KEY (id_pa) REFERENCES patient(id_pa)
);
------------------------------------------------------------
-- Table: Seance
------------------------------------------------------------
CREATE TABLE Seance(
	id_co          NUMBER(10,0)  NOT NULL  ,
	id_pa  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT PK_Seance PRIMARY KEY (id_co,id_pa)
	,CONSTRAINT FK_Seance_consultation FOREIGN KEY (id_co) REFERENCES consultation(id_co)
	,CONSTRAINT FK_Seance_patient0 FOREIGN KEY (id_pa) REFERENCES patient(id_pa)
);
CREATE SEQUENCE Seq_patient_id START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_profession_id START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_creneau_horaire_id_creneau_horaire START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_consultation_id START WITH 1 INCREMENT BY 1 NOCYCLE;

CREATE OR REPLACE TRIGGER patient_id
	BEFORE INSERT ON patient 
  FOR EACH ROW 
	WHEN (NEW.id_pa IS NULL) 
	BEGIN
		 select Seq_patient_id.NEXTVAL INTO :NEW.id_pa from DUAL; 
	END;
	/
CREATE OR REPLACE TRIGGER profession_id
	BEFORE INSERT ON profession 
  FOR EACH ROW 
	WHEN (NEW.id_pr IS NULL) 
	BEGIN
		 select Seq_profession_id.NEXTVAL INTO :NEW.id_pr from DUAL; 
	END;
	/
CREATE OR REPLACE TRIGGER creneau_horaire_id_creneau_horaire
	BEFORE INSERT ON creneau_horaire 
  FOR EACH ROW 
	WHEN (NEW.id_creneau_horaire IS NULL) 
	BEGIN
		 select Seq_creneau_horaire_id_creneau_horaire.NEXTVAL INTO :NEW.id_creneau_horaire from DUAL; 
	END;
	/
CREATE OR REPLACE TRIGGER consultation_id
	BEFORE INSERT ON consultation 
  FOR EACH ROW 
	WHEN (NEW.id_co IS NULL) 
	BEGIN
		 select Seq_consultation_id.NEXTVAL INTO :NEW.id_co from DUAL; 
	END;
	/
