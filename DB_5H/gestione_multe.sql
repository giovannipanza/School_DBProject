DROP DATABASE IF EXISTS gestione_multe_5h;

create DATABASE gestione_multe_5h;

use gestione_multe_5h;

-- Tabella Agenti
CREATE TABLE Agenti (
    Matricola INT PRIMARY KEY,
    Nominativo VARCHAR(50)
);

-- Tabella Automobilisti
CREATE TABLE Automobilisti (
    C_Fiscale CHAR(16) PRIMARY KEY,
    Nominativo VARCHAR(50),
    Indirizzo VARCHAR(100),
    Citta VARCHAR(30),
    CAP CHAR(5)
);

-- Tabella Auto
CREATE TABLE Auto (
    Targa varchar(10) PRIMARY KEY,
    Marca VARCHAR(50),
    Modello VARCHAR(50),
    C_Fiscale CHAR(16),
    FOREIGN KEY (C_Fiscale) REFERENCES Automobilisti(C_Fiscale)
);

-- Tabella Infrazioni
CREATE TABLE Infrazioni (
    Id_Infrazione INT PRIMARY KEY,
    Data DATE,
    Matricola INT,
    TipoInfrazione VARCHAR(50),
    Importo DECIMAL(10, 2),
    Targa VARCHAR(20),
    FOREIGN KEY (Matricola) REFERENCES Agenti(Matricola),
    FOREIGN KEY (Targa) REFERENCES Auto(Targa)
);
