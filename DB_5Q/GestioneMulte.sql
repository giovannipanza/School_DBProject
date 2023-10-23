DROP DATABASE IF EXISTS 5q_gestione_multe;  

CREATE DATABASE 5q_gestione_multe;

USE 5q_gestione_multe;


-- creo la tabella agente con nome, cognome e matricola chiave primaria
CREATE Table agente (
    matricola int AUTO_INCREMENT PRIMARY key,
    nome VARCHAR(32),
    cognome VARCHAR(32)
);

-- creo la tabella automobilista con c_fiscale chiave primaria, nome, cognome e indirizzo, città e cap
CREATE Table automobilista (
    c_fiscale CHAR(16) PRIMARY KEY,
    nome VARCHAR(32),
    cognome VARCHAR(32),
    indirizzo VARCHAR(64),
    città VARCHAR(32),
    cap char(5)
);


-- completate voi il resto......