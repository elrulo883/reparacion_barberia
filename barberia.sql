-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-11-2024 a las 14:18:46
-- Versión del servidor: 8.0.39-0ubuntu0.24.04.2
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `servicio` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_cita` date DEFAULT NULL,
  `hora_cita` time DEFAULT NULL,
  `barbero_asignado` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_cliente`, `servicio`, `fecha_cita`, `hora_cita`, `barbero_asignado`) VALUES
(6, 6, 'rapada al 0', '2024-10-14', '22:57:00', NULL),
(7, 7, 'moicano', '2024-10-16', '13:58:00', NULL),
(8, 8, 'rapada', '2024-10-15', '00:13:00', NULL),
(9, 1, 'Corte de cabello', '2024-10-27', '10:00:00', NULL),
(11, 9, 'funcionando', '2024-10-07', '21:40:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nombre_cliente` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido_cliente` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono_cliente` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `telefono_cliente`) VALUES
(1, 'rulo', 'rod', '9861089273'),
(2, '123', '123', '123'),
(3, 'ruloo', 'rod', '123'),
(4, 'pablo', 'cuan', '99988877733'),
(5, 'jairo cahuhn', 'reyes', '4442221133'),
(6, 'edgardo ak ', 'kuyoc', '6668884400'),
(7, 'jeremy', 'josafat', '3332221114'),
(8, 'cristian', 'che', '55555555'),
(9, 'replicacion', 'desde la maquina', '192.168.0.102');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id_producto`, `nombre_producto`, `cantidad`, `fecha_actualizacion`) VALUES
(16, 'Shampoo', 10, NULL),
(17, 'jabon zote', 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int NOT NULL,
  `id_cita` int DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `metodo_pago` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_cita`, `monto`, `fecha_pago`, `metodo_pago`) VALUES
(10, 6, 123.00, '2024-10-21', 'efectivo'),
(11, 7, 952.00, '2024-10-21', 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre_usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` enum('Jesica','raul','webmaster','recepcionista','barbero','jefe') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `password`, `rol`) VALUES
(3, 'jefe1', '482c811da5d5b4bc6d497ffa98491e38', 'jefe'),
(7, 'barbero', '202cb962ac59075b964b07152d234b70', 'barbero'),
(8, 'recepcionista', '202cb962ac59075b964b07152d234b70', 'recepcionista'),
(16, 'raul', '202cb962ac59075b964b07152d234b70', 'raul'),
(17, 'webmaster', '202cb962ac59075b964b07152d234b70', 'webmaster'),
(19, 'jesica', '202cb962ac59075b964b07152d234b70', 'Jesica');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_cita` (`id_cita`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
