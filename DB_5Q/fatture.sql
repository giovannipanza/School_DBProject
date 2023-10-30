-- Dump della struttura del database fatturazione
DROP DATABASE IF EXISTS `5q_fatturazione`;

CREATE DATABASE IF NOT EXISTS `5q_fatturazione` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `5q_fatturazione`;

-- Dump della struttura di tabella fatturazione.articoli
CREATE TABLE IF NOT EXISTS `articoli` (
  `ID_articolo` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(17) DEFAULT NULL,
  `prezzo_unitario` float DEFAULT NULL,
  `id_fattura` int(11) DEFAULT NULL,
  `importo` varchar(6) DEFAULT NULL,
  `evaso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_articolo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella fatturazione.articoli: ~5 rows (circa)
/*!40000 ALTER TABLE `articoli` DISABLE KEYS */;
REPLACE INTO `articoli` (`ID_articolo`, `descrizione`, `prezzo_unitario`, `id_fattura`, `importo`, `evaso`) VALUES
	(1, 'penna biro', 2.2, NULL, NULL, NULL),
	(2, 'stilografica', 1.9, NULL, NULL, NULL),
	(3, 'gomma', 0.9, NULL, NULL, NULL),
	(4, 'busta trasparente', 2.5, NULL, NULL, NULL),
	(5, 'risma A4', 9.6, NULL, NULL, NULL);
/*!40000 ALTER TABLE `articoli` ENABLE KEYS */;

-- Dump della struttura di tabella fatturazione.clienti
CREATE TABLE IF NOT EXISTS `clienti` (
  `ID_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `ragione_sociale` varchar(22) DEFAULT NULL,
  `indirizzo` varchar(22) DEFAULT NULL,
  `citta` varchar(7) DEFAULT NULL,
  `cod_fiscale` varchar(17) DEFAULT NULL,
  `partita_iva` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella fatturazione.clienti: ~7 rows (circa)
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
REPLACE INTO `clienti` (`ID_cliente`, `ragione_sociale`, `indirizzo`, `citta`, `cod_fiscale`, `partita_iva`) VALUES
	(1, 'La casa del pc', 'via mazzini 3', 'Milano', '1002003001', '1002003001'),
	(2, 'Nobis', 'via verdi 121', 'Torino', '1002003011', '1002003011'),
	(3, 'computer compound 3', 'via colombo 98', 'Genova', '1004003011', '1004003011'),
	(4, 'computer compound 1', 'via benbelli 45', 'Como', '1052003011', '1052003011'),
	(5, 'Nobis BIS', 'via cortini 678', 'Milano', '1032003011', '1032003011'),
	(6, 'il computer', 'p.zza grande 1', 'Bologna', '1012003011', '1012003011'),
	(7, 'Rossi Gino', 'Via Roma,33', 'Como', 'RSSGNN68H111C933T', 'NULL');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;

-- Dump della struttura di tabella fatturazione.fatture
CREATE TABLE IF NOT EXISTS `fatture` (
  `ID_fattura` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `pagata` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_fattura`),
  KEY `a_fatture_FK` (`id_cliente`),
  CONSTRAINT `a_fatture_FK` FOREIGN  KEY (`id_cliente`) REFERENCES `clienti` (`ID_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella fatturazione.fatture: ~18 rows (circa)
/*!40000 ALTER TABLE `fatture` DISABLE KEYS */;
REPLACE INTO `fatture` (`ID_fattura`, `numero`, `data`, `id_cliente`, `pagata`) VALUES
	(1, 11, '12/07/2013', 1, NULL),
	(2, 12, '01/08/2013', 2, NULL),
	(3, 13, '20/12/2013', 1, NULL),
	(4, 1, '29/05/2014', 1, NULL),
	(5, 2, '03/11/2014', 2, NULL),
	(6, 1, '21/02/2015', 3, NULL),
	(7, 2, '22/04/2015', 3, NULL),
	(8, 100, '28/01/2016', 5, NULL),
	(9, 101, '22/06/2016', 5, NULL),
	(10, 1, '09/04/2017', 5, NULL),
	(11, 2, '11/11/2017', 5, NULL),
	(12, 3, '02/04/2017', 5, NULL),
	(13, 10, '05/09/2019', 5, NULL),
	(14, 12, '10/10/2019', 1, NULL),
	(15, 55, '01/10/2020', 2, NULL),
	(16, 54, '10/10/2021', 2, NULL),
	(17, 56, '15/10/2021', 6, NULL),
	(18, 78, '16/10/2021', 6, NULL);
/*!40000 ALTER TABLE `fatture` ENABLE KEYS */;

-- Dump della struttura di tabella fatturazione.fatture_articoli
CREATE TABLE IF NOT EXISTS `fatture_articoli` (
  `id_fattura` int(11) NOT NULL,
  `id_articolo` int(11) NOT NULL,
  `quantita` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fattura`,`id_articolo`),
  foreign key(id_fattura) references fatture(id_fattura),
  foreign Key (id_articolo) REFERENCES articoli(ID_articolo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella fatturazione.fatture_articoli: ~27 rows (circa)
/*!40000 ALTER TABLE `fatture_articoli` DISABLE KEYS */;
REPLACE INTO `fatture_articoli` (`id_fattura`, `id_articolo`, `quantita`) VALUES
	(1, 2, 1),
	(1, 3, 5),
	(1, 4, 2),
	(2, 1, 6),
	(2, 2, 6),
    (3, 1, 1),
    (3, 2, 1),
    (3, 3, 1),
    (3, 4, 1),
    (4, 1, 1),
	(4, 2, 1),
	(4, 3, 1),
	(7, 1, 9),
	(8, 1, 1),
	(9, 2, 1),
	(10, 4, 10),
	(11, 2, 1),
	(12, 3, 23),
	(13, 1, 1),
	(13, 2, 1),
	(16, 3, 5),
	(16, 4, 3);
/*!40000 ALTER TABLE `fatture_articoli` ENABLE KEYS */;

