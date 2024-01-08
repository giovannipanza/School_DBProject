-- creo un database chiamato db_libri
drop database if exists db_libri2;
create database db_libri2;

-- attivo il data base
use db_libri2;


CREATE TABLE Libri (
    ID_Libro INT PRIMARY KEY,
    Titolo VARCHAR(255) NOT NULL,
    Autore VARCHAR(255) NOT NULL,
    Anno_Pubblicazione int(4) NOT NULL,
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

-- 1. Elencare i clienti che hanno ordinato il libro più costoso.
-- Soluzioni non corrette
select titolo, max(prezzo) from Libri;
select titolo, max(prezzo) from Libri
    group by titolo;
select titolo from Libri
    order by prezzo desc
    limit 1;
-- Soluzione corretta
select c.nome, c.cognome from Clienti c
    join Ordini o on c.id_cliente = o.id_cliente
    join Dettagli_Ordini d on o.id_ordine = d.id_ordine
    join Libri l on d.id_libro = l.id_libro
    where l.prezzo= (select min(prezzo) from Libri);

-- 2. Trovare i libri il cui prezzo è superiore alla media del prezzo dei libri.
select avg(prezzo) as MediaPrezzi from Libri;
select titolo, prezzo from Libri
    where prezzo > (select avg(prezzo) from Libri);

-- 3. Elencare i titoli dei libri che non sono mai stati ordinati.
-- aggiungo un nuovo libro
insert into Libri (ID_Libro, Titolo, Autore, Anno_Pubblicazione, Prezzo) VALUES (11,'Il Piccolo Principe','Antoine de Saint-Exupéry',1943,12.99);
select distinct ID_Libro from Dettagli_Ordini;
select ID_Libro, Titolo from Libri
    where ID_Libro not in (select distinct ID_Libro from Dettagli_Ordini);

-- 4. Elencare i libri che sono stati ordinati esattamente due volte.
-- 4.a numero di ordini per ogni libro
select ID_Libro, count(ID_Ordine) as NumeroOrdini from Dettagli_Ordini
    group by ID_Libro;
-- 4.b libri ordinati più di una volta
-- 4.a versione non nidificata
select l.ID_Libro, Titolo  as NumeroOrdini from Dettagli_Ordini do, Libri l
   where l.ID_Libro=do.ID_Libro
    group by ID_Libro
    having count(ID_Ordine) = 2;
-- 4.b versione nidificata
select ID_Libro, Titolo from Libri
    where ID_Libro in (select ID_Libro  as NumeroOrdini from Dettagli_Ordini
                            group by ID_Libro
                                having count(ID_Ordine) = 2);

-- 5.  Trovare i clienti che hanno ordinato solo libri pubblicati dopo il 1850.
-- 5.a libri ordinati dopo il 1850
select ID_Libro from Libri
    where Anno_Pubblicazione > 1850;
-- 5.b libri ordinati fino al 1850
select ID_Libro from Libri
    where Anno_Pubblicazione <= 1850;

select ID_Cliente, Nome, Cognome from Clienti
    where ID_Cliente in (select ID_Libro from Libri where Anno_Pubblicazione > 1850)
        and ID_Cliente not in (select ID_Libro from Libri where Anno_Pubblicazione <= 1850);

