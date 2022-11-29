-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2022 at 01:46 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinika_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresyzamieszkania`
--

CREATE TABLE `adresyzamieszkania` (
  `idAdresyZamieszkania` int(11) NOT NULL,
  `Pacjenci_idPacjenci` int(11) NOT NULL,
  `Ulica` varchar(45) DEFAULT NULL,
  `KodPocztowy` varchar(6) NOT NULL,
  `Miejscowosc` varchar(45) NOT NULL,
  `NrDomu` varchar(5) NOT NULL,
  `NrMieszkania` varchar(5) DEFAULT NULL,
  `WielkoscMiejscowosci` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `badania`
--

CREATE TABLE `badania` (
  `idBadania` int(11) NOT NULL,
  `RodzajBadania_idRodzajBadania` int(11) NOT NULL,
  `MaterialWizyty_idMaterialWizyty` int(11) NOT NULL,
  `DataUzyskaniaWyniku` datetime DEFAULT NULL,
  `WynikBadania` varchar(45) DEFAULT NULL,
  `Komentarz` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `daneusera`
--

CREATE TABLE `daneusera` (
  `idDaneUsera` int(11) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `Hasło` varchar(45) NOT NULL,
  `Imie` varchar(45) NOT NULL,
  `Nazwisko` varchar(45) NOT NULL,
  `Pesel` varchar(11) DEFAULT NULL,
  `NrTelefonu` int(11) DEFAULT NULL,
  `DataUtworzenia` datetime NOT NULL,
  `DataModyfikacji` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `daneusera`
--

INSERT INTO `daneusera` (`idDaneUsera`, `Login`, `Hasło`, `Imie`, `Nazwisko`, `Pesel`, `NrTelefonu`, `DataUtworzenia`, `DataModyfikacji`) VALUES
(1, 'user1', 'pwd', 'Ania', 'Kowalska', '95847377748', 795838273, '2022-11-29 10:43:12', '2022-11-29 10:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `diagnozy`
--

CREATE TABLE `diagnozy` (
  `OznaczenieChoroby` varchar(10) NOT NULL,
  `OpisChoroby` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diagnozy`
--

INSERT INTO `diagnozy` (`OznaczenieChoroby`, `OpisChoroby`) VALUES
('A02', 'Inne zakażenia wywołane przez Salmonella'),
('A25', 'Gorączka szczurza'),
('A67', 'Pinta'),
('G91', 'Wodogłowie'),
('I50', 'Niewydolność serca');

-- --------------------------------------------------------

--
-- Table structure for table `diagnozywizyty`
--

