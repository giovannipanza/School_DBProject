DROP DATABASE IF EXISTS gestione_multe_5h;

create DATABASE gestione_multe_5h;

use gestione_multe_5h;

-- Tabella Agenti
CREATE TABLE Agenti (
    Matricola INT PRIMARY KEY,
    Nominativo VARCHAR(50)
);

-- aggiungo il campo nome e il campo cognome alla tabella Agenti
ALTER TABLE Agenti
    ADD Nomee VARCHAR(50),
    ADD Cognome VARCHAR(50);

-- rimuovo il campo nominativo dalla tabella Agenti
ALTER TABLE Agenti
    DROP Nominativo;

-- rinomino il campo nome di Agenti in first_name
ALTER TABLE Agenti
    CHANGE Nomee Nome VARCHAR(50);

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
    Targa varchar(7) PRIMARY KEY,
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


-- data set Agenti
-- Inserimento degli agenti
INSERT INTO Agenti (Matricola, Nome, Cognome) VALUES
(101, 'Marco', 'Bianchi'),
(102, 'Laura', 'Verdi'),
(103, 'Giulia', 'Romano'),
(104, 'Simone', 'Ferrari'),
(105, 'Alessia', 'Esposito'),
(106, 'Luca', 'Ricci'),
(107, 'Sara', 'Moretti'),
(108, 'Fabio', 'Russo'),
(109, 'Elena', 'Rossetti'),
(110, 'Davide', 'Giallo');


-- data set Automobilisti
INSERT INTO Automobilisti (C_Fiscale, Nominativo, Indirizzo, Citta, CAP) VALUES
('ABC12345Z', 'Mario Rossi', 'Via Roma 1', 'Roma', '00100'),
('DEF67890Y', 'Laura Bianchi', 'Corso Italia 22', 'Milano', '20100'),
('GHI13579X', 'Luca Verdi', 'Viale dei Fiori 5', 'Napoli', '80100'),
('JKL24680W', 'Giulia Neri', 'Piazza Duomo 7', 'Firenze', '50100'),
('MNO35791V', 'Antonio Esposito', 'Largo Garibaldi 10', 'Bari', '70100'),
('PQR46802U', 'Sofia Moretti', 'Via Mazzini 15', 'Torino', '10100'),
('STU57913T', 'Giovanni Gialli', 'Corso Vittorio Emanuele 3', 'Palermo', '90100'),
('VWX68024S', 'Chiara Rossetti', 'Via Dante 20', 'Verona', '37100'),
('YZA79135R', 'Elena Ferrara', 'Piazza Navona 12', 'Bologna', '40100'),
('BCD80246Q', 'Marco Russo', 'Corso Umberto 18', 'Genova', '16100');
-- mi converti i dati inseriti in automobilisti in formato csv

-- data set Auto
INSERT INTO Auto (Targa, Marca, Modello, C_Fiscale) VALUES
('AB123CD', 'Fiat', 'Panda', 'ABC12345Z'),
('XY456ZW', 'Ford', 'Focus', 'ABC12345Z'),
('LM789NO', 'Volkswagen', 'Golf', 'DEF67890Y'),
('CD012EF', 'Renault', 'Clio', 'DEF67890Y'),
('GH345IJ', 'Toyota', 'Yaris', 'GHI13579X'),
('KL678MN', 'Audi', 'A3', 'GHI13579X'),
('OP901QR', 'Mercedes', 'C-Class', 'JKL24680W'),
('ST234UV', 'BMW', '3 Series', 'JKL24680W'),
('WX567YZ', 'Hyundai', 'i30', 'MNO35791V'),
('AB890CD', 'Kia', 'Sportage', 'MNO35791V'),
('EF123GH', 'Peugeot', '208', 'PQR46802U'),
('IJ456KL', 'Volvo', 'XC40', 'PQR46802U'),
('MN789OP', 'Citroen', 'C4', 'STU57913T'),
('QR012ST', 'Mazda', 'CX-5', 'STU57913T'),
('UV345WX', 'Subaru', 'Impreza', 'VWX68024S'),
('YZ678AB', 'Tesla', 'Model 3', 'VWX68024S'),
('CD901EF', 'Chevrolet', 'Camaro', 'YZA79135R'),
('GH234IJ', 'Jaguar', 'F-Type', 'YZA79135R'),
('KL567MN', 'Ferrari', '488 GTB', 'BCD80246Q'),
('OP890QR', 'Lamborghini', 'Huracan', 'BCD80246Q');

