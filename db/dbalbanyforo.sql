-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2023 a las 15:39:23
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
-- Base de datos: `dbforo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hilo`
--

CREATE TABLE `hilo` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `hilo`
--

INSERT INTO `hilo` (`id`, `titulo`, `contenido`, `fecha_creacion`, `usuario_id`) VALUES
(9, ' Proceso de creacion de auto', 'En este hilo, discutamos las últimas tendencias sobre como son los procesos manuales y automatizados de la fabricacion de automoviles.', '2025-01-25 05:41:37', 3),
(10, 'Impacto del deporte en la economia de un pais', '¿Te has preguntado por que en los paises de primer mundo se hacen esfuerzos sobrehumanos y economicos para que el futbol sea un metodo de trabajo que genere ingresos tanto al equipo como al pais', '2025-01-25 05:42:08', 3),
(11, 'El estres es la nueva enfermedad que daña a los seres humanos', 'Como todos sabemos el estres se ha convertido en la nueva enfermedad del ser humano debido a que gracvias a los nuevos avances tecnologicos y al desarrolo social las personas cada vez viven mas estresadas en su dia a dia. Como podemos prevenir esto?.', '2025-01-25 05:42:35', 3),
(12, 'Es posible encontrar la felicidad plena', 'Hola a todos, recientemente intenté hacer una encuesta donde le preguntaba a las personas si realmente son felicies. Que crees que me respodieron la mayoria?', '2025-01-25 05:44:52', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `hilo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `clave` varchar(60) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `correo`, `clave`, `fecha_registro`) VALUES
(1, 'carlos', 'carlos@foro.com', '$2y$10$cndiUJiBOaRn2D4fErXS9eUXBLIY7GJh4xT9nNG33ximEFt0PAIFC', '2025-01-25 08:40:06'),
(2, 'jose', 'jose@foro.com', '$2y$10$JIJaOosnZybCYZJsSu1m3.7hgbHr0F9wtv69XXBT8.NcBzxDwvYZq', '2025-01-25 16:41:50'),
(3, 'pedro', 'pedro@g.com', '$2y$10$4UDvMr4y1AmmOhN.MCvAOeOCHU8.a2NlW8CIg1yZlCvqbNXcS0gUW', '2025-01-25 23:42:50'),
(4, 'Maria', 'mmaria@g.com', '$2y$10$gvtnt.6dcvjCVBwSXoGqgex7v6ympeMLWE3rSB.7eEvvk4D4KWhcS', '2025-01-25 05:10:53'),
(5, 'mercedes', 'merce@g.com', '$2y$10$UvSyMa.soXoXd7SuCVTFDOUy4POzOCQ9K4uBHfY6ImCKG4MOU0ZN6', '2025-01-25 05:44:24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `hilo`
--
ALTER TABLE `hilo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_hilo` (`usuario_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_respuesta` (`usuario_id`),
  ADD KEY `hilo_respuesta` (`hilo_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hilo`
--
ALTER TABLE `hilo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hilo`
--
ALTER TABLE `hilo`
  ADD CONSTRAINT `usuario_hilo` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `hilo_respuesta` FOREIGN KEY (`hilo_id`) REFERENCES `hilo` (`id`),
  ADD CONSTRAINT `usuario_respuesta` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
