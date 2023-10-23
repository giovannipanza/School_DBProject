DROP DATABASE IF EXISTS 5q_gestione_prodotti;

CREATE DATABASE gestione_prodotti;

-- attivo il db
USE gestione_prodotti;

-- Crea la tabella Fornitori
CREATE TABLE Fornitori (
  CodiceFornitore INT AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Indirizzo VARCHAR(255) NOT NULL,
  Città VARCHAR(255) NOT NULL,
  PRIMARY KEY (CodiceFornitore)
);

-- Crea la tabella Prodotti
CREATE TABLE Prodotti (
  CodiceProdotto INT AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Marca VARCHAR(255) NOT NULL,
  Modello VARCHAR(255) NOT NULL,
  PRIMARY KEY (CodiceProdotto)
);

-- Crea la tabella Catalogo
CREATE TABLE Catalogo (
  CodiceFornitore INT NOT NULL,
  CodiceProdotto INT NOT NULL,
  Costo DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (CodiceFornitore, CodiceProdotto),
  FOREIGN KEY (CodiceFornitore) REFERENCES Fornitori (CodiceFornitore),
  FOREIGN KEY (CodiceProdotto) REFERENCES Prodotti (CodiceProdotto)
);
