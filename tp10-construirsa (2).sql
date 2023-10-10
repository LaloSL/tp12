-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2023 a las 22:15:01
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
-- Base de datos: `tp10-construirsa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `dni` int(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `dni`, `apellido`, `nombre`, `acceso`, `estado`) VALUES
(1, 12345678, 'González', 'Juan', 1, 1),
(2, 23456789, 'Pérez', 'Ana', 0, 0),
(3, 34567890, 'Martínez', 'Carlos', 1, 1),
(4, 123456589, 'Pérez', 'Juan', 1, 1),
(5, 29877789, 'García', 'Ana', 1, 0),
(7, 1234576789, 'Smith', 'John', 3, 1),
(12, 654321, 'Gomez', 'Juana', 2, 0),
(13, 7890, 'Sosa', 'Pedro', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `id_herramienta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`id_herramienta`, `nombre`, `descripcion`, `stock`, `estado`) VALUES
(26, 'Martillo', 'Martillo de acero para trabajos generales', 10, 1),
(27, 'Taladro', 'Taladro eléctrico con velocidad variable', 5, 1),
(29, 'Destornillador', 'Destornillador de punta plana', 20, 1),
(30, 'Llave Inglesa', 'Llave ajustable para distintos tamaños de tuercas', 15, 1),
(31, 'Pinza', 'Pinza de tipo punta', 15, 1),
(32, 'Serrucho', 'Serrucho de Carpintero', 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idHerramienta` int(11) NOT NULL,
  `fechap` date NOT NULL,
  `fechad` date DEFAULT NULL,
  `cantidadret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `idEmpleado`, `idHerramienta`, `fechap`, `fechad`, `cantidadret`) VALUES
(12, 4, 30, '2023-01-15', '2023-01-17', 2),
(13, 5, 29, '2023-01-14', '2023-01-18', 5),
(15, 5, 26, '2023-03-15', '2023-03-23', 3),
(16, 4, 26, '2023-04-20', '2023-04-25', 1),
(17, 4, 30, '2023-04-05', '2023-04-12', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`id_herramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idHerramienta` (`idHerramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `id_herramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`idHerramienta`) REFERENCES `herramienta` (`id_herramienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