-- data set Infrazioni
INSERT INTO Infrazioni (Id_Infrazione, Data, Matricola, TipoInfrazione, Importo, Targa) VALUES
(1, '2023-01-15', 101, 'Eccesso di velocità', 100.00, 'AB123CD'),
(2, '2023-02-20', 102, 'Sosta vietata', 50.00, 'LM789NO'),
(3, '2023-03-05', 103, 'Guida senza cintura', 80.00, 'OP901QR'),
(4, '2023-04-10', 104, 'Attraversamento col rosso', 120.00, 'WX567YZ'),
(5, '2023-05-12', 105, 'Mancato uso frecce', 60.00, 'EF123GH'),
(6, '2023-06-18', 106, 'Telefono cellulare alla guida', 90.00, 'UV345WX'),
(7, '2023-07-22', 107, 'Eccesso di velocità', 100.00, 'CD901EF'),
(8, '2023-08-25', 108, 'Sosta vietata', 50.00, 'KL567MN'),
(9, '2023-09-30', 109, 'Guida senza cintura', 80.00, 'MN789OP'),
(10, '2023-10-05', 110, 'Attraversamento col rosso', 120.00, 'YZ678AB'),
(11, '2023-11-08', 101, 'Eccesso di velocità', 100.00, 'KL567MN'),
(12, '2023-12-12', 102, 'Sosta vietata', 50.00, 'UV345WX'),
(13, '2024-01-15', 103, 'Guida senza cintura', 80.00, 'YZ678AB'),
(14, '2024-02-20', 104, 'Attraversamento col rosso', 120.00, 'AB890CD'),
(15, '2024-03-25', 105, 'Mancato uso frecce', 60.00, 'CD012EF'),
(16, '2024-04-28', 106, 'Telefono cellulare alla guida', 90.00, 'GH345IJ'),
(17, '2024-05-30', 107, 'Eccesso di velocità', 100.00, 'EF123GH'),
(18, '2024-06-05', 108, 'Sosta vietata', 50.00, 'ST234UV'),
(19, '2024-07-08', 109, 'Guida senza cintura', 80.00, 'AB123CD'),
(20, '2024-08-12', 110, 'Attraversamento col rosso', 120.00, 'CD901EF'),
(21, '2024-09-15', 101, 'Eccesso di velocità', 100.00, 'GH345IJ'),
(22, '2024-10-20', 102, 'Sosta vietata', 50.00, 'KL567MN'),
(23, '2024-11-25', 103, 'Guida senza cintura', 80.00, 'UV345WX'),
(24, '2024-12-28', 104, 'Attraversamento col rosso', 120.00, 'YZ678AB'),
(25, '2025-01-02', 105, 'Mancato uso frecce', 60.00, 'OP901QR'),
(26, '2025-02-08', 106, 'Telefono cellulare alla guida', 90.00, 'LM789NO'),
(27, '2025-03-12', 107, 'Eccesso di velocità', 100.00, 'WX567YZ'),
(28, '2025-04-15', 108, 'Sosta vietata', 50.00, 'CD012EF'),
(29, '2025-05-18', 109, 'Guida senza cintura', 80.00, 'AB890CD'),
(30, '2025-06-20', 110, 'Attraversamento col rosso', 120.00, 'EF123GH');






delete from automobilisti where C_Fiscale = 'C_Fiscale'; 
