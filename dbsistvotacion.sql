-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2023 a las 11:55:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistvotacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `idCandidato` varchar(2) NOT NULL,
  `nombreCandidato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`idCandidato`, `nombreCandidato`) VALUES
('JP', 'Juan Castro'),
('PG', 'Pedro Gonzalez'),
('PT', 'Pamela Toro'),
('JP', 'Juan Castro'),
('GM', 'Gloria Morales'),
('dd', 'ochefvpiwjen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `codRegion` varchar(2) NOT NULL,
  `codComuna` int(11) NOT NULL,
  `nombreComuna` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`codRegion`, `codComuna`, `nombreComuna`) VALUES
('TA', 1101, 'Iquique'),
('TA', 1107, 'Alto Hospicio'),
('TA', 1401, 'Pozo Almonte'),
('TA', 1402, 'Camiña'),
('TA', 1403, 'Colchane'),
('TA', 1404, 'Huara'),
('TA', 1405, 'Pica'),
('AN', 2101, 'Antofagasta'),
('AN', 2102, 'Mejillones'),
('AN', 2103, 'Sierra Gorda'),
('AN', 2104, 'Taltal'),
('AN', 2201, 'Calama'),
('AN', 2202, 'Ollagüe'),
('AN', 2203, 'San Pedro de Atacama'),
('AN', 2301, 'Tocopilla'),
('AN', 2302, 'María Elena'),
('AT', 3101, 'Copiapó'),
('AT', 3102, 'Caldera'),
('AT', 3103, 'Tierra Amarilla'),
('AT', 3201, 'Chañaral'),
('AT', 3202, 'Diego de Almagro'),
('AT', 3301, 'Vallenar'),
('AT', 3302, 'Alto del Carmen'),
('AT', 3303, 'Freirina'),
('AT', 3304, 'Huasco'),
('CO', 4101, 'La Serena'),
('CO', 4102, 'Coquimbo'),
('CO', 4103, 'Andacollo'),
('CO', 4104, 'La Higuera'),
('CO', 4105, 'Paiguano'),
('CO', 4106, 'Vicuña'),
('CO', 4201, 'Illapel'),
('CO', 4202, 'Canela'),
('CO', 4203, 'Los Vilos'),
('CO', 4204, 'Salamanca'),
('CO', 4301, 'Ovalle'),
('CO', 4302, 'Combarbalá'),
('CO', 4303, 'Monte Patria'),
('CO', 4304, 'Punitaqui'),
('CO', 4305, 'Río Hurtado'),
('VA', 5101, 'Valparaíso'),
('VA', 5102, 'Casablanca'),
('VA', 5103, 'Concón'),
('VA', 5104, 'Juan Fernández'),
('VA', 5105, 'Puchuncaví'),
('VA', 5107, 'Quintero'),
('VA', 5109, 'Viña del Mar'),
('VA', 5201, 'Isla  de Pascua'),
('VA', 5301, 'Los Andes'),
('VA', 5302, 'Calle Larga'),
('VA', 5303, 'Rinconada'),
('VA', 5304, 'San Esteban'),
('VA', 5401, 'La Ligua'),
('VA', 5402, 'Cabildo'),
('VA', 5403, 'Papudo'),
('VA', 5404, 'Petorca'),
('VA', 5405, 'Zapallar'),
('VA', 5501, 'Quillota'),
('VA', 5502, 'Calera'),
('VA', 5503, 'Hijuelas'),
('VA', 5504, 'La Cruz'),
('VA', 5506, 'Nogales'),
('VA', 5601, 'San Antonio'),
('VA', 5602, 'Algarrobo'),
('VA', 5603, 'Cartagena'),
('VA', 5604, 'El Quisco'),
('VA', 5605, 'El Tabo'),
('VA', 5606, 'Santo Domingo'),
('VA', 5701, 'San Felipe'),
('VA', 5702, 'Catemu'),
('VA', 5703, 'Llaillay'),
('VA', 5704, 'Panquehue'),
('VA', 5705, 'Putaendo'),
('VA', 5706, 'Santa María'),
('VA', 5801, 'Quilpué'),
('VA', 5802, 'Limache'),
('VA', 5803, 'Olmué'),
('VA', 5804, 'Villa Alemana'),
('LI', 6101, 'Rancagua'),
('LI', 6102, 'Codegua'),
('LI', 6103, 'Coinco'),
('LI', 6104, 'Coltauco'),
('LI', 6105, 'Doñihue'),
('LI', 6106, 'Graneros'),
('LI', 6107, 'Las Cabras'),
('LI', 6108, 'Machalí'),
('LI', 6109, 'Malloa'),
('LI', 6110, 'Mostazal'),
('LI', 6111, 'Olivar'),
('LI', 6112, 'Peumo'),
('LI', 6113, 'Pichidegua'),
('LI', 6114, 'Quinta de Tilcoco'),
('LI', 6115, 'Rengo'),
('LI', 6116, 'Requínoa'),
('LI', 6117, 'San Vicente'),
('LI', 6201, 'Pichilemu'),
('LI', 6202, 'La Estrella'),
('LI', 6203, 'Litueche'),
('LI', 6204, 'Marchihue'),
('LI', 6205, 'Navidad'),
('LI', 6206, 'Paredones'),
('LI', 6301, 'San Fernando'),
('LI', 6302, 'Chépica'),
('LI', 6303, 'Chimbarongo'),
('LI', 6304, 'Lolol'),
('LI', 6305, 'Nancagua'),
('LI', 6306, 'Palmilla'),
('LI', 6307, 'Peralillo'),
('LI', 6308, 'Placilla'),
('LI', 6309, 'Pumanque'),
('LI', 6310, 'Santa Cruz'),
('ML', 7101, 'Talca'),
('ML', 7102, 'Constitución'),
('ML', 7103, 'Curepto'),
('ML', 7104, 'Empedrado'),
('ML', 7105, 'Maule'),
('ML', 7106, 'Pelarco'),
('ML', 7107, 'Pencahue'),
('ML', 7108, 'Río Claro'),
('ML', 7109, 'San Clemente'),
('ML', 7110, 'San Rafael'),
('ML', 7201, 'Cauquenes'),
('ML', 7202, 'Chanco'),
('ML', 7203, 'Pelluhue'),
('ML', 7301, 'Curicó'),
('ML', 7302, 'Hualañé'),
('ML', 7303, 'Licantén'),
('ML', 7304, 'Molina'),
('ML', 7305, 'Rauco'),
('ML', 7306, 'Romeral'),
('ML', 7307, 'Sagrada Familia'),
('ML', 7308, 'Teno'),
('ML', 7309, 'Vichuquén'),
('ML', 7401, 'Linares'),
('ML', 7402, 'Colbún'),
('ML', 7403, 'Longaví'),
('ML', 7404, 'Parral'),
('ML', 7405, 'Retiro'),
('ML', 7406, 'San Javier'),
('ML', 7407, 'Villa Alegre'),
('ML', 7408, 'Yerbas Buenas'),
('BI', 8101, 'Concepción'),
('BI', 8102, 'Coronel'),
('BI', 8103, 'Chiguayante'),
('BI', 8104, 'Florida'),
('BI', 8105, 'Hualqui'),
('BI', 8106, 'Lota'),
('BI', 8107, 'Penco'),
('BI', 8108, 'San Pedro de la Paz'),
('BI', 8109, 'Santa Juana'),
('BI', 8110, 'Talcahuano'),
('BI', 8111, 'Tomé'),
('BI', 8112, 'Hualpén'),
('BI', 8201, 'Lebu'),
('BI', 8202, 'Arauco'),
('BI', 8203, 'Cañete'),
('BI', 8204, 'Contulmo'),
('BI', 8205, 'Curanilahue'),
('BI', 8206, 'Los Álamos'),
('BI', 8207, 'Tirúa'),
('BI', 8301, 'Los Ángeles'),
('BI', 8302, 'Antuco'),
('BI', 8303, 'Cabrero'),
('BI', 8304, 'Laja'),
('BI', 8305, 'Mulchén'),
('BI', 8306, 'Nacimiento'),
('BI', 8307, 'Negrete'),
('BI', 8308, 'Quilaco'),
('BI', 8309, 'Quilleco'),
('BI', 8310, 'San Rosendo'),
('BI', 8311, 'Santa Bárbara'),
('BI', 8312, 'Tucapel'),
('BI', 8313, 'Yumbel'),
('BI', 8314, 'Alto Biobío'),
('AR', 9101, 'Temuco'),
('AR', 9102, 'Carahue'),
('AR', 9103, 'Cunco'),
('AR', 9104, 'Curarrehue'),
('AR', 9105, 'Freire'),
('AR', 9106, 'Galvarino'),
('AR', 9107, 'Gorbea'),
('AR', 9108, 'Lautaro'),
('AR', 9109, 'Loncoche'),
('AR', 9110, 'Melipeuco'),
('AR', 9111, 'Nueva Imperial'),
('AR', 9112, 'Padre Las Casas'),
('AR', 9113, 'Perquenco'),
('AR', 9114, 'Pitrufquén'),
('AR', 9115, 'Pucón'),
('AR', 9116, 'Saavedra'),
('AR', 9117, 'Teodoro Schmidt'),
('AR', 9118, 'Toltén'),
('AR', 9119, 'Vilcún'),
('AR', 9120, 'Villarrica'),
('AR', 9121, 'Cholchol'),
('AR', 9201, 'Angol'),
('AR', 9202, 'Collipulli'),
('AR', 9203, 'Curacautín'),
('AR', 9204, 'Ercilla'),
('AR', 9205, 'Lonquimay'),
('AR', 9206, 'Los Sauces'),
('AR', 9207, 'Lumaco'),
('AR', 9208, 'Purén'),
('AR', 9209, 'Renaico'),
('AR', 9210, 'Traiguén'),
('AR', 9211, 'Victoria'),
('LL', 10101, 'Puerto Montt'),
('LL', 10102, 'Calbuco'),
('LL', 10103, 'Cochamó'),
('LL', 10104, 'Fresia'),
('LL', 10105, 'Frutillar'),
('LL', 10106, 'Los Muermos'),
('LL', 10107, 'Llanquihue'),
('LL', 10108, 'Maullín'),
('LL', 10109, 'Puerto Varas'),
('LL', 10201, 'Castro'),
('LL', 10202, 'Ancud'),
('LL', 10203, 'Chonchi'),
('LL', 10204, 'Curaco de Vélez'),
('LL', 10205, 'Dalcahue'),
('LL', 10206, 'Puqueldón'),
('LL', 10207, 'Queilén'),
('LL', 10208, 'Quellón'),
('LL', 10209, 'Quemchi'),
('LL', 10210, 'Quinchao'),
('LL', 10301, 'Osorno'),
('LL', 10302, 'Puerto Octay'),
('LL', 10303, 'Purranque'),
('LL', 10304, 'Puyehue'),
('LL', 10305, 'Río Negro'),
('LL', 10306, 'San Juan de la Costa'),
('LL', 10307, 'San Pablo'),
('LL', 10401, 'Chaitén'),
('LL', 10402, 'Futaleufú'),
('LL', 10403, 'Hualaihué'),
('LL', 10404, 'Palena'),
('AI', 11101, 'Coihaique'),
('AI', 11102, 'Lago Verde'),
('AI', 11201, 'Aisén'),
('AI', 11202, 'Cisnes'),
('AI', 11203, 'Guaitecas'),
('AI', 11301, 'Cochrane'),
('AI', 11302, 'O\'Higgins'),
('AI', 11303, 'Tortel'),
('AI', 11401, 'Chile Chico'),
('AI', 11402, 'Río Ibáñez'),
('MA', 12101, 'Punta Arenas'),
('MA', 12102, 'Laguna Blanca'),
('MA', 12103, 'Río Verde'),
('MA', 12104, 'San Gregorio'),
('MA', 12201, 'Cabo de Hornos'),
('MA', 12202, 'Antártica'),
('MA', 12301, 'Porvenir'),
('MA', 12302, 'Primavera'),
('MA', 12303, 'Timaukel'),
('MA', 12401, 'Natales'),
('MA', 12402, 'Torres del Paine'),
('RM', 13101, 'Santiago'),
('RM', 13102, 'Cerrillos'),
('RM', 13103, 'Cerro Navia'),
('RM', 13104, 'Conchalí'),
('RM', 13105, 'El Bosque'),
('RM', 13106, 'Estación Central'),
('RM', 13107, 'Huechuraba'),
('RM', 13108, 'Independencia'),
('RM', 13109, 'La Cisterna'),
('RM', 13110, 'La Florida'),
('RM', 13111, 'La Granja'),
('RM', 13112, 'La Pintana'),
('RM', 13113, 'La Reina'),
('RM', 13114, 'Las Condes'),
('RM', 13115, 'Lo Barnechea'),
('RM', 13116, 'Lo Espejo'),
('RM', 13117, 'Lo Prado'),
('RM', 13118, 'Macul'),
('RM', 13119, 'Maipú'),
('RM', 13120, 'Ñuñoa'),
('RM', 13121, 'Pedro Aguirre Cerda'),
('RM', 13122, 'Peñalolén'),
('RM', 13123, 'Providencia'),
('RM', 13124, 'Pudahuel'),
('RM', 13125, 'Quilicura'),
('RM', 13126, 'Quinta Normal'),
('RM', 13127, 'Recoleta'),
('RM', 13128, 'Renca'),
('RM', 13129, 'San Joaquín'),
('RM', 13130, 'San Miguel'),
('RM', 13131, 'San Ramón'),
('RM', 13132, 'Vitacura'),
('RM', 13201, 'Puente Alto'),
('RM', 13202, 'Pirque'),
('RM', 13203, 'San José de Maipo'),
('RM', 13301, 'Colina'),
('RM', 13302, 'Lampa'),
('RM', 13303, 'Tiltil'),
('RM', 13401, 'San Bernardo'),
('RM', 13402, 'Buin'),
('RM', 13403, 'Calera de Tango'),
('RM', 13404, 'Paine'),
('RM', 13501, 'Melipilla'),
('RM', 13502, 'Alhué'),
('RM', 13503, 'Curacaví'),
('RM', 13504, 'María Pinto'),
('RM', 13505, 'San Pedro'),
('RM', 13601, 'Talagante'),
('RM', 13602, 'El Monte'),
('RM', 13603, 'Isla de Maipo'),
('RM', 13604, 'Padre Hurtado'),
('RM', 13605, 'Peñaflor'),
('LR', 14101, 'Valdivia'),
('LR', 14102, 'Corral'),
('LR', 14103, 'Lanco'),
('LR', 14104, 'Los Lagos'),
('LR', 14105, 'Máfil'),
('LR', 14106, 'Mariquina'),
('LR', 14107, 'Paillaco'),
('LR', 14108, 'Panguipulli'),
('LR', 14201, 'La Unión'),
('LR', 14202, 'Futrono'),
('LR', 14203, 'Lago Ranco'),
('LR', 14204, 'Río Bueno'),
('AP', 15101, 'Arica'),
('AP', 15102, 'Camarones'),
('AP', 15201, 'Putre'),
('AP', 15202, 'General Lagos'),
('NB', 16101, 'Chillán'),
('NB', 16102, 'Bulnes'),
('NB', 16103, 'Chillán Viejo'),
('NB', 16104, 'El Carmen'),
('NB', 16105, 'Pemuco'),
('NB', 16106, 'Pinto'),
('NB', 16107, 'Quillón'),
('NB', 16108, 'San Ignacio'),
('NB', 16109, 'Yungay'),
('NB', 16201, 'Quirihue'),
('NB', 16202, 'Cobquecura'),
('NB', 16203, 'Coelemu'),
('NB', 16204, 'Ninhue'),
('NB', 16205, 'Portezuelo'),
('NB', 16206, 'Ránquil'),
('NB', 16207, 'Treguaco'),
('NB', 16301, 'San Carlos'),
('NB', 16302, 'Coihueco'),
('NB', 16303, 'Ñiquén'),
('NB', 16304, 'San Fabián'),
('NB', 16305, 'San Nicolás');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `ordenRegion` int(11) NOT NULL,
  `codRegion` varchar(2) NOT NULL,
  `nombreRegion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`ordenRegion`, `codRegion`, `nombreRegion`) VALUES