CREATE TABLE `diagnozywizyty` (
  `idDiagnozyWizyty` int(11) NOT NULL,
  `Wizyty_idWizyty` int(11) NOT NULL,
  `Diagnozy_OznaczenieChoroby` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leki`
--

CREATE TABLE `leki` (
  `idLeki` int(11) NOT NULL,
  `Nazwa leku` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leki`
--

INSERT INTO `leki` (`idLeki`, `Nazwa leku`) VALUES
(1, 'Vividrin 30'),
(2, 'Natrax 100'),
(3, 'Doreta 700'),
(4, 'Ibum 2000'),
(5, 'Ibufen 50');

-- --------------------------------------------------------

--
-- Table structure for table `lekiwizyty`
--

CREATE TABLE `lekiwizyty` (
  `idLekiWizyty` int(11) NOT NULL,
  `Leki_idLeki` int(11) NOT NULL,
  `Wizyty_idWizyty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listauprawnien`
--

CREATE TABLE `listauprawnien` (
  `idListaUprawnien` int(11) NOT NULL,
  `Uprawnienie` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `listauprawnien`
--

INSERT INTO `listauprawnien` (`idListaUprawnien`, `Uprawnienie`) VALUES
(1, 'Rejestrator'),
(2, 'Lekarz'),
(3, 'Diagnosta');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `idMaterial` int(11) NOT NULL,
  `RodzajMaterialu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`idMaterial`, `RodzajMaterialu`) VALUES
(1, 'Krew'),
(2, 'Mocz'),
(3, 'Kał'),
(4, 'Ślina'),
(5, 'Wymaz z nosogardzieli'),
(6, 'Surowica'),
(7, 'Osocze');

-- --------------------------------------------------------

--
-- Table structure for table `materialwizyty`
--

CREATE TABLE `materialwizyty` (
  `idMaterialWizyty` int(11) NOT NULL,
  `Wizyty_idWizyty` int(11) NOT NULL,
  `Material_idMaterial` int(11) NOT NULL,
  `DataPobrania` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pacjenci`
--

CREATE TABLE `pacjenci` (
  `idPacjenci` int(11) NOT NULL,
  `Pesel` varchar(11) DEFAULT NULL,
  `Imię` varchar(45) NOT NULL,
  `Nazwisko` varchar(45) NOT NULL,
  `Płeć` enum('K','M') NOT NULL,
  `DataUrodzenia` date NOT NULL,
  `DataUtworzenia` datetime NOT NULL,
  `DataModyfikacji` datetime NOT NULL,
  `DaneUsera_idDaneUsera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacjenci`
--

INSERT INTO `pacjenci` (`idPacjenci`, `Pesel`, `Imię`, `Nazwisko`, `Płeć`, `DataUrodzenia`, `DataUtworzenia`, `DataModyfikacji`, `DaneUsera_idDaneUsera`) VALUES
(21, '932487025', 'Julia', 'De', 'M', '2022-11-25', '2022-11-29 13:34:06', '2022-11-29 13:34:06', 1),
(22, '4879325325', 'Ania', 'De', 'M', '2022-11-25', '2022-11-29 13:37:33', '2022-11-29 13:37:33', 1),
(23, '4879325325', 'Ania', 'De', 'K', '2022-11-25', '2022-11-29 13:37:48', '2022-11-29 13:37:48', 1),
(24, '91748735456', 'Ada', 'Er', 'K', '2022-11-25', '2022-11-29 13:38:39', '2022-11-29 13:38:39', 1),
(25, '91748735456', 'Facet', 'Em', 'M', '2022-11-25', '2022-11-29 13:41:46', '2022-11-29 13:41:46', 1),
(26, '91748735456', 'Kobieta', 'Em', 'K', '2022-11-25', '2022-11-29 13:42:06', '2022-11-29 13:42:06', 1),
(27, '91748735456', 'Trans', 'Em', '', '2022-11-25', '2022-11-29 13:42:30', '2022-11-29 13:42:30', 1),
(28, '91748735456', 'Kobieta1', 'Em', 'K', '2022-11-25', '2022-11-29 13:42:54', '2022-11-29 13:42:54', 1),
(29, '91748735456', 'Kobieta2', 'Em', 'K', '2022-11-25', '2022-11-29 13:42:59', '2022-11-29 13:42:59', 1),
(30, '91748735456', 'Kobieta3', 'Em', 'K', '2022-11-25', '2022-11-29 13:43:04', '2022-11-29 13:43:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rodzajbadania`
--

CREATE TABLE `rodzajbadania` (
  `idRodzajBadania` int(11) NOT NULL,
  `Badanie` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rodzajbadania`
--

INSERT INTO `rodzajbadania` (`idRodzajBadania`, `Badanie`) VALUES
(5, 'Bakterie'),
(4, 'Hormony'),
(2, 'Mikrobiom'),
(1, 'Morfologia'),
(3, 'Wirusy');

-- --------------------------------------------------------

--
-- Table structure for table `uprawnienia`
--

CREATE TABLE `uprawnienia` (
  `idUprawnienia` int(11) NOT NULL,
  `DaneUsera_idDaneUsera` int(11) NOT NULL,
  `ListaUprawnien_idListaUprawnien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wizyty`
--

CREATE TABLE `wizyty` (
  `idWizyty` int(11) NOT NULL,
  `DataWizyty` datetime NOT NULL,
  `Pacjenci_idPacjenci` int(11) NOT NULL,
  `DaneUsera_idDaneUsera` int(11) NOT NULL,
  `Zalecenia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresyzamieszkania`
--
ALTER TABLE `adresyzamieszkania`
  ADD PRIMARY KEY (`idAdresyZamieszkania`),
  ADD UNIQUE KEY `idAdresyZamieszkania_UNIQUE` (`idAdresyZamieszkania`),
  ADD UNIQUE KEY `Pacjenci_idPacjenci_UNIQUE` (`Pacjenci_idPacjenci`),
  ADD KEY `fk_AdresyZamieszkania_Pacjenci1_idx` (`Pacjenci_idPacjenci`);

--
-- Indexes for table `badania`
--
ALTER TABLE `badania`
  ADD PRIMARY KEY (`idBadania`),
  ADD UNIQUE KEY `idBadania_UNIQUE` (`idBadania`),
  ADD UNIQUE KEY `RodzajBadania_idRodzajBadania_UNIQUE` (`RodzajBadania_idRodzajBadania`),
  ADD UNIQUE KEY `MaterialWizyty_idMaterialWizyty_UNIQUE` (`MaterialWizyty_idMaterialWizyty`),
  ADD KEY `fk_Badania_RodzajBadania1_idx` (`RodzajBadania_idRodzajBadania`),
  ADD KEY `fk_Badania_MaterialWizyty1_idx` (`MaterialWizyty_idMaterialWizyty`);

--
-- Indexes for table `daneusera`
--
ALTER TABLE `daneusera`
  ADD PRIMARY KEY (`idDaneUsera`),
  ADD UNIQUE KEY `Login_UNIQUE` (`Login`),
  ADD KEY `Nazwisko` (`Nazwisko`),
  ADD KEY `Pesel` (`Pesel`);

--
-- Indexes for table `diagnozy`
--
ALTER TABLE `diagnozy`
  ADD PRIMARY KEY (`OznaczenieChoroby`),
  ADD UNIQUE KEY `OznaczenieChoroby_UNIQUE` (`OznaczenieChoroby`);

--
-- Indexes for table `diagnozywizyty`
--
ALTER TABLE `diagnozywizyty`
  ADD UNIQUE KEY `Wizyty_idWizyty_UNIQUE` (`Wizyty_idWizyty`),
  ADD UNIQUE KEY `idDiagnozyWizyty_UNIQUE` (`idDiagnozyWizyty`),
  ADD KEY `fk_DiagnozyWizyty_Wizyty1_idx` (`Wizyty_idWizyty`),
  ADD KEY `fk_DiagnozyWizyty_Diagnozy1_idx` (`Diagnozy_OznaczenieChoroby`);

--
-- Indexes for table `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`idLeki`),
  ADD UNIQUE KEY `idLeki_UNIQUE` (`idLeki`);

--
-- Indexes for table `lekiwizyty`
--
ALTER TABLE `lekiwizyty`
  ADD PRIMARY KEY (`idLekiWizyty`),
  ADD UNIQUE KEY `idLekiWizyty_UNIQUE` (`idLekiWizyty`),
  ADD UNIQUE KEY `Leki_idLeki_UNIQUE` (`Leki_idLeki`),
  ADD UNIQUE KEY `Wizyty_idWizyty_UNIQUE` (`Wizyty_idWizyty`),
  ADD KEY `fk_LekiWizyty_Leki1_idx` (`Leki_idLeki`),
  ADD KEY `fk_LekiWizyty_Wizyty1_idx` (`Wizyty_idWizyty`);

--
-- Indexes for table `listauprawnien`
--
ALTER TABLE `listauprawnien`
  ADD PRIMARY KEY (`idListaUprawnien`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`idMaterial`),
  ADD UNIQUE KEY `idMaterial_UNIQUE` (`idMaterial`);

--
-- Indexes for table `materialwizyty`
--
ALTER TABLE `materialwizyty`
  ADD PRIMARY KEY (`idMaterialWizyty`),
  ADD UNIQUE KEY `idMaterialWizyty_UNIQUE` (`idMaterialWizyty`),
  ADD UNIQUE KEY `Material_idMaterial_UNIQUE` (`Material_idMaterial`),
  ADD UNIQUE KEY `Wizyty_idWizyty_UNIQUE` (`Wizyty_idWizyty`),
  ADD KEY `fk_MaterialWizyty_Wizyty1_idx` (`Wizyty_idWizyty`),
  ADD KEY `fk_MaterialWizyty_Material1_idx` (`Material_idMaterial`);

--
-- Indexes for table `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`idPacjenci`),
  ADD UNIQUE KEY `idPacjenci_UNIQUE` (`idPacjenci`),
  ADD KEY `fk_Pacjenci_DaneUsera1_idx` (`DaneUsera_idDaneUsera`);

--
-- Indexes for table `rodzajbadania`
--
ALTER TABLE `rodzajbadania`
  ADD PRIMARY KEY (`idRodzajBadania`),
  ADD UNIQUE KEY `idRodzajBadania_UNIQUE` (`idRodzajBadania`),
  ADD UNIQUE KEY `Badanie_UNIQUE` (`Badanie`);

--
-- Indexes for table `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD PRIMARY KEY (`idUprawnienia`),
  ADD KEY `fk_Uprawnienia_DaneUsera_idx` (`DaneUsera_idDaneUsera`),
  ADD KEY `fk_Uprawnienia_ListaUprawnien1` (`ListaUprawnien_idListaUprawnien`);

--
-- Indexes for table `wizyty`
--
ALTER TABLE `wizyty`
  ADD PRIMARY KEY (`idWizyty`),
  ADD UNIQUE KEY `idWizyty_UNIQUE` (`idWizyty`),
  ADD UNIQUE KEY `Pacjenci_idPacjenci_UNIQUE` (`Pacjenci_idPacjenci`),
  ADD UNIQUE KEY `DaneUsera_idDaneUsera_UNIQUE` (`DaneUsera_idDaneUsera`),
  ADD KEY `fk_Wizyty_Pacjenci1_idx` (`Pacjenci_idPacjenci`),
  ADD KEY `fk_Wizyty_DaneUsera1_idx` (`DaneUsera_idDaneUsera`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresyzamieszkania`
--
ALTER TABLE `adresyzamieszkania`
  MODIFY `idAdresyZamieszkania` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daneusera`
--
ALTER TABLE `daneusera`
  MODIFY `idDaneUsera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `leki`
--
ALTER TABLE `leki`
  MODIFY `idLeki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `listauprawnien`
--
ALTER TABLE `listauprawnien`
  MODIFY `idListaUprawnien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `materialwizyty`
--
ALTER TABLE `materialwizyty`
  MODIFY `idMaterialWizyty` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `idPacjenci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `rodzajbadania`
--
ALTER TABLE `rodzajbadania`
  MODIFY `idRodzajBadania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uprawnienia`
--
ALTER TABLE `uprawnienia`
  MODIFY `idUprawnienia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wizyty`
--
ALTER TABLE `wizyty`
  MODIFY `idWizyty` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresyzamieszkania`
--
ALTER TABLE `adresyzamieszkania`
  ADD CONSTRAINT `fk_AdresyZamieszkania_Pacjenci1` FOREIGN KEY (`Pacjenci_idPacjenci`) REFERENCES `pacjenci` (`idPacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `badania`
--
ALTER TABLE `badania`
  ADD CONSTRAINT `fk_Badania_MaterialWizyty1` FOREIGN KEY (`MaterialWizyty_idMaterialWizyty`) REFERENCES `materialwizyty` (`idMaterialWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Badania_RodzajBadania1` FOREIGN KEY (`RodzajBadania_idRodzajBadania`) REFERENCES `rodzajbadania` (`idRodzajBadania`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `diagnozywizyty`
--
ALTER TABLE `diagnozywizyty`
  ADD CONSTRAINT `fk_DiagnozyWizyty_Diagnozy1` FOREIGN KEY (`Diagnozy_OznaczenieChoroby`) REFERENCES `diagnozy` (`OznaczenieChoroby`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DiagnozyWizyty_Wizyty1` FOREIGN KEY (`Wizyty_idWizyty`) REFERENCES `wizyty` (`idWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lekiwizyty`
--
ALTER TABLE `lekiwizyty`
  ADD CONSTRAINT `fk_LekiWizyty_Leki1` FOREIGN KEY (`Leki_idLeki`) REFERENCES `leki` (`idLeki`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LekiWizyty_Wizyty1` FOREIGN KEY (`Wizyty_idWizyty`) REFERENCES `wizyty` (`idWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `materialwizyty`
--
ALTER TABLE `materialwizyty`
  ADD CONSTRAINT `fk_MaterialWizyty_Material1` FOREIGN KEY (`Material_idMaterial`) REFERENCES `material` (`idMaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MaterialWizyty_Wizyty1` FOREIGN KEY (`Wizyty_idWizyty`) REFERENCES `wizyty` (`idWizyty`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD CONSTRAINT `fk_Pacjenci_DaneUsera1` FOREIGN KEY (`DaneUsera_idDaneUsera`) REFERENCES `daneusera` (`idDaneUsera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD CONSTRAINT `fk_Uprawnienia_DaneUsera` FOREIGN KEY (`DaneUsera_idDaneUsera`) REFERENCES `daneusera` (`idDaneUsera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Uprawnienia_ListaUprawnien1` FOREIGN KEY (`ListaUprawnien_idListaUprawnien`) REFERENCES `listauprawnien` (`idListaUprawnien`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wizyty`
--
ALTER TABLE `wizyty`
  ADD CONSTRAINT `fk_Wizyty_DaneUsera1` FOREIGN KEY (`DaneUsera_idDaneUsera`) REFERENCES `daneusera` (`idDaneUsera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Wizyty_Pacjenci1` FOREIGN KEY (`Pacjenci_idPacjenci`) REFERENCES `pacjenci` (`idPacjenci`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
