-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2018 a las 23:11:28
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `surveydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `id` int(50) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_pregunta`
--

CREATE TABLE `encuesta_pregunta` (
  `id_encuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_menu`
--

CREATE TABLE `item_menu` (
  `id` int(11) NOT NULL,
  `item` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id_pregunta` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `opcion` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(500) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `respuesta` text COLLATE utf8_bin NOT NULL,
  `id_encuesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_alumno`
--

CREATE TABLE `respuesta_alumno` (
  `id_usuario` varchar(12) COLLATE utf8_bin NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(50) NOT NULL,
  `rol` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'estudiante'),
(2, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_item`
--

CREATE TABLE `rol_item` (
  `id_rol` int(11) NOT NULL,
  `id_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `nombre` varchar(20) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(20) COLLATE utf8_bin NOT NULL,
  `nombre_usuario` varchar(12) COLLATE utf8_bin NOT NULL,
  `clave` varchar(255) COLLATE utf8_bin NOT NULL,
  `pregunta` varchar(100) COLLATE utf8_bin NOT NULL,
  `respuesta` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_rol` int(50) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `apellido`, `nombre_usuario`, `clave`, `pregunta`, `respuesta`, `id_rol`) VALUES
('Administrador', 'Principal', 'admin', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'Nombre de Usuario', '*4ACFE3202A5FF5CF467898FC58AAB1D615029441', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_encuesta`
--

CREATE TABLE `usuario_encuesta` (
  `id_usuario` varchar(12) COLLATE utf8_bin NOT NULL,
  `id_encuesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encuesta_pregunta`
--
ALTER TABLE `encuesta_pregunta`
  ADD PRIMARY KEY (`id_encuesta`,`id_pregunta`),
  ADD KEY `id_pregunta_poseeFK` (`id_pregunta`);

--
-- Indices de la tabla `item_menu`
--
ALTER TABLE `item_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_preguntaFK` (`id_pregunta`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_encuestaFK` (`id_encuesta`);

--
-- Indices de la tabla `respuesta_alumno`
--
ALTER TABLE `respuesta_alumno`
  ADD PRIMARY KEY (`id_usuario`,`id_opcion`),
  ADD KEY `id_opcion_resp_FK` (`id_opcion`),
  ADD KEY `id_preg_resp` (`id_pregunta`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_item`
--
ALTER TABLE `rol_item`
  ADD PRIMARY KEY (`id_rol`,`id_item`),
  ADD KEY `id_item_rolFK` (`id_item`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`nombre_usuario`),
  ADD KEY `id_rolFK` (`id_rol`);

--
-- Indices de la tabla `usuario_encuesta`
--
ALTER TABLE `usuario_encuesta`
  ADD PRIMARY KEY (`id_usuario`,`id_encuesta`),
  ADD KEY `id_encuesta_realizaFK` (`id_encuesta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `item_menu`
--
ALTER TABLE `item_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `encuesta_pregunta`
--
ALTER TABLE `encuesta_pregunta`
  ADD CONSTRAINT `id_encuesta_poseeFK` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_pregunta_poseeFK` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `id_preguntaFK` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `id_encuestaFK` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta_alumno`
--
ALTER TABLE `respuesta_alumno`
  ADD CONSTRAINT `id_opcion_resp_FK` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_preg_resp` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_respFK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`nombre_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol_item`
--
ALTER TABLE `rol_item`
  ADD CONSTRAINT `id_item_rolFK` FOREIGN KEY (`id_item`) REFERENCES `item_menu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_rol_itemFK` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `id_rolFK` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_encuesta`
--
ALTER TABLE `usuario_encuesta`
  ADD CONSTRAINT `id_encuesta_realizaFK` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuarioFK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`nombre_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
