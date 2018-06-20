-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2018 a las 20:32:37
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

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
(10, '¿Consideras que la institución académica reconoce tus esfuerzos?'),
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
(1, 'Por favor contactenos para atender mas detalladamente su caso.\r\nGracias', 1, ''),
(39, 'Empoderamiento y Prosocialidad:\nPrimeramente debe acudir a la coordinaciÃ³n de informÃ¡tica, en la cual solicite toda la informaciÃ³n sobre su carrera: pensum, oficinas de denuncia, profesores y su preparaciÃ³n acadÃ©mica, beneficios universitarios (becas, comedor, transporte, carnet, seguro mÃ©dico, entre otros), orientaciÃ³n sobre su escuela, la ubicaciÃ³n de los salones y su respectiva identificaciÃ³n, el nombre de los edificios y/o oficinas junto con su ubicaciÃ³n.\nSi existen profesores que se niegan a dar la ayuda que necesita, dirÃ­jase a la coordinaciÃ³n de informÃ¡tica; en caso de tampoco ser atendido puede acudir al jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas planteando la situaciÃ³n que se le haya presentado; en caso de tampoco ser atendido debe ir a la oficina de â€œBienestar Estudiantilâ€.\nRecomiendo realizar sus quejas y/o solicitudes siempre por escrito con una hoja original y una copia donde solicite a quienes se la entregÃ³ firmarla de recibido con fecha incluida como aval, en caso de no recibir respuesta (dependiendo de su solicitud) en 10 o 15 dÃ­as recurra a la una prÃ³xima oficina de acuerdo a la escala antes mencionada. \nEsto se realiza con la finalidad de proveer las herramientas necesarias para aumentar sus fortalezas, mejorar sus capacidades de confianza en la instituciÃ³n y seguridad en sÃ­ mismo(a); asÃ­ como impulsar la importancia de la toma de decisiones que afecten a su vida positivamente, desarrollando capacidades y habilidades que puedan hacer valer su rol y mejorar su situaciÃ³n en tÃ©rminos de derechos sociales.', 1, '1,2,3,7,11,12,14,15,17,18,20,21,23,24,26,27,29,30,32,33,35,36'),
(41, 'titulo idiota que falta poner\nhola,mergue', 1, '1,2,6,8,11,14,17,20,23,26,29,32,35'),
(43, 'RelaciÃ³n de Poder:\nInicialmente debe conocer las diferencias entre abuso y maltrato, para lograr identificarlo en su instituciÃ³n acadÃ©mica:\nMaltrato: Es cualquier acciÃ³n que realice una persona hacia otra empleando la violencia o tenga la intenciÃ³n de causar daÃ±o, este puede ser fÃ­sico, sexual, psicolÃ³gico, entre otros (Castillero, O 2018) https://psicologiaymente.net/forense/diferencias-abuso-maltrato. Por ejemplo: \nCuando un docente utiliza palabras hirientes (â€œyo soy mÃ¡s que tÃº por ser profesorâ€, â€œtÃº eres un simple bachillerâ€,...) a sus estudiantes, bien sea dentro del aula de clases o a la hora de solicitar asesorÃ­as particulares.\nCuando el docente ejerza violencia fÃ­sica directa o indirectamente (â€œcolocando un cuaderno de forma fuerte o cualquier cosa sobre tu pupitreâ€,...).\nAbuso: Es cuando existe una sobrelimitaciÃ³n de una persona hacia otra, es decir, una relaciÃ³n desigual por medio de prejuicios, como: la fuerza fÃ­sica, la edad, experiencia, posiciÃ³n social, entre otros (Castillero, O 2018) https://psicologiaymente.net/forense/diferencias-abuso-maltrato. Por ejemplo:\nCuando un docente insinÃºa u obliga que las condiciones para aprobar su materia sean por medio de retribuciones sexuales, econÃ³micas o de extorsiÃ³n hacia los estudiantes. \nQue en mÃ¡s de una ocasiÃ³n el docente falte a sus deberes acadÃ©micos como ir a clase; evalÃºe contenido no explicado, entre otros.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias: \nCoordinaciÃ³n de InformÃ¡tica\nJefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\nOficina de Bienestar Estudiantil\nDecanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,8,9,10,11,12,14,15,17,18,20,21,23,24,26,27,29,30,32,33,35,36'),
(44, 'RelaciÃ³n de Poder:\nInicialmente debe conocer las diferencias entre abuso y maltrato, para lograr identificarlo en su instituciÃ³n acadÃ©mica:\nMaltrato: Es cualquier acciÃ³n que realice una persona hacia otra empleando la violencia o tenga la intenciÃ³n de causar daÃ±o, este puede ser fÃ­sico, sexual, psicolÃ³gico, entre otros (Castillero, O 2018) https://psicologiaymente.net/forense/diferencias-abuso-maltrato. Por ejemplo: \nCuando un docente utiliza palabras hirientes (â€œyo soy mÃ¡s que tÃº por ser profesorâ€, â€œtÃº eres un simple bachillerâ€,...) a sus estudiantes, bien sea dentro del aula de clases o a la hora de solicitar asesorÃ­as particulares.\nCuando el docente ejerza violencia fÃ­sica directa o indirectamente (â€œcolocando un cuaderno de forma fuerte o cualquier cosa sobre tu pupitreâ€,...).\nAbuso: Es cuando existe una sobrelimitaciÃ³n de una persona hacia otra, es decir, una relaciÃ³n desigual por medio de prejuicios, como: la fuerza fÃ­sica, la edad, experiencia, posiciÃ³n social, entre otros (Castillero, O 2018) https://psicologiaymente.net/forense/diferencias-abuso-maltrato. Por ejemplo:\nCuando un docente insinÃºa u obliga que las condiciones para aprobar su materia sean por medio de retribuciones sexuales, econÃ³micas o de extorsiÃ³n hacia los estudiantes. \nQue en mÃ¡s de una ocasiÃ³n el docente falte a sus deberes acadÃ©micos como ir a clase; evalÃºe contenido no explicado, entre otros.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias: \nCoordinaciÃ³n de InformÃ¡tica\nJefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\nOficina de Bienestar Estudiantil\nDecanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,4,5,6,8,9,10,11,12,14,15,17,18,22,23,24,26,27,29,30,32,33,35,36'),
(45, 'ENRIQUECIMIENTO:\nAunque no haya mostrado signos negativos dentro de la instituciÃ³n acadÃ©mica, no significa que en su entorno no puedan existir ciertas circunstancias que puedan generarle malestar a sus allegados o incluso a usted mismo, pero que no haya podido identificar dicha acciÃ³n.\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,25,28,31,34,37'),
(46, 'ENRIQUECIMIENTO:\nAunque no haya mostrado signos negativos dentro de la instituciÃ³n acadÃ©mica, no significa que en su entorno no puedan existir ciertas circunstancias que puedan generarle malestar a sus allegados o incluso a usted mismo, pero que no haya podido identificar dicha acciÃ³n.\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,25,28,31,34,35,36'),
(47, 'ENRIQUECIMIENTO:\nAunque no haya mostrado signos negativos dentro de la instituciÃ³n acadÃ©mica, no significa que en su entorno no puedan existir ciertas circunstancias que puedan generarle malestar a sus allegados o incluso a usted mismo, pero que no haya podido identificar dicha acciÃ³n.\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,25,28,31,32,33,37'),
(48, 'ENRIQUECIMIENTO:\nAunque no haya mostrado signos negativos dentro de la instituciÃ³n acadÃ©mica, no significa que en su entorno no puedan existir ciertas circunstancias que puedan generarle malestar a sus allegados o incluso a usted mismo, pero que no haya podido identificar dicha acciÃ³n.\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,20,21,25,28,31,34,37'),
(49, 'REORIENTACIÃ“N:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido): \n1. CoordinaciÃ³n de InformÃ¡tica\n2. Jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\n3. Oficina de Bienestar Estudiantil\n4. Decanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,25,28,29,30,31,32,33,34,35,36,37'),
(50, 'REORIENTACIÃ“N:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido): \n1. CoordinaciÃ³n de InformÃ¡tica\n2. Jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\n3. Oficina de Bienestar Estudiantil\n4. Decanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,25,26,27,29,30,31,32,33,34,35,36'),
(51, 'REORIENTACIÃ“N:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido): \n1. CoordinaciÃ³n de InformÃ¡tica\n2. Jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\n3. Oficina de Bienestar Estudiantil\n4. Decanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,23,24,28,29,30,31,32,33,34,35,36'),
(52, 'REORIENTACIÃ“N:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido): \n1. CoordinaciÃ³n de InformÃ¡tica\n2. Jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\n3. Oficina de Bienestar Estudiantil\n4. Decanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,22,23,24,26,27,29,30,31,32,33,34,35,36'),
(53, 'REORIENTACIÃ“N:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido): \n1. CoordinaciÃ³n de InformÃ¡tica\n2. Jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\n3. Oficina de Bienestar Estudiantil\n4. Decanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,20,21,25,28,29,30,31,32,33,34,35,36'),
(54, 'REORIENTACIÃ“N:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido): \n1. CoordinaciÃ³n de InformÃ¡tica\n2. Jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\n3. Oficina de Bienestar Estudiantil\n4. Decanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36');
INSERT INTO `respuesta` (`id`, `respuesta`, `id_encuesta`, `combinacion`) VALUES
(55, 'ASESORÃA:\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.    Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.    Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.    ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.    IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.    Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.    CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias y/o peticiones de reconocimiento; siempre y cuando sus solicitudes sean verificables (por escrito preferiblemente con copia y original firmado de recibido):\nCoordinaciÃ³n de InformÃ¡tica\nJefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\nOficina de Bienestar Estudiantil\nDecanato', 1, '1,2,3,4,5,6,7,8,9,10,13,16,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,37'),
(56, 'RelaciÃ³n de Poder:\nInicialmente debe conocer las diferencias entre abuso y maltrato, para lograr identificarlo en su instituciÃ³n acadÃ©mica:\nMaltrato: Es cualquier acciÃ³n que realice una persona hacia otra empleando la violencia o tenga la intenciÃ³n de causar daÃ±o, este puede ser fÃ­sico, sexual, psicolÃ³gico, entre otros (Castillero, O 2018) https://psicologiaymente.net/forense/diferencias-abuso-maltrato. Por ejemplo: \nCuando un docente utiliza palabras hirientes (â€œyo soy mÃ¡s que tÃº por ser profesorâ€, â€œtÃº eres un simple bachillerâ€,...) a sus estudiantes, bien sea dentro del aula de clases o a la hora de solicitar asesorÃ­as particulares.\nCuando el docente ejerza violencia fÃ­sica directa o indirectamente (â€œcolocando un cuaderno de forma fuerte o cualquier cosa sobre tu pupitreâ€,...).\nAbuso: Es cuando existe una sobrelimitaciÃ³n de una persona hacia otra, es decir, una relaciÃ³n desigual por medio de prejuicios, como: la fuerza fÃ­sica, la edad, experiencia, posiciÃ³n social, entre otros (Castillero, O 2018) https://psicologiaymente.net/forense/diferencias-abuso-maltrato. Por ejemplo:\nCuando un docente insinÃºa u obliga que las condiciones para aprobar su materia sean por medio de retribuciones sexuales, econÃ³micas o de extorsiÃ³n hacia los estudiantes. \nQue en mÃ¡s de una ocasiÃ³n el docente falte a sus deberes acadÃ©micos como ir a clase; evalÃºe contenido no explicado, entre otros.\nPara obtener resultados efectivos luego de identificar las dificultades que presenta debe seguir la siguiente escala para realizar sus respectivas denuncias: \nCoordinaciÃ³n de InformÃ¡tica\nJefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas\nOficina de Bienestar Estudiantil\nDecanato\nEn caso de fallar o desconfiar en las oficinas o el personal encargado antes mencionado, debe dirigirse a las siguientes oficinas, segÃºn sus requerimientos y solo si no se le ha dado  respuestas a sus denuncias dentro de la instituciÃ³n acadÃ©mica: \nPolicÃ­a (Encargado de mantener el orden pÃºblico y la seguridad de los ciudadanos).\nCuerpo de Investigaciones CientÃ­ficas Penales y CriminalÃ­sticas â€œCICPCâ€ (InvestigaciÃ³n detallada de los delitos mediante la determinaciÃ³n cientÃ­fica).\nComo usualmente pasar por situaciones frustrantes o negativas generan sentimientos de ansiedad o depresiÃ³n, puede intentar realizar actividades recreativas dentro de la instituciÃ³n que promuevan la superaciÃ³n de dichos elementos, disminuyendo el punto focal de conmociones negativas y al mismo tiempo formar relaciones mÃ¡s afianzadas en la comunidad universitaria, como: fÃºtbol, basket, ajedrez, voleibol, clubes de lecturas (no necesariamente con libros acadÃ©micos), mÃºsica, socializar o conocer a otras personas (generando feedback de conocimientos y/o mejora de relaciones).', 1, '1,2,4,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,26,27,29,30,32,33,35,36'),
(57, 'Empoderamiento y Prosocialidad:\nPrimeramente debe acudir a la coordinaciÃ³n de informÃ¡tica, en la cual solicite toda la informaciÃ³n sobre su carrera: pensum, oficinas de denuncia, profesores y su preparaciÃ³n acadÃ©mica, beneficios universitarios (becas, comedor, transporte, carnet, seguro mÃ©dico, entre otros), orientaciÃ³n sobre su escuela, la ubicaciÃ³n de los salones y su respectiva identificaciÃ³n, el nombre de los edificios y/o oficinas junto con su ubicaciÃ³n.\nSi existen profesores que se niegan a dar la ayuda que necesita, dirÃ­jase a la coordinaciÃ³n de informÃ¡tica; en caso de tampoco ser atendido puede acudir al jefe(a) de la Escuela de IngenierÃ­a y Ciencias Aplicadas planteando la situaciÃ³n que se le haya presentado; en caso de tampoco ser atendido debe ir a la oficina de â€œBienestar Estudiantilâ€.\nRecomiendo realizar sus quejas y/o solicitudes siempre por escrito con una hoja original y una copia donde solicite a quienes se la entregÃ³ firmarla de recibido con fecha incluida como aval, en caso de no recibir respuesta (dependiendo de su solicitud) en 10 o 15 dÃ­as recurra a la una prÃ³xima oficina de acuerdo a la escala antes mencionada. \nEsto se realiza con la finalidad de proveer las herramientas necesarias para aumentar sus fortalezas, mejorar sus capacidades de confianza en la instituciÃ³n y seguridad en sÃ­ mismo(a); asÃ­ como impulsar la importancia de la toma de decisiones que afecten a su vida positivamente, desarrollando capacidades y habilidades que puedan hacer valer su rol y mejorar su situaciÃ³n en tÃ©rminos de derechos sociales.', 1, '1,2,3,7,11,12,13,14,15,16,17,18,22,23,24,26,27,29,30,32,33,35,36'),
(58, 'ENRIQUECIMIENTO:\nAunque no haya mostrado signos negativos dentro de la instituciÃ³n acadÃ©mica, no significa que en su entorno no puedan existir ciertas circunstancias que puedan generarle malestar a sus allegados o incluso a usted mismo, pero que no haya podido identificar dicha acciÃ³n.\nMuchas personas desconocen que la violencia puede manifestarse de manera fÃ­sica, verbal o psicolÃ³gica o incluso cuando pasa por ese tipo de situaciones desconozca que realmente estÃ¡ ocurriendo; ya que la misma varÃ­a dependiendo de quien la ejecuta y quien la recibe, por lo que nadie se encuentra exento de ser vÃ­ctima. Es por esto que a continuaciÃ³n se seÃ±alan algunos tipos de violencia que ocurren en las instituciones acadÃ©micas y que posiblemente no haya podido identificar:\n1.	Violencia del docente al alumno: puede manifestarse cuando el docente utiliza palabras hirientes a sus estudiantes, bien sea dentro del aula de clases o al solicitar asesorÃ­as particulares. TambiÃ©n ejerciendo violencia fÃ­sica de manera directa o indirectamente (colocando un cuaderno o algÃºn objeto de forma fuerte o despectiva sobre su pupitre, golpeando la pizarra, etc.).\n2.	Violencia del alumno al docente: puede ser que el estudiante se burle de la ropa del docente, decirle insultos y groserÃ­as dentro o fuera de clases, amenazas, entre otros.\n3.	ExclusiÃ³n: puede presentarse cuando un grupo de alumnos o un docente alejen intencionalmente a un estudiante del resto  en repetidas ocasiones, con la finalidad de causar malestar o incomodidad logrando que al final la persona se aÃ­sle por completo de su entorno social. Esto no aplica cuando el docente lo realice por separar a un grupo que ocasiona discordia dentro del aula de clases.\n4.	IntimidaciÃ³n: esto ocurre cuando un docente trata de infundir miedo por medio de su jerarquÃ­a con amenazas y valerse de su poder para que los estudiantes cumplan con las exigencias de dicho agresor. Esto no significa que ocurra unidireccional, es decir, el estudiante tambiÃ©n puede ejercer la intimidaciÃ³n hacia un docente, pero por fines de la investigaciÃ³n se coloca de docentes a estudiantes.\n5.	Violencia Sexual: las instituciones acadÃ©micas no se encuentran exentas de presenciar este tipo de conductas, esta puede evidenciarse cuando se muestran los genitales y/o hay contacto fÃ­sico sin consentimiento (roces de piel con la mano o alguna otra parte del cuerpo y hasta forzar al acto sexual). Esto puede realizarse de docente a estudiante o viceversa, de estudiante a estudiante o de docente a docente.\n6.	CoacciÃ³n: generalmente es la violencia ejercida sobre alguien con el objeto de obligar a otra persona a realizar cualquier acciÃ³n que no se estÃ© de acuerdo. Se puede utilizar tanto la amenaza como la violencia fÃ­sica para lograr el objetivo. Un ejemplo claro serÃ­a la â€œoperaciÃ³n colchÃ³nâ€.\nEvidentemente estos son algunos de todos los tipos de violencia que existen y la finalidad de esta intervenciÃ³n es enriquecernos de conocimiento, ya que posiblemente presenciaron algunas de estas prÃ¡cticas pero no se le dio la importancia que debÃ­a tener, o les sirva de ayuda para orientar a otra persona que pase por uno o vario de los tipos de violencia.', 1, '1,2,3,4,5,6,8,9,10,13,14,15,16,18,19,22,25,26,27,29,30,32,33,37');

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

