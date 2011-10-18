-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-10-2011 a las 11:17:49
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `formatic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombre`, `apellidos`, `dni`, `telefono`, `email`) VALUES
(4, 'Manuel', 'RodrÃ­guez LÃ³pez', '23423455', '2345234234, 2345432324', 'santamaria_de_as_mercedes@gmail.com'),
(5, 'adsf', 'asdfa', 'asdfasf', 'fff', 'fff'),
(13, 'ddssaa', 'gg', 'gg', 'gg', 'gg'),
(14, 'rgrgrgrg', 'asdf', 'ass', 'as', 'as'),
(15, 'ffd', 'ffd', 'ffd', 'ffd', 'ffd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importe` int(11) NOT NULL,
  `concepto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `alumno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno_id` (`alumno_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `importe`, `concepto`, `fecha`, `fecha_pago`, `alumno_id`) VALUES
(11, 2342, 'Clases de apoyo', '2011-09-13', '0000-00-00', 5),
(14, 2342, 'Clases de apoyo modificado', '2011-09-13', '0000-00-00', 4),
(19, 2342, 'Clases de uhuh', '2011-09-13', '0000-00-00', 5);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `facturaConAlumno`
--
CREATE TABLE IF NOT EXISTS `facturaConAlumno` (
`id` int(11)
,`importe` int(11)
,`concepto` varchar(100)
,`fecha` date
,`fecha_pago` date
,`alumno_id` int(11)
,`nombre` varchar(20)
,`apellidos` varchar(20)
,`dni` varchar(12)
,`telefono` varchar(30)
,`email` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `nivel`) VALUES
(1, 'to', 'secreto', 10),
(2, 'to', 'normal', 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `facturaConAlumno`
--
DROP TABLE IF EXISTS `facturaConAlumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturaConAlumno` AS select `factura`.`id` AS `id`,`factura`.`importe` AS `importe`,`factura`.`concepto` AS `concepto`,`factura`.`fecha` AS `fecha`,`factura`.`fecha_pago` AS `fecha_pago`,`alumno`.`id` AS `alumno_id`,`alumno`.`nombre` AS `nombre`,`alumno`.`apellidos` AS `apellidos`,`alumno`.`dni` AS `dni`,`alumno`.`telefono` AS `telefono`,`alumno`.`email` AS `email` from (`factura` join `alumno`) where (`alumno`.`id` = `factura`.`alumno_id`);

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON UPDATE CASCADE;
