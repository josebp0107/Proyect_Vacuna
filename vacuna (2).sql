-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2019 a las 02:52:28
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vacuna`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionarDatosNino` (IN `tipoOperacion` INT(1), IN `p_identificacion` VARCHAR(10), IN `p_nombres` VARCHAR(60), IN `p_apellidos` VARCHAR(60), IN `p_fechaNacimiento` DATE, IN `p_identificacionAcudiente` INT)  BEGIN

DECLARE numeroRegistros int;



IF tipoOperacion = 1 THEN

   

 SELECT COUNT(1) INTO numeroRegistros
    FROM datosNinos WHERE identificacion= p_identificacion;
    
    
    

   
 IF numeroRegistros = 0 THEN
   INSERT INTO datosNinos VALUES (p_identificacion,p_nombres,p_apellidos,p_fechaNacimiento,p_identificacionAcudiente);
  

    ELSE 
	SET SQL_SAFE_UPDATES=0;
    UPDATE datosNinos SET identificacion= p_identificacion,nombres = p_nombres,apellidos = p_apellidos,fechaNacimiento = p_fechaNacimiento, identificacionAcudiente = p_identificacionAcudiente
    WHERE  identificacion= p_identificacion;
    
    END IF;

ELSE

	DELETE FROM datosNinos WHERE identificacion= p_identificacion;

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionarRegistroAcudiente` (IN `tipoOperacion` INT(1), IN `p_identificacionAcudiente` INT, IN `p_nombreEncargado` VARCHAR(50), IN `p_apellidoEncargado` VARCHAR(50), IN `p_telefono` INT, IN `p_correo` VARCHAR(50))  BEGIN

DECLARE numeroRegistros int;



IF tipoOperacion = 1 THEN

   

 SELECT COUNT(1) INTO numeroRegistros
    FROM registroacudiente WHERE identificacionAcudiente= p_identificacionAcudiente;
    
    
    

   
 IF numeroRegistros = 0 THEN
   INSERT INTO registroacudiente VALUES (p_identificacionAcudiente,p_nombreEncargado,p_apellidoEncargado,p_telefono,p_correo);
  

    ELSE 
	SET SQL_SAFE_UPDATES=0;
    UPDATE registroacudiente SET identificacionAcudiente= p_identificacionAcudiente,nombreEncargado = p_nombreEncargado,apellidoEncargado = p_apellidoEncargado,telefono = p_telefono, correo = p_correo
    WHERE  identificacionAcudiente= p_identificacionAcudiente;
    
    END IF;

ELSE

	DELETE FROM registroacudiente WHERE identificacionAcudiente= p_identificacionAcudiente;

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionarRegistroDosis` (IN `tipoOperacion` INT(1), IN `p_idDosis` INT, IN `p_idNino` INT, IN `p_idVacuna` INT, IN `p_dosis` VARCHAR(20))  BEGIN

DECLARE numeroRegistros int;



IF tipoOperacion = 1 THEN

   

 SELECT COUNT(1) INTO numeroRegistros
    FROM registrodosis WHERE idDosis= p_idDosis;
    
    
    

   
 IF numeroRegistros = 0 THEN
   INSERT INTO registrodosis VALUES (p_idDosis,p_idNino,p_idVacuna,p_dosis);
  

    ELSE 
	SET SQL_SAFE_UPDATES=0;
    UPDATE registrodosis SET idDosis= p_idDosis,idNino = p_idNino,idVacuna = p_idVacuna, dosis = p_dosis
    WHERE  idDosis= p_idDosis;
    
    END IF;

ELSE

	DELETE FROM registrodosis WHERE idDosis= p_idDosis;

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionarRegistroVacuna` (IN `tipoOperacion` INT(1), IN `p_idVacuna` INT, IN `p_nombreVacuna` VARCHAR(45))  BEGIN

DECLARE numeroRegistros int;



IF tipoOperacion = 1 THEN

   

 SELECT COUNT(1) INTO numeroRegistros
    FROM registrovacuna WHERE idVacuna= p_idVacuna;
    
    
    

   
 IF numeroRegistros = 0 THEN
   INSERT INTO registrovacuna VALUES (p_idVacuna,p_nombreVacuna);
  

    ELSE 
	SET SQL_SAFE_UPDATES=0;
    UPDATE registrovacuna SET idVacuna= p_idVacuna,nombreVacuna = p_nombreVacuna
    WHERE  idVacuna= p_idVacuna;
    
    END IF;

ELSE

	DELETE FROM registrovacuna WHERE idVacuna= p_idVacuna;

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionarSubCategoriaVacuna` (IN `tipoOperacion` INT(1), IN `p_identificacionVacuna` INT, IN `p_nombreVacuna` VARCHAR(45), IN `p_idVacuna` INT)  BEGIN

DECLARE numeroRegistros int;