--
-- Volcado de datos para la tabla `respuesta_alumno1`
--

INSERT INTO `respuesta_alumno1` (`id`, `id_respuesta`, `id_usuario`, `opciones`) VALUES
(87, 1, 'Ines', '2,3,7,11,14,17,20,23,26,31,32,35'),
(88, 55, 'Al', '2,4,9,13,16,19,22,24,26,29,32,37'),
(89, 1, 'Paul', '2,4,9,11,15,18,22,24,26,29,33,37'),
(90, 45, 'Manuel', '2,4,9,13,16,19,22,25,28,31,34,37'),
(91, 44, 'Paesani', '2,4,8,12,15,18,22,24,26,29,32,35'),
(92, 44, 'JuanB', '2,4,8,12,15,18,22,23,26,29,32,35'),
(93, 1, 'Eduardo', '2,3,8,13,15,19,22,25,26,29,32,37'),
(94, 1, 'abraham', '2,3,7,13,16,18,22,25,27,30,33,35');

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
('Ali', 'Marcano', 'Al', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'color favorito', '*ECCE1931BEA03B2D16A4C7C013B9C436E87F22D8', 1),
('Eduardo', 'Rodriguez', 'Eduardo', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'Nombre de mi mascota', '*14F3C4868BD19935D832B10A1839D24FFCB13185', 1),
('Ines alejan', 'Natera', 'Ines', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'perro', '*E33729014FEFB64F5F8AD54615B0B514C1C35B44', 1),
('Ines', 'Natera', 'Ines1', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'perro', 'balto', 1),
('Juan', 'Blanco', 'JuanB', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'Â¿color?', '*ECCE1931BEA03B2D16A4C7C013B9C436E87F22D8', 1),
('Manuel', 'Rodriguez', 'Manuel', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'dulce', '*D205AB439771F7878E83BB04947D200663B9429F', 1),
('Maria', 'Luna', 'Maria', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'mi hermano', 'andres', 1),
('Roger', 'Paesani', 'Paesani', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'ayy', '*91CEA4C0C738C62667B2595CE9A6C4109FFC10EA', 1),
('Paul', 'Bello', 'Paul', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'musica', '*6C58061A6972BAE6B2EB6450F7B0E8663A1E492B', 1),
('Rahylem', 'Jimenez', 'Rahylem', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'nombre de mi papa', '*9B1DDB7BB214F9ED335026479D27FAE7F8765A31', 1),
('abraham', 'jimenez', 'abraham', '*99926435CA56FECD2463690F16980965E0D1C7E7', 'nombre de mi mejor amigo', '*2D55C8D6CE7D0BD5B2E703DC209269BC664B4FCE', 1),
('Hilary', 'Alzate', 'hilary', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'nombre de mi perro', '*130AFB371C00704844C324721EA1DFCE2E93232F', 1),
('Administrador', 'Principal', 'rahy', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'Nombre de Usuario', '*4ACFE3202A5FF5CF467898FC58AAB1D615029441', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `respuesta_alumno1`
--
ALTER TABLE `respuesta_alumno1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

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
