-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2025 a las 09:26:14
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
-- Base de datos: `hayashi_ha`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_apoderados`
--

CREATE TABLE `tbl_apoderados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_apoderados`
--

INSERT INTO `tbl_apoderados` (`id`, `nombre`, `correo`, `telefono`, `creado_en`) VALUES
(1, 'Peeeepe', 'mrpepelopez@duocuc.lc', '', '2025-10-16 04:22:49'),
(7, 'tulio', 'tulio31minutos@duocuc.cl', '259616231', '2025-10-16 04:59:29'),
(8, 'Mario', 'mariolopez@duocuc.cl', '168519816152', '2025-10-16 10:34:33'),
(9, 'Juanin', 'juanin31minutos@gmail.com', '+56952236209', '2025-10-16 10:40:58'),
(10, 'Fabrizzio', 'fabr.alvarez@duocuc.cl', '+56952236209', '2025-10-23 03:39:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cursos`
--

CREATE TABLE `tbl_cursos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `edad_minima` int(11) NOT NULL,
  `edad_maxima` int(11) NOT NULL,
  `monto_mensual` decimal(10,2) NOT NULL,
  `monto_matricula` decimal(10,2) DEFAULT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_cursos`
--

INSERT INTO `tbl_cursos` (`id`, `nombre`, `edad_minima`, `edad_maxima`, `monto_mensual`, `monto_matricula`, `creado_en`) VALUES
(1, 'Niños', 5, 10, 35000.00, 15000.00, '2025-10-16 04:27:11'),
(2, 'Adultos', 11, 100, 35000.00, 15000.00, '2025-10-16 04:27:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facturas`
--

CREATE TABLE `tbl_facturas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_inscripcion` int(11) DEFAULT NULL,
  `id_semestre` int(11) DEFAULT NULL,
  `tipo_cobro` enum('mensualidad','matricula') NOT NULL,
  `anio_periodo` int(11) DEFAULT NULL,
  `mes_periodo` tinyint(4) DEFAULT NULL,
  `fecha_vencimiento` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` enum('pendiente','pagado','parcial','cancelado') DEFAULT 'pendiente',
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_facturas`
--

INSERT INTO `tbl_facturas` (`id`, `id_usuario`, `id_inscripcion`, `id_semestre`, `tipo_cobro`, `anio_periodo`, `mes_periodo`, `fecha_vencimiento`, `monto`, `estado`, `creado_en`) VALUES
(7, 17, 11, NULL, 'matricula', 2025, 10, '0000-00-00', 15000.00, 'pagado', '2025-10-23 01:34:47'),
(8, 17, 11, NULL, 'mensualidad', 2025, 10, '0000-00-00', 35000.00, 'pagado', '2025-10-23 01:34:47'),
(11, 19, 13, NULL, 'matricula', 2025, 10, '0000-00-00', 15000.00, 'pendiente', '2025-10-23 04:10:34'),
(12, 19, 13, NULL, 'mensualidad', 2025, 10, '0000-00-00', 35000.00, 'pendiente', '2025-10-23 04:10:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_horarios`
--

CREATE TABLE `tbl_horarios` (
  `id` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_horarios`
--

INSERT INTO `tbl_horarios` (`id`, `id_curso`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 1, 'Lunes', '18:00:00', '19:00:00'),
(2, 1, 'Miércoles', '18:00:00', '19:00:00'),
(3, 1, 'Viernes', '18:00:00', '19:00:00'),
(4, 2, 'Lunes', '19:00:00', '20:30:00'),
(5, 2, 'Miércoles', '19:00:00', '20:30:00'),
(6, 2, 'Viernes', '19:00:00', '20:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inscripciones`
--

CREATE TABLE `tbl_inscripciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `dia_cobro` tinyint(4) DEFAULT NULL,
  `estado` enum('activo','pausado','retirado') DEFAULT 'activo',
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_inscripciones`
--

INSERT INTO `tbl_inscripciones` (`id`, `id_usuario`, `id_curso`, `fecha_inicio`, `dia_cobro`, `estado`, `creado_en`) VALUES
(11, 17, 2, '2025-10-23', 23, 'activo', '2025-10-23 01:34:47'),
(13, 19, 2, '2025-10-23', 23, 'activo', '2025-10-23 04:10:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notificaciones`
--

CREATE TABLE `tbl_notificaciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_apoderado` int(11) DEFAULT NULL,
  `canal` enum('correo','pagina') NOT NULL,
  `tipo` enum('deuda','evento','clase','general') NOT NULL,
  `asunto` varchar(180) NOT NULL,
  `mensaje` text NOT NULL,
  `estado` enum('enviado','en_cola','fallido') DEFAULT 'en_cola',
  `enviado_en` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pagos`
--

CREATE TABLE `tbl_pagos` (
  `id` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `monto_pagado` decimal(10,2) NOT NULL,
  `metodo_pago` enum('efectivo','transferencia','tarjeta') NOT NULL,
  `fecha_pago` datetime DEFAULT current_timestamp(),
  `comprobante` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_pagos`
--

INSERT INTO `tbl_pagos` (`id`, `id_factura`, `id_usuario`, `monto_pagado`, `metodo_pago`, `fecha_pago`, `comprobante`) VALUES
(7, 7, 17, 15000.00, 'tarjeta', '2025-10-23 01:34:47', 'MAT-20251023063447-17'),
(8, 8, 17, 35000.00, 'tarjeta', '2025-10-23 01:34:47', 'MEN-20251023063447-17'),
(9, 7, 17, 15000.00, '', '2025-10-23 03:30:28', 'PP#1JG27884X03653335'),
(10, 8, 17, 35000.00, '', '2025-10-23 03:30:28', 'PP#1JG27884X03653335'),
(19, 11, 19, 15000.00, 'transferencia', '2025-10-23 04:10:34', 'MAT-20251023091034-19'),
(20, 12, 19, 35000.00, 'transferencia', '2025-10-23 04:10:34', 'MEN-20251023091034-19'),
(21, 11, 19, 15000.00, 'transferencia', '2025-10-23 04:11:44', 'TRF-20251023091144-19 (pendiente)'),
(22, 12, 19, 35000.00, 'transferencia', '2025-10-23 04:11:44', 'TRF-20251023091144-19 (pendiente)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_semestres`
--

CREATE TABLE `tbl_semestres` (
  `id` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `numero` enum('1','2') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_semestres`
--

INSERT INTO `tbl_semestres` (`id`, `anio`, `numero`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 2025, '1', '2025-01-01', '2025-06-30'),
(2, 2025, '2', '2025-07-01', '2025-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` char(32) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `es_menor` tinyint(1) DEFAULT 0,
  `metodo_pago` enum('efectivo','transferencia','tarjeta') DEFAULT 'efectivo',
  `acepto_condiciones` tinyint(1) DEFAULT 0,
  `id_apoderado` int(11) DEFAULT NULL,
  `creado_en` datetime DEFAULT current_timestamp(),
  `actualizado_en` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id`, `correo`, `password`, `nombre`, `apellido`, `fecha_nacimiento`, `es_menor`, `metodo_pago`, `acepto_condiciones`, `id_apoderado`, `creado_en`, `actualizado_en`) VALUES
(17, 'ye.gomez@duocuc.cl', '25f9e794323b453885f5181f1b624d0b', 'Yerko', 'Gomez', '1997-08-07', 0, 'tarjeta', 1, NULL, '2025-10-23 01:34:47', '2025-10-23 01:34:47'),
(19, 'lolaindigo@duocuc.cl', '25f9e794323b453885f5181f1b624d0b', 'Lola', 'Lolita', '1997-08-07', 0, 'transferencia', 1, NULL, '2025-10-23 04:10:34', '2025-10-23 04:10:34');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_apoderados`
--
ALTER TABLE `tbl_apoderados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `tbl_cursos`
--
ALTER TABLE `tbl_cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_inscripcion` (`id_inscripcion`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Indices de la tabla `tbl_horarios`
--
ALTER TABLE `tbl_horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `tbl_inscripciones`
--
ALTER TABLE `tbl_inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `tbl_notificaciones`
--
ALTER TABLE `tbl_notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_apoderado` (`id_apoderado`);

--
-- Indices de la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tbl_semestres`
--
ALTER TABLE `tbl_semestres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anio` (`anio`,`numero`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `fk_usuario_apoderado` (`id_apoderado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_apoderados`
--
ALTER TABLE `tbl_apoderados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_cursos`
--
ALTER TABLE `tbl_cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_horarios`
--
ALTER TABLE `tbl_horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_inscripciones`
--
ALTER TABLE `tbl_inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_notificaciones`
--
ALTER TABLE `tbl_notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tbl_semestres`
--
ALTER TABLE `tbl_semestres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD CONSTRAINT `tbl_facturas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_facturas_ibfk_2` FOREIGN KEY (`id_inscripcion`) REFERENCES `tbl_inscripciones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_facturas_ibfk_3` FOREIGN KEY (`id_semestre`) REFERENCES `tbl_semestres` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_horarios`
--
ALTER TABLE `tbl_horarios`
  ADD CONSTRAINT `tbl_horarios_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tbl_cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_inscripciones`
--
ALTER TABLE `tbl_inscripciones`
  ADD CONSTRAINT `tbl_inscripciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_inscripciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `tbl_cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_notificaciones`
--
ALTER TABLE `tbl_notificaciones`
  ADD CONSTRAINT `tbl_notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_notificaciones_ibfk_2` FOREIGN KEY (`id_apoderado`) REFERENCES `tbl_apoderados` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  ADD CONSTRAINT `tbl_pagos_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `tbl_facturas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pagos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `fk_usuario_apoderado` FOREIGN KEY (`id_apoderado`) REFERENCES `tbl_apoderados` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
