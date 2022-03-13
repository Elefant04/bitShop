-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Mrz 2022 um 12:46
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
CREATE DATABASE IF NOT EXISTS `bitshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
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
-- TRUNCATE Tabelle vor dem Einfügen `hersteller`
--

TRUNCATE TABLE `hersteller`;
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
-- TRUNCATE Tabelle vor dem Einfügen `kategorie`
--

TRUNCATE TABLE `kategorie`;
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

--
-- TRUNCATE Tabelle vor dem Einfügen `kunde`
--

TRUNCATE TABLE `kunde`;
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
-- TRUNCATE Tabelle vor dem Einfügen `produkt`
--

TRUNCATE TABLE `produkt`;
--
-- Daten für Tabelle `produkt`
--

INSERT INTO `produkt` (`id`, `name`, `hersteller`, `kategorie`, `rabatt`, `preis_normal`, `beschreibung`, `bild`) VALUES
(1, 'Asus ROG Strix GeForce RTX™ 3050 OC Edition 8GB', 3, 1, 0, '500.00', 'Die ROG Strix GeForce RTX™ 3050 OC Edition 8GB GDDR6 bietet ein verbessertes Design und eine erstklassige thermische Leistung.\r\n\r\nNVIDIA Ampere Streaming-Multiprozessoren: Der brandneue Ampere SM bietet den 2-fachen FP32-Durchsatz und eine verbesserte Leistungseffizienz.\r\n\r\nRT-Kerne der 2. Generation: Erlebe den 2-fachen Durchsatz der RT-Kerne der 1. Generation und gleichzeitige RT- und Shading-Leistung für eine ganz neue Ebene des Raytracing.\r\n\r\nTensor-Kerne der 3. Generation: Erreiche einen bis zu 2-fachen Durchsatz mit struktureller Sparsamkeit und fortschrittlichen KI-Algorithmen wie DLSS. Diese Kerne sorgen für einen enormen Leistungsschub im Spiel und völlig neue KI-Funktionen.\r\n\r\nDas Axial-Tech-Gebläsedesign wurde neu abgestimmt und hat eine umgekehrte zentrale Gebläserichtung für weniger Turbulenzen.\r\n\r\nDas 2.7-Slot-Design vergrößert die Kühloberfläche, damit die drei leistungsstarken Axial-tech-Lüfter optimal genutzt werden können.\r\n\r\nSuper Alloy Power II enthält hochwertige Legierungsdrosseln, feste Polymerkondensatoren und eine Reihe von Hochstromendstufen.\r\n\r\nGPU Tweak II bietet intuitive Leistungsoptimierung, Temperaturregelung und Systemüberwachung.', '1.strix.png'),
(2, 'ROG-STRIX-LC-RX6900XT-T16G-GAMING', 3, 1, 0, '900.00', 'ROG-STRIX-LC-RX6900XT-T16G-GAMING\r\nDie ROG Strix LC Radeon™ RX 6900 XT ist ein wassergekühlter Leviathan.\r\n\r\nEine vollflächige Kälteplatte bringt die Wasserkühlung zu GPU-Chip und Speicher\r\nDie On-Board-Kühlung für die Stromversorgung wird von einem Blower-Lüfter und einem Low-Profile-Kühlkörper übernommen. \r\nEin 240mm großer Radiator vereint Kompatibilität und Performance.\r\n600mm Schläuche für Kompatibilität mit EATX-Gehäusen und alternativen Befestigungen\r\nSuper Alloy Power II beinhaltet Spulen aus hochwertigen Legierungen, Festpolymerkondensatoren und eine Reihe von Hochstrom-Leistungsstufen.\r\nASUS FanConnect II bietet einen Lüfteranschluss mit Hybrid-Steuerung für eine optimale Kühlung des Systems.\r\nGPU Tweak II bietet intuitive Leistungsoptimierungen, eine Temperatursteuerung und System-Monitoring.\r\n', '2.strix.png'),
(3, 'Intel Core i9-12900K', 4, 3, 0, '616.00', 'Prozessorfamilie: Intel Core i9 (12xxx), Anzahl Prozessorkerne: 16, Arbeitsspeicher Geschwindigkeit: 4800 MHz, Taktfrequenz: 3.2 GHz, Integrierte Grafik: Ja, Verlustleistung (TDP): 125 W.', '3.prozessor.webp'),
(4, 'Intel Core i9-11900K', 4, 3, 5, '484.00', 'Die Intel Turbo-Boost-Technik erhöht dynamisch die Frequenz eines Prozessors nach Bedarf, indem die Temperatur- und Leistungsreserven ausgenutzt werden, um bei Bedarf mehr Geschwindigkeit und andernfalls mehr Energieeffizienz zu bieten. Die Intel Hyper-Threading-Technik ermöglicht zwei Verarbeitungs-Threads pro physischem Kern. Anwendungen mit vielen Threads können mehr Aufgaben parallel erledigen und Tasks früher beenden.', '4.11900k.webp'),
(5, 'AMD Ryzen 7 5800X', 2, 3, 0, '397.00', 'Der AMD Ryzen 7 5800X ist der ultimative Desktop-Prozessor für Gamer, Kreative und Enthusiasten. AMDs Multi-Threading-Technik ermöglicht noch besseres Multitasking, denn jeder Prozessorkern kann zwei Aufgaben gleichzeitig verarbeiten. So geniessen Sie intelligentes Multitasking. Ihr PC reagiert schneller und das lästige Warten gehört der Vergangenheit an. Precision Boost 2 erhöht automatisch die Prozessorfrequenz. Damit erhalten Sie geballte Leistung genau dann, wenn sie am dringendsten gebraucht wird.', '20614362-A_Ryzen7_5000_3DPIBWOF_RIGHT_ROW.webp'),
(6, 'Intel Core i5-12600K', 4, 3, 10, '300.00', 'CPU/Core i5-12600K 4.90GHZ LGA16A Box.', 'Box_T4_i5_Unlocked_12th_H93496_Ang02_Front_V01_1280x1280.webp'),
(7, 'AMD Ryzen 9 5900X', 2, 3, 8, '542.00', 'Der AMD Ryzen 9 5900X ist der ultimative Desktop-Prozessor für Gamer, Kreative und Enthusiasten. AMDs Multi-Threading-Technik ermöglicht noch besseres Multitasking, denn jeder Prozessorkern kann zwei Aufgaben gleichzeitig verarbeiten. So geniessen Sie intelligentes Multitasking. Ihr PC reagiert schneller und das lästige Warten gehört der Vergangenheit an. Precision Boost 2 erhöht automatisch die Prozessorfrequenz. Damit erhalten Sie geballte Leistung genau dann, wenn sie am dringendsten gebraucht wird.', '20614363-A_Ryzen9_5000_3DPIBWOF_RIGHT_ROW.webp'),
(8, 'AMD Ryzen 5 5600X', 2, 3, 3, '265.00', 'Der AMD Ryzen 5 5600X ist ein Prozessor der sich besonders an Gamer und Overclocker richtet. AMDs Multi-Threading-Technik ermöglicht noch besseres Multitasking, denn jeder Prozessorkern kann zwei Aufgaben gleichzeitig verarbeiten. So geniessen Sie intelligentes Multitasking. Ihr PC reagiert schneller und das lästige Warten gehört der Vergangenheit an. Precision Boost 2 erhöht automatisch die Prozessorfrequenz. Damit erhalten Sie geballte Leistung genau dann, wenn sie am dringendsten gebraucht wird.', '20619238-A_Ryzen5_SR1_3DPIB_RIGHT_ROW.webp'),
(9, 'Intel Core i7-11700K', 4, 3, 0, '374.00', 'Die Intel Turbo-Boost-Technik erhöht dynamisch die Frequenz eines Prozessors nach Bedarf, indem die Temperatur- und Leistungsreserven ausgenutzt werden, um bei Bedarf mehr Geschwindigkeit und andernfalls mehr Energieeffizienz zu bieten. Intel vPro-Technik ist eine Zusammenstellung von Sicherheits- und Verwaltbarkeitsfunktionen, die in den Prozessor integriert sind und vier kritische Bereiche in der IT-Sicherheit handhaben: 1) Bedrohungsverwaltung, darunter Schutz vor Rootkits, Viren und Malware, 2) Schutz von Identitäten und Website-Zugriffspunkten, 3) Schutz von vertraulichen persönlichen und geschäftlichen Daten, 4) Remote- und lokale Überwachung, Korrektur und Reparatur von PCs und Workstations. Die Intel Hyper-Threading-Technik ermöglicht zwei Verarbeitungs-Threads pro physischem Kern. Anwendungen mit vielen Threads können mehr Aufgaben parallel erledigen und Tasks früher beenden. Mit der Intel Virtualisierungstechnik (VT-x) kann eine Hardwareplattform als mehrere „virtuelle“ Plattformen eingesetzt werden. Sie bietet verbesserte Verwaltbarkeit durch weniger Ausfallzeiten und eine Beibehaltung der Produktivität, indem die Rechenvorgänge in separate Partitionen verschoben werden. Die Intel Directed-I/O-Virtualisierungstechnik (VT-d) setzt die bestehende Unterstützung von Virtualisierungslösungen für die IA-32 (VT-x) und Systeme mit Itanium Prozessoren (VT-i) fort und erweitert diese um die Unterstützung für die I/O-Gerätevirtualisierung. Die Intel VT-d kann Benutzern helfen, die Sicherheit und Zuverlässigkeit von Systemen sowie die Leistung von I/O-Geräten in virtualisierten Umgebungen zu verbessern.\r\n', 'Box_T4_i7_Unlocked_11th_H93496_Ang02_Front_V01_HIGHRES_SIMPLIF.webp'),
(10, 'AMD Ryzen 7 3800X', 2, 3, 5, '320.00', 'Der AMD Ryzen 7 3800X ist der ultimative Desktop-Prozessor für Gamer, Kreative und Enthusiasten. Er verfügt über acht Kerne und kann dank Multithreading bis zu 16 Threads gleichzeitig bearbeiten. Die Taktrate liegt standardmässig bei 3,9 GHz und mit dem Turbo-Core kann die CPU sogar bis zu 4,5 GHz erreichen. Der Prozessor beruht auf der «Zen 2»-Architektur von AMD und besitzt einen offenen Multiplikator zur einfachen Übertaktung. Er passt auf den Sockel AM4 und unterstützt DDR4-Arbeitsspeicher. Das Ryzen 7 3800X Modell kommt mit einem ganz besonderen Boxed-Kühler. Der Wraith Prism besitzt einen transparenten Lüfter mit integrierten LEDs, und das AMD-Logo strahlt ebenfalls in wählbaren Farben. Wer ein Mainboard mit 4-Pin LED-Anschluss besitzt, kann dieses zur Steuerung der Beleuchtung nutzen. Ein kleiner Schalter ermöglicht sogar die Regelung der Lüfterdrehzahl. Der Kühler kann die Ryzen-CPU adäquat kühlen und macht dies bei einer angenehm moderaten Geräuschkulisse.', '19239708-A_3rdGENRYZEN7_ROW_RF.webp'),
(11, 'AMD Ryzen 9 5950X', 2, 3, 8, '765.00', '\r\nDer AMD Ryzen 9 5950X ist der ultimative Desktop-Prozessor für Gamer, Kreative und Enthusiasten. AMDs Multi-Threading-Technik ermöglicht noch besseres Multitasking, denn jeder Prozessorkern kann zwei Aufgaben gleichzeitig verarbeiten. So geniessen Sie intelligentes Multitasking. Ihr PC reagiert schneller und das lästige Warten gehört der Vergangenheit an. Precision Boost 2 erhöht automatisch die Prozessorfrequenz. Damit erhalten Sie geballte Leistung genau dann, wenn sie am dringendsten gebraucht wird.', '20614363-A_Ryzen9_5000_3DPIBWOF_RIGHT_ROW.webp'),
(12, 'AMD Ryzen 5 5600G', 2, 3, 0, '246.00', 'Sechskern-CPU aus der AMD \"Zen 3\"-Familie, mit 3,9 GHz Basis- und 4,4 GHz Boost-Takt, Multi-Threading mit 12 virtuellen Kernen, PCI-Express 3.0 und Precision Boost Overdrive, 3 MB L2- und 16 MB L3-Cache, 65 Watt TDP und offener Multiplikator, Boxed-Version mit AMD Wraith Stealth Kühler.', '21820167-A_AMDRyzen5_wGraphics_3DPIB_RIGHT_ROW.jpg'),
(13, 'Intel Core i5-11400F', 4, 3, 0, '185.00', '\"Rocket Lake-S\" - auf diesen Namen hört die 11. Generation der Intel Core-Prozessoren. Neben erhöhten Taktraten gegenüber \"Comet Lake-S\" der 10. Generation, unterstützt \"Rocket Lake-S\" höhere Speichertaktraten und bietet Unterstützung für PCI-Express 4.0 sowie eine erhöhte Anzahl von insgesamt 20 PCIe-Lanes gegenüber der Vorgängergeneration.', 'Box_T4_i5F_Unlocked_11th_H93496_Ang02_Front_V01_HIGHRES_SIMPLIF.webp'),
(14, 'Intel Core i7-9700KF', 4, 3, 1, '310.00', 'Die NEUEN Intel Core Desktop-Prozessoren der 9. Generation sind die bislang leistungsstärkste Generation in der Reihe der Intel Core Desktop-Prozessoren. Mit dieser neuen Prozessorgeneration eröffnen sich sowohl für Computerspieler, die auf ein fantastisches Gaming-Erlebnis mit ausreichendem Leistungsspielraum für flüssiges Livestreaming und problemloses Aufzeichnen der Highlights Wert legen, als auch für Kreative, die gerne mehr verfassen, gestalten und mit anderen teilen und weniger Zeit mit dem Warten auf den Computer verbringen würden, völlig neue Horizonte.', 'intel_bx80684i79700kf_boxed_intel_core_i7_9700kf_1455408.jpg'),
(15, 'AMD Ryzen 7 3700X', 2, 3, 0, '304.00', 'AMD Prozessoren der Ryzen 3000 Serie liefern konkurrenzlose Technologie für überragende Leistung. Erleben und nutzen Sie Technologien wie Precision Boost Overdrive, Precision Boost 2, Pure Power und AMD StoreMI und mehr, alles mit den Prozessoren der AMD Ryzen 3000 Serie. AMD Ryzen Prozessoren der 3. Generation mit 7nm \"Zen 2\"-Kern setzen Standards für hohe Leistung durch exklusive Fertigungstechnologie, bahnbrechenden Chip-Durchsatz und revolutionäre Gesamtleistung. Die Erfolgsserie des technologischen Fortschritts: AMD Ryzen Prozessoren der 3. Generation. Sie bietet erstmals auch Konnektivität für PCIe 4,0, um die modernsten Mainboards, Grafikkarten und Speichertechnologien der Welt zu unterstützen. AMD Ryzen Prozessoren der 3. Generation liefern, was Sie brauchen, immer und überall. Der weltweit fortschrittlichste Desktop Prozessor ist nicht nur für Leistung gemacht, sondern für Gewinner.', '19239708-A_3rdGENRYZEN7_ROW_RF (1).webp'),
(16, 'Intel Core i7-10700K', 4, 3, 2, '400.00', 'Die Intel Core i7 Prozessoren stellen dank schnellerer, intelligenter Multicore-Technik, die Rechenleistung dynamisch ganz nach Bedarf zuweist, einen unglaublichen Durchbruch bei der PC-Leistung dar. Sie sind die besten Intel Desktop-Prozessoren aller Zeiten.\r\nErleben Sie schnelleres Multitasking und erstellen Sie beeindruckende digitale Medien. Und durch die Kombination aus Intel Turbo Boost Technology und Intel Hyper-Threading-Technologie (Intel HT-Technologie), die die volle Prozessorleistung genau dort entfaltet, wo Sie sie am dringendsten benötigen, können Sie bei allem, was Sie auf Ihrem PC erledigen, auf maximale Leistung zählen.\r\nIntel Turbo Boost Technology beschleunigt anspruchsvolle Anwendungen und passt die Leistung dynamisch an die Anforderungen an. Geniessen Sie mehr Leistung, wenn Sie sie benötigen. Intel Hyper-Threading-Technologie unterstützt Multithread-Anwendungen, damit Sie mehrere Aufgaben gleichzeitig erledigen können. Dem Betriebssystem stehen acht Verarbeitungsthreads zur Verfügung. So wird Multitasking einfacher denn je.\r\nIntel Advanced-Smart-Cache: Mehr Leistung und Effizienz für das Cache-Subsystem. Für die führenden Multithread-Spiele optimiert.\r\nIntegrierter Speichercontroller unterstützt drei Kanäle für DDR3-1066-MHz-Speicher und damit eine Speicherbandbreite von bis zu 25,6 GB/s. Die geringere Latenz und höhere Bandbreite dieses Speichercontrollers stellt für datenintensive Anwendungen unglaubliche Leistungsmerkmale bereit.\r\nIntel HD-Boost ermöglicht deutliche Verbesserungen für zahlreiche Multimedia- und andere rechenintensive Anwendungen. 128-Bit-SSE-Befehle werden mit einer Frequenz von einem Befehl pro Taktzyklus verarbeitet, wodurch diese Technik für Anwendungen, die für SSE4 optimiert sind, einen neuen Massstab in puncto Prozessoreffizienz setzt.', 'i7K_Center_2000x2000px.webp'),
(17, 'Intel Core i9-9900KF', 4, 3, 10, '550.00', 'Die NEUEN Intel Core Desktop-Prozessoren der 9. Generation sind die bislang leistungsstärkste Generation in der Reihe der Intel Core Desktop-Prozessoren. Mit dieser neuen Prozessorgeneration eröffnen sich sowohl für Computerspieler, die auf ein fantastisches Gaming-Erlebnis mit ausreichendem Leistungsspielraum für flüssiges Livestreaming und problemloses Aufzeichnen der Highlights Wert legen, als auch für Kreative, die gerne mehr verfassen, gestalten und mit anderen teilen und weniger Zeit mit dem Warten auf den Computer verbringen würden, völlig neue Horizonte.', 'intel_bx80684i99900kf_boxed_intel_core_i9_9900kf_1455409.webp');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
