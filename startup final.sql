-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2024 a las 20:41:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `startup`
--
CREATE DATABASE IF NOT EXISTS `startup` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `startup`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `insertarUltimaRelacion_pro_img`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUltimaRelacion_pro_img` ()   BEGIN
    DECLARE ultimo_proyecto_id INT;
    DECLARE ultima_imagen_id INT;

    SELECT id INTO ultimo_proyecto_id
    FROM proyecto
    ORDER BY id DESC
    LIMIT 1;

    SELECT id INTO ultima_imagen_id
    FROM imagenes
    ORDER BY id DESC
    LIMIT 1;

    IF ultimo_proyecto_id IS NOT NULL AND ultima_imagen_id IS NOT NULL THEN
        INSERT INTO pro_img (proyecto, imagenes)
        VALUES (ultimo_proyecto_id, ultima_imagen_id);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay proyectos o imágenes disponibles.';
    END IF;
END$$

DROP PROCEDURE IF EXISTS `insertarUltimaRelacion_usu_grupo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUltimaRelacion_usu_grupo` ()   BEGIN
    DECLARE ultimo_grupo_id INT;
    DECLARE ultimo_usuario_id INT;

    SELECT id INTO ultimo_grupo_id
    FROM grupo
    ORDER BY id DESC
    LIMIT 1;

    SELECT id INTO ultimo_usuario_id
    FROM usuarios
    ORDER BY id DESC
    LIMIT 1;
    IF ultimo_grupo_id IS NOT NULL AND ultimo_usuario_id IS NOT NULL THEN
        INSERT INTO usu_grupo (grupo_id, usuario_id)
        VALUES (ultimo_grupo_id, ultimo_usuario_id);
    ELSE

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay grupos o usuarios disponibles.';
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
CREATE TABLE `etiquetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etiquetas`
--

INSERT INTO `etiquetas` (`id`, `nombre`) VALUES
(1, 'Desarrollo de Software'),
(2, 'Desarrollo de videojuegos'),
(3, 'Desarrollo de Software movile'),
(4, 'Desarrollo de Inteligencia Artificial'),
(5, 'Desarrollo de Software de Seguridad '),
(6, 'Desarrollo de Software de Realidad Virtual  ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `proyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`) VALUES
(2, 'Los pumas'),
(3, 'Desarrollo Creativo'),
(4, 'Innovadores de Tecnología'),
(5, 'Exploradores de Ideas'),
(6, 'Pioneros de la Sostenibilidad'),
(7, 'Visionarios del Futuro'),
(8, 'Aliados de la Innovación'),
(9, 'Creadores de Soluciones'),
(11, 'tryhards'),
(12, 'Innovadores del Futuro'),
(13, 'Mentes Creativas'),
(14, 'Constructores de Sueños');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL,
  `img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id`, `img`) VALUES
(10, 'img_2/gym-7328168_1280.png'),
(11, 'img_2/shop-139370-OSZJLP-885.jpg'),
(12, 'img_2/proytect-20596.jpg'),
(13, 'img_2/icon-education-10.jpg'),
(14, 'img_2/cloud-2044797_1280.png'),
(15, 'img_2/business-8682137_1280.png'),
(16, 'img_2/icon-events-5974270_1280.png'),
(17, 'img_2/finance-4762523_1280.png'),
(18, 'img_2/write-tacks-2935375_1280.png'),
(19, 'img_2/recycling-160925_1280.png'),
(20, 'img_2/brain-8764400_1280.png'),
(21, 'img_2/icon-events-5974270_1280.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `grupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `nombre`, `descripcion`, `grupo`) VALUES
(2, 'Aplicación Móvil de Fitness', 'Desarrollo de una app para seguimiento de entrenamientos y salud', 2),
(3, 'Sitio Web de E-commerce', 'Creación de una plataforma de ventas en línea', 3),
(4, 'Sistema de Gestión de Proyectos', 'Implementación de un software para administrar proyectos y equipos', 4),
(5, 'Plataforma de Aprendizaje', 'Desarrollo de un portal educativo en línea', 5),
(6, 'App de Clima', 'Aplicación móvil para pronósticos del tiempo en tiempo real', 6),
(7, 'Red Social para Profesionales', 'Creación de una plataforma de networking para profesionales', 7),
(8, 'Aplicación de Gestión de Tareas', 'Desarrollo de una app para la organización de tareas diarias', 8),
(11, 'Proyecto Alfa', 'Desarrollo de una aplicación web para calculadora de finizas', 9),
(12, 'Proyecto Gamma', 'Desarrollo de una herramienta de análisis de datos para pequeñas empresas, que permita visualizar tendencias de ventas y comportamientos de clientes a través de gráficos interactivos', 11),
(13, 'Proyecto Delta', 'Desarrollo de una plataforma de seguimiento y gestión de residuos sólidos para ciudades, con herramientas para optimizar la recolección y reciclaje.', 12),
(14, 'Proyecto Épsilon', 'Desarrollo de una solución de inteligencia artificial para análisis predictivo de tendencias de mercado en tiempo real.\'', 13),
(15, 'Proyecto Zeta', 'Desarrollo de una aplicación para la gestión de eventos, con registro de asistentes, programación y notificaciones en tiempo real.\'', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_img`
--

DROP TABLE IF EXISTS `pro_img`;
CREATE TABLE `pro_img` (
  `id` int(11) NOT NULL,
  `proyecto` int(11) DEFAULT NULL,
  `imagenes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pro_img`
--

INSERT INTO `pro_img` (`id`, `proyecto`, `imagenes`) VALUES
(1, 2, 10),
(2, 3, 11),
(3, 4, 12),
(4, 5, 13),
(5, 6, 14),
(6, 7, 15),
(7, 8, 16),
(8, 11, 17),
(9, 12, 18),
(10, 13, 19),
(11, 14, 20),
(12, 15, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `id_cargo` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `dni`, `telefono`, `nombre_usuario`, `correo_electronico`, `contraseña`, `id_cargo`) VALUES
(9, 'ema', 'Aspi', 45420056, 1153857044, 'erac', 'emanuelaspi123@gmail.com', '1230', 2),
(10, 'Juan', 'Pérez', 38123456, 1145678901, 'juanp', 'juan.perez@gmail.com', 'JuanPerez2024!', 2),
(11, 'María', 'López', 40234567, 1145789012, 'marial', 'maria.lopez@gmail.com', 'MariaLopez2024!', 2),
(12, 'Pedro', 'Martínez', 42156789, 1145890123, 'pedrom', 'pedro.martinez@gmail.com', 'PedroMartinez2024!', 2),
(13, 'Ana', 'García', 45167890, 1145901234, 'anag', 'ana.garcia@gmail.com', 'AnaGarcia2024!', 2),
(14, 'Luis', 'Fernández', 47278901, 1146012345, 'luisf', 'luis.fernandez@gmail.com', 'LuisFernandez2024!', 2),
(15, 'Clara', 'Hernández', 50389012, 1146123456, 'clarah', 'clara.hernandez@gmail.com', 'ClaraHernandez2024!', 2),
(16, 'Carlos', 'Sánchez', 53490123, 1146234567, 'carloss', 'carlos.sanchez@gmail.com', 'CarlosSanchez2024!', 2),
(17, 'Lucía', 'Ramírez', 56501234, 1146345678, 'luciar', 'lucia.ramirez@gmail.com', 'LuciaRamirez2024!', 2),
(18, 'Jorge', 'Gómez', 58612345, 1146456789, 'jorgeg', 'jorge.gomez@gmail.com', 'JorgeGomez2024!', 2),
(19, 'Elena', 'Torres', 60723456, 1146567890, 'elenat', 'elena.torres@gmail.com', 'ElenaTorres2024!', 2),
(20, 'David', 'Morales', 62834567, 1146678901, 'davidm', 'david.morales@gmail.com', 'DavidMorales2024!', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usu_grupo`
--

DROP TABLE IF EXISTS `usu_grupo`;
CREATE TABLE `usu_grupo` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `grupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usu_grupo`
--

INSERT INTO `usu_grupo` (`id`, `usuario`, `grupo`) VALUES
(1, 9, 2),
(2, 10, 3),
(3, 11, 4),
(4, 12, 5),
(5, 13, 6),
(6, 14, 7),
(7, 15, 8),
(8, 16, 9),
(9, 17, 11),
(10, 18, 12),
(11, 19, 13),
(12, 20, 14);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `proyecto` (`proyecto`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo` (`grupo`);

--
-- Indices de la tabla `pro_img`
--
ALTER TABLE `pro_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyecto` (`proyecto`),
  ADD KEY `imagenes` (`imagenes`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usu_grupo`
--
ALTER TABLE `usu_grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `grupo` (`grupo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pro_img`
--
ALTER TABLE `pro_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usu_grupo`
--
ALTER TABLE `usu_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`proyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `pro_img`
--
ALTER TABLE `pro_img`
  ADD CONSTRAINT `pro_img_ibfk_1` FOREIGN KEY (`proyecto`) REFERENCES `proyecto` (`id`),
  ADD CONSTRAINT `pro_img_ibfk_2` FOREIGN KEY (`imagenes`) REFERENCES `imagenes` (`id`);

--
-- Filtros para la tabla `usu_grupo`
--
ALTER TABLE `usu_grupo`
  ADD CONSTRAINT `usu_grupo_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `usu_grupo_ibfk_2` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
