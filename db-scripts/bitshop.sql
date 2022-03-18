-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Mrz 2022 um 12:02
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.9

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

DROP TABLE IF EXISTS `hersteller`;
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
(6, 'Microsoft'),
(7, 'Captiva '),
(8, 'Samsung'),
(9, 'Team Group'),
(12, 'G.Skill'),
(13, 'Corsair'),
(14, 'Gigabyte '),
(15, 'Apple'),
(16, 'MSI'),
(17, 'Mifcom'),
(18, 'PNY'),
(19, 'Hyrican');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
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
(4, 'Monitore', ''),
(5, 'RAM', ''),
(6, 'SSD', ''),
(9, 'Handy', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

DROP TABLE IF EXISTS `kunde`;
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

DROP TABLE IF EXISTS `produkt`;
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
(17, 'Intel Core i9-9900KF', 4, 3, 10, '550.00', 'Die NEUEN Intel Core Desktop-Prozessoren der 9. Generation sind die bislang leistungsstärkste Generation in der Reihe der Intel Core Desktop-Prozessoren. Mit dieser neuen Prozessorgeneration eröffnen sich sowohl für Computerspieler, die auf ein fantastisches Gaming-Erlebnis mit ausreichendem Leistungsspielraum für flüssiges Livestreaming und problemloses Aufzeichnen der Highlights Wert legen, als auch für Kreative, die gerne mehr verfassen, gestalten und mit anderen teilen und weniger Zeit mit dem Warten auf den Computer verbringen würden, völlig neue Horizonte.', 'intel_bx80684i99900kf_boxed_intel_core_i9_9900kf_1455409.webp'),
(18, 'Captiva I67-333', 7, 2, 10, '4955.00', 'Intel Core i9-12900KF, 64 GB, 2000 GB, SSD', '67383_01_o.RGB_RAM.avif'),
(19, 'Captiva R57-197', 7, 2, 0, '1117.00', 'AMD Ryzen 5 3600, 16 GB, 1000 GB, SSD', '359111_0.0x800.avif'),
(20, 'Samsung 980 Pro', 8, 6, 0, '309.00', 'Entfesseln Sie die Leistung der Samsung SSD 980 Pro, der ersten PCIe 4.0 NVMe SSD von Samsung für den Heimgebrauch - für EDV-Erfahrungen auf dem nächsten Level. Die für grafikintensive Games und Hochleistungsanwendungen konzipierte 980 Pro setzt den eigens von Samsung entwickelten Controller sowie PCIe 4.0 ein und verdoppelt die Datenübertragungsrate von PCIe 3.0. Die Abwärtskompatibilität und der kompakte M.2-Formfaktor sorgen dabei für Vielseitigkeit und Flexibilität in diversen Hochleistungs-EDV-Lösungen.\r\n\r\nNVMe-SSD-Leistung auf dem nächsten Level: Der massgefertigte Elpis Controller für PCIe 4.0 SSDs von Samsung, die modernen V-NAND- und DRAM-Technologien und alle weiteren Komponenten sowie die Firmware der 980 Pro werden von Samsung intern entwickelt und hergestellt, um Leistung und Geschwindigkeit zu maximieren. Die 980 Pro ist ungefähr doppelt so schnell wie die PCIe 3.0 SSDs der Vorgängergeneration und 12,7 Mal so schnell wie SATA SSDs.\r\n\r\nEine überzeugende Kombination: Die für Hardcore-Gamer, Kreativprofis und technisch versierte Benutzer entwickelte 980 Pro bietet Hochleistungsbandbreite und -durchsatz für leistungsintensive Anwendungen in Gaming, Grafik, Datenanalyse und mehr. Sie lädt Games schnell sowohl auf PCs als auch auf Konsolen, wodurch Sie mehr spielen und weniger warten. Ihre Performance ist zudem für die nahtlose Verarbeitung von 4K- und 8K-Inhalten optimiert. Die 980 Pro ist im kompakten M.2 2280-Formfaktor gebaut und kann für eine maximale Flexibilität beim Leiterplattendesign leicht in Desktop-PCs und Laptops eingesteckt werden. Die optimierte Energieeffizienz macht das Laufwerk ideal für Hochleistungs-EDV-Systeme.\r\n\r\nIntelligente, verlässliche Temperaturkontrolle: Die nächste Leistungsstufe der 980 Pro wird von einer aussergewöhnlichen Temperaturkontrolle gestützt. Die SSD verwendet eine Nickelbeschichtung anstelle eines externen Kupfergehäuses, um die Temperatur des Controllers besser zu steuern, sowie ein Heat- Spreader-Label, das die Temperatur des NAND Kontro', 'MZ-V8P2T0BW_001_Front_Black.avif'),
(21, 'Team Group T-Force Xtreem ARGB, DDR4-3600, CL18 - 16 GB Dual Kit', 9, 5, 0, '146.00', 'Schneller DDR4-RAM mit schickem Design, mit digital adressierbarer RGB-Beleuchtung, 16-GB-Dual-Kit (2x 8 GB), 3.600 MHz Takt, CL18-Latenzen, 1,35 V Spannung.', 'metg-383_metg_383_01.avif'),
(22, 'G.Skill Trident Z Royal', 12, 5, 0, '791.00', 'Kurzinfo: G.Skill Trident Z Royal Series - DDR4 - 128 GB: 4 x 32 GB - DIMM 288-PIN - 4000 MHz / PC4-32000 - CL18 - 1.4 V - ungepuffert - non-ECC - Silber Gruppe RAM Hersteller G.Skill Hersteller Art. Nr. F4-4000C18Q-128GTRS EAN/UPC Produktbeschreibung: G.Skill Trident Z Royal Series - DDR4 - 128 GB: 4 x 32 GB - DIMM 288-PIN - ungepuffert Produkttyp RAM-Speicher Kapazität 128 GB: 4 x 32 GB Speichertyp DDR4 SDRAM - DIMM 288-PIN Erweiterungstyp Generisch Datenintegritätsprüfung Non-ECC Geschwindigkeit 4000 MHz (PC4-32000) Latenzzeiten CL18 (18-22-22-42) Leistungsmerkmale Wärmeverteiler aus Aluminium, Dualer Kanal, Vier-Kanal, Intel Extreme Memory Profiles (XMP 2.0), 10-Layer-PCB-Wärmeverteiler, ASUS Aura Sync-Support, RGB-Farben der LED-Beleuchtung, Unterstützung von MSI Mystic Light RGB, Gigabyte RGB Support, ASRock Polychrome-Support, Kronjuwelen-Design, Trident Z Tri-Fin-Design, Kristall-Element, 8 RGB-Lichtzonen, ungepuffert Spannung 1.4 V Ausführliche Details Allgemein Kapazität 128 GB:.', '160128484510.jpg'),
(23, 'Corsair Vengeance RGB Pro', 13, 5, 18, '175.00', '2 x 16GB, DDR4-3200, DIMM 288 pin', 'Vengeance_RGB_Pro_13_2up.avif'),
(24, 'Gigabyte Aorus RGB AIC', 14, 6, 0, '298.01', '1000 GB, PCI-Express', '20190315141004807992b98de99b51d98ceef161a1020700_big.jpg'),
(25, 'Apple iPhone SE (3rd Gen)', 9, 15, 0, '539.00', 'Du wirst es lieben. Von der Power bis zum Preis. Blitzschneller A15 Bionic Chip. Grossartige Batterie und eine Superstarkamera. Ausserdem das härteste Glas in einem Smartphone und eine Hometaste mit sicherem Touch ID.\r\n\r\n• 4,7\" Retina HD Display (11,94 cm Diagonale)\r\n\r\n• Fortschrittliches Ein‑Kamera-System mit 12 MP Weitwinkel-Kamera, Smart HDR 4, Fotografische Stile,Porträtmodus und 4K Video bis zu 60 fps\r\n\r\n• 7 MP FaceTime HD Kamera mit Smart HDR 4, Fotografische Stile, Porträtmodus und 1080pVideoaufnahme\r\n\r\n• A15 Bionic Chip für superschnelle Performance\r\n\r\n• Bis zu 15 Stunden Videowiedergabe\r\n\r\n• 5G fähig\r\n\r\n• Robustes Design und IP67 Wasserschutz\r\n\r\n• Hometaste mit Touch ID für sicheres Authentifizieren\r\n\r\n• iOS 15 ist vollgepackt mit neuen Features, damit du mehr mit dem iPhone machen kannst alsje zuvor', 'iPhone_SE3_Midnight_PDP_Image_Position-1A__WWEN.avif'),
(26, 'Apple iPhone 13', 15, 9, 0, '1016.00', 'iPhone 13: Das fortschrittlichste Zwei-Kamera-System, das es je auf einem iPhone gab. Mach mit der neuen Weitwinkel-Kamera unglaubliche Fotos und Videos bei wenig Licht. Nimm mit der Ultraweitwinkel-Kamera mehr von deiner Umgebung auf. Mach grossartige Filme mit dem Kinomodus. iPhone 13: 6,1\" Super Retina XDR Display*, das noch heller und dadurch im direkten Sonnenlicht besser zu sehen ist. Helles Weiss, tiefes Schwarz und unglaubliche Farbgenauigkeit. Die ultrahohe Pixeldichte lässt Fotos und Text gestochen scharf aussehen. Der A15 Bionic Chip macht jede Aufgabe flüssiger und ermöglicht Kinomodus, Fotografische Stile, Livetext und mehr. Und er ist noch effizienter und trägt so zu einem grossen Sprung bei der Batterielaufzeit bei. Robustes Design mit Ceramic Shield. Aluminium in Raumfahrt-Qualität. Branchenführender IP68 Wasserschutz. 5G ermöglicht superschnelle Downloads, Streaming in hoher Qualität und sogar anspruchsvolle Multiplayer-Spiele. Das iPhone 13 hat mehr 5G Bänder für 5G Speed an mehr Orten. Datentarif erforderlich. 5G ist in ausgewählten Ländern und über ausgewählte Anbieter verfügbar. Die Geschwindigkeit kann je nach Standort und Anbieter variieren.', 'iPhone_13_Midnight_PDP_Image_Position-1A__WWEN.avif'),
(27, 'Samsung Galaxy S22 Ultra', 8, 9, 0, '1419.00', 'Die Galaxy S22 Series läutet eine neue Ära der Nachtfotografie ein: Mit authentischen und lebendigen Farben wird die Nacht erhellt, wie man es noch nie zuvor gesehen hat – für epische Ergebnisse in jeder Lichtsituation. Der weltweit erste 4-nm-Prozessor sorgt zudem für Höchstleistung bei langer Akkulaufzeit. Die Galaxy S22 Series verfügt über das hellste Display, das je in einem Galaxy-Gerät verbaut wurde, damit du auch bei direkter Sonneneinstrahlung alles klar und detailgetreu sehen kannst. Das Galaxy S22 Ultra erbt das Beste aus der Note-Serie und integriert den schnellsten S Pen aller Zeiten, um Produktivität, Multitasking und Kreativität maximal zu fördern. Mit starkem Aluminiumrahmen und härtestem Glas ausgestattet, legt das Galaxy S22 eine extrem hohe Widerstandsfähigkeit an den Tag.\r\nDie neue Galaxy S22 Series kommt mit grösseren, sensibleren Kamerasensoren und mit adaptiver Pixel-Technologie, die Licht ins Dunkel der Nacht bringt. So können in jeder Lichtsituation selbst kleinste Details in höchster Qualität festgehalten werden. Dank 12 bit HDR werden die Aufnahmen mit 64 Mal lebendigeren Farben und Kontrasten aufgelöst. Mit dem neuen leistungsfähigen Prozessor werden innerhalb von Millisekunden bis zu 20 Bilder analysiert – für noch schärfere und detailliertere Fotos und Videos.', 'sm-s908_galaxys22ultra_front_phantomblack_211119.avif'),
(28, 'Samsung Galaxy S21+', 8, 9, 0, '918.00', 'Bildschirmdiagonale: 6.7 , Betriebssystem: Android, Farbe: Schwarz, Speicherkapazität total: 256 GB, Verbauter Arbeitsspeicher: 8 GB, Card Reader: Kein.', 'sm_g996_s21_PhantomBlack_front_back.avif'),
(29, 'Samsung Galaxy S20 FE 5G', 8, 9, 0, '601.00', 'Dank seines schlanken Designs und des Premium-Finishes liegt das S20 erstaunlich bequem in der Hand. Die neuen Farben sind frisch, elegant und ziehen den Blick auf sich. Gorilla Glass 6 schützt sowohl die Vorder- als auch die Hinterseite. Das S20 ist zudem wasserfest und IP68-zertifiziert. Die grosse Batterie der S20-Familie toleriert die in Bezug auf Energie anspruchsvollsten Benutzer und ist dank der Super-Fast-Charging-Technologie in weniger als 30 Minuten zu 50 % geladen. Das Smartphone lädt ausserdem\r\nunterwegs Galaxy Buds oder die Galaxy Watch mit Wireless PowerShare auf.', 'Samsung_S20_FE_Cloud-Navy_digitec.avif'),
(33, 'Gigabyte GeForce RTX 3080 Ti GAMING OC 12G LHR', 14, 1, 0, '1449.00', 'NVIDIA GeForce RTX 3080 Ti-Grafikkarte, mit 1.365/1.710 MHz Base-/Boost-Takt, 12 GB GDDR6X VRAM mit 19 GHz RAM-Takt (effektiv), Triple-Fan-Kühlerdesign mit RGB-LED-Beleuchtung.', '92241536_2279177839.avif'),
(34, 'MSI GeForce RTX 3080 Ti SUPRIM X 12G', 16, 1, 0, '1849.00', 'Grafikkategorie: Highend/Gaming, Formfaktor: Full-Height, Slot Belegung: Triple Slot, Grafikspeicher Grösse: 12 GB, Kühlungstyp: Aktiv, Schnittstelle Grafikkarte: PCI Express 4.0.', 'msi-geforce_rtx_3080_Ti_suprim_x_12g-product_photo_2d1.avif'),
(35, 'Mifcom Spectrum', 17, 2, 0, '4799.00', 'Anhand eines Gehäuses, dessen Seitenwände vollständig aus gehärtetem Glas bestehen, sowie einer per Corsair iCue Software individuell konfigurierbaren RGB-Beleuchtung und wahlweise einer Custom-Wasserkühlung handelt es sich beim Mifcom Spectrum um einen visuellen Leckerbissen. Es kommen die aktuellsten RGB Komponenten wie Corsair LL Lüfter, Corsair Vengeance RGB Pro RAM, Corsair RGB LED Lighting PRO Extpansion Kit sowie Asus Z390-F STRIX Mainboard für Intel-basierte Systeme oder Asus X570-F STRIX Mainboard für AMD-basierte Systeme mit der Asus Aura Kompatibilität zum Einsatz. Bestückt mit Core i7 oder i9 Prozessoren der 9. Gen. bzw. Ryzen 7 oder 9 Prozessoren und GeForce RTX 2080 Super oder RTX 2080 Ti Grafikkarten hat man es hier mit Konfigurationen zu tun, die selbst kommende Spiele-Generationen mit mehr als nur genug FPS versorgen.\r\n\r\nMIFCOM setzt alles daran, maximale Qualität zu bieten. Das beginnt bei der sorgfältigen Auswahl hochwertiger Komponenten anhand intensiver Tests hinsichtlich Kompatibilität, Stabilität und Leistung. Alle Systeme werden von erfahrenen Technikern gemäss standardisierten Prozessen gebaut. Zum guten Ton gehört eine vollautomatisierte A+-Windowsinstallation mitsamt aktuellsten Treibern und Updates.', 'Spe2080TiIntelUltLiq1.avif'),
(36, 'PNY VCNRTXA6000-SB Grafikkarte NVIDIA RTX A6000 GDDR6', 18, 1, 0, '4987.00', 'PNY Grafikkarte NVIDIA Quadro RTX A6000 SB 48 GB OEM, Grafikkategorie: Professional/CAD, Formfaktor: Full-Height, Slot Belegung: Dual Slot, Grafikspeicher Grösse: 48 GB, Kühlungstyp: Aktiv, Schnittstelle Grafikkarte: PCI Express 4.0 x16.', '88634989_1645766534.jpg'),
(37, 'Captiva G29IG 20V2', 7, 2, 0, '4168.00', 'Erlebe mit Captiva Gaming PC Systemen heisseste Shots und schärfste Sessions im Spiel deiner Wahl. Captiva stellt dir erstklassige Hardware, namhafter Hersteller zur Verfügung. Darunter Marken wie Samsung, WD, Hitachi, LG, Sony, Intel, AMD, NVIDIA, Pioneer, Seagate, Kingston und viele Weitere - Ein Genuss für deine Zockerseele.\r\n\r\nDie High-Tech-Produktion in München sorgt dafür, dass du dich mit aktuellen Computerspielen ausleben kannst: Ob Rollenspiele, Ego-Shooter, Strategie & Co, deine Sessions werden zur High-End-Gaming-Experience bei der du deine Gegner an die Wand zockst. Vor dem Versand wird dein Baby nochmal genauestens auf Herz und Nieren getestet. Und das nicht nur einmal.', '2390538-n0.avif'),
(38, 'Captiva G29AG 21V1', 7, 2, 0, '3752.00', 'AMD Ryzen 9 5900X, 32 GB, 2000 GB, SSD', '59559_01.avif'),
(39, 'Hyrican Striker 6753', 19, 1, 0, '3566.00', 'Der perfekte Einstieg in die Welt des Gamings. Unübersehbar ist das Design mit farbiger ARGB-Beleuchtung in der Front. Die geregelten ARGB-Lüfter verleihen dem PC nicht nur eine kraftvolle Optik, sondern sorgen für perfekte und geräuscharme Kühlleistung bei unendlich viel Gamingspass. Das Kühlkonzept der Hyrican Striker Serie ist alles andere als Standard. Dieser PC besitzt eine Hochleistungsflüssigkeitskühlung für den Prozessor. Die Kühllösung stellt eine geschlossene Einheit dar und ist somit komplett wartungsfrei. Hyrican Striker Gaming-PCs mit dem Intel Core Prozessor der 10. Generation bieten erstklassige Leistung und faszinierende Funktionalität.\r\n\r\nDer Intel Core i7-10700F Prozessor, mit 8 Kernen und 16 Threads bietet erstklassige Leistung und faszinierende Funktionalitäten. Erleben Sie schnelleres Multitasking und erstellen Sie beeindruckende digitale Medien. Zusammen mit den Grafikprozessoren der GeForce RTX 30-Serie können kreative Projekte auf ein neues Level gebracht werden. Die GeForce RTX 3080 Ti liefert mithilfe von Ampere, der RTX-Architektur der 2. Generation von Nvidia, die lang ersehnte Superleistung. Erhalte ein überwältigendes Gaming-Erlebnis mit verbesserten Raytracing - und Tensor-Recheneinheiten, neuen StreamingMultiprozessoren und dem superschnellen G6X-Speicher. Windows 11 ist perfekt für jede Art von Gaming.', '211112152959300301900085G.jpeg'),
(40, 'HP NVIDIA RTX A6000 48GB 4DP GFX', 5, 1, 0, '7668.00', 'NVIDIA RTX A6000 48GB 4DP GFX', 'wid-W126476648.jpeg'),
(41, 'Gigabyte Aorus GeForce RTX 3090 Xtreme', 14, 1, 0, '2873.16', 'Die Max-Covered-Kühlung verfügt über 2x 115-mm- und 1x 100-mm-Blattstapellüfter mit Windklauen-Design und abwechselnder Drehung, so dass der Luftdruck den Kühlkörper vollständig abdecken kann. Alternate Spinning kann die Turbulenzen benachbarter Lüfter reduzieren und den Luftdruck erhöhen. Verstärken und kanalisieren Sie den Luftstrom, um den Kühlkörper vollständig zu bedecken. Ein erweitertes Kühlkörper-Design lässt den Luftstrom durch, wodurch eine bessere Wärmeableitung erreicht wird. Der aktive 3D-Lüfter sorgt für eine semi-passive Kühlung, und die Lüfter bleiben ausgeschaltet, wenn die GPU unter geringer Last oder bei Spielen mit geringem Stromverbrauch läuft. Die doppelte Kugellagerstruktur hat eine bessere Wärmebeständigkeit und Effizienz als die Hülsenstruktur. Die schräge und ungleiche Rippenhöhe kann den Luftstrom durch die Rippen leiten und die Kontaktfläche vergrössern. Mit direktem Kontakt zur GPU und zum VRAM kombiniert die grosse Kupferplatte die Verbundwärmerohre, um die von den inneren Kernen erzeugte Wärme effizient zum Kühlkörper zu übertragen.', '4.avif'),
(42, 'MSI GeForce RTX 3090 GAMING X TRIO 24G', 16, 1, 0, '2799.00', 'Die MSI GeForce RTX 3090 Gaming X Trio 24G ist mit einem leistungsstarken Grafikprozessor und besonders schnellem GDDR6X-Grafikspeicher ausgestattet. Dieses Modell bietet ab Werk erhöhte Taktfrequenzen für eine gesteigerte Leistung. Die Gaming-Grafikkarte eignet sich für Spieler mit hohen Ansprüchen an Grafikqualität und Leistung. Im Vergleich zur RTX-2080-Serie wurden die Rechengeschwindigkeit der Rasterization-Optik und die Raytracing-Performance deutlich gesteigert. Mit einer GeForce RTX 3090 sind extrem hohe Frameraten in 4K und sogar flüssiges Gaming in 8K möglich.', 'msi-geforce_rtx_3090_GAMING_X_TRIO_24G_2d1.avif');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