(15, 'AI', 'Aysén del General Carlos Ibáñe'),
(3, 'AN', 'Antofagasta'),
(1, 'AP', 'Arica y Parinacota'),
(12, 'AR', 'La Araucanía'),
(4, 'AT', 'Atacama'),
(11, 'BI', 'Biobío'),
(5, 'CO', 'Coquimbo'),
(8, 'LI', 'Libertador General Bernardo O\''),
(14, 'LL', 'Los Lagos'),
(13, 'LR', 'Los Ríos'),
(16, 'MA', 'Magallanes y de la Antártica C'),
(9, 'ML', 'Maule'),
(10, 'NB', 'Ñuble'),
(7, 'RM', 'Metropolitana de Santiago'),
(2, 'TA', 'Tarapacá'),
(6, 'VA', 'Valparaíso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `NombreYApellido` varchar(100) NOT NULL,
  `Alias` varchar(20) NOT NULL,
  `RUT` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ordRegion` int(11) NOT NULL,
  `codComuna` int(11) NOT NULL,
  `idCandidato` varchar(2) NOT NULL,
  `seEnteroEnWeb` int(1) NOT NULL,
  `seEnteroEnTV` int(1) NOT NULL,
  `seEnteroEnRedes` int(1) NOT NULL,
  `seEnteroEnAmigo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla en que se almacenan los Votos';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`codComuna`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`codRegion`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD UNIQUE KEY `RUT` (`RUT`),
  ADD KEY `RUT_2` (`RUT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
