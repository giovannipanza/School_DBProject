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


-- creo la tabella Progetto (Sigla,Nome,Bilancio,Responsabile)
CREATE TABLE Progetto (
    Sigla VARCHAR(30),
    Nome VARCHAR(30) NOT NULL,
    Bilancio DECIMAL (10,2) NOT NULL,
    Responsabile INT NOT NULL,
    PRIMARY KEY (Sigla),
    FOREIGN KEY (Responsabile) REFERENCES Impiegato(Matricola)
);

-- creo la tabella Partecipazione (Impiegato,Progetto)
CREATE TABLE Partecipazione (
    Impiegato INT NOT NULL,
    Progetto VARCHAR(30) NOT NULL,
    PRIMARY KEY (Impiegato,Progetto),
    FOREIGN KEY (Impiegato) REFERENCES Impiegato(Matricola),
    FOREIGN KEY (Progetto) REFERENCES Progetto(Sigla)
);


-- devo aggiungere sulla tabellq Impiegato un vincolo di integrità referenziale che impedisca di inserire un impiegato con un dipartimento non esistente
ALTER TABLE Impiegato
    ADD CONSTRAINT FK_Dipartimento 
        Foreign Key (Dipartimento) REFERENCES Dipartimento(Codice);