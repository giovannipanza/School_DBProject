DROP DATABASE IF EXISTS 5q_gestione_multe;

CREATE DATABASE 5q_gestione_multe;

USE 5q_gestione_multe;

CREATE TABLE
    Agenti(
        Matricola INTEGER,
        Nominativo VARCHAR(50),
        PRIMARY KEY(Matricola)
    );

-- inseriscimi 10 agenti in modo casuale

INSERT INTO
    Agenti (Matricola, Nominativo)
VALUES (1, 'Mario Rossi'), (2, 'Luigi Verdi'), (3, 'Giovanni Bianchi'), (4, 'Paolo Neri'), (5, 'Marco Gialli'), (6, 'Giacomo Marroni'), (7, 'Gianluca Viola'), (8, 'Giuseppe Rosa'), (9, 'Giorgio Blu'), (10, 'Giancarlo Giallo');

CREATE TABLE
    Automobilisti(
        C_Fiscale VARCHAR(16),
        Nominativo VARCHAR(30),
        Indirizzo VARCHAR(25),
        Citta VARCHAR(20),
        CAP VARCHAR(5),
        PRIMARY KEY(C_Fiscale)
    );

-- inseriscimi 10 automobilisti in modo casuale

INSERT INTO
    automobilisti (
        C_Fiscale,
        Nominativo,
        Indirizzo,
        Citta,
        CAP
    )
VALUES (
        'pnz',
        'Lombardo',
        'Via Piave',
        '59100'
    ), (
        'mrc',
        'Bianchi',
        'Via Roma',
        '59100'
    ), (
        'gcm',
        'Rossi',
        'Via Garibaldi',
        '59100'
    ), (
        'gcm',
        'Verdi',
        'Via Garibaldi',
        '59100'
    ), (
        'nra',
        'Neri',
        'Via Garibaldi',
        '59100'
    ), (
        'gla',
        'Gialli',
        'Via Garibaldi',
        '59100'
    ), (
        'mri',
        'Marroni',
        'Via Garibaldi',
        '59100'
    ), (
        'vla',
        'Viola',
        'Via Garibaldi',
        '59100'
    ), (
        'rsa',
        'Rosa',
        'Via Garibaldi',
        '59100'
    ), (
        'blu',
        'Blu',
        'Via Garibaldi',
        '59100'
    ), (
        'gco',
        'Giallo',
        'Via Garibaldi',
        '59100'
    );

CREATE TABLE
    Auto(
        Targa VARCHAR(10),
        Marca VARCHAR(25),
        Modello VARCHAR(20),
        C_Fiscale VARCHAR(16),
        FOREIGN KEY(C_Fiscale) REFERENCES Automobilisti(C_Fiscale),
        PRIMARY KEY(Targa)
    );

-- inseriscimi 10 auto in modo casuale diverse per targa, per marca e per modello

INSERT INTO
    Auto (
        Targa,
        Marca,
        Modello,
        C_Fiscale
    )
VALUES (
        'dp911xz',
        'Fiat',
        'Punto',
        'pnz'
    ), (
        'fg305vj',
        'Ford',
        'Fiesta',
        'mri'
    ), (
        'gg706ut',
        'Mercedes',
        'gla',
        'vla'
    ), (
        'hh123aa',
        'Fiat',
        'Punto',
        'gcm'
    ), (
        'ii456bb',
        'Fiat',
        'Punto',
        'gcm'
    ), (
        'jj789cc',
        'Fiat',
        'Panda',
        'nra'
    ), (
        'kk012dd',
        'Nissan',
        'Leaf',
        'gla'
    ), (
        'll345ee',
        'Fiat',
        'Punto',
        'mrc'
    ), (
        'mm678ff',
        'Fiat',
        'Punto',
        'gcm'
    ), (
        'nn901gg',
        'Fiat',
        'Punto',
        'gcm'
    )

CREATE TABLE
    Infrazioni(
        Id_Infrazione VARCHAR(10),
        Data DATETIME,
        Matricola INTEGER,
        TipoInfrazione VARCHAR(25),
        Importo DOUBLE,
        Targa VARCHAR(10),
        FOREIGN KEY(Matricola) REFERENCES Agenti(Matricola),
        FOREIGN KEY(Targa) REFERENCES Auto(Targa)
    );

-- inseriscimi 10 infrazioni in modo casuale con i dati che ho già inserito nelle varie tabelle

INSERT INTO
    Infrazioni (
        Id_Infrazione,
        Data,
        Matricola,
        TipoInfrazione,
        Importo,
        Targa
    )
VALUES (
        '1',
        '2019-01-01 00:00:00',
        1,
        'Velocità',
        100,
        'dp911xz'
    ), (
        '2',
        '2019-01-01 00:00:00',
        2,
        'Velocità',
        100,
        'fg305vj'
    ), (
        '3',
        '2019-01-01 00:00:00',
        3,
        'divieto di sosta',
        100,
        'gg706ut'
    ), (
        '4',
        '2019-01-01 00:00:00',
        4,
        'semaforo rosso',
        100,
        'hh123aa'
    ), (
        '5',
        '2019-01-01 00:00:00',
        5,
        'Velocità',
        100,
        'ii456bb'
    ), (
        '6',
        '2019-01-01 00:00:00',
        6,
        'eccesso di velocità',
        100,
        'jj789cc'
    ), (
        '7',
        '2019-01-01 00:00:00',
        7,
        'Velocità',
        100,
        'kk012dd'
    ), (
        '8',
        '2019-01-01 00:00:00',
        8,
        'Velocità',
        100,
        'll345ee'
    ), (
        '9',
        '2019-01-01 00:00:00',
        9,
        'Velocità',
        100,
        'mm678ff'
    ), (
        '10',
        '2019-01-01 00:00:00',
        10,
        'Velocità',
        100,
        'nn901gg'
    );