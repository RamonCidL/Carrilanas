-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-10-2011 a las 13:58:40
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `carrilana`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lugar` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `distancia` int(11) NOT NULL,
  `mapaRecorrido` varchar(300) NOT NULL,
  `comoLlegar` varchar(300) NOT NULL,
  `prediccionTiempo` varchar(300) NOT NULL,
  `comentario` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `lugar`, `fecha`, `distancia`, `mapaRecorrido`, `comoLlegar`, `prediccionTiempo`, `comentario`) VALUES
(1, 'Ourense', '0000-00-00 00:00:00', 3, 'gimnasio.jpg', 'dd', 'dd', 'dd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`) VALUES
(1, 'C1', 'hola'),
(2, 'C2', 'adios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `miembro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentario_miembro1` (`miembro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comentario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `comentario` text,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipo_categoria` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`, `foto`, `comentario`, `categoria_id`) VALUES
(1, 'EquipoA', 'gimnasio.jpg', 'ddddddd', 1),
(2, 'EquipoB', 'imagen fotos.jpg', 'erwer', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `comentario` text,
  `miembro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foto_miembro1` (`miembro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `foto`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscrito`
--

CREATE TABLE IF NOT EXISTS `inscrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `equipo_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`equipo_id`,`carrera_id`),
  KEY `fk_inscrito_equipo1` (`equipo_id`),
  KEY `fk_inscrito_carrera1` (`carrera_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `inscrito`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llegada`
--

CREATE TABLE IF NOT EXISTS `llegada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiempoLlegada` time NOT NULL,
  `posicion` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`carrera_id`,`equipo_id`),
  KEY `fk_llegada_carrera1` (`carrera_id`),
  KEY `fk_llegada_equipo1` (`equipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `llegada`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE IF NOT EXISTS `miembro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `password` varchar(10) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `equipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_miembro_equipo1` (`equipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `miembro`
--

INSERT INTO `miembro` (`id`, `nombre`, `foto`, `password`, `telefono`, `correo`, `equipo_id`) VALUES
(2, 'Miembro1', 'botellacarrilana.jpg', 'miembro1', '988562356', 'ddd@ddd.es', 1),
(3, 'Pepito', 'imagen fotos.jpg', 'pepito', '988562356', 'ddd@ddd.es', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE IF NOT EXISTS `noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `noticia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `nivel`) VALUES
(1, 'uno', 'uno', 10),
(2, 'to', 'secreto', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `video` varchar(200) NOT NULL,
  `comentario` text,
  `miembro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_miembro1` (`miembro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `video`
--

INSERT INTO `video` (`id`, `titulo`, `video`, `comentario`, `miembro_id`) VALUES
(1, 'etrft', 'ertet', 'ertr', 2),
(2, 'rrere', 'erere', 'eee', 3),
(3, 'sdffrd', 'ff', 'fff', 3),
(4, 'sdffrd', 'ff', 'fff', 3),
(5, 'sdffrd', 'ff', 'fff', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videoconmiembro`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carrilana`.`videoconmiembro` AS select `carrilana`.`video`.`id` AS `id`,`carrilana`.`video`.`titulo` AS `titulo`,`carrilana`.`video`.`video` AS `video`,`carrilana`.`video`.`comentario` AS `comentario`,`carrilana`.`video`.`miembro_id` AS `miembro_id`,`carrilana`.`miembro`.`nombre` AS `nombre` from (`carrilana`.`video` join `carrilana`.`miembro`) where (`carrilana`.`miembro`.`id` = `carrilana`.`video`.`miembro_id`);

--
-- Volcar la base de datos para la tabla `videoconmiembro`
--

INSERT INTO `videoconmiembro` (`id`, `titulo`, `video`, `comentario`, `miembro_id`, `nombre`) VALUES
(1, 'etrft', 'ertet', 'ertr', 2, 'Miembro1'),
(2, 'rrere', 'erere', 'eee', 3, 'Pepito'),
(3, 'sdffrd', 'ff', 'fff', 3, 'Pepito'),
(4, 'sdffrd', 'ff', 'fff', 3, 'Pepito'),
(5, 'sdffrd', 'ff', 'fff', 3, 'Pepito');

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_miembro1` FOREIGN KEY (`miembro_id`) REFERENCES `miembro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `fk_equipo_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_miembro1` FOREIGN KEY (`miembro_id`) REFERENCES `miembro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscrito`
--
ALTER TABLE `inscrito`
  ADD CONSTRAINT `fk_inscrito_carrera1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscrito_equipo1` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `llegada`
--
ALTER TABLE `llegada`
  ADD CONSTRAINT `fk_llegada_carrera1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_llegada_equipo1` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `miembro`
--
ALTER TABLE `miembro`
  ADD CONSTRAINT `fk_miembro_equipo1` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_video_miembro1` FOREIGN KEY (`miembro_id`) REFERENCES `miembro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
