-- Destruction des triggers en place -- 
DROP TRIGGER consultation_id_consultation;
DROP TRIGGER creneau_horaire_id_creneau_horaire;
DROP TRIGGER profession_id_profession;

-- Desctruction des sequences en place --
DROP SEQUENCE Seq_consultation_id_consultation;
DROP SEQUENCE Seq_creneau_horaire_id_creneau_horaire;
DROP SEQUENCE Seq_profession_id_profession;

-- Suppression des tables en place --
DROP TABLE SEANCE CASCADE CONSTRAINTS;
DROP TABLE A_EXERCE CASCADE CONSTRAINTS;
DROP TABLE CONSULTATION CASCADE CONSTRAINTS;
DROP TABLE CRENEAU_HORAIRE CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE PROFESSION CASCADE CONSTRAINTS;
