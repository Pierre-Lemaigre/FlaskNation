-- Destruction des triggers en place -- 
DROP TRIGGER patient_id;
DROP TRIGGER profession_id;
DROP TRIGGER creneau_horaire_id_creneau_horaire;
DROP TRIGGER consultation_id;

-- Desctruction des sequences en place --
DROP SEQUENCE Seq_profession_id;
DROP SEQUENCE Seq_creneau_horaire_id_creneau_horaire;
DROP SEQUENCE Seq_patient_id;
DROP SEQUENCE Seq_consultation_id;

-- Suppression des tables en place --
DROP TABLE SEANCE CASCADE CONSTRAINTS;
DROP TABLE A_EXERCE CASCADE CONSTRAINTS;
DROP TABLE CONSULTATION CASCADE CONSTRAINTS;
DROP TABLE CRENEAU_HORAIRE CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE PROFESSION CASCADE CONSTRAINTS;
