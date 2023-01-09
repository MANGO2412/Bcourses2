-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2023 a las 16:49:55
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliNumero` smallint(6) NOT NULL,
  `cliNombre` varchar(25) NOT NULL,
  `cliMetodoPago` varchar(20) NOT NULL,
  `cliTelefono` char(10) NOT NULL,
  `cliNumEmp` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliNumero`, `cliNombre`, `cliMetodoPago`, `cliTelefono`, `cliNumEmp`) VALUES
(102, 'Sara Mendez', 'Efectivo', '6642154783', 276),
(103, 'Juan Perez', 'Tarjeta', '6642136548', 279),
(104, 'Anna Cruz', 'Tarjeta', '6643321566', 279),
(105, 'Luisa Herra', 'Tarjeta', '6643122558', 276),
(106, 'Pablo Jauregui', 'Efectivo', '6643369877', 276),
(107, 'Nicolas Inocence', 'Efectivo', '6641156698', 279),
(108, 'Jazmin Torres', 'Tarjeta', '6642255991', 276),
(109, 'Gabriel Reyes', 'Efectivo', '6647789664', 279),
(110, 'Julieta Garcia', 'Efectivo', '6644489635', 279),
(111, 'Milly Rodriguez', 'Efectivo', '6649971322', 279),
(112, 'Carlos Santana', 'Efectivo', '6643621599', 276),
(113, 'Jorge Hank', 'Tarjeta', '6649956644', 276),
(114, 'Enrique Pena', 'Tarjeta', '6642269751', 279),
(115, 'Ramon Valdez', 'Efectivo', '6646632154', 279),
(116, 'Isaac Molina Jr.', 'Tarjeta', '6649975136', 276);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `idcli` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`idcli`, `name`, `email`, `phone`, `address`, `created`, `modified`, `status`) VALUES
(1, 'Usuario Demo', 'demo-demo@gmail.com', '900099900', 'Quito, EC, Ecuador', '2018-02-17 08:21:25', '2018-02-17 08:21:25', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empNumero` smallint(6) NOT NULL,
  `empNombre` varchar(25) NOT NULL,
  `empApe_Pat` varchar(20) NOT NULL,
  `empApe_Mat` varchar(20) NOT NULL,
  `empEdad` smallint(2) NOT NULL,
  `empCorreo` varchar(30) NOT NULL,
  `empRFC` varchar(15) NOT NULL,
  `empTelefono` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`empNumero`, `empNombre`, `empApe_Pat`, `empApe_Mat`, `empEdad`, `empCorreo`, `empRFC`, `empTelefono`) VALUES
(201, 'Ricardo', 'Dominguez', 'Herrera', 28, 'HerreraRicardo@gmail.com', 'RDH0835411', '6645251333'),
(211, 'Alan', 'Perez', 'Muños', 23, 'Alan11@gmail.com', 'AGNH5T7455', '6645842788'),
(212, 'David', 'Villalobos', 'Lopez', 31, 'DavidVillalobos3@hotmail.com', 'DVVILL9889', '6615845775'),
(214, 'Lucero', 'Santiago', 'Flores', 21, 'LuceroF4@gmil.com', 'LUCEVF3211', '6638998911'),
(223, 'Julieta', 'Gonzales', 'Hernandez', 22, 'July92@gmail.com', 'JL74Q15447', '6645231428'),
(233, 'Berenice', 'Hernandez', 'Gomez', 28, 'Berenice33@gmail.com', 'BRNCIE1101', '6645287747'),
(239, 'Michelle', 'Martinez', 'Dominguez', 23, 'MichelleMD@gamil.com', 'MMD02864421', '6645528977'),
(241, 'Teresa', 'Medina', 'Akino', 36, 'Teresa41M@gmail.com', 'TMA0812221', '6658987414'),
(245, 'Gamaliel', 'Godinez', 'Cruz', 25, 'Cruz45@gmail.com', 'CMIALL3423', '6645744788'),
(256, 'Karla', 'Cisneros', 'Acosta', 22, 'Karla56@gmail.com', 'KCA9471973', '6649686675'),
(269, 'Alejandro', 'Villanueva', 'Costa', 30, 'Alejandro69@gmail.com', 'ALVICO9000', '6612524887'),
(276, 'Antonito', 'Reyes', 'Reyes', 32, 'Antonit@gmail.com', 'ERFDRE453411', '6645477898'),
(279, 'Martha', 'Vazquez', 'Cena', 37, 'MrthaVAZ554@outlook.com', 'MRTH912312', '6645785896'),
(299, 'Camila', 'Torres', 'Martinez', 29, 'Camila99@gmail.com', 'CRZUTRH657', '6632522112'),
(300, 'Milly', 'Ruiz', 'Medina', 18, 'Millyhot@hotmail.com', 'ERDFTG4534231', '6645457656');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `marCodigo` int(11) NOT NULL,
  `marNombre` varchar(20) NOT NULL,
  `marImagen` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`marCodigo`, `marNombre`, `marImagen`) VALUES
(1, 'DERWENT', 'derwent.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mis_productos`
--

CREATE TABLE `mis_productos` (
  `idprod` int(11) NOT NULL,
  `foto` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sabor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `marca` smallint(20) NOT NULL,
  `tamanio` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `tipoD` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mis_productos`
--

INSERT INTO `mis_productos` (`idprod`, `foto`, `name`, `description`, `sabor`, `marca`, `tamanio`, `tipoD`, `price`, `created`, `modified`, `status`) VALUES
(5, 'l3.jpg', 'Producto 1', 'Lorem ipsum dolor sit amet, volutpat.', 'bannana', 1, 'CH', '1', 15.00, '2022-08-17 08:21:25', '2022-08-17 08:21:25', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idor` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_articulos`
--

CREATE TABLE `orden_articulos` (
  `idor_ar` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `perNumero` smallint(6) NOT NULL,
  `perRFC` varchar(25) NOT NULL,
  `perPuesto` varchar(25) NOT NULL,
  `perTurno` varchar(11) NOT NULL,
  `perSueldo` int(11) NOT NULL,
  `perHorasLab` smallint(6) NOT NULL,
  `perHorasEx` smallint(6) NOT NULL,
  `perTelefono_emp` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`perNumero`, `perRFC`, `perPuesto`, `perTurno`, `perSueldo`, `perHorasLab`, `perHorasEx`, `perTelefono_emp`) VALUES
(401, 'MMD02864421', 'Limpieza', 'Vespertino', 1000, 7, 2, '6645528977'),
(404, 'JL74Q15447', 'Gerente', 'Matutino', 1000, 8, 3, '6645231428'),
(408, 'MRTH912312', 'Cajero', 'Vespertino', 1000, 7, 3, '6645785896'),
(411, 'ALVICO9000', 'Gerente', 'Matutino', 1000, 8, 2, '6612524887'),
(412, 'KCA9471973', 'Mantenimiento', 'Matutino', 1000, 8, 4, '6649686675'),
(421, 'AGNH5T7455', 'Mesero', 'Matutino', 1000, 8, 3, '6645842788'),
(432, 'DVVILL9889', 'Mesero', 'Matutino', 1000, 8, 3, '6615845775'),
(433, 'CRZUTRH657', 'Almacenista', 'Vespertino', 1000, 7, 1, '6632522112'),
(455, 'LPYH6765', 'Cajero', 'Matutino', 1000, 8, 4, '6648759687'),
(459, 'LUCEVF3211', 'Mesero', 'Vespertino', 1000, 7, 2, '6638998911'),
(462, 'EQT9836651', 'Cocinero', 'Matutino', 1000, 8, 4, '6638977854'),
(478, 'BRNCIE1101', 'Mantenimiento', 'Vespertino', 1000, 7, 2, '6645287747'),
(481, 'RDH0835411', 'Cocinero', 'Matutino', 1000, 8, 5, '6645251333'),
(490, 'TMA0812221', 'Cocinero', 'Vespertino', 1000, 7, 5, '6658987414'),
(498, 'CMIALL3423', 'Limpieza', 'Matutino', 1000, 8, 3, '6645744788');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `prodCodigo` smallint(6) NOT NULL,
  `prodNombre` varchar(25) NOT NULL,
  `prodSabor` varchar(25) NOT NULL,
  `prodTamanio` varchar(2) NOT NULL,
  `prodMarca` varchar(30) NOT NULL,
  `prodPrecio` float(5,2) NOT NULL,
  `prodTipo` varchar(20) DEFAULT NULL,
  `prodMatricula` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`prodCodigo`, `prodNombre`, `prodSabor`, `prodTamanio`, `prodMarca`, `prodPrecio`, `prodTipo`, `prodMatricula`) VALUES
(1001, 'Cheesecake', 'Frambuesa', 'CH', 'Kirkland', 20.00, 'Postre', 3022),
(1002, 'Muffins', 'Chocolate', 'CH', 'Kirkland', 18.00, 'Postre', 3047),
(1003, 'Galletas', 'Vainilla', 'CH', 'Kirkland', 10.00, 'Postre', 3001),
(1004, 'Creppa', 'Nutella', 'M', 'N/A', 25.00, 'Postre', 3087),
(1005, 'Panque', 'Limon', 'CH', 'Kirkland', 20.00, 'Postre', 3019),
(1006, 'Sandwich', 'Pavo', 'G', 'Kirkland', 35.00, 'Otros', 222),
(1007, 'Hamburguesa', 'Res', 'G', 'N/A', 60.00, 'Comida', 3033),
(1008, 'Pizza', 'Pepperoni', 'G', 'N/A', 70.00, 'Comida', 3011),
(1009, 'Burrito', 'Frijoles', 'M', 'Kirkland', 15.00, 'Comida', 3007),
(1010, 'Café', 'Moka', 'M', 'N/A', 30.00, 'Bebida', 3023),
(1011, 'Frappe', 'Oreo', 'M', 'N/A', 40.00, 'Bebida', 3056),
(1012, 'Jugo', 'Manzana', 'M', 'Kirkland', 23.00, 'Bebida', 3044),
(1013, 'Leche', 'Natural', 'CH', 'Kirkland', 15.00, 'Bebida', 3029),
(1014, 'Soda', 'Sprite', 'M', 'CocaCola', 19.00, 'Bebida', 3005),
(1015, 'Agua', 'Natural', 'CH', 'Ciel', 12.00, 'Bebida', 3072);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `provMatricula` smallint(6) NOT NULL,
  `provNombreEmpresa` varchar(25) NOT NULL,
  `provNomProductos` varchar(25) NOT NULL,
  `provCantidad` int(11) NOT NULL,
  `provCorreo_Electronico` varchar(30) NOT NULL,
  `provFecha` date NOT NULL,
  `provHoraLLegada` time DEFAULT NULL,
  `provTelefono` char(10) DEFAULT NULL,
  `provRFC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`provMatricula`, `provNombreEmpresa`, `provNomProductos`, `provCantidad`, `provCorreo_Electronico`, `provFecha`, `provHoraLLegada`, `provTelefono`, `provRFC`) VALUES
(4001, 'Kirkland', 'Pastel', 10, 'KirklandCEO@hotmail.com', '2022-07-10', '03:00:54', '6648393000', 'KRC453L432'),
(4002, 'Bimbo', 'Donitas', 15, 'BimboORG@hotmail.com', '2022-06-15', '04:20:22', '6640503422', 'BMB5F3GH45'),
(4003, 'Coca-Cola', 'Coca - Cola Light', 12, 'CocaCokeMX@hotmail.com', '2022-05-01', '04:20:22', '6640399432', 'CKOL563U564'),
(4004, 'Sabritas', 'Doritos Nacho', 20, 'SabritasADMON@outlook.com', '2022-05-09', '05:15:00', '6634521211', 'SABT34H500'),
(4005, 'Bitz', 'FriskiBits', 12, 'OXXBI@outlook.com', '2022-04-10', '02:00:24', '6645446556', 'OXCM3400G5'),
(4006, 'Marinela', 'Pinguinos Fresa', 24, 'MARINELA_ADMIN@outlook.com', '2022-04-15', '03:00:14', '6648789422', 'MRNL5422R4'),
(4007, 'Barcel', 'Takis Fuego', 24, 'BARCELCEO@outlook.com', '2022-04-06', '04:55:55', '6645693211', 'BRCAM544T7'),
(4008, 'Kirkland', 'Pizza Pepperoni', 36, 'KirklandCEO@hotmail.com', '2022-07-10', '03:00:45', '664839000', 'KRC453L432'),
(4009, 'Kirkland', 'Pizza Cheese', 12, 'KirklandCEO@hotmail.com', '2022-07-10', '03:00:21', '664839000', 'KRC453L432'),
(4010, 'Kirkland', 'Yogurth Helado Frambueza', 48, 'KirklandCEO@hotmail.com', '2022-07-10', '03:00:14', '664839000', 'KRC453L432'),
(4011, 'Nabisco', 'Galleta Oreo', 48, 'NabiscoCompanys@outlook.com', '2022-04-12', '12:00:24', '6645872421', 'NBCC04IS44'),
(4012, 'Nabisco', 'Galleta Oreo Vainilla', 36, 'NabiscoCompanys@outlook.com', '2022-04-12', '12:00:39', '6645872421', 'NBCC04IS45'),
(4013, 'Nabisco', 'Galleta Oreo Pay de Limon', 24, 'NabiscoCompanys@outlook.com', '2022-04-12', '12:00:20', '6645872421', 'NBCC04IS46'),
(4014, 'Nabisco', 'Galleta Oreo Chocolate', 12, 'NabiscoCompanys@outlook.com', '2022-04-12', '12:00:21', '6645872421', 'NBCC04IS47'),
(4015, 'Kirkland', 'Galleta Chispas de Chocol', 72, 'KirklandCEO@hotmail.com', '2022-04-10', '11:00:23', '6648391000', 'KRC453L432'),
(4016, 'Bimbo', 'Mantecadas Fresa', 50, 'BimboCEO@gmail.com', '2022-08-12', '03:05:17', '6645256541', 'GJHMNTVBFC21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `sugNum` int(11) NOT NULL,
  `sugNombre` varchar(40) NOT NULL,
  `sugEmail` varchar(40) NOT NULL,
  `sugMensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamanios`
--

CREATE TABLE `tamanios` (
  `tamCodigo` char(2) NOT NULL,
  `tamNombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tamanios`
--

INSERT INTO `tamanios` (`tamCodigo`, `tamNombre`) VALUES
('CH', 'CHICO'),
('G', 'GRANDE'),
('M', 'MEDIANO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `telConsecutivo` int(11) NOT NULL,
  `telNumero` varchar(13) NOT NULL,
  `telEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`telConsecutivo`, `telNumero`, `telEmpleado`) VALUES
(1, '2147483647', 223),
(2, '2147483647', 276),
(3, '2147483647', 211),
(4, '2147483647', 233),
(5, '2147483647', 245),
(6, '2147483647', 299),
(7, '2147483647', 269),
(8, '2147483647', 212),
(9, '2147483647', 214),
(10, '2147483647', 279),
(11, '2147483647', 256),
(12, '2147483647', 239),
(13, '2147483647', 208),
(14, '2147483647', 201);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `veCodigo` smallint(6) NOT NULL,
  `veCantidad` smallint(6) NOT NULL,
  `veNombreProd` varchar(25) NOT NULL,
  `veMarcaProd` varchar(25) NOT NULL,
  `vePrecioProd` float(5,2) NOT NULL,
  `veTotalProd` float(5,2) NOT NULL,
  `veCodigoProd` smallint(6) DEFAULT NULL,
  `veNumeroEmp` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`veCodigo`, `veCantidad`, `veNombreProd`, `veMarcaProd`, `vePrecioProd`, `veTotalProd`, `veCodigoProd`, `veNumeroEmp`) VALUES
(108, 2, 'Cheesecake', 'Kirkland', 20.00, 40.00, 1001, 223),
(4123, 4, 'Cheesecake', 'Kirkland', 20.00, 80.00, 1001, 279),
(4221, 2, 'Frappe', 'N/A', 40.00, 80.00, 1011, 279),
(4222, 3, 'Muffins', 'Kirkland', 18.00, 54.00, 1002, 279),
(4255, 2, 'Cheesecake', 'Kirkland', 20.00, 40.00, 1010, 276),
(4332, 4, 'Burrito', 'Kirkland', 15.00, 60.00, 1009, 279),
(4432, 3, 'Frappe', 'N/A', 40.00, 60.00, 1011, 276),
(4551, 3, 'Hamburguesa', 'N/A', 60.00, 180.00, 1007, 276),
(4599, 3, 'Galletas', 'Kirkland', 10.00, 30.00, 1003, 276),
(4644, 2, 'Jugo', 'Kirkland', 23.00, 46.00, 1012, 276),
(4762, 1, 'Pizza', 'N/A', 70.00, 70.00, 1008, 276),
(4765, 1, 'Sandwich', 'N/A', 45.00, 45.00, 1006, 279),
(4811, 6, 'Café', 'N/A', 30.00, 180.00, 1010, 279),
(4812, 1, 'Café', 'N/A', 30.00, 30.00, 1010, 276),
(4910, 2, 'Panque', 'Kirkland', 20.00, 40.00, 1005, 276);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliNumero`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idcli`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empNumero`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marCodigo`);

--
-- Indices de la tabla `mis_productos`
--
ALTER TABLE `mis_productos`
  ADD PRIMARY KEY (`idprod`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idor`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `orden_articulos`
--
ALTER TABLE `orden_articulos`
  ADD PRIMARY KEY (`idor_ar`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`perNumero`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prodCodigo`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`provMatricula`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`sugNum`);

--
-- Indices de la tabla `tamanios`
--
ALTER TABLE `tamanios`
  ADD PRIMARY KEY (`tamCodigo`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`telConsecutivo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`veCodigo`),
  ADD KEY `veCodigoProd` (`veCodigoProd`),
  ADD KEY `veNumeroEmp` (`veNumeroEmp`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliNumero` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `idcli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mis_productos`
--
ALTER TABLE `mis_productos`
  MODIFY `idprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden_articulos`
--
ALTER TABLE `orden_articulos`
  MODIFY `idor_ar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `sugNum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `telConsecutivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`veCodigoProd`) REFERENCES `productos` (`prodCodigo`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`veNumeroEmp`) REFERENCES `empleados` (`empNumero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
