DROP DATABASE IF EXISTS Gestione_Prodotti;

-- creo il data base
CREATE DATABASE Gestione_Prodotti;

USE Gestione_Prodotti;

-- creo la tabella fornitori
-- Fornitori (CodiceFornitore, Nome, Indirizzo, Città) 
CREATE Table fornitori (
    codice_fornitore int AUTO_INCREMENT PRIMARY key,
    nome VARCHAR(32),
    indirizzo VARCHAR(64),
    città VARCHAR(32)
);

-- Creo la tabella prodotti
-- Prodotti (CodiceProdotto, Nome, Marca, Modello) 
CREATE Table prodotti (
    codice_prodotto int AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(32),
    marca VARCHAR(32),
    modello VARCHAR(32)
);


-- DROP Table fornitori;

-- Catalogo (CodiceFornitore, CodiceProdotto, Costo)
CREATE Table catalogo (
    codice_fornitore int,
    codice_prodotto int,
    costo DECIMAL(8,2),
    PRIMARY KEY(codice_fornitore,codice_prodotto),
    Foreign Key (codice_fornitore) 
            REFERENCES fornitori(codice_fornitore),
    Foreign Key (codice_prodotto) 
            REFERENCES prodotti(codice_prodotto)
);