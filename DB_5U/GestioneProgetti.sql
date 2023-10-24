DROP DATABASE IF EXISTS 5u_gestione_progetti;

CREATE DATABASE 5u_gestione_progetti;
use 5u_gestione_progetti;   

-- creare una tabella Impiegato (Matricola,Cognome,Stipendio,Dipartimento)
CREATE TABLE Impiegato (
    Matricola INT,
    Cognome VARCHAR(30) NOT NULL,
    Stipendio DECIMAL (10,2) NOT NULL,
    Dipartimento INT NOT NULL,
    PRIMARY KEY (Matricola)
    -- FOREIGN KEY (Dipartimento) REFERENCES Dipartimento(Codice)
);

-- inserisco i dati nella tabella Impiegato, inseriscimi 10 impiegati diversi
INSERT INTO Impiegato (Matricola,Cognome,Stipendio,Dipartimento) 
        VALUES (1,'Rossi',1000,1), 
        (2,'Verdi',2000,2), 
        (3,'Bianchi',3000,3), 
        (4,'Neri',4000,4), 
        (5,'Gialli',5000,5), 
        (6,'Blu',6000,6), 
        (7,'Arancioni',7000,7), 
        (8,'Viola',8000,8), 
        (9,'Rosa',9000,9), 
        (10,'Marroni',10000,10);

-- creo la tabella Dipartimento (Codice,Nome,Sede,Direttore)
CREATE TABLE Dipartimento (
    Codice INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Sede VARCHAR(30) NOT NULL,
    Direttore INT NOT NULL,
    PRIMARY KEY (Codice),
    FOREIGN KEY (Direttore) REFERENCES Impiegato(Matricola)
);
-- inserisco i dati nella tabella Dipartimento, inseriscimi 10 dipartimenti diversi
INSERT INTO Dipartimento (Nome,Sede,Direttore) 
        VALUES ('Dipartimento 1','Sede 1',1), 
        ('Dipartimento 2','Sede 2',2), 
        ('Dipartimento 3','Sede 3',3), 
        ('Dipartimento 4','Sede 4',4), 
        ('Dipartimento 5','Sede 5',5), 
        ('Dipartimento 6','Sede 6',6), 
        ('Dipartimento 7','Sede 7',7), 
        ('Dipartimento 8','Sede 8',8), 
        ('Dipartimento 9','Sede 9',9), 
        ('Dipartimento 10','Sede 10',10);


-- creo la tabella Progetto (Sigla,Nome,Bilancio,Responsabile)
CREATE TABLE Progetto (
    Sigla VARCHAR(30),
    Nome VARCHAR(30) NOT NULL,
    Bilancio DECIMAL (10,2) NOT NULL,
    Responsabile INT NOT NULL,
    PRIMARY KEY (Sigla),
    FOREIGN KEY (Responsabile) REFERENCES Impiegato(Matricola)
);

-- inserisco i dati nella tabella Progetto, inseriscimi 10 progetti diversi
INSERT INTO Progetto (Sigla,Nome,Bilancio,Responsabile) 
        VALUES ('Sigla 1','Progetto 1',1000,1), 
        ('Sigla 2','Progetto 2',2000,2), 
        ('Sigla 3','Progetto 3',3000,3), 
        ('Sigla 4','Progetto 4',4000,4), 
        ('Sigla 5','Progetto 5',5000,5), 
        ('Sigla 6','Progetto 6',6000,6), 
        ('Sigla 7','Progetto 7',7000,7), 
        ('Sigla 8','Progetto 8',8000,8), 
        ('Sigla 9','Progetto 9',9000,9), 
        ('Sigla 10','Progetto 10',10000,10);

-- creo la tabella Partecipazione (Impiegato,Progetto)
CREATE TABLE Partecipazione (
    Impiegato INT NOT NULL,
    Progetto VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato,Progetto),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Progetto) REFERENCES Progetto(Sigla)
);
-- inserisco i dati nella tabella Partecipazione, inseriscimi 10 partecipazioni diverse
INSERT INTO Partecipazione (Impiegato,Progetto) 
        VALUES (1,'Sigla 1'), 
        (2,'Sigla 2'), 
        (3,'Sigla 3'), 
        (4,'Sigla 4'), 
        (5,'Sigla 5'), 
        (6,'Sigla 6'), 
        (7,'Sigla 7'), 
        (8,'Sigla 8'), 
        (9,'Sigla 9'), 
        (10,'Sigla 10');


-- devo aggiungere sulla tabellq Impiegato un vincolo di integrità referenziale che impedisca di inserire un impiegato con un dipartimento non esistente
ALTER TABLE Impiegato
    ADD CONSTRAINT FK_Dipartimento 
        Foreign Key (Dipartimento) REFERENCES Dipartimento(Codice);