-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2018 a las 01:33:08
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

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

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`id`, `nombre`) VALUES
(1, 'Encuesta Inicial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_pregunta`
--

CREATE TABLE `encuesta_pregunta` (
  `id_encuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `encuesta_pregunta`
--

INSERT INTO `encuesta_pregunta` (`id_encuesta`, `id_pregunta`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id_pregunta` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `opcion` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_pregunta`, `id_opcion`, `opcion`) VALUES
(1, 1, 'Femenino'),
(1, 2, 'Masculino'),
(3, 3, 'De 16 a 20 años'),
(3, 4, 'De 21 a 24 años'),
(3, 5, 'De 25 a 28 años'),
(3, 6, 'De 29 años en adelante  '),
(4, 7, 'Menos de 2 años'),
(4, 8, 'De 2 a 5 años'),
(4, 9, 'De 6 a 10 años'),
(4, 10, '11 años o más '),
(5, 11, 'No'),
(5, 12, 'Regular'),
(5, 13, 'Si'),
(6, 14, 'No'),
(6, 15, 'Regular'),
(6, 16, 'Si'),
(7, 17, 'No'),
(7, 18, 'Regular'),
(7, 19, 'Si'),
(8, 20, 'No'),
(8, 21, 'Regular'),
(8, 22, 'Si'),
(9, 23, 'No'),
(9, 24, 'Regular'),
(9, 25, 'Si'),
(10, 26, 'No'),
(10, 27, 'Regular'),
(10, 28, 'Si'),
(11, 29, 'No'),
(11, 30, 'Regular'),
(11, 31, 'Si'),
(12, 32, 'No'),
(12, 33, 'Regular'),
(12, 34, 'Si'),
(13, 35, 'No'),
(13, 36, 'Regular'),
(13, 37, 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `pregunta`) VALUES
(1, 'Género'),
(3, 'Edad'),
(4, '¿Cuál es su antigüedad en la institución académica?'),
(5, 'Cuando ingrese a la institución me sentí bienvenido'),
(6, 'Considero que existe un buen ambiente académico'),
(7, 'Cuento con el apoyo de mis profesores a la hora de solicitar asesorías'),
(8, 'Mis compañeros y yo nos apoyamos mutuamente en cuanto a trabajos académicos'),
(9, '¿Puedes expresar tus opiniones o quejas de algún profesor en una oficina particular sin ser etiquetado?'),
(10, '¿Consideras que la institución académica te recompensa por tus esfuerzos?'),
(11, 'Al ingresar a la institución, ¿se le informa sobre las medidas que debería tomar en caso de ser víctima de abuso por parte de docentes, compañeros o cualquier personal administrativo?'),
(12, 'Actualmente ¿consideras que las denuncias en tu institución académica tienen un efecto positivo para solventar dificultades entre profesores y/o estudiantes? '),
(13, 'Actualmente ¿Confías en la oficina y/o el personal que recibe las denuncias de tu institución?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `respuesta` text COLLATE utf8_bin NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  `combinacion` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `respuesta`, `id_encuesta`, `combinacion`) VALUES
(33, 'Mergue', 1, '1,3,7,11,14,17,20,23,26,29,32,35'),
(34, 'Modelo de respuesta 2', 1, '1,4,7,11,14,17,20,23,26,29,32,35');

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
-- Estructura de tabla para la tabla `respuesta_alumno1`
--

CREATE TABLE `respuesta_alumno1` (
  `id` int(11) NOT NULL,
  `id_respuesta` int(11) NOT NULL,
  `id_usuario` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `opciones` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
('Eduardo', 'Rodriguez', 'Eduardo', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'Nombre de mi mascota', '*14F3C4868BD19935D832B10A1839D24FFCB13185', 1),
('Ines alejan', 'Natera', 'Ines', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'perro', '*E33729014FEFB64F5F8AD54615B0B514C1C35B44', 1),
('Ines', 'Natera', 'Ines1', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'perro', 'balto', 1),
('Maria', 'Luna', 'Maria', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'mi hermano', 'andres', 1),
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
  ADD UNIQUE KEY `combinacion_uk` (`combinacion`) USING BTREE,
  ADD KEY `id_encuestaFK` (`id_encuesta`);

--
-- Indices de la tabla `respuesta_alumno`
--
ALTER TABLE `respuesta_alumno`
  ADD PRIMARY KEY (`id_usuario`,`id_opcion`),
  ADD KEY `id_opcion_resp_FK` (`id_opcion`),
  ADD KEY `id_preg_resp` (`id_pregunta`);

--
-- Indices de la tabla `respuesta_alumno1`
--
ALTER TABLE `respuesta_alumno1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuarioFK1` (`id_usuario`),
  ADD KEY `id_respuestaFK` (`id_respuesta`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `respuesta_alumno1`
--
ALTER TABLE `respuesta_alumno1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Filtros para la tabla `respuesta_alumno1`
--
ALTER TABLE `respuesta_alumno1`
  ADD CONSTRAINT `id_respuestaFK` FOREIGN KEY (`id_respuesta`) REFERENCES `respuesta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuarioFK1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`nombre_usuario`) ON UPDATE CASCADE;

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
