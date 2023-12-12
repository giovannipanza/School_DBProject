
create database GestioneCorsi_5U;
use GestioneCorsi_5U;
--creazione tabelle alunno, insegnante, corso, iscritto
CREATE TABLE alunno(
    id_alunno INT NOT NULL PRIMARY KEY,
    cognome VARCHAR(30) NOT NULL,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE insegnante(
    id_insegnante INT NOT NULL PRIMARY KEY,
    cognome VARCHAR(30) NOT NULL,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE corso(
    id_corso INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    id_insegnante INT NOT NULL,
    importo1rata DECIMAL(5,2) NOT NULL,
    importo2rata DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_insegnante) REFERENCES insegnante(id_insegnante)
);

CREATE TABLE iscritto(
    id_alunno INT NOT NULL,
    id_corso INT NOT NULL,
    1rata VARCHAR(30) NOT NULL,
    2rata VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_alunno, id_corso),
    FOREIGN KEY (id_alunno) REFERENCES alunno(id_alunno),
    FOREIGN KEY (id_corso) REFERENCES corso(id_corso)
);

-- 1 Calcolare la media del costo complessivo dei corsi.
    select avg(importo1rata+importo2rata) as TotaleCorsi from corso;

-- 2 Trovare tutti i corsi (codice e nome) a cui è iscritto l’alunno “Pistone Mario”
    select c.codice, c.nome from corso c join iscrizione i
        on c.codice = i.codicecorso join alunno a on i.codicealunno = a.codice
                            where a.nome = 'Pistone' and a.cognome = 'Mario';

-- 2 Trovare tutti i corsi (codice e nome) a cui è iscritto l’alunno “Pistone Mario” - utilizza le query nidificate
    select c.codice, c.nome from corso c
        where c.codice in (select i.codicecorso from iscrizione i
        where i.codicealunno in (select a.codice from alunno a
                            where a.nome = 'Pistone' and a.cognome = 'Mario'));

-- 3 Stampare tutti i dati degli alunni iscritti a corsi tenuti dalla prof.ssa Brunori
    select * from alunno a join iscritto i
        on a.id_alunno = i.id_alunno join corso c on i.id_corso = c.id_corso
        join insegnante ins on c.id_insegnante=ins.id_insegnante
                            where ins.nome = 'Elena' and ins.cognome='Brunori';

/* 4 Calcolare il totale incassato ad oggi per il corso n. 1 (cybersecurity)
   prendendo in considerazione tutti gli studenti che hanno pagato la 1 rata o
   la 2 rata, ma anche quelli che hanno pagato entrambe le rate e fai la somma
 */
select (
    (
    SELECT SUM(importo1rata)
    FROM corso c
    JOIN iscritto i ON c.id_corso = i.id_corso
    WHERE (c.id_corso = 1 AND 1rata='si')
    )
               +
    (
    SELECT SUM(importo2rata)
    FROM corso c
    JOIN iscritto i ON c.id_corso = i.id_corso
    WHERE (c.id_corso = 1 AND 2rata='si')
    )
       ) as totale_incassato;

-- 5 Stampare tutti i dati dei corsi che hanno un costo totale superiore alla media
    select * from corso where importo1rata+importo2rata > 
                              (select avg(importo1rata+importo2rata) from corso);


-- 6 Calcolare il numero di rate non pagate
    select sum(
       (SELECT COUNT(*) AS prima_non_pagate
FROM iscritto
WHERE 1rata = 'no')
       +
       (SELECT COUNT(*) AS seconda_non_pagate
FROM iscritto
WHERE 2rata = 'no')
       );


-- 7 Trovare per ogni corso il suo costo totale
    select c.nome, c.importo1rata+c.importo2rata as costo_totale from corso c;

-- 8 Trovare tutti i corsi (id e nome) che hanno un costo inferiore a 300 €
    select c.id_corso, c.nome from corso c where c.importo1rata+c.importo2rata < 300;

-- 9 Calcolare il totale incassato ad oggi per il pagamento delle rate di tutti i corsi
    select sum(
    (
    SELECT SUM(importo1rata)   AS totale_1rata
    FROM corso c
    JOIN iscritto i ON c.id_corso = i.id_corso
    WHERE (1rata='si')
    )
               +
    (
    SELECT SUM(importo2rata)   AS totale_2rata
    FROM corso c
    JOIN iscritto i ON c.id_corso = i.id_corso
    WHERE (2rata='si')
    )
       );
-- 10 Trovare tutti gli insegnanti (nome e cognome) di corsi che hanno un costo inferiore a 300 €
    select i.nome, i.cognome from insegnante i
        join corso c on i.id_insegnante = c.id_insegnante
                             where c.importo1rata+c.importo2rata < 300;

-- 11 Trovare eventuali corsi a cui non è stato ancora assegnato nessun insegnante
    select c.nome from corso c where c.id_insegnante is null;

-- 12 Trovare il numero di corsi insegnati da ciascun docente (nome e cognome)
select i.nome, i.cognome, count(c.id_insegnante) as numero_corsi from insegnante i
        join corso c on i.id_insegnante = c.id_insegnante
        group by i.nome, i.cognome;
