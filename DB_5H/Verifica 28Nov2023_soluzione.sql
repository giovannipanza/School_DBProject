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

-- 2
ALTER TABLE visite
    ADD glicemia INT;

-- 3
INSERT INTO `pazienti` (`id_paziente`, `cognome`, `nome`, `data_nascita`, `provincia_nascita`, `codice_asl`) 
  VALUES  (1, 'Rossi', 'Mario', '1987-03-13', 'MI', 'LU112'), 
          (2, 'Verdi', 'Gino', '1980-02-19', 'CO', 'FE109'), 
          (3, 'Bianchi', 'Pino', '1965-06-10', 'BO', 'FE109'), 
          (4, 'Marelli', 'Tino', '2000-06-03', 'PO', 'PO104'), 
          (5, 'Colombo', 'Rina', '1994-08-11', 'NA', '');

INSERT INTO `visite` (`id_visita`, `data_visita`, `peso`, `altezza`, `pressione_min`, `pressione_max`, `id_paziente`, `glicemia`) 
VALUES (1, '2020-03-10', 120, 189, 98, '189', 1, 111),
				(2, '2021-05-01', 100, 189, 88, '170', 1, 89),
				(3, '2019-02-05', 65, 170, 85, 115, 2, null),
				(4, '2011-11-01', 90, 170, null, null, 2, 133),
				(5, '2020-05-04', 75, 165, 80, 130, 3, null),
				(6, '2017-10-03', 51, 159, 70, 120, 4, 78),
				(7, '2018-02-11', 98, 189, 78, 155, 1, null);
