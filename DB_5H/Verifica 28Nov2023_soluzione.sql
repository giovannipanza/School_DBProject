create database if not exists `DB_5H_visite`;
       /*!40100 default character set utf8 */;

         use `DB_5H_visite`;

-- 1
CREATE TABLE pazienti(
    id_paziente CHAR(16) PRIMARY KEY,
    cognome VARCHAR(16),
    nome VARCHAR(16),
    data_nascita DATE,
    provincia_nascita VARCHAR(16),
    codice_asl CHAR(16) DEFAULT NULL
);

CREATE TABLE visite(
    id_visita INT PRIMARY KEY,
    data_visita DATE,
    peso INT,
    altezza INT,
    pressione_min INT,
    pressione_max INT,
    id_paziente CHAR(16),
    FOREIGN KEY (id_paziente) REFERENCES pazienti(id_paziente)
);

use `DB_5H_visite`;
-- 2
ALTER TABLE visite
    ADD glicemia INT;

-- 3
INSERT INTO `pazienti` (`id_paziente`, `cognome`, `nome`, `data_nascita`, `provincia_nascita`, `codice_asl`)
VALUES (1, 'Rossi', 'Mario', '1987-03-13', 'MI', 'LU112'),
        (2, 'Verdi', 'Gino', '1980-02-19', 'CO', 'FE109'),
        (3, 'Bianchi', 'Pino', '1965-06-10', 'BO', 'FE109'),
        (4, 'Marelli', 'Tino', '2000-06-03', 'PO', 'PO104'),
        (5, 'Colombo', 'Rina', '1994-08-11', 'NA', '');
INSERT INTO `visite` (`id_visita`, `data_visita`, `peso`, `altezza`, `pressione_min`, `pressione_max`, `id_paziente`, `glicemia`)
VALUES (1, '2020-03-10', 120, 189, 98, 189, 1, 111),
             (2, '2021-05-01', 100, 189, 88, 170, 1, 89),
                (3, '2019-02-05', 65, 170, 85, 115, 2, null),
                    (4, '2011-11-01', 90, 170, null, null, 2, 133),
                        (5, '2020-05-04', 75, 165, 80, 130, 3, null),
                            (6, '2017-10-03', 51, 159, 70, 120, 4, 78),
                                 (7, '2018-02-11', 98, 189, 78, 155, 1, null);

-- 4 Stampare tutti i dati delle visite del paziente n. 2
SELECT * FROM visite WHERE id_paziente = 2;

-- 5 Per il paziente n. 1, stampare un report contenente l’andamento cronologico del suo peso
SELECT data_visita, peso FROM visite
        WHERE id_paziente = 1 ORDER BY data_visita;

-- 6. Quante visite sono state fatte per ciascun paziente? Scrivere la query che consente di rispondere a questa domanda.
SELECT id_paziente, COUNT(*) AS visite FROM visite GROUP BY id_paziente;

-- 7. Senza usare query annidate, è possibile in modo un po’ “artigianale” ricavare qual è il paziente più alto. Scrivere la query che consente di fare ciò.
SELECT id_paziente, altezza FROM visite ORDER BY altezza DESC LIMIT 1;

-- 8. Stampare nome e cognome di tutti i pazienti che festeggiano il compleanno a giugno
SELECT nome, cognome FROM pazienti WHERE MONTH(data_nascita) = 6;

-- 9. Calcolare il peso medio misurato per ciascun paziente
SELECT id_paziente, AVG(peso) AS peso_medio FROM visite GROUP BY id_paziente;

-- 10. Trovare ID_visita e data di tutte le visite nelle quali non è stata misurata la glicemia
SELECT id_visita, data_visita FROM visite WHERE glicemia IS NULL;

-- 11. Trovare i valori più alto e più basso rilevati per la glicemia
SELECT MAX(glicemia) AS max_glicemia, MIN(glicemia) AS min_glicemia FROM visite;

-- 12. Stampare id, nome, cognome e data di nascita di tutti i pazienti il cui nome è formato da una lettera sola + “ino” (es. Pino, ma non Luigino)
SELECT id_paziente, nome, cognome, data_nascita FROM pazienti WHERE nome LIKE '_ino';

-- 13 Modificare il database aggiungendo la seguente tabella: ASL(codice, regione, descrizione azienda)
CREATE TABLE asl(
    codice CHAR(16) PRIMARY KEY,
    regione VARCHAR(16),
    descrizione_azienda VARCHAR(16)
);
-- occorre a questo punto effettuare delle modifiche alle altre tabelle del database
-- NB. Eseguire prima la QUERY N.14 (INSERT) altrimenti errore
ALTER TABLE pazienti ADD FOREIGN KEY (codice_asl) REFERENCES asl(codice);

-- 14. Scrivere le query di inserimento in modo che siano presenti i seguenti valori:
INSERT INTO ASL (codice, regione, descrizione_azienda)
    VALUES ('LU102', 'Toscana', 'Lucca'),
           ('PO104', 'Toscana', 'Prato'),
           ('SI107', 'Toscana', 'Siena'),
           ('FE109', 'Emilia Romagna', 'Azienda USL Ferrara'),
           ('LU112', 'Toscana', 'Versilia');

-- 15 Modificare eventuali record nella tabella dei pazienti che non abbiano assegnato un codice ASL, assegnandoli all’ASL di Prato.
    UPDATE pazienti
    SET codice_asl = 'PO104'
    WHERE codice_asl IS NULL;

-- 16 Eliminare dalla tabella delle ASL la riga corrispondente alla descrizione “Lucca”. È possibile farlo? Perché? Spiegare.
    DELETE FROM asl WHERE descrizione_azienda = 'Lucca';
    -- Non è possibile farlo perché la riga è referenziata dalla tabella pazienti e ci sono pazienti con asl a Lucca
    -- con  ON DELETE CASCADE sarebbe possibile farlo ma ....

-- 17 (a) Calcolare la quantità di visite effettuate per ciascuna ASL, ordinate da quella meno numerosa a quella più numerosa.
SELECT codice_asl, COUNT(*) AS visite FROM pazienti GROUP BY codice_asl ORDER BY visite;
-- 17 (b) calcola quantita asl presenti in ciascuna regione ordinate da piu' a meno numerosa
SELECT regione, COUNT(*) AS asl FROM asl GROUP BY regione ORDER BY asl DESC;

-- 18. Stampare i tre pazienti più giovani.
SELECT * FROM pazienti ORDER BY data_nascita DESC LIMIT 3;

-- 19. Stampare tutti i dati delle ASL che si trovano al di fuori della Toscana.
SELECT * FROM asl WHERE regione != 'Toscana';

-- 20. Eliminare la colonna della provincia di nascita dalla tabella dei pazienti.
ALTER TABLE pazienti
    DROP COLUMN provincia_nascita;
