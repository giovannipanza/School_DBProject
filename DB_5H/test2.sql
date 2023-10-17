CREATE DATABASE Articoli;

USE articoli;

CREATE TABLE fornitore (
  codice INT AUTO_INCREMENT,
  ragione_sociale VARCHAR(255) NOT NULL,
  indirizzo VARCHAR(255) NOT NULL,
  citta VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (codice)
);

CREATE TABLE articolo (
  codice INT AUTO_INCREMENT,
  descrizione VARCHAR(255) NOT NULL,
  prezzo DECIMAL(10,2) NOT NULL,
  codice_fornitore INT,      -- questo campo è la chiave esterna
  PRIMARY KEY (codice),
  Foreign Key (codice_fornitore) REFERENCES fornitore(codice)   -- vincolo di integrità referenziale
);