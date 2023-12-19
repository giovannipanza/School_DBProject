CREATE TABLE Libri (
    ID_Libro INT PRIMARY KEY,
    Titolo VARCHAR(255) NOT NULL,
    Autore VARCHAR(255) NOT NULL,
    Anno_Pubblicazione YEAR NOT NULL,
    Prezzo DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Clienti (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cognome VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Ordini (
    ID_Ordine INT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Data_Ordine DATE NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clienti(ID_Cliente)
);

CREATE TABLE Dettagli_Ordini (
    ID_Ordine INT,
    ID_Libro INT,
    Quantita INT NOT NULL,
    PRIMARY KEY (ID_Ordine, ID_Libro),
    FOREIGN KEY (ID_Ordine) REFERENCES Ordini(ID_Ordine),
    FOREIGN KEY (ID_Libro) REFERENCES Libri(ID_Libro)
);


-- dati da caricare
INSERT INTO Libri (ID_Libro, Titolo, Autore, Anno_Pubblicazione, Prezzo) VALUES
(1, 'Il Grande Gatsby', 'F. Scott Fitzgerald', 1925, 19.99),
(2, '1984', 'George Orwell', 1949, 15.99),
(3, 'Il Signore degli Anelli', 'J.R.R. Tolkien', 1954, 25.99),
(4, 'Guerra e Pace', 'Lev Tolstoj', 1869, 22.99),
(5, 'Moby Dick', 'Herman Melville', 1851, 18.99),
(6, 'Orgoglio e Pregiudizio', 'Jane Austen', 1813, 17.99),
(7, 'Delitto e Castigo', 'Fedor Dostoevskij', 1866, 20.99),
(8, 'Anna Karenina', 'Lev Tolstoj', 1877, 21.99),
(9, 'Don Chisciotte', 'Miguel de Cervantes', 1605, 24.99),
(10, 'I Fratelli Karamazov', 'Fedor Dostoevskij', 1880, 23.99);

INSERT INTO Clienti (ID_Cliente, Nome, Cognome, Email) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.com'),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi@email.com'),
(3, 'Luca', 'Verdi', 'luca.verdi@email.com'),
(4, 'Sara', 'Neri', 'sara.neri@email.com'),
(5, 'Paolo', 'Bruni', 'paolo.bruni@email.com'),
(6, 'Laura', 'Russo', 'laura.russo@email.com'),
(7, 'Alessandro', 'Ferrari', 'alessandro.ferrari@email.com'),
(8, 'Anna', 'Esposito', 'anna.esposito@email.com'),
(9, 'Matteo', 'Romano', 'matteo.romano@email.com'),
(10, 'Chiara', 'Colombo', 'chiara.colombo@email.com');

INSERT INTO Ordini (ID_Ordine, ID_Cliente, Data_Ordine) VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-20'),
(3, 3, '2023-03-10'),
(4, 4, '2023-04-05'),
(5, 5, '2023-05-21'),
(6, 6, '2023-06-17'),
(7, 7, '2023-07-08'),
(8, 8, '2023-08-30'),
(9, 9, '2023-09-15'),
(10, 10, '2023-10-04');

INSERT INTO Dettagli_Ordini (ID_Ordine, ID_Libro, Quantita) VALUES
(1, 5, 1),
(1, 7, 2),
(2, 3, 1),
(3, 2, 1),
(4, 10, 1),
(4, 1, 1),
(5, 4, 1),
(6, 9, 1),
(7, 6, 2),
(7, 8, 1),
(8, 1, 1),
(9, 3, 1),
(9, 5, 1),
(10, 2, 1),
(10, 7, 1);
