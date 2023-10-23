DROP DATABASE IF EXISTS 5q_gestione_treni;


CREATE DATABASE 5q_gestione_treni;

USE 5q_gestione_treni;

CREATE TABLE Treni(
    numero INT NOT NULL,
    giorno INT NOT null,
    ora TIME NOT null,
    destinazione VARCHAR(255) NOT null,
    categoria VARCHAR(255) NOT null,
    PRIMARY KEY(numero)
    );
    
CREATE TABLE Stazioni(
    id_stazione INT PRIMARY KEY,
    nome_stazione VARCHAR(255) not null
    );
    
CREATE TABLE Fermate(
    id_stazione INT not NULL,
    num_treno INT not null,
    ora TIME not null,
    PRIMARY KEY (num_treno,id_stazione, ora),
    foreign key (id_stazione) references Stazioni(id_stazione),
    foreign key (num_treno) references Treni(numero)
    );


INSERT INTO Treni (numero, giorno, ora, destinazione, categoria)
VALUES
    (101, 1, '08:00:00', 'Roma', 'Alta Velocità'),
    (102, 2, '09:15:00', 'Milano', 'Regionale'),
    (103, 3, '11:30:00', 'Napoli', 'Intercity'),
    (104, 4, '14:45:00', 'Firenze', 'Alta Velocità'),
    (105, 5, '16:20:00', 'Bologna', 'Regionale'),
    (106, 6, '18:40:00', 'Venezia', 'Alta Velocità'),
    (107, 7, '20:10:00', 'Torino', 'Intercity'),
    (108, 1, '07:30:00', 'Genova', 'Regionale'),
    (109, 2, '10:00:00', 'Palermo', 'Alta Velocità'),
    (110, 3, '13:15:00', 'Catania', 'Regionale');


INSERT INTO Stazioni (id_stazione, nome_stazione) VALUES
(1, 'Roma'),
(2, 'Firenze'),
(3, 'Bologna'),
(4, 'Venezia'),
(5, 'Torino'),
(6, 'Genova'),
(7, 'Palermo'),
(8, 'Catania'),
(9, 'Napoli'),
(10, 'Milano');

-- Inserisci 10 fermate con dati casuali

INSERT INTO Fermate (id_stazione, num_treno, ora)
VALUES (2,102,'12:00:00');

INSERT INTO Fermate (id_stazione, num_treno, ora)
VALUES
    (1, 102, '08:00:00'),
    (2, 103, '08:45:00'),
    (3, 101, '09:30:00'),
    (4, 106, '10:15:00'),
    (5, 101, '11:00:00'),
    (1, 109, '11:45:00'),
    (7, 101, '12:30:00'),
    (8, 101, '13:15:00'),
    (9, 102, '14:00:00'),
    (10, 101, '14:45:00');


--query n.1: tutti i treni diretti a Milano (numero treno e categoria)
select numero, categoria from Treni
    where destinazione='Milano';

--query n.2: tutti i treni diretti a Milano (numero treno e categoria)
-- solo i treni ad alta velocità
select numero, categoria from Treni
    where destinazione='Milano' and categoria='Alta velocità';

--q3: tutti i treni che fermano a Firenze
--soluzione n.1 JOIN CON LA CLAUSULA WHERE
select num_treno, nome_stazione from stazioni, fermate
    where fermate.id_stazione=stazioni.id_stazione
        and stazioni.nome_stazione='Firenze'; 
--soluzione n.2 JOIN NATURALE
select num_treno, nome_stazione from stazioni INNER JOIN fermate
    ON fermate.id_stazione=stazioni.id_stazione
        and stazioni.nome_stazione='Firenze'; 

--q4: Trova tutte le fermate di un treno specifico, ordinate per ora

--q5: Trova tutti i treni che fermano in una stazione specifica e partono dopo un'ora specifica

--q6: Trova tutti i treni che partono da una stazione e arrivano a una destinazione
SELECT numero, nome_stazione, destinazione FROM Stazioni, Fermate, Treni
    WHERE Stazioni.id_stazione = Fermate.id_stazione
        AND Treni.numero = Fermate.num_treno
        AND nome_stazione='Firenze'
        AND destinazione='Milano';

-- soluzione Russo
SELECT t.numero, f.id_stazione, nome_stazione, destinazione FROM Fermate f, Stazioni s, Treni t
    WHERE f.id_stazione=s.id_stazione and f.num_treno=t.numero
        AND nome_stazione = 'Firenze' AND destinazione = 'Milano';
  