IF tipoOperacion = 1 THEN

   

 SELECT COUNT(1) INTO numeroRegistros
    FROM subcategoriavacuna WHERE identificacionVacuna= p_identificacionVacuna;
    
    
    

   
 IF numeroRegistros = 0 THEN
   INSERT INTO subcategoriavacuna VALUES (p_identificacionVacuna,p_nombreVacuna,p_idVacuna);
  

    ELSE 
	SET SQL_SAFE_UPDATES=0;
    UPDATE subcategoriavacuna SET identificacionVacuna= p_identificacionVacuna,nombreVacuna = p_nombreVacuna,idVacuna = p_idVacuna
    WHERE  identificacionVacuna= p_identificacionVacuna;
    
    END IF;

ELSE

	DELETE FROM subcategoriavacuna WHERE identificacionVacuna= p_identificacionVacuna;

END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosninos`
--

CREATE TABLE `datosninos` (
  `identificacion` int(11) NOT NULL,
  `nombres` varchar(45) CHARACTER SET latin1 NOT NULL,
  `apellidos` varchar(45) CHARACTER SET latin1 NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `identificacionAcudiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `datosninos`
--

INSERT INTO `datosninos` (`identificacion`, `nombres`, `apellidos`, `fechaNacimiento`, `identificacionAcudiente`) VALUES
(123, 'Ronald', 'Herazo', '2019-06-07', 1102877824);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroacudiente`
--

CREATE TABLE `registroacudiente` (
  `identificacionAcudiente` int(11) NOT NULL,
  `nombreEncargado` varchar(50) CHARACTER SET latin1 NOT NULL,
  `apellidoEncargado` varchar(50) CHARACTER SET latin1 NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registroacudiente`
--

INSERT INTO `registroacudiente` (`identificacionAcudiente`, `nombreEncargado`, `apellidoEncargado`, `telefono`, `correo`) VALUES
(1102877824, 'Ronald', 'Herazo', 30032316, 'akldfaldf'),
(1102877825, 'Andrea', 'Ossa', 23614, 'asdfasdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrodosis`
--

CREATE TABLE `registrodosis` (
  `idDosis` int(11) NOT NULL,
  `idNino` int(11) NOT NULL,
  `idVacuna` int(11) NOT NULL,
  `dosis` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registrodosis`
--

INSERT INTO `registrodosis` (`idDosis`, `idNino`, `idVacuna`, `dosis`) VALUES
(1123, 123, 4000, 'unica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrovacuna`
--

CREATE TABLE `registrovacuna` (
  `idVacuna` int(11) NOT NULL,
  `nombreVacuna` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registrovacuna`
--

INSERT INTO `registrovacuna` (`idVacuna`, `nombreVacuna`) VALUES
(1000, 'Tuberculosis B.C.G'),
(2000, 'Polio (oral-IM)'),
(3000, 'Prevalente'),
(4000, 'Hepatitis A'),
(4100, 'Hepatitis B'),
(5000, 'Rotavirus'),
(6000, 'Neumococo'),
(7000, 'Influenza'),
(8000, 'Sarmpión Rubeola Papera(SRP)'),
(9000, 'Fiebre Amarilla'),
(10000, 'Difterla Tosferina Tetano(DPT)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `cargo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `clave`, `cargo`) VALUES
(1, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datosninos`
--
ALTER TABLE `datosninos`
  ADD PRIMARY KEY (`identificacion`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD KEY `fk_idAcudiente` (`identificacionAcudiente`);

--
-- Indices de la tabla `registroacudiente`
--
ALTER TABLE `registroacudiente`
  ADD PRIMARY KEY (`identificacionAcudiente`),
  ADD UNIQUE KEY `identificacionAcudiente` (`identificacionAcudiente`);

--
-- Indices de la tabla `registrodosis`
--
ALTER TABLE `registrodosis`
  ADD PRIMARY KEY (`idDosis`),
  ADD UNIQUE KEY `idDosis` (`idDosis`),
  ADD KEY `fk_idNino` (`idNino`),
  ADD KEY `fk_idVacuna` (`idVacuna`);

--
-- Indices de la tabla `registrovacuna`
--
ALTER TABLE `registrovacuna`
  ADD PRIMARY KEY (`idVacuna`),
  ADD UNIQUE KEY `idVacuna` (`idVacuna`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datosninos`
--
ALTER TABLE `datosninos`
  ADD CONSTRAINT `fk_idAcudiente` FOREIGN KEY (`identificacionAcudiente`) REFERENCES `registroacudiente` (`identificacionAcudiente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registrodosis`
--
ALTER TABLE `registrodosis`
  ADD CONSTRAINT `fk_idNino` FOREIGN KEY (`idNino`) REFERENCES `datosninos` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idVacuna` FOREIGN KEY (`idVacuna`) REFERENCES `registrovacuna` (`idVacuna`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
