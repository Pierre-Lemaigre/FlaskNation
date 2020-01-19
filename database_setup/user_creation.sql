-- Creation d'un espace de création de table sauvegardee dans psy_app.dbf
CREATE TABLESPACE psyapp
  	DATAFILE 'psy_app.dbf'
 	SIZE 200m;


-- Creation d'un utilisateur avec pour espace de table celui creer precedement --
CREATE USER psy_admin
    IDENTIFIED by Pierrot123
    DEFAULT TABLESPACE psyapp;

-- Attribution des droits essentiels pour la gestion de la base de donnee --
GRANT CREATE ANY TABLE,
      SELECT ANY TABLE,
      UPDATE ANY TABLE,
      DELETE ANY TABLE,
      INSERT ANY TABLE,
      ALTER ANY TABLE,
      DROP ANY TABLE
    TO psy_admin;


GRANT CREATE ANY TRIGGER, DROP ANY TRIGGER TO psy_admin;
GRANT CREATE ANY SEQUENCE, DROP ANY SEQUENCE, SELECT ANY SEQUENCE TO psy_admin;

-- Attributin du droit de connection et d'utilisation de l'epace de table --
GRANT CREATE SESSION TO psy_admin;
GRANT UNLIMITED TABLESPACE TO psy_admin;