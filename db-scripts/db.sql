-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Mrz 2022 um 16:57
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `bitshop`
--

CREATE DATABASE IF NOT EXISTS `bitshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bitshop`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hersteller`
--

CREATE TABLE `hersteller` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hersteller`
--

INSERT INTO `hersteller` (`id`, `name`) VALUES
(1, 'nvidia'),
(2, 'amd'),
(3, 'asus'),
(4, 'intel'),
(5, 'HP'),
(6, 'Microsoft');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` varchar(2024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id`, `name`, `beschreibung`) VALUES
(1, 'Grafikkarten', ''),
(2, 'Fertig-PCs', ''),
(3, 'Prozessoren', ''),
(4, 'Monitore', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `id` int(11) NOT NULL,
  `Anrede` varchar(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Vorname` varchar(255) NOT NULL,
  `Strasse` varchar(255) NOT NULL,
  `Hausnummer` varchar(10) NOT NULL,
  `Ort` varchar(255) NOT NULL,
  `Postleitzahl` varchar(10) NOT NULL,
  `Land` varchar(255) NOT NULL,
  `Telefonnummer` varchar(20) DEFAULT NULL,
  `E-mail` varchar(255) NOT NULL,
  `Passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkt`
--

CREATE TABLE `produkt` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `hersteller` int(11) DEFAULT NULL,
  `kategorie` int(11) DEFAULT NULL,
  `rabatt` int(3) NOT NULL DEFAULT 0,
  `preis_normal` decimal(9,2) NOT NULL,
  `beschreibung` varchar(2024) NOT NULL DEFAULT '',
  `bild` varchar(2024) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `produkt`
--

INSERT INTO `produkt` (`id`, `name`, `hersteller`, `kategorie`, `rabatt`, `preis_normal`, `beschreibung`, `bild`) VALUES
(1, 'Asus ROG Strix GeForce RTX™ 3050 OC Edition 8GB', 3, 1, 0, '500.00', 'Die ROG Strix GeForce RTX™ 3050 OC Edition 8GB GDDR6 bietet ein verbessertes Design und eine erstklassige thermische Leistung.\r\n\r\nNVIDIA Ampere Streaming-Multiprozessoren: Der brandneue Ampere SM bietet den 2-fachen FP32-Durchsatz und eine verbesserte Leistungseffizienz.\r\n\r\nRT-Kerne der 2. Generation: Erlebe den 2-fachen Durchsatz der RT-Kerne der 1. Generation und gleichzeitige RT- und Shading-Leistung für eine ganz neue Ebene des Raytracing.\r\n\r\nTensor-Kerne der 3. Generation: Erreiche einen bis zu 2-fachen Durchsatz mit struktureller Sparsamkeit und fortschrittlichen KI-Algorithmen wie DLSS. Diese Kerne sorgen für einen enormen Leistungsschub im Spiel und völlig neue KI-Funktionen.\r\n\r\nDas Axial-Tech-Gebläsedesign wurde neu abgestimmt und hat eine umgekehrte zentrale Gebläserichtung für weniger Turbulenzen.\r\n\r\nDas 2.7-Slot-Design vergrößert die Kühloberfläche, damit die drei leistungsstarken Axial-tech-Lüfter optimal genutzt werden können.\r\n\r\nSuper Alloy Power II enthält hochwertige Legierungsdrosseln, feste Polymerkondensatoren und eine Reihe von Hochstromendstufen.\r\n\r\nGPU Tweak II bietet intuitive Leistungsoptimierung, Temperaturregelung und Systemüberwachung.', '1.strix.png'),
(2, 'ROG-STRIX-LC-RX6900XT-T16G-GAMING', 3, 1, 0, '900.00', 'ROG-STRIX-LC-RX6900XT-T16G-GAMING\r\nDie ROG Strix LC Radeon™ RX 6900 XT ist ein wassergekühlter Leviathan.\r\n\r\nEine vollflächige Kälteplatte bringt die Wasserkühlung zu GPU-Chip und Speicher\r\nDie On-Board-Kühlung für die Stromversorgung wird von einem Blower-Lüfter und einem Low-Profile-Kühlkörper übernommen. \r\nEin 240mm großer Radiator vereint Kompatibilität und Performance.\r\n600mm Schläuche für Kompatibilität mit EATX-Gehäusen und alternativen Befestigungen\r\nSuper Alloy Power II beinhaltet Spulen aus hochwertigen Legierungen, Festpolymerkondensatoren und eine Reihe von Hochstrom-Leistungsstufen.\r\nASUS FanConnect II bietet einen Lüfteranschluss mit Hybrid-Steuerung für eine optimale Kühlung des Systems.\r\nGPU Tweak II bietet intuitive Leistungsoptimierungen, eine Temperatursteuerung und System-Monitoring.\r\n', '2.strix.png');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `hersteller`
--
ALTER TABLE `hersteller`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `E-mail` (`E-mail`);

--
-- Indizes für die Tabelle `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `hersteller`
--
ALTER TABLE `hersteller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
