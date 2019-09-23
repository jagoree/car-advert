-- Adminer 4.7.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `mileage` int(10) unsigned DEFAULT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `phone` varchar(18) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cars` (`id`, `model_id`, `mileage`, `price`, `phone`, `created`) VALUES
(15,	1,	65000,	550000,	'+7 (123) 456-78-90',	'2019-09-22 19:26:41'),
(19,	770,	500000,	20000,	'+7 (987) 654-32-10',	'2019-09-21 18:15:00');

DROP TABLE IF EXISTS `cars_options`;
CREATE TABLE `cars_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_id` (`car_id`),
  KEY `option_id` (`option_id`),
  CONSTRAINT `cars_options_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cars_options_ibfk_4` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cars_options` (`id`, `car_id`, `option_id`) VALUES
(40,	19,	1),
(41,	19,	7),
(42,	19,	8),
(43,	19,	9),
(44,	19,	10),
(45,	19,	12),
(46,	19,	13),
(47,	19,	14);

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `ext` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `images_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `images` (`id`, `car_id`, `ext`) VALUES
(30,	15,	'jpg'),
(31,	15,	'jpg'),
(32,	15,	'jpg'),
(40,	19,	'jpg'),
(41,	19,	'jpg'),
(42,	19,	'jpg');

DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `marks` (`id`, `caption`) VALUES
(1,	'ALFA ROMEO'),
(2,	'AUDI'),
(3,	'BMW'),
(4,	'CHEVROLET'),
(5,	'CHRYSLER'),
(6,	'CITROEN'),
(7,	'DAEWOO'),
(8,	'DODGE'),
(9,	'FIAT'),
(10,	'FORD'),
(11,	'HONDA'),
(12,	'HYUNDAI'),
(13,	'INFINITI'),
(14,	'ISUZU'),
(15,	'IVECO'),
(16,	'JEEP'),
(17,	'KIA'),
(18,	'LADA'),
(19,	'LANCIA'),
(20,	'LEXUS'),
(21,	'MAZDA'),
(22,	'MERCEDES'),
(23,	'MITSUBISHI'),
(24,	'NISSAN'),
(25,	'OPEL'),
(26,	'PEUGEOT'),
(27,	'RENAULT'),
(28,	'ROVER'),
(29,	'SAAB'),
(30,	'SCANIA'),
(31,	'SEAT'),
(32,	'SKODA'),
(33,	'SUBARU'),
(34,	'SUZUKI'),
(35,	'TOYOTA'),
(36,	'VOLKSWAGEN'),
(37,	'VOLVO'),
(39,	'DAIHATSU'),
(40,	'MINI'),
(41,	'PORSCHE'),
(42,	'PLYMOUTH'),
(46,	'LAND ROVER'),
(47,	'ZAZ'),
(48,	'MERCURY'),
(49,	'DAF'),
(50,	'GAZ'),
(51,	'CHERY'),
(52,	'JAGUAR'),
(53,	'BYD'),
(54,	'MAN'),
(55,	'CADILLAC');

DROP TABLE IF EXISTS `models`;
CREATE TABLE `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark_id` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mark_id` (`mark_id`),
  CONSTRAINT `models_ibfk_2` FOREIGN KEY (`mark_id`) REFERENCES `marks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `models` (`id`, `mark_id`, `caption`) VALUES
(1,	1,	'156 , SDN 97-/KOMBI 00-'),
(2,	1,	'ALFA 145/146'),
(3,	2,	'100 + AVANT, 77-0983/ 200, -8.83'),
(4,	2,	'100 +AVANT, 12.90-5.94'),
(5,	2,	'100+AVANT 10.82-11.90/200, 9.83-12.91'),
(6,	2,	'80 (B3) 10.86-8.91'),
(7,	2,	'80 (B4) 9.91- /KOMBI 11.92-'),
(8,	2,	'80, 78-82'),
(9,	2,	'80, 82-86'),
(10,	2,	'90/COUPE (B3), 87-8.91'),
(11,	2,	'90/COUPE(B2).10.84-04.87'),
(12,	2,	'90/COUPE/CABRIO/80 6CYL.9.91-'),
(13,	2,	'A2 00-'),
(14,	2,	'A3 01.00-04.03'),
(15,	2,	'A3 05.03-04.08'),
(16,	2,	'A3 01.96-12.99'),
(17,	2,	'A4  04-08'),
(18,	2,	'A4 SDN 94-98/KOMBI 94-98'),
(19,	2,	'A4 SDN 99-00/KOMBI 99-01'),
(20,	2,	'A4 SEDAN 01-/KOMBI 02-'),
(21,	2,	'A6  05.04-'),
(22,	2,	'A6 SDN 94-97/KOMBI 94-98'),
(23,	2,	'A6 SDN/AVANT 05.97-05.01'),
(24,	2,	'A6 SEDAN/AVANT 06.01-01.05'),
(25,	2,	'A8 94-02'),
(26,	2,	'TT 06-'),
(27,	2,	'TT 99-'),
(28,	2,	'V8'),
(29,	3,	'1 E87 04-'),
(30,	3,	'3 E21 77-83'),
(31,	3,	'3 E30 9.82-90/KOMBI -93'),
(32,	3,	'3 E36, SDN/COUPE/CABRIO 12.90-/COMPACT/KOMBI 94-'),
(33,	3,	'3 E46 COUPE/CABRIO 03.03-09.06'),
(34,	3,	'3 E46 COUPE/CABRIO 05.99-03.03'),
(35,	3,	'3 E46, SDN 97-/KOMBI 99-'),
(36,	3,	'3 E46, SDN/KOMBI, 02-'),
(37,	3,	'3 E90/E91 SDN/TOURING 11.04-08.08'),
(38,	3,	'5 E12, -81'),
(39,	3,	'5 E28, 81-88'),
(40,	3,	'5 E34, SDN 88-95 +KOMBI 92-3.97'),
(41,	3,	'5 E39, 00-03'),
(42,	3,	'5 E39, SDN 96- + KOMBI 4.97'),
(43,	3,	'5 E60/E61 06.03-'),
(44,	3,	'6 E24'),
(45,	3,	'7 E28, 77-87'),
(46,	3,	'7 E32, 87-94'),
(47,	3,	'7 E38, 94-'),
(48,	3,	'7 E65/66 09.01-12.04'),
(51,	3,	'X5 00-'),
(52,	3,	'X5 04-07'),
(53,	3,	'Х3 03-'),
(54,	4,	'AVEO (T200) HB/SDN 03-08'),
(55,	4,	'LACETTI SEDAN 03-'),
(56,	4,	'LANOS'),
(57,	4,	'SPARK 05.05-'),
(58,	4,	'TAHOE/SUBURBAN/SILVERADO PICK UP 00-05'),
(59,	4,	'TRACKER 99-04'),
(60,	4,	'TRAILBLAZER 02-06'),
(61,	5,	'300M 99-04'),
(62,	5,	'300С 04-'),
(63,	5,	'CH CONCORD 98-01'),
(64,	5,	'CONCORD 02-04'),
(66,	5,	'NEON'),
(67,	5,	'PACIFICA 04-'),
(68,	5,	'PT CRUISER 00-'),
(69,	5,	'SEBRING  07-'),
(70,	5,	'SEBRING 00-'),
(71,	5,	'TOWN&COUNTRY 01-04'),
(72,	5,	'TOWN&COUNTRY 91-'),
(73,	5,	'TOWN&COUNTRY 98-'),
(74,	5,	'VOYAGER 01.00-12.04'),
(75,	5,	'VOYAGER 01.05-01.08'),
(76,	5,	'VOYAGER 01.96-12.99'),
(77,	6,	'AX 87-95'),
(78,	6,	'BERLINGO 96-02'),
(79,	6,	'BERLINGO 02-08'),
(80,	6,	'C-CROSSER 07-'),
(81,	6,	'C2 01.03-'),
(82,	6,	'C25 11.81-05.94'),
(83,	6,	'C3 02-05'),
(84,	6,	'C3 PLURIEL'),
(85,	6,	'C4 05-'),
(86,	6,	'C4 PICASSO  06-'),
(87,	6,	'C5 01-05'),
(88,	6,	'C5 05-08'),
(89,	6,	'EVASION 94-'),
(90,	6,	'JUMPER 02-'),
(91,	6,	'JUMPER 06-'),
(92,	6,	'JUMPER 06.94-01'),
(93,	6,	'JUMPY 04-07'),
(94,	6,	'SAXO 10.99-05.04'),
(95,	6,	'XANTIA'),
(96,	6,	'XM'),
(97,	6,	'XSARA 00-'),
(98,	6,	'XSARA 97-'),
(99,	6,	'XSARA PICASSO 04-'),
(100,	6,	'XSARA PICASSO 10.99-'),
(101,	6,	'ZX'),
(102,	7,	'Damas'),
(103,	7,	'ESPERO 01.95-12.99'),
(104,	7,	'LANOS 01.97-'),
(105,	7,	'LEGANZA 01.96-12.02'),
(106,	7,	'MATIZ 98-00'),
(107,	7,	'MATIZ II, 10.00-'),
(108,	7,	'NEXIA 01.95-'),
(109,	7,	'NUBIRA 06.99-12.03'),
(110,	7,	'NUBIRA 97-99'),
(111,	8,	'CARAVAN 96-00'),
(112,	8,	'CARAVAN 02.00-12.04'),
(113,	8,	'STRATUS  00-'),
(114,	8,	'STRATUS 95-'),
(115,	9,	'BRAVO/BRAVA 06.95-10.01'),
(116,	9,	'CROMA 86-90'),
(117,	9,	'CROMA 91-96'),
(118,	9,	'DOBLO  01-05'),
(119,	9,	'DOBLO 06-'),
(120,	9,	'DUCATO 11.81-05.94'),
(121,	9,	'DUCATO 02-06+DUCATO(RUSSIA) 07-'),
(122,	9,	'DUCATO 06-'),
(123,	9,	'DUCATO 06.94-01'),
(124,	9,	'MAREA 01.96-06.02'),
(125,	9,	'PUNTO GRANDE 05-'),
(126,	9,	'PUNTO I 10.93-09.99'),
(127,	9,	'PUNTO II  07.03-09.05'),
(128,	9,	'PUNTO II, 10.99-07.03'),
(129,	9,	'REGATA'),
(130,	9,	'SCUDO 04-07'),
(131,	9,	'SCUDO 95-'),
(132,	9,	'SEDICI 03.06-'),
(133,	9,	'SEICENTO 98-'),
(134,	9,	'SIENA/PALIO 01.97-12.01'),
(135,	9,	'TEMPRA 01.90-08.96'),
(136,	9,	'TIPO 08.88-05.95'),
(137,	9,	'ULYSSE 94-02'),
(138,	9,	'uno -89 / 89-'),
(139,	10,	'COURIER 99-02'),
(140,	10,	'ESCAPE 01-04'),
(141,	10,	'ESCAPE 05-06'),
(142,	10,	'ESCORT 2.95-'),
(143,	10,	'ESCORT/ORION 81-86'),
(144,	10,	'ESCORT/ORION 86-90'),
(145,	10,	'ESCORT/ORION 90-1.95'),
(146,	10,	'EXPLORER 95-'),
(147,	10,	'EXPLORER(USA) 05-'),
(148,	10,	'FIESTA 02-05'),
(149,	10,	'FIESTA 05-'),
(150,	10,	'FIESTA 83-89'),
(151,	10,	'FIESTA 99-01'),
(152,	10,	'FIESTA/COURIER 89-96'),
(153,	10,	'FIESTA/COURIER 96-8.99'),
(154,	10,	'FOCUS II NEW 08-'),
(155,	10,	'FOCUS 98-'),
(156,	10,	'FOCUS C-MAX  04-'),
(157,	10,	'FOCUS C-MAX 07-'),
(158,	10,	'FOCUS II, 05-'),
(159,	10,	'FUSION 02-05'),
(160,	10,	'FUSION 05-'),
(161,	10,	'GALAXY  00-'),
(162,	10,	'GALAXY 05.06-06.10'),
(163,	10,	'GALAXY 95-00'),
(164,	10,	'KA 09.96-10.08'),
(165,	10,	'MAVERICK 00-'),
(166,	10,	'MAVERICK 93-'),
(167,	10,	'MONDEO 00-06'),
(168,	10,	'MONDEO 2007-'),
(169,	10,	'MONDEO 93-96'),
(170,	10,	'MONDEO 96-00'),
(171,	10,	'PROBE 89-92'),
(172,	10,	'PUMA 97-02'),
(173,	10,	'S-MAX 05.06-06.10'),
(174,	10,	'SCORPIO -94'),
(175,	10,	'SCORPIO 95-'),
(176,	10,	'SIERRA -3.87'),
(177,	10,	'SIERRA 4.87-'),
(178,	10,	'TAUNUS 76-82'),
(179,	10,	'TAURUS 96-99'),
(180,	10,	'TRANSIT  06-'),
(181,	10,	'TRANSIT 01-'),
(182,	10,	'TRANSIT 86-91'),
(183,	10,	'TRANSIT 92-95'),
(184,	10,	'TRANSIT 96-00'),
(185,	10,	'TRANSIT TOURNEO CONNECT 05.03-08.06'),
(186,	11,	'ACCORD  06-08'),
(187,	11,	'ACCORD  08-'),
(188,	11,	'ACCORD USA 03-'),
(189,	11,	'ACCORD 03-05 ЕВРОПА'),
(190,	11,	'ACCORD 86-89'),
(191,	11,	'ACCORD 90-93'),
(192,	11,	'ACCORD 93-95 АНГЛИЙСКАЯ СБОРКА'),
(193,	11,	'ACCORD 93-98 USA'),
(194,	11,	'ACCORD 96-98 АНГЛИЙСКАЯ СБОРКА'),
(195,	11,	'ACCORD 98-02 АНГЛИЙСКАЯ СБОРКА'),
(196,	11,	'ACCORD CD 94-97'),
(197,	11,	'ACCORD USA 98-'),
(198,	11,	'ACCORD(USA) 03-'),
(199,	11,	'CIVIC  HB  10.05-'),
(200,	11,	'CIVIC 3-D HB 04-05'),
(201,	11,	'CIVIC 3-D HB/SDN 99-'),
(202,	11,	'CIVIC 3-дв SDN/HB 96- Japan'),
(203,	11,	'CIVIC 4-D SDN 01-'),
(204,	11,	'CIVIC 5-D HB 97-/KOMBI 98- Europa'),
(205,	11,	'CIVIC 5-дв HB 95-96 Europa'),
(206,	11,	'CIVIC H/B  84-87'),
(207,	11,	'CIVIC HB 88-91'),
(208,	11,	'CIVIC HB 92-95'),
(209,	11,	'CIVIC SDN 03-'),
(210,	11,	'CIVIC SDN 05-'),
(211,	11,	'CIVIC SDN 88-91'),
(212,	11,	'CIVIC SDN 92-95'),
(213,	11,	'CIVIC НВ 3/5ДВ. 01-'),
(214,	11,	'CRV 01-'),
(215,	11,	'CRV 09.06 -'),
(216,	11,	'CRV, 96-'),
(217,	11,	'CRX 90-91'),
(218,	11,	'ELEMENT 03-06'),
(219,	11,	'HR-V 99-'),
(220,	11,	'JAZZ, 03.02-'),
(221,	11,	'PRELUDE 97-01'),
(222,	12,	'ACCENT 00- (TAGAZ 00-10)'),
(223,	12,	'ACCENT 03-'),
(224,	12,	'ACCENT 94-97'),
(225,	12,	'ACCENT 98-00'),
(226,	12,	'COUPE/TIBURON, 01-'),
(227,	12,	'ELANTRA 06.00-12.03'),
(228,	12,	'ELANTRA 04- (TAGAZ 04-10)'),
(229,	12,	'ELANTRA 10.06-'),
(230,	12,	'GETZ 05.02-09.05'),
(231,	12,	'GETZ 09.05-'),
(232,	12,	'H-100 97-'),
(233,	12,	'H-100 PORTER 97-'),
(234,	12,	'H-100/PORTER 04-'),
(235,	12,	'H1/STAREX 98-05'),
(236,	12,	'LANTRA    01.99-05.00'),
(237,	12,	'LANTRA 10.90-01.95'),
(238,	12,	'LANTRA 02.95-12.98'),
(239,	12,	'MATRIX 08.06-'),
(240,	12,	'MATRIX, 01.01-08.06'),
(241,	12,	'NF 04-'),
(242,	12,	'PONY/EXCEL 92-94'),
(243,	12,	'SANTA FE 01-06/SANTA FE CLASSIC 09-10'),
(244,	12,	'SANTA FE 04.06-06.09'),
(245,	12,	'SONATA  01-10 (TAGAZ)'),
(246,	12,	'SONATA 96-99'),
(247,	12,	'SONATA 98-01'),
(248,	12,	'TERRACAN 04-'),
(249,	12,	'TUCSON 04-'),
(250,	12,	'VERNA 06-'),
(251,	13,	'FX35/FX45 03-'),
(252,	14,	'RODEO 90-96'),
(253,	14,	'TROOPER 87-92'),
(254,	14,	'TROOPER 92-'),
(255,	15,	'DAILY -90'),
(256,	15,	'DAILY 99-'),
(257,	15,	'DAILY, 03.90-99'),
(258,	15,	'EUROCARGO 91-'),
(259,	15,	'EUROSTAR-EUROTECH 93-'),
(260,	16,	'CHEROKEE 84-95'),
(261,	16,	'GRAND CHEROKEE 04-'),
(262,	16,	'GRAND CHEROKEE 93-98'),
(263,	16,	'GRAND CHEROKEE 99-'),
(264,	17,	'CARENS 03-'),
(265,	17,	'CARENS III 06-'),
(266,	17,	'CARNIVAL 02-06'),
(267,	17,	'CARNIVAL 06-'),
(268,	17,	'CARNIVAL 98-01'),
(269,	17,	'CEED 10.06-'),
(270,	17,	'CERATO  04.04-'),
(271,	17,	'MAGENTIS 01-'),
(272,	17,	'PICANTO 01.04-'),
(273,	17,	'RIO  00-02'),
(274,	17,	'RIO  02-05'),
(275,	17,	'RIO, 01.05-09.11'),
(276,	17,	'SEPHIA II 98-00'),
(277,	17,	'SHUMA/SPECTRA 01-'),
(278,	17,	'SHUMA/SPECTRA 04-'),
(279,	17,	'SORENTO 08.02-01.06'),
(280,	17,	'SPECTRA 05-'),
(281,	17,	'SPORTAGE 94-05'),
(282,	17,	'SPORTAGE III, 09.04-10.10'),
(283,	18,	'GAZEL НОВАЯ'),
(284,	18,	'SAMARA 2109'),
(285,	19,	'THEMA 88-94'),
(286,	20,	'LEXUS RX 300/330/400 02.03-'),
(287,	20,	'LX450 90-98'),
(288,	20,	'RX300 99-03'),
(289,	21,	'121 00-'),
(290,	21,	'121 96-99'),
(291,	21,	'3, 10.03-07.09'),
(292,	21,	'323 SDN 2001-'),
(293,	21,	'323, 8.85-89/KOMBI 86-94'),
(294,	21,	'323, 89-94'),
(295,	21,	'323, 94-98 SDN/COUPE'),
(296,	21,	'323, F 89-94'),
(297,	21,	'323, F 94-'),
(298,	21,	'323, P 10.96-'),
(299,	21,	'323, SDN 98-'),
(300,	21,	'323F  98-2001'),
(301,	21,	'323F, 01-'),
(302,	21,	'5, 05-'),
(303,	21,	'6, 02-'),
(304,	21,	'6, 11.07-'),
(305,	21,	'626 01.01-05.02'),
(306,	21,	'626, 83-87'),
(307,	21,	'626, 92-96'),
(308,	21,	'626, 97-'),
(309,	21,	'626, SDN/HB/COUPE 88-91//KOMBI 88-96'),
(310,	21,	'CX-7  06-'),
(311,	21,	'MPV 99-02'),
(312,	21,	'MPV 02-04'),
(313,	21,	'MX6 92-'),
(314,	21,	'PREMACY 99-04'),
(315,	21,	'TRIBUTE 01-04'),
(316,	21,	'TRIBUTE 05-06'),
(317,	21,	'XEDOS 6'),
(318,	22,	'100 87-'),
(319,	22,	'1013-3850(TRUCK)'),
(320,	22,	'207-410, 77-95'),
(321,	22,	'406-613 77-85'),
(322,	22,	'507D-814D, 86-'),
(323,	22,	'C208 CLK 97-'),
(324,	22,	'CL  W215  99-'),
(325,	22,	'SL  R230  01-'),
(326,	22,	'SMART FORFOUR 03-'),
(327,	22,	'SMART FORTWO COUPE/CABRIO 07-'),
(328,	22,	'SPRINTER 05-'),
(329,	22,	'SPRINTER 208-414, 00-'),
(330,	22,	'SPRINTER 208-414, 03-'),
(331,	22,	'SPRINTER 208-414, 95-'),
(332,	22,	'VITO/V-KLASSE (W638) 96-'),
(333,	22,	'VITO/VIANO (W639) 03-'),
(334,	22,	'W123 01.75-12.85'),
(335,	22,	'W124 84-96'),
(336,	22,	'W126, 80-91'),
(337,	22,	'W140, 91-98'),
(338,	22,	'W163 02-04 M-klasse'),
(339,	22,	'W163 M-klasse 98-02'),
(340,	22,	'W164 M-CLASS 05-'),
(341,	22,	'W168 A-CLASSE 09.97-08.04'),
(342,	22,	'W169 A-CLASS  09.04-05.08'),
(343,	22,	'W170 SLK'),
(344,	22,	'W201(190) 82-93'),
(345,	22,	'W202 93-00'),
(346,	22,	'W203 05.00-03.07'),
(347,	22,	'W204 C-CLASS 03.07-'),
(348,	22,	'W210 06.95-06.99'),
(349,	22,	'W211  02-'),
(350,	22,	'W211  06-'),
(351,	22,	'W220 S-KLASSE 02-'),
(352,	22,	'W220, 10.98-02'),
(353,	22,	'W245 B-KLASSE 05.05-06.11'),
(354,	22,	'X164 GL-CLASS 06-'),
(355,	23,	'CARISMA, 99-'),
(356,	23,	'CARISMA, 95-99'),
(357,	23,	'COLT 04-'),
(358,	23,	'COLT 92-'),
(359,	23,	'COLT 96-'),
(360,	23,	'COLT/LANCER 89-91/ БЕЗ KOMBI'),
(361,	23,	'ECLIPCE 00-05'),
(362,	23,	'GALANT 3.93-97'),
(363,	23,	'GALANT 85-88'),
(364,	23,	'GALANT 89-2.93'),
(365,	23,	'GALANT 97-06'),
(366,	23,	'GALANT USA  01-03'),
(367,	23,	'GALANT USA 04-'),
(368,	23,	'GALANT USA 99-01'),
(369,	23,	'L200 05-'),
(370,	23,	'LANCER 07-'),
(371,	23,	'LANCER 85-88'),
(372,	23,	'LANCER CEDIA 00-02'),
(373,	23,	'LANCER SDN 03-'),
(374,	23,	'LANCER SDN 08.95-11.97'),
(375,	23,	'LANCER SDN 12.97-04.01'),
(376,	23,	'LANCER SDN 92-95/KOMBI 92-99'),
(377,	23,	'OUTLANDER 03-07'),
(378,	23,	'OUTLANDER XL  07-'),
(379,	23,	'PAJERO 07-'),
(380,	23,	'PAJERO/MONTERO 00-03'),
(381,	23,	'PAJERO/MONTERO 03-'),
(382,	23,	'PAJERO/MONTERO 82-91'),
(383,	23,	'PAJERO/MONTERO 91-97'),
(384,	23,	'PAJERO/MONTERO 97-'),
(385,	23,	'PAJERO/MONTERO SPORT 00-07'),
(386,	23,	'PAJERO/MONTERO SPORT 06-'),
(387,	23,	'SPACE GEAR/L400, 95-02'),
(388,	23,	'SPACE STAR 99-'),
(389,	23,	'SPACE WAGON 91-'),
(390,	24,	'ALMERA N16 00- /SUNNY 00-01'),
(391,	24,	'ALMERA 03-06'),
(392,	24,	'ALMERA 96-99'),
(393,	24,	'ALMERA CLASSIC 07-'),
(394,	24,	'ALTIMA 02-04'),
(395,	24,	'KUBISTAR 04-'),
(396,	24,	'MAXIMA 87-'),
(397,	24,	'MAXIMA I30 89-94'),
(398,	24,	'MAXIMA QX 95-/CEFIRO 95-'),
(399,	24,	'MAXIMA(EU) 00-'),
(400,	24,	'MICRA K10 82-92'),
(401,	24,	'MICRA K11  02.98-02.03'),
(402,	24,	'MICRA K11 93-01.98'),
(403,	24,	'MICRA K12 02-'),
(404,	24,	'MURANO, 03-'),
(405,	24,	'NAVARA/PATHFINDER 04-'),
(406,	24,	'NOTE 06-'),
(407,	24,	'PATHFINDER 87-95'),
(408,	24,	'PATHFINDER, 96-'),
(409,	24,	'PATROL 01.01-08.04'),
(410,	24,	'PATROL 09.04-'),
(411,	24,	'PATROL 81-90'),
(412,	24,	'PATROL 07.90-06.97'),
(413,	24,	'PICK-UP;KING CAB D22 98-'),
(414,	24,	'PRIMASTAR 01-'),
(415,	24,	'PRIMERA 01-'),
(416,	24,	'PRIMERA 90-96'),
(417,	24,	'PRIMERA 96-99'),
(418,	24,	'PRIMERA 99-'),
(419,	24,	'QASHQAI 06-'),
(420,	24,	'SENTRA'),
(421,	24,	'SERENA 93- / VANETTE 95-'),
(422,	24,	'SUNNY B12 86-91'),
(423,	24,	'SUNNY N12 9.82-86'),
(424,	24,	'SUNNY N13 86-90'),
(425,	24,	'SUNNY N14 91-96'),
(426,	24,	'SUNNY Y10 91-96 KOMBI'),
(427,	24,	'TEANA 08-'),
(428,	24,	'TERRANO 87-93'),
(429,	24,	'TERRANO II 93-'),
(430,	24,	'TIIDA 07-'),
(431,	24,	'X-TRAIL 01-08.03'),
(432,	24,	'X-TRAIL 09.03-08.07'),
(433,	24,	'X-TRAIL 09.07-'),
(434,	25,	'AGILA 07.00-01.08'),
(435,	25,	'ASCONA, 81-88'),
(436,	25,	'ASTRA H 04.07-'),
(437,	25,	'ASTRA H, 04-'),
(438,	25,	'ASTRA, 03.98-04'),
(439,	25,	'ASTRA, 10.91-02.98'),
(440,	25,	'CALIBRA, 90-'),
(441,	25,	'CORSA /COMBO 07.00-10.03'),
(442,	25,	'CORSA/COMBO 10.03-07.06'),
(443,	25,	'CORSA D 07.06-'),
(444,	25,	'CORSA/COMBO 03.93-00'),
(445,	25,	'CORSA/COMBO 82-93'),
(446,	25,	'FRONTERA 09.91-'),
(447,	25,	'FRONTERA 09.98-'),
(448,	25,	'KADETT D, -84'),
(449,	25,	'KADETT E, 84-91'),
(450,	25,	'MERIVA   06-'),
(451,	25,	'MERIVA 03-06'),
(452,	25,	'MONTEREY 02.92-'),
(453,	25,	'MOVANO 07.98-12.03'),
(454,	25,	'OMEGA A, 86-02.94'),
(455,	25,	'OMEGA B, 03.94-09.99'),
(456,	25,	'OMEGA B, 10.99-'),
(457,	25,	'RECORD, 78-86'),
(458,	25,	'SIGNUM, 03-'),
(459,	25,	'SINTRA 01.96-'),
(460,	25,	'TIGRA  04-'),
(461,	25,	'TIGRA 95-'),
(462,	25,	'VECTRA A, 09.88-09.92'),
(463,	25,	'VECTRA A, 10.92-09.95'),
(464,	25,	'VECTRA B, 01.99-02'),
(465,	25,	'VECTRA B, 10.95-12.98'),
(466,	25,	'VECTRA C, 02-'),
(467,	25,	'VECTRA C, 05-'),
(468,	25,	'VIVARO 01.01-12.06'),
(469,	25,	'ZAFIRA 99-05'),
(470,	25,	'ZAFIRA 2005-'),
(471,	26,	'1007 09.05-'),
(472,	26,	'106 09.91-12.03'),
(473,	26,	'107 05-'),
(474,	26,	'206'),
(475,	26,	'207, 06-'),
(476,	26,	'306, 03.93-03.97'),
(477,	26,	'306, 04.97-12.98'),
(478,	26,	'307  05-'),
(479,	26,	'307, 01-05'),
(480,	26,	'308 07-'),
(481,	26,	'309'),
(482,	26,	'4007  07-'),
(483,	26,	'405, 07.87-10.95'),
(484,	26,	'406, 05.99-07.04'),
(485,	26,	'406, 11.95-05.99'),
(486,	26,	'407  04-'),
(487,	26,	'407 2D 05-'),
(488,	26,	'505, 79-90'),
(489,	26,	'605, 09.89-06.94'),
(490,	26,	'607 99-09'),
(491,	26,	'806, 94-'),
(492,	26,	'BOXER 02-'),
(493,	26,	'BOXER 06-'),
(494,	26,	'BOXER 06.94-01'),
(495,	26,	'EXPERT 04-07'),
(496,	26,	'EXPERT 94-'),
(497,	26,	'J5, 11.81-05.94'),
(498,	26,	'PARTNER 02-08'),
(499,	26,	'PARTNER 96-02'),
(500,	27,	'19 01.88-12.95'),
(501,	27,	'21 87-95'),
(502,	27,	'25'),
(503,	27,	'5, 85-'),
(504,	27,	'9/11 01.81-12.89'),
(505,	27,	'CLIO  05.90-09.98'),
(507,	27,	'CLIO 09.05-05.09'),
(508,	27,	'CLIO 09.98-06.01'),
(509,	27,	'CLIO/SYMBOL 07.01-'),
(510,	27,	'ESPACE 02-06'),
(511,	27,	'ESPACE 06-'),
(512,	27,	'ESPACE II 92-96'),
(513,	27,	'ESPACE III, 97-00'),
(514,	27,	'KANGOO 01.03-01.08'),
(515,	27,	'KANGOO 03.98-12.02'),
(517,	27,	'LAGUNA 03.01-04.05'),
(518,	27,	'LAGUNA 03.05-10.07'),
(519,	27,	'LAGUNA 94-98'),
(520,	27,	'LAGUNA 99-01'),
(521,	27,	'LOGAN 04-09'),
(522,	27,	'MASTER 07.98-12.03'),
(523,	27,	'MEGANE II 06-'),
(524,	27,	'MEGANE II 03-'),
(525,	27,	'MEGANE 95-99'),
(526,	27,	'MEGANE 99-'),
(527,	27,	'MEGANE SCENIC 95-99'),
(528,	27,	'SAFRANE 92-/96-'),
(529,	27,	'SCENIC 06.03-08.06'),
(530,	27,	'SCENIC 08.06-05.09'),
(531,	27,	'SCENIC 09.99-06.03'),
(532,	27,	'TRAFIC 02-'),
(533,	27,	'TRAFIC 89-95'),
(534,	27,	'TRAFIC 95-'),
(535,	27,	'TWINGO 01-'),
(536,	27,	'VEL SATIS 02-'),
(537,	28,	'200 11.95-03.00'),
(538,	28,	'25 03,00-'),
(539,	28,	'400, 95-'),
(540,	28,	'45,  00-'),
(541,	28,	'600 93-'),
(542,	29,	'9-5, 09.97-10.01'),
(543,	29,	'9.3 02.98-08.03'),
(544,	29,	'900  79-98'),
(545,	29,	'9000  85-'),
(546,	30,	'P3-T143(M112/M113), 88-95'),
(547,	30,	'P94-R144(M114), 96-'),
(548,	31,	'ALHAMBRA  02.01-06.10'),
(549,	31,	'ALHAMBRA 04.96-01.01'),
(550,	31,	'ALTEA 03.04-'),
(551,	31,	'AROSA 01.01-06.04'),
(552,	31,	'AROSA 05.97-12.00'),
(553,	31,	'IBIZA/CORDOBA 05.93-08.99'),
(554,	31,	'IBIZA/CORDOBA, 02.02-05.06'),
(555,	31,	'IBIZA/CORDOBA, 07.99-02.02'),
(556,	31,	'INCA 11.95-12.03'),
(557,	31,	'LEON 06.05-'),
(558,	31,	'LEON 11.99-05.05'),
(559,	31,	'TOLEDO 10.04-09.09'),
(560,	31,	'TOLEDO II 04.99-09.04'),
(561,	31,	'TOLEDO, 05.91-03.99'),
(562,	31,	'TOLEDO, 96-98'),
(563,	32,	'FABIA 04.00-03.07'),
(564,	32,	'FABIA2 03.07-04.10'),
(565,	32,	'FAVORIT'),
(566,	32,	'FELICIA 94-98'),
(567,	32,	'FELICIA 98-'),
(568,	32,	'OCTAVIA  TOUR  04-10'),
(569,	32,	'OCTAVIA 2004-'),
(570,	32,	'OCTAVIA 96-04'),
(571,	32,	'ROOMSTER 06-'),
(572,	32,	'SUPERB 02.02-06.08'),
(573,	32,	'SUPERB 08-'),
(574,	33,	'FORESTER 03-'),
(575,	33,	'FORESTER 98-'),
(576,	33,	'IMPREZA 93-12.96'),
(577,	33,	'IMPREZA 01.97-12.00'),
(578,	33,	'LEGACY -92'),
(579,	33,	'LEGACY 06.92-94'),
(580,	33,	'LEGACY 95-98'),
(581,	33,	'LEGACY 98-03'),
(582,	33,	'LEGACY/OUTBACK 00-04'),
(583,	34,	'ALTO SS30/40/80  79-85'),
(584,	34,	'BALENO 02-'),
(585,	34,	'BALENO 05-'),
(586,	34,	'BALENO 95-99'),
(587,	34,	'BALENO 99-'),
(588,	34,	'GRAND VITARA 97-05'),
(589,	34,	'GRAND VITARA 05-'),
(590,	34,	'IGNIS  03-'),
(591,	34,	'LIANA 02-'),
(592,	34,	'SWIFT 03.05-'),
(593,	34,	'SWIFT 09.96-02.05'),
(594,	34,	'SWIFT 89-08.96'),
(595,	34,	'SX4, 05.06-'),
(596,	34,	'VITARA 03-04'),
(597,	34,	'VITARA 88-95'),
(598,	34,	'VITARA 01.96-12.03'),
(599,	34,	'WAGON R 00-'),
(600,	34,	'XL-7  04-05'),
(601,	35,	'AURIS 07-'),
(602,	35,	'AVENSIS 01-03'),
(603,	35,	'AVENSIS 03-'),
(604,	35,	'AVENSIS 06-'),
(605,	35,	'AVENSIS 98-00'),
(606,	35,	'AYGO 09.05-'),
(607,	35,	'CAMRY 02-'),
(608,	35,	'CAMRY 06-'),
(609,	35,	'CAMRY 86-91'),
(610,	35,	'CAMRY 92-96'),
(611,	35,	'CAMRY 97-'),
(612,	35,	'CAMRY 99-02'),
(613,	35,	'CARINA E 92-98'),
(614,	35,	'CARINA II AT151 84-87'),
(615,	35,	'CARINA II AT171 87-92'),
(616,	35,	'CELICA  00-'),
(617,	35,	'CELICA 89-93(ST18)'),
(618,	35,	'COROLLA 02- HB'),
(619,	35,	'COROLLA 02- SD'),
(620,	35,	'COROLLA 04-  США/ЯПОНИЯ'),
(621,	35,	'COROLLA 04- HB'),
(622,	35,	'COROLLA 07-'),
(623,	35,	'COROLLA 88-92'),
(624,	35,	'COROLLA 92-97'),
(625,	35,	'COROLLA 97-99'),
(626,	35,	'COROLLA 99-01'),
(627,	35,	'COROLLA EE80-AE82, 85-88'),
(628,	35,	'COROLLA VERSO 03-05'),
(629,	35,	'ECHO 01-02'),
(630,	35,	'HI-ACE 89-95'),
(631,	35,	'HI-ACE GRANVIA 96-'),
(632,	35,	'HIGHLANDER 01-03'),
(633,	35,	'HIGHLANDER 04-'),
(634,	35,	'HILUX  2WD  79-83//84-88//89-'),
(635,	35,	'HILUX  4WD  82-83//84-87'),
(636,	35,	'HILUX/4RUNNER 88-91'),
(637,	35,	'HILUX/4RUNNER 92-95'),
(638,	35,	'HILUX/4RUNNER 96-'),
(639,	35,	'LANDCRUISER FJ100 98-'),
(640,	35,	'LANDCRUISER FJ120 PRADO 01.03-10.09'),
(641,	35,	'LANDCRUISER FJ80 91-96'),
(642,	35,	'LANDCRUISER FJ90 96-98'),
(643,	35,	'LANDCRUISER FJ90 PRADO 01-02'),
(644,	35,	'MATRIX 03-'),
(645,	35,	'PREVIA 91-98'),
(646,	35,	'RAV 4  01.06-02.09'),
(647,	35,	'RAV4 06.00-12.03'),
(648,	35,	'RAV4 01.04-12.05'),
(649,	35,	'RAV4 94-00'),
(650,	35,	'TERCEL 91-99'),
(651,	35,	'YARIS 04.02-12.05'),
(652,	35,	'YARIS 01.06-'),
(653,	35,	'YARIS 04.99-03.02'),
(654,	35,	'YARIS VERSO 99-'),
(655,	36,	'BORA 11.98-'),
(656,	36,	'CADDY 3, 04-'),
(657,	36,	'CADDY II, 95-'),
(658,	36,	'CARAVELLE 96-'),
(659,	36,	'CORRADO 88-91'),
(660,	36,	'CRAFTER 05-'),
(661,	36,	'EOS 06-'),
(662,	36,	'FOX 04-'),
(663,	36,	'GOLF 5 03-'),
(664,	36,	'GOLF 5 PLUS 05-'),
(665,	36,	'GOLF I, 74-83'),
(666,	36,	'GOLF II, 83-92'),
(667,	36,	'GOLF III, 91-'),
(668,	36,	'GOLF IV, 09.97-'),
(669,	36,	'JETTA 5   05-'),
(670,	36,	'JETTA I, 79-84'),
(671,	36,	'JETTA II, 02.84-12.91'),
(672,	36,	'LT 75-96'),
(673,	36,	'LT II 96-06'),
(674,	36,	'LUPO, 05.98-'),
(675,	36,	'PASSAT B3 88-93'),
(676,	36,	'PASSAT B4 94-96'),
(677,	36,	'PASSAT B5 01-05'),
(678,	36,	'PASSAT B5 96-00'),
(679,	36,	'PASSAT B6 05-'),
(680,	36,	'PASSAT/SANTANA 81-88'),
(681,	36,	'POLO 2 (COUPE/KOMBI) 8.81-90'),
(682,	36,	'POLO CLASSIC/KOMBI 11.95-06.01'),
(683,	36,	'POLO HB 01-05'),
(685,	36,	'POLO HB 05-09'),
(686,	36,	'POLO HB 10.99-08.01'),
(687,	36,	'POLO HB 94-99'),
(688,	36,	'POLO III 91-9.94'),
(689,	36,	'SHARAN 01-'),
(690,	36,	'SHARAN 95-'),
(691,	36,	'TARO  2WD/4WD  89-'),
(692,	36,	'TIGUAN 07-'),
(693,	36,	'TOUAREG 10.02-12.06'),
(694,	36,	'TOUAREG 07-'),
(695,	36,	'TOURAN 03-'),
(696,	36,	'TOURAN 06-'),
(697,	36,	'TRANSPORTER  T5  03-'),
(698,	36,	'TRANSPORTER T3 79-90'),
(699,	36,	'TRANSPORTER T4 90-02'),
(700,	36,	'VENTO 01.92-10.98'),
(701,	37,	'440 89-96'),
(702,	37,	'460 89-96'),
(703,	37,	'740/760/940 82-89'),
(704,	37,	'740/760/940/960 90-96'),
(705,	37,	'850 92-'),
(706,	37,	'C70 97-'),
(707,	37,	'FH12,FH16 93-//FM7,FM12 98-'),
(708,	37,	'S40/V40 96-'),
(709,	37,	'S40/V50 10.03-04.07'),
(710,	37,	'S60 11.00-03.04'),
(711,	37,	'S70/V70 97-'),
(712,	37,	'S80 98-'),
(713,	37,	'V70 04.00-06.04'),
(714,	37,	'XC90 03-'),
(716,	27,	'TWINGO 93-98'),
(717,	9,	'ALBEA/PALIO 05-'),
(718,	12,	'H1/STAREX 05-'),
(719,	17,	'SHUMA 98-'),
(720,	12,	'XG 99-'),
(721,	6,	'C1 05-'),
(722,	6,	'JUMPY 07-'),
(723,	26,	'EXPERT 07-'),
(724,	4,	'AVEO SEDAN 06-11'),
(725,	36,	'NEW BEETLE 98-'),
(726,	17,	'PICANTO 08-'),
(727,	24,	'BLUEBIRD 84-88'),
(728,	21,	'929, 84-'),
(729,	24,	'TEANA 04-08'),
(730,	7,	'NEXIA NEW 2008-'),
(731,	25,	'MOVANO 01.04-07.07'),
(732,	27,	'MASTER 01.04-12.06'),
(733,	32,	'PRAKTIK 07-'),
(734,	8,	'INTREPID 98-04'),
(735,	22,	'W463 (GELANDEWAGEN) 89-'),
(736,	12,	'I30 10.07-'),
(737,	39,	'ROCKY 85-01'),
(738,	27,	'LOGAN 10-'),
(739,	27,	'SANDERO 08-'),
(740,	40,	'COOPER/COOPER S 06.01-/CABRIO 07.04-07.07'),
(741,	22,	'CLK-KLASSE(C209) 06.02-'),
(742,	22,	'W221 S-KLASSE 09.05-'),
(743,	22,	'SLK-KLASSE (R171) 11.04-'),
(744,	4,	'AVEO H/B 08-'),
(745,	4,	'LACETTI H/B 03-'),
(747,	6,	'C4 (LA/LC) 08-'),
(748,	6,	'C3 10-'),
(750,	6,	'DS3 10-'),
(751,	6,	'C5 (RD/TD) 08-'),
(754,	26,	'3008 09-'),
(755,	26,	'5008 09-'),
(756,	26,	'RCZ 10-'),
(757,	37,	'CABRIO 97-'),
(758,	29,	'9.3 02-07'),
(760,	23,	'L300 01.94-'),
(763,	6,	'C3 05-09'),
(764,	27,	'AVANTIME(DEO) 01-03'),
(765,	2,	'Q7 (4L) 10.05-'),
(767,	23,	'L 300 87-93'),
(768,	24,	'CHERY 78-82'),
(769,	39,	'CHARADE 83-86'),
(770,	41,	'CAYENNE 09.02-'),
(771,	22,	'W210 07.99-03.02'),
(772,	22,	'SL  R129 89-01'),
(773,	42,	'VOYAGER  01-'),
(776,	17,	'CARENS 00-02'),
(777,	17,	'CLARUS 96-99'),
(778,	17,	'CLARUS 99-02'),
(779,	17,	'JOICE 01-'),
(780,	12,	'GRANDEUR 04-'),
(781,	17,	'MAGENTIS 05-08'),
(782,	17,	'PREGIO 97-'),
(783,	3,	'Z3 95-03'),
(784,	17,	'SEPHIA 95-98'),
(785,	12,	'TERRACAN 01-04'),
(786,	12,	'COUPE 96-01'),
(787,	12,	'SANTAMO 99-'),
(788,	12,	'SONATA 88-93'),
(789,	5,	'LE BARON 90-96'),
(790,	5,	'VOYAGER 01.91-12.95'),
(791,	12,	'GALLOPER 98-'),
(792,	33,	'LEGACY 03-'),
(793,	33,	'LEGACY OUTBACK 03-'),
(794,	23,	'PAJERO/MONTERO SPORT 97-'),
(796,	24,	'PATROL 07.97-12.00'),
(797,	2,	'A8(D3) 03-'),
(798,	22,	'CLS-KLASSE(C219) 04-'),
(799,	46,	'FREELANDER 2 07-'),
(800,	27,	'LAGUNA 10.07-'),
(801,	35,	'COROLLA VERSO 07-'),
(802,	22,	'GELANDEWAGEN 07-'),
(803,	22,	'W164 M-CLASS 08-'),
(804,	22,	'W251  R-CLASS 09.05-04.10'),
(805,	36,	'GOLF VI 10.08-'),
(806,	32,	'YETI 09-'),
(807,	4,	'EPICA 05.06-'),
(808,	37,	'FH12 02-07'),
(809,	2,	'A4/S4 SDN/AVANT 01.08-'),
(810,	7,	'KALOS 01.03-'),
(811,	9,	'STILO 01.01-'),
(812,	9,	'BRAVO 02.07-'),
(813,	24,	'MURANO 11.07-'),
(814,	37,	'S80 04-06'),
(815,	27,	'THALIA  06.02-'),
(816,	27,	'THALIA 09.99-05.02'),
(817,	27,	'MODUS 12.04-'),
(818,	27,	'KANGOO 01.08-'),
(819,	28,	'75 99-'),
(820,	6,	'BERLINGO 08-'),
(821,	26,	'PARTNER 08-'),
(822,	9,	'CROMA 05.05-'),
(823,	1,	'166 03-'),
(824,	15,	'DAILY 06-'),
(825,	8,	'NEON 03-'),
(826,	8,	'CALIBER 06.06-'),
(827,	32,	'OCTAVIA 2009-'),
(828,	16,	'CHEROKEE 07-'),
(829,	16,	'LIBERTY 07-'),
(830,	33,	'IMPREZA 01.03-10.05'),
(831,	33,	'IMPREZA  10.05-09.07'),
(832,	33,	'IMPREZA  09.07-'),
(833,	33,	'FORESTER 08-'),
(834,	17,	'SORENTO 02.06-'),
(835,	35,	'PRIUS 03-08'),
(836,	36,	'GOLF KOMBI 09.05-'),
(837,	4,	'CRUZE 09-'),
(838,	8,	'INTREPID 93-97'),
(839,	21,	'2, 04.03-10.07'),
(840,	12,	'SONATA 94-95'),
(841,	47,	'CHANCE'),
(842,	47,	'SENS'),
(843,	3,	'X5 (E70) 10.06-'),
(845,	4,	'CAPTIVA 05.06-'),
(846,	10,	'FIESTA 09.08-'),
(847,	35,	'LANDCRUISER 74-91'),
(848,	22,	'SLK-KLASSE (R170) 09.96-10.04'),
(849,	7,	'NUBIRA 03-'),
(850,	24,	'PATHFINDER USA 98-04'),
(851,	37,	'XC70 03.00-05.04'),
(853,	17,	'SOUL 09-'),
(854,	25,	'SIGNUM 05-'),
(855,	37,	'S40/V50 04.07-'),
(856,	37,	'C30 10.06-01.10'),
(857,	37,	'S60 03.04-03.09'),
(858,	37,	'V70 06.04-03.07'),
(859,	37,	'XC70 05.04-09.07'),
(860,	6,	'C6 09.05-'),
(861,	27,	'PREMIUM 06-'),
(862,	23,	'SPACE STAR 01.02-12.05'),
(863,	6,	'С8 02-'),
(864,	9,	'SCUDO 07-'),
(865,	9,	'ULYSSE 02-'),
(866,	19,	'PHEDRA 02-'),
(867,	26,	'807 02-'),
(868,	27,	'SYMBOL 2 10.08-'),
(869,	5,	'TOWN&COUNTRY 08-'),
(870,	14,	'NQR 07-10'),
(871,	14,	'NKR 07-10'),
(872,	14,	'NPR,NHR 04-06'),
(873,	14,	'NPR,NHR,NKR'),
(874,	14,	'NPR,NHR 93-03'),
(875,	14,	'NPR/ELF 07-'),
(876,	27,	'FLUENCE 10-'),
(877,	27,	'MEGANE III 09-'),
(878,	10,	'TRANSIT 78-85'),
(879,	48,	'MARINER 02-'),
(880,	6,	'SAXO 03.96-09.99'),
(881,	16,	'CHEROKEE 96-01'),
(882,	8,	'CARAVAN 01.05-'),
(883,	9,	'CINQUECENTO 07.91-10.98'),
(884,	9,	'PANDA 09.03-'),
(885,	9,	'500 03.07-'),
(886,	36,	'BEETLE  98-05'),
(887,	36,	'BEETLE 05-10'),
(888,	22,	'W460 G-KLASSE - 05.79-08.89'),
(889,	23,	'COLT 08-'),
(890,	31,	'IBIZA 04.08-'),
(891,	10,	'KUGA 03.08-'),
(892,	33,	'JUSTY 10.95-09.03'),
(893,	36,	'GOLF VI PLUS 01.09-'),
(894,	36,	'POLO 08.09-'),
(895,	36,	'PASSAT CC 06.08-'),
(896,	10,	'TRANSIT TOURNEO CONNECT 09.06-'),
(897,	31,	'IBIZA/CORDOBA, 05.06-04.08'),
(898,	22,	'ACTROS 03-09'),
(899,	22,	'ACTROS 96-02'),
(900,	22,	'ACTROS 10-'),
(901,	22,	'AXOR 96-09'),
(902,	22,	'AXOR 04-'),
(903,	49,	'XF 02-08;CF65/CF75/CF85 00-08;LF45/LF55 01-08'),
(904,	12,	'I20 10.08-'),
(905,	12,	'MATRIX 08-'),
(906,	26,	'306 01.99-12.01'),
(907,	21,	'3, 07.09-'),
(908,	35,	'RAV 4 02.09-'),
(909,	35,	'LANDCRUISER FJ200 11.07-'),
(910,	12,	'SANTA FE 06.09-'),
(911,	3,	'7 E65/66 01.05-10.08'),
(912,	2,	'Q5 08-'),
(913,	29,	'9-5, 11.01-12.05'),
(914,	12,	'GRAND STAREX 08-'),
(915,	20,	'LX470 98-07'),
(916,	22,	'W212 SDN/KOMBI  09-'),
(917,	20,	'GS300/400/430 98-05'),
(918,	25,	'AGILA 01.08-'),
(919,	27,	'TWINGO 08-'),
(920,	34,	'SPLASH 07-'),
(921,	50,	'GAZEL NEW'),
(922,	12,	'PONY/EXCEL 90-91'),
(923,	8,	'CARAVAN 01.88-12.95'),
(924,	7,	'TICO 01.91-12.00'),
(925,	9,	'ALBEA/PALIO WEEKEND 01.02-04.06'),
(926,	25,	'MOVANO 07.07-01.10'),
(927,	27,	'MASTER 01.07-01.10'),
(928,	24,	'INTERSTAR 02-01.04'),
(929,	24,	'INTERSTAR 01.04-01.07'),
(930,	24,	'INTERSTAR 01.07-'),
(931,	35,	'AVENSIS 09-'),
(932,	36,	'TRANSPORTER T2 73-06.79'),
(933,	24,	'NAVARA/PICK-UP/FRONTIER 02-05'),
(934,	27,	'CLIO 05.09-'),
(935,	21,	'323, 06.80-12.87'),
(936,	19,	'Y 96-'),
(937,	9,	'BARCHETTA 95-'),
(938,	3,	'3 E90/E91 08.08-'),
(939,	3,	'3 E92/E93 COUPE/CABRIO 09.06-03.10'),
(940,	8,	'NEON 08.99-'),
(941,	36,	'TRANSPORTER T5 10.09-'),
(942,	6,	'JUMPY 10.95-'),
(943,	19,	'ZETA 94-'),
(944,	6,	'SYNERGIE 94-'),
(945,	51,	'QQ6(S21) 06-'),
(946,	51,	'TIGGO 06-'),
(947,	35,	'HI-ACE 05-'),
(948,	52,	'X-TYPE'),
(949,	1,	'159 05-'),
(950,	23,	'L200 00-'),
(951,	3,	'X6 E71 08-'),
(952,	2,	'A3 04.08-'),
(953,	24,	'TERRANO 07.02-12.06'),
(954,	24,	'XTERRA 05-'),
(955,	27,	'MASCOTT 01.99-12.04'),
(956,	27,	'MASCOTT 01.05-'),
(957,	21,	'929 87-'),
(958,	3,	'6E63/E64, 04-'),
(959,	27,	'PREMIUM 340 96-05'),
(960,	11,	'CITY 09-'),
(961,	26,	'205 01.83-12.97'),
(962,	9,	'MULTIPLA 01.99-12.04'),
(963,	33,	'IMPREZA 01.01-12.02'),
(964,	12,	'IX35 10-'),
(965,	17,	'MAGENTIS 10.08-'),
(966,	4,	'SPARK 01.10-'),
(967,	3,	'5 F10/F11 10-'),
(968,	27,	'SCENIC 05.09-'),
(969,	27,	'MAGNUM 02-'),
(970,	6,	'C4 10-'),
(971,	23,	'OUTLANDER XL 10-'),
(972,	51,	'AMULET 05-'),
(973,	53,	'F3 05-'),
(974,	9,	'RITMO 01.78-12.88'),
(975,	17,	'CERES 10.83-12.98'),
(976,	34,	'SAMURAJ 09.81-'),
(977,	35,	'HI-ACE 84-89'),
(978,	35,	'HI-ACE 77-83'),
(980,	6,	'С3 PICASSO 10.08-'),
(981,	9,	'CROMA 11.07-'),
(982,	9,	'IDEA 01.04-/06-'),
(983,	9,	'LINEA 06.07-'),
(984,	11,	'PRELUDE 92-96'),
(985,	11,	'JAZZ 10.08-'),
(986,	11,	'FRV 02.05-09.09'),
(987,	23,	'LANCER EVO X 03.08-'),
(988,	17,	'CERATO 09-'),
(989,	17,	'CEED 08.09-'),
(990,	36,	'AMAROK 10-'),
(991,	37,	'XC60 05.08-'),
(992,	37,	'340/360 08.75-07.91'),
(993,	34,	'ALTO 08-'),
(994,	34,	'JIMNY 09.98-'),
(995,	36,	'CADDY 10-'),
(996,	36,	'JETTA 11-'),
(997,	36,	'TOURAN 11-'),
(998,	36,	'TOUAREG 10-'),
(999,	17,	'RIO 10.11-'),
(1000,	12,	'SOLARIS 11-'),
(1001,	2,	'A1 04.10-'),
(1002,	2,	'A5/S5 03.07-10.11'),
(1003,	35,	'LANDCRUISER FJ150 PRADO 09-'),
(1004,	6,	'NEMO 10.07-'),
(1005,	9,	'FIORINO/QUBO 10.07-'),
(1006,	26,	'BIPPER 10.07-'),
(1007,	35,	'HIGHLANDER 10-'),
(1008,	1,	'147 10.00-10.04'),
(1009,	24,	'350 Z 03-09'),
(1010,	21,	'2, 11.07-10.10'),
(1011,	21,	'2 10.10-'),
(1012,	21,	'BT-50 07-'),
(1013,	10,	'FOCUS C-MAX 11.10-'),
(1014,	10,	'GALAXY 06.10-'),
(1015,	10,	'S-MAX 06.10-'),
(1016,	24,	'MAXIMA 03-'),
(1017,	22,	'E-CLASS C207 COUPE 09-'),
(1018,	16,	'GRAND CHEROKEE 10-'),
(1019,	27,	'DUSTER 10-'),
(1020,	17,	'PICANTO 06.11-'),
(1021,	54,	'TGA 00-07'),
(1022,	54,	'F2000 94-'),
(1023,	54,	'TGX 07-'),
(1024,	36,	'PASSAT B7 11.10-'),
(1025,	10,	'KA 10.08-'),
(1026,	49,	'CF85 09-/XF105 06-'),
(1027,	35,	'COROLLA VERSO 01-03'),
(1028,	17,	'SORENTO 05.09-'),
(1029,	5,	'VOYAGER 01.08-'),
(1030,	25,	'VIVARO 01.07-'),
(1031,	27,	'TRAFIC 01.07-'),
(1032,	39,	'TERIOS 06-'),
(1033,	21,	'MX3'),
(1034,	24,	'JUKE 06.10-'),
(1035,	24,	'NOTE 10-'),
(1036,	24,	'PATROL 10-'),
(1037,	37,	'FE/FL 06-'),
(1038,	24,	'PRIMASTAR 01.07-'),
(1039,	27,	'MASTER 01.10-'),
(1040,	24,	'QASHQAI 04.10-'),
(1041,	25,	'MOVANO 01.10-'),
(1042,	27,	'KOLEOS 06.08-'),
(1043,	27,	'MODUS 11.07-'),
(1044,	10,	'FOCUS III 12.10-'),
(1045,	52,	'S-TYPE 01.99-10.06'),
(1046,	52,	'S-TYPE 10.06-05.08'),
(1047,	55,	'ESCALADE 06-'),
(1048,	19,	'DELTA 07.08-'),
(1049,	29,	'9-5, 09.05-02.10'),
(1050,	20,	'IS 11.05-03.09'),
(1051,	20,	'GS 01.05-'),
(1052,	37,	'240 81-93'),
(1053,	37,	'S90/V90 01.97-12.98'),
(1054,	37,	'S80 04.06-'),
(1055,	37,	'V70 03.07-'),
(1056,	37,	'XC70 03.07-'),
(1057,	4,	'EVANDA 05.03-05.06'),
(1058,	8,	'GRAND CARAVAN 09.07-'),
(1059,	9,	'126 72-00'),
(1060,	24,	'SUNNY B14 94-96'),
(1061,	25,	'INSIGNIA 08-'),
(1062,	6,	'C3 PICASSO 10.08-'),
(1063,	3,	'3 E46 COMPACT 03.00-12.04'),
(1064,	8,	'NITRO 09.07-11.11'),
(1065,	21,	'MX-5 05.98-03.05'),
(1066,	21,	'MX-5 03.05-'),
(1067,	21,	'RX-8 09.03-'),
(1068,	23,	'ECLIPSE 09.05-08.11'),
(1069,	3,	'X1 (E84) 09-'),
(1070,	35,	'YARIS 03.09-03.11'),
(1071,	36,	'LUPO 03 -'),
(1072,	35,	'RAV 4 04.10-'),
(1073,	12,	'H1/STAREX 08-'),
(1074,	32,	'FABIA2 04.10-'),
(1075,	32,	'ROOMSTER 10-'),
(1076,	37,	'FH16 08-'),
(1077,	12,	'SONATA 11-'),
(1079,	3,	'X3 (F25) 11.10-'),
(1080,	17,	'VENGA 01.10-'),
(1081,	4,	'ORLANDO 03.11-'),
(1082,	16,	'COMPASS 01.07-02.11'),
(1083,	20,	'LX570 07-'),
(1084,	21,	'CX-5 11-'),
(1085,	17,	'OPTIMA 06.10-'),
(1086,	25,	'ASTRA J 09.09-'),
(1087,	25,	'ANTARA 09.06-'),
(1088,	12,	'ELANTRA/AVANTE 08.10-'),
(1089,	35,	'COROLLA 06.10-'),
(1090,	23,	'PAJERO PININ 01.98-06.07'),
(1091,	23,	'PAJERO SPORT 08-'),
(1092,	22,	'ATEGO 97-03'),
(1093,	5,	'CIRRUS 97-00'),
(1094,	42,	'BREEZE 97-00'),
(1095,	19,	'DEDRA 90-'),
(1096,	19,	'PRISMA 82-89'),
(1097,	49,	'LF 55'),
(1098,	27,	'MAXITY 06-'),
(1099,	27,	'MIDLUM 00-'),
(1100,	22,	'ATEGO 04-'),
(1101,	17,	'SPORTAGE 06.10-'),
(1102,	2,	'A4 ALLROAD 09-'),
(1103,	2,	'A6 11-'),
(1104,	2,	'A7 10-'),
(1105,	2,	'A6 ALLROAD 11-'),
(1106,	23,	'ASX 01.10-'),
(1107,	8,	'JOURNEY 09.07-'),
(1108,	25,	'ZAFIRA TOURER 01.12-'),
(1109,	35,	'HILUX 01.05-'),
(1110,	6,	'C4 AIRCROSS 04.12-'),
(1111,	26,	'4008 04.12-'),
(1112,	3,	'7 F01/F02 08-'),
(1113,	18,	'LARGUS 13-'),
(1114,	6,	'C-ELYSEE 12-'),
(1115,	26,	'2008 13-'),
(1116,	26,	'208 12-'),
(1117,	26,	'301 12-'),
(1118,	35,	'RUSH 06-'),
(1119,	34,	'SWIFT 09.10-'),
(1120,	10,	'ESCAPE 08-'),
(1121,	10,	'MONDEO 03.10-'),
(1122,	19,	'LYBRA 06.99-12.05'),
(1123,	46,	'EVOQUE 11-'),
(1124,	37,	'S60 04.10-'),
(1125,	36,	'POINTER 01-'),
(1126,	36,	'POINTER 06-'),
(1127,	37,	'C30 01.10-'),
(1128,	35,	'HILUX 11-'),
(1129,	21,	'5, 05.10-'),
(1130,	21,	'PREMACY 10-'),
(1131,	10,	'FOCUS USA 08-'),
(1132,	12,	'I10 04.08-04.11'),
(1133,	12,	'TUCSON 10.09-'),
(1134,	35,	'PRIUS 05.09-'),
(1135,	27,	'THALIA  10.08-');

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `options` (`id`, `caption`) VALUES
(1,	'ABS'),
(2,	'Break assist'),
(3,	'EBD'),
(4,	'ESP'),
(5,	'Датчик дождя'),
(6,	'Крепление детского сидения ISOFIX'),
(7,	'Парктроник'),
(8,	'Подушка безопасности водителя'),
(9,	'Подушка безопасности переднего пассажира'),
(10,	'Подушки безопасности боковые'),
(11,	'Сигнализация'),
(12,	'Сигнализация с автозапуском'),
(13,	'Система контроля давления в шинах'),
(14,	'Центральный замок');

-- 2019-09-23 08:37:13