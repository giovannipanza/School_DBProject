-- gestione immobili adfasdfasdfqasd
DROP DATABASE IF EXISTS 5q_gestione_immobili;

CREATE DATABASE 5q_gestione_immobili;

USE 5q_gestione_immobili;

CREATE TABLE proprietario (
IdP INTEGER PRIMARY KEY,
Cognome CHAR(20),
Nome CHAR(20));

CREATE TABLE immobile (
IdI INTEGER PRIMARY KEY,
idP INTEGER,
Tipo VARCHAR(20),
Vani Integer,
Costo Long,
Sup Integer,
Anno integer,
FOREIGN KEY (idP) REFERENCES proprietario(IdP)
);

drop table if EXISTS annesso;
CREATE TABLE annesso (
idAnnesso INTEGER PRIMARY KEY,
Tipo VARCHAR(20),
Sup Integer,
idI INTEGER,
FOREIGN KEY (idI) REFERENCES immobile(IdI)
);
