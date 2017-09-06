-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-09-2017 a las 08:50:22
-- Versión del servidor: 5.6.23-cll-lve
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toallasd_facturando`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `door` varchar(255) DEFAULT NULL,
  `post_code` varchar(45) NOT NULL,
  `city` varchar(255) NOT NULL,
  `states_id` int(11) NOT NULL,
  `countries_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`id`, `address`, `floor`, `door`, `post_code`, `city`, `states_id`, `countries_id`) VALUES
(1, 'Dirección de Prueba 1234', NULL, NULL, '0000', 'Ciudad de Prueba', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tipo_movimiento_caja` int(11) NOT NULL,
  `conceptos_caja_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `importe` double NOT NULL,
  `detalle` varchar(255) NOT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre_caja_especial`
--

CREATE TABLE `cierre_caja_especial` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mon_01` int(11) NOT NULL,
  `mon_05` int(11) NOT NULL,
  `mon_010` int(11) NOT NULL,
  `mon_025` int(11) NOT NULL,
  `mon_050` int(11) NOT NULL,
  `mon_1` int(11) NOT NULL,
  `mon_2` int(11) NOT NULL,
  `mon_5` int(11) NOT NULL,
  `mon_10` int(11) NOT NULL,
  `mon_20` int(11) NOT NULL,
  `mon_50` int(11) NOT NULL,
  `mon_100` int(11) NOT NULL,
  `mon_200` int(11) NOT NULL,
  `mon_500` int(11) NOT NULL,
  `cheques_importe` double NOT NULL,
  `saldo` double NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cierre_caja_especial`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `tax_id` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addresses_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `companies_type_id` int(11) NOT NULL,
  `fiscal_situation_id` int(11) DEFAULT NULL,
  `tax_type_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `tax_id`, `tel`, `fax`, `website`, `logo`, `addresses_id`, `is_active`, `created_at`, `updated_at`, `companies_type_id`, `fiscal_situation_id`, `tax_type_id`, `email`) VALUES
(1, 'Jose Maria Garbini', '20139809255', '+541147344259', NULL, NULL, NULL, 1, 1, NULL, NULL, 3, NULL, 1, NULL),


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies_type`
--

CREATE TABLE `companies_type` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `companies_type`
--

INSERT INTO `companies_type` (`id`, `type`) VALUES
(1, 'Cliente'),
(2, 'Proveedor'),
(3, 'Propia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `concepto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`id`, `code`, `concepto`) VALUES
(1, 1, 'Productos'),
(2, 2, 'Servicios'),
(3, 3, 'Productos y Servicios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos_caja`
--

CREATE TABLE `conceptos_caja` (
  `id` int(11) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conceptos_caja`
--

INSERT INTO `conceptos_caja` (`id`, `concepto`, `is_active`) VALUES
(1, 'Concepto de prueba 1', 0),
(2, 'Concepto de prueba 2', 0),
(3, 'Otro concepto de prueba!', 0),
(4, 'Concepto 1', 0),
(5, 'Flete', 1),
(6, 'Retiro Personal', 0),
(7, 'Ajuste de Saldo Anterior', 1),
(8, 'Cobranza', 0),
(9, 'Agua a Domicilio', 1),
(10, 'Alquiler', 1),
(11, 'Anticipo de Sueldo', 1),
(12, 'Bomberos', 1),
(13, 'Cartuchos de Toner', 1),
(14, 'Comisiones', 1),
(15, 'Correo', 1),
(16, 'Electricista', 1),
(17, 'Honorarios Ing. Seg. e Higiene', 1),
(18, 'Imprenta', 1),
(19, 'Impuestos', 1),
(20, 'Librería', 1),
(21, 'Limpieza', 1),
(22, 'Mantenimiento Mecánico', 1),
(23, 'Matafuego', 1),
(24, 'Policía', 1),
(25, 'Remis', 1),
(26, 'Seguro', 1),
(27, 'Sistema', 1),
(28, 'Vale', 1),
(29, 'Refacciones Edificio', 1),
(30, 'Retiro Personal EFECTIVO', 1),
(31, 'Retiro Personal CHEQUES \"A\"', 1),
(32, 'Retiro Personal CHEQUES \"B\"', 1),
(33, 'Cobranza EFECTIVO', 1),
(34, 'Cobranza CHEQUES \"A\"', 1),
(35, 'Cobranza CHEQUES \"B\"', 1),
(36, 'Pago Proveedor', 1),
(37, 'Ropa de Trabajo', 1),
(38, 'Cuchillas Sierra sin Fin', 1),
(39, 'Servicio de Seguridad y Vigilancia', 1),
(40, 'Credifin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos_caja_especial`
--

CREATE TABLE `conceptos_caja_especial` (
  `id` int(11) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conceptos_caja_especial`
--

INSERT INTO `conceptos_caja_especial` (`id`, `concepto`, `is_active`) VALUES
(1, 'Concepto de prueba 1', 0),
(2, 'Concepto de prueba 2', 0),
(3, 'Otro concepto de prueba!', 0),
(4, 'Concepto 1', 0),
(5, 'Flete', 1),
(6, 'Retiro Personal', 0),
(7, 'Ajuste de Saldo Anterior', 1),
(8, 'Cobranza', 0),
(9, 'Agua a Domicilio', 1),
(10, 'Alquiler', 1),
(11, 'Anticipo de Sueldo', 1),
(12, 'Bomberos', 1),
(13, 'Cartuchos de Toner', 1),
(14, 'Comisiones', 1),
(15, 'Correo', 1),
(16, 'Electricista', 1),
(17, 'Honorarios Ing. Seg. e Higiene', 1),
(18, 'Imprenta', 1),
(19, 'Impuestos', 1),
(20, 'Librería', 1),
(21, 'Limpieza', 1),
(22, 'Mantenimiento Mecánico', 1),
(23, 'Matafuego', 1),
(24, 'Policía', 1),
(25, 'Remis', 1),
(26, 'Seguro', 1),
(27, 'Sistema', 1),
(28, 'Vale', 1),
(29, 'Refacciones Edificio', 1),
(30, 'Retiro Personal EFECTIVO', 1),
(31, 'Retiro Personal CHEQUES \"A\"', 1),
(32, 'Retiro Personal CHEQUES \"B\"', 1),
(33, 'Cobranza EFECTIVO', 1),
(34, 'Cobranza CHEQUES \"A\"', 1),
(35, 'Cobranza CHEQUES \"B\"', 1),
(36, 'Pago Proveedor', 1),
(37, 'Ropa de Trabajo', 1),
(38, 'Cuchillas Sierra sin Fin', 1),
(39, 'Servicio de Seguridad y Vigilancia', 1),
(40, 'Credifin', 1),
(41, 'PL Concepto ', 0),
(42, 'PL Flete', 1),
(43, 'PL Ajuste de Saldo Anterior', 1),
(44, 'PL Agua a Domicilio', 1),
(45, 'PL Alquiler', 1),
(46, 'PL Anticipo de Sueldo', 1),
(47, 'PL Bomberos', 1),
(48, 'PL Cartuchos de Toner', 1),
(49, 'PL Comisiones', 1),
(50, 'PL Correo', 1),
(51, 'PL Electricista', 1),
(52, 'PL Honorarios Ing. Seg. e Higiene', 1),
(53, 'PL  Imprenta', 1),
(54, 'PL Impuestos', 1),
(55, 'PL Librería', 1),
(56, 'PL Limpieza', 1),
(57, 'PL Mantenimiento Mecánico', 1),
(58, 'PL Matafuego', 1),
(59, 'PL Policía', 1),
(60, 'PL Remis', 1),
(61, 'PL Seguro', 1),
(62, 'PL Sistema', 1),
(63, 'PL Vale', 1),
(64, 'PL Refacciones Edificio', 1),
(65, 'PL Retiro Personal EFECTIVO', 1),
(66, 'PL Retiro Personal CHEQUES \"A\"', 1),
(67, 'PL Retiro Personal CHEQUES \"B\"', 1),
(68, 'PL Cobranza EFECTIVO', 1),
(69, 'PL Cobranza CHEQUES \"A\"', 1),
(70, 'PL Cobranza CHEQUES \"B\"', 1),
(71, 'PL Pago Proveedor', 1),
(72, 'PL Ropa de Trabajo', 1),
(73, 'PL Cuchillas Sierra sin Fin', 1),
(74, 'PL Servicio de Seguridad y Vigilancia', 1),
(75, 'PL Credifin', 1),
(76, 'Retiro Sueldo', 1),
(77, 'TdP EFECTIVO', 1),
(78, 'TdP CHEQUES \"A\"', 1),
(79, 'tDP CHEQUES \"B\"', 1),
(80, 'LA MILAGROSA EFECTIVO', 1),
(81, 'LA MILAGROSA CHEQUES \"A\"', 1),
(82, 'LA MILAGROSA CHEQUES \"B\"', 1),
(83, 'Banco', 1),
(84, 'Garage P. Luna', 1),
(85, 'Retiro Casa', 1),
(86, 'Prestamo', 1),
(87, 'Recolector', 1),
(88, 'Combustible', 1),
(89, 'Error de Sistema', 1),
(90, 'Gastos Ariel', 1),
(91, 'PL FUMIGACION', 1),
(92, 'Veraz', 1),
(93, 'Seguridad e Higiene', 1),
(94, 'Ahorro', 1),
(95, 'Gtos. por Obsequios', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corredores`
--

CREATE TABLE `corredores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `comision` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `corredores`
--

INSERT INTO `corredores` (`id`, `nombre`, `mail`, `clave`, `is_active`, `comision`) VALUES
(1, 'Toalla de Papel', 'toalladepapel@gmail.com', 'tdp8799', 1, 0),


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `country`) VALUES
(1, 'Argentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cta_ctes`
--

CREATE TABLE `cta_ctes` (
  `id` int(11) NOT NULL,
  `invoice_head_id` int(11) NOT NULL,
  `saldo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cta_ctes`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `fisc_situation` int(11) NOT NULL,
  `tax_id_type` int(11) NOT NULL,
  `transporte` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `corredores_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `customer`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_proveedores`
--

CREATE TABLE `facturas_proveedores` (
  `id` int(11) NOT NULL,
  `nro_factura` varchar(45) DEFAULT NULL,
  `importe_total` double NOT NULL,
  `importe_neto` double NOT NULL,
  `importe_iva` double DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `companies_id` int(11) DEFAULT NULL,
  `nombre_proveedor` varchar(255) DEFAULT NULL,
  `cuit` varchar(45) DEFAULT NULL,
  `tipo_doc` varchar(45) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `importe_iva_27` double DEFAULT NULL,
  `importe_iva_10_5` double DEFAULT NULL,
  `perc_iva` double DEFAULT NULL,
  `importe_neto_no_gravado` double DEFAULT NULL,
  `tipo_cbte_prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas_proveedores`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiscal_situation`
--

CREATE TABLE `fiscal_situation` (
  `id` int(11) NOT NULL,
  `fisc_situation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fiscal_situation`
--

INSERT INTO `fiscal_situation` (`id`, `fisc_situation`) VALUES
(1, 'Responsable Inscripto'),
(2, 'Responsable Monotributo'),
(3, 'Consumidor Final'),
(4, 'Excento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_head`
--

CREATE TABLE `invoice_head` (
  `id` int(11) NOT NULL,
  `cae` varchar(255) DEFAULT NULL,
  `fecha_vto_cae` date DEFAULT NULL,
  `nro_cbte` int(11) DEFAULT NULL,
  `id_order` int(11) NOT NULL,
  `pto_vta` int(11) DEFAULT NULL,
  `tipo_pago` varchar(255) DEFAULT NULL,
  `fecha_facturacion` date DEFAULT NULL,
  `fecha_vto_factura` date DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `tax_id` varchar(255) NOT NULL,
  `fisc_situation` int(11) NOT NULL,
  `tax_id_type` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `cbte_tipo` int(11) DEFAULT NULL,
  `cbte_desde` int(11) DEFAULT NULL,
  `cbte_hasta` int(11) DEFAULT NULL,
  `imp_total` double DEFAULT NULL,
  `imp_tot_conc` double DEFAULT NULL,
  `imp_net` double DEFAULT NULL,
  `imp_op_ex` double DEFAULT NULL,
  `imp_trib` double DEFAULT NULL,
  `imp_iva_21` double DEFAULT NULL,
  `mon_id` int(11) DEFAULT NULL,
  `mon_cotiz` varchar(45) DEFAULT NULL,
  `fecha_serv_desde` date DEFAULT NULL,
  `fecha_serv_hasta` date DEFAULT NULL,
  `fecha_vto_pago` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `companies_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `concepto` int(11) DEFAULT NULL,
  `archivo_pdf` varchar(255) DEFAULT NULL,
  `factura_emitida` tinyint(4) DEFAULT '0',
  `imp_iva_27` double DEFAULT NULL,
  `imp_iva_10_5` double DEFAULT NULL,
  `iva_imp_total` double DEFAULT NULL,
  `tipo_venta` tinyint(4) NOT NULL,
  `orden_compra` varchar(255) DEFAULT NULL,
  `motivo_r` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `invoice_head`
--

INSERT INTO `invoice_head` (`id`, `cae`, `fecha_vto_cae`, `nro_cbte`, `id_order`, `pto_vta`, `tipo_pago`, `fecha_facturacion`, `fecha_vto_factura`, `company_name`, `tax_id`, `fisc_situation`, `tax_id_type`, `address`, `cbte_tipo`, `cbte_desde`, `cbte_hasta`, `imp_total`, `imp_tot_conc`, `imp_net`, `imp_op_ex`, `imp_trib`, `imp_iva_21`, `mon_id`, `mon_cotiz`, `fecha_serv_desde`, `fecha_serv_hasta`, `fecha_vto_pago`, `status`, `companies_id`, `users_id`, `concepto`, `archivo_pdf`, `factura_emitida`, `imp_iva_27`, `imp_iva_10_5`, `iva_imp_total`, `tipo_venta`, `orden_compra`, `motivo_r`) VALUES
(33, NULL, NULL, 11, 159, NULL, 'Pago al contado', '2015-09-06', NULL, 'ITWARP SRL', '30711859655', 1, 1, 'Avenida Corrientes 1327, C.A.B.A. (1043), Ciudad de Buenos Aires, Argentina.', 99, NULL, NULL, 9.68, NULL, 8, NULL, NULL, 1.68, NULL, NULL, NULL, NULL, NULL, 'G', 580, 1, NULL, 'remito-11.pdf', 0, NULL, NULL, 1.68, 1, NULL, NULL),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios_pagos`
--

CREATE TABLE `medios_pagos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medios_pagos`
--

INSERT INTO `medios_pagos` (`id`, `tipo`) VALUES
(1, 'Efectivo'),
(2, 'Cheques de 3ros.'),
(3, 'Cheque Propio'),
(4, 'Transf. Bancaria'),
(5, 'Tarjeta de Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `moneda` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `pago` double NOT NULL,
  `otro` varchar(255) DEFAULT NULL,
  `medios_pagos_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cta_ctes_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` int(11) NOT NULL,
  `nro_remito_inicial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `nro_remito_inicial`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `updated_at`, `created_at`) VALUES
('tpcontroladm1@gmail.com', '38d8b2d815167ac16e7dfa0612136b7cba10f75e6cae335ae56faf0eb1987aef', '2016-08-17 18:17:12', '2016-08-17 19:17:12'),
('toalladepapel@gmail.com', '126ab29de445a0fc17892e1385b8b3d7cd6dad637a2da24d7da187d769905888', '2016-10-16 14:03:26', '2016-10-16 15:03:26'),
('tpcontroladm2@gmail.com', 'd267ebc956e2901c9c531486b0f3b6af409b7b31d63aa834c46aebb01454985c', '2016-11-03 19:30:49', '2016-11-03 20:30:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `kg` float NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `codigo`, `kg`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '6010A', 15, 7, '2016-10-11 23:42:27', '2016-10-11 23:42:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosTDP`
--

CREATE TABLE `productosTDP` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `pesoRef` float NOT NULL,
  `diametroRef` float NOT NULL,
  `metrosRef` float NOT NULL,
  `rollosRef` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productosTDP`
--

INSERT INTO `productosTDP` (`id`, `codigo`, `descripcion`, `pesoRef`, `diametroRef`, `metrosRef`, `rollosRef`) VALUES
(1, '1101', '1101 Toalla Beige Ancho 20cm Largo 24cm en Caja de 2500u,', 0, 0, 0, 0),
(2, '1001A', '1001A Toalla Blanca Ancho 20cm Largo 24cm en Caja de 2250u', 0, 0, 0, 0),
(3, '1001AA', '1001AA Toalla Blanca Ancho 20cm Largo 24cm en Caja de 1900u', 0, 0, 0, 0),
(4, '1101A', '1101A Toalla Beige Ancho 20cm Largo 24cm en Caja de 2250u', 0, 0, 0, 0),
(5, '1101AA', '1101AA Toalla Beige Ancho 20cm Largo 24cm en Caja de 1900u', 0, 0, 0, 0),
(6, '2010', '2010 Toalla Blanca Ancho 20cm Buje de 7,6cm', 26, 30, 400, 9),
(7, '2011', '2011 Toalla Blanca Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(8, '2110', '2110 Toalla Beige Ancho 20cm Buje de 7,6cm', 26, 30, 400, 9),
(9, '2111', '2111 Toalla Beige Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(10, '3010', '3010 Toalla Blanca Doble Hoja Ancho 20cm Buje de 7,6cm', 26, 30, 400, 9),
(11, '3011', '3011 Toalla Blanca Doble Hoja Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(12, '3110', '3110 Toalla Beige Doble Hoja Ancho 20cm Buje de 7,6cm', 26, 30, 400, 9),
(13, '3111', '3111 Toalla Beige Doble Hoja Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(14, '4000', '4000 Toalla Blanca Ancho 20cm Buje de 4,6cm', 12, 20, 200, 9),
(15, '4001', '4001 Toalla Blanca Ancho 20cm Buje de 4,6cm', 19, 23, 300, 9),
(16, '4100', '4100 Toalla Beige Ancho 20cm en Buje de 4,6cm', 12, 20, 200, 9),
(17, '4101', '4101 Toalla Beige Ancho 20cm Buje de 4,6cm', 19, 23, 300, 9),
(18, '4111', '4111 Toalla Blanca Ancho 20cm Buje de 4,6cm', 5, 13, 100, 9),
(19, '4150', '4150 Toalla Blanca Ancho 20cm Buje de 4,6cm', 9, 16, 150, 9),
(20, '6010', '6010 Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(21, '6010A', '6010A Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 23, 30, 350, 7),
(22, '6011', '6011 Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 26, 30, 400, 9),
(23, '6011A', '6011A Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 23, 30, 350, 9),
(24, '6011AA', '6011AA Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 20, 29, 250, 9),
(25, '6012', '6012 Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 23, 29, 350, 9),
(26, '6110', '6110 Toalla Beige Doble Hoja Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(27, '6111', '6111 Toalla Ecologica Doble Hoja Ancho 25cm Buje de 7,6cm', 26, 30, 400, 7),
(28, '6111A', '6111A Toalla Ecologica Doble Hoja Ancho 25cm Buje de 7,6cm', 23, 29, 350, 7),
(29, '7300', '7300 Jumbo Blanco x 300m', 11, 19, 300, 19),
(30, '7300AA', '7300AA  Jumbo Blanco x 300m', 5, 18, 220, 19),
(31, '7301', '7301 Jumbo Blanco x 300m', 11, 19, 300, 19),
(32, '7301A', '7301A Jumbo Blanco x 300m', 8, 19, 250, 19),
(33, '7350', '7350 Jumbo Blanco x 350m', 13, 19, 350, 19),
(34, '7350A', '7350A Jumbo Blanco x 350m', 9, 19, 300, 19),
(35, '7600', '7600 Jumbo Blanco x 600m', 20, 24, 600, 19),
(36, '7600A', '7600A Jumbo Blanco x 600m', 11, 24, 350, 19),
(37, '7900', '7900 Higienico Blanco 30u x 100m', 3, 9, 100, 19),
(38, '7900A', '7900A Higienico Blanco 30u x 100m', 3, 9, 90, 19),
(39, '7900AA', '7900AA Higienico Blanco 30u x 100m', 2, 9, 80, 19),
(40, '7920', '7920 Higienico Blanco 20m', 0, 9, 20, 19),
(41, '7930', '7930 Higienico Blanco 30m', 1, 9, 30, 19),
(42, '7940', '7940 Higienico Blanco 40m', 1, 9, 40, 19),
(43, '7950', '7950 Higienico Blanco 50m', 1, 9, 50, 19),
(44, '7950A', '7950A Higienico Blanco 50m', 1, 9, 40, 19),
(45, '9001', '9001 Cubre Camilla Blanco Ancho 60cm Largo 60m', 5, 13, 60, 3),
(46, '7960', '7960 Higienico Blanco 60m', 2, 9, 60, 19),
(47, '40001', '40001 Film Stretch Manual Virgen 3\"', 0, 0, 0, 0),
(48, '40002', '40002 Film Stretch Automatico Virgen', 0, 0, 0, 0),
(49, '40003', '40003 Film Stretch con Manguito Virgen', 0, 0, 0, 0),
(50, '40004', '40004 Film Stretch Cortes Virgen 3\"', 0, 0, 0, 0),
(51, '50002', '50002 Film Termocontraible Lamina 33/50 Âµm', 0, 0, 0, 0),
(52, '40011', '40011 Film Stretch Manual C/Recuperado 3\"', 0, 0, 0, 0),
(53, '40013', '40013 Film Stretch con Manguito C/Recuperado', 0, 0, 0, 0),
(54, '40012', '40012 Film Stretch Automatico C/Recuperado', 0, 0, 0, 0),
(55, '40014', '40014 Film Stretch Cortes C/Recuperado 3\"', 0, 0, 0, 0),
(56, '7300A', '7300A Jumbo Blanco x 300m', 8, 19, 250, 19),
(57, '9101', '9101 Cubre Camilla Beige Ancho 60cm Largo 60m', 5, 13, 60, 3),
(58, '6010AA', '6010AA Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 2, 29, 250, 7),
(59, '6010A3', '6010A3 Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 18, 28, 220, 7),
(60, '1001A3', '1001A3 Toalla Blanca Ancho 20cm Largo 24cm en Caja de 1620u', 0, 0, 0, 0),
(61, '1001A4', '1001A4 Toalla Blanca Ancho 20cm Largo 24cm en Caja de 1260u', 0, 0, 0, 0),
(62, '1101A3', '1101A3 Toalla Beige Ancho 20cm Largo 24cm en Caja de 1620u', 0, 0, 0, 0),
(63, '1101A4', '1101A4 Toalla Beige Ancho 20cm Largo 24cm en Caja de 1260u', 0, 0, 0, 0),
(64, '2010A', '2010A Toalla Blanca Ancho 20cm Buje de 7,6cm', 23, 30, 350, 9),
(65, '2011A', '2011A Toalla Blanca Ancho 25cm Buje de 7,6cm', 23, 30, 350, 7),
(66, '2110A', '2110A Toalla Beige Ancho 20cm Buje de 7,6cm', 23, 30, 350, 9),
(67, '2111A', '2111A Toalla Beige Ancho 25cm Buje de 7,6cm', 23, 30, 350, 7),
(68, '3010A', '3010A Toalla Blanca Doble Hoja Ancho 20cm Buje de 7,6cm', 23, 30, 350, 9),
(69, '3011A', '3011A Toalla Blanca Doble Hoja Ancho 25cm Buje de 7,6cm', 23, 30, 350, 7),
(70, '3110A', '3110A Toalla Beige Doble Hoja Ancho 20cm Buje de 7,6cm', 23, 30, 350, 9),
(71, '3111A', '3111A Toalla Beige Doble Hoja Ancho 25cm Buje de 7,6cm', 23, 30, 350, 7),
(72, '4000A', '4000A Toalla Blanca Ancho 20cm Buje de 4,6cm', 11, 20, 180, 9),
(73, '4001A', '4001A Toalla Blanca Ancho 20cm Buje de 4,6cm', 17, 23, 250, 9),
(74, '4100A', '4100A Toalla Beige Ancho 20cm en Buje de 4,6cm', 11, 20, 180, 9),
(75, '4101A', '4101A Toalla Beige Ancho 20cm Buje de 4,6cm', 17, 23, 250, 9),
(76, '4111A', '4111A Toalla Blanca Ancho 20cm Buje de 4,6cm', 5, 13, 90, 9),
(77, '4150A', '4150A Toalla Blanca Ancho 20cm Buje de 4,6cm', 8, 16, 130, 9),
(78, '4160', '4160 Toalla Blanca Ancho 20cm Buje de 4,6cm', 9, 16, 150, 9),
(79, '4160A', '4160A Toalla Blanca Ancho 20cm Buje de 4,6cm', 8, 16, 130, 9),
(80, '6010A4', '6010A4 Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 15, 27, 188, 7),
(81, '6011A3', '6011A3 Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 18, 28, 220, 9),
(82, '6011A4', '6011A4 Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 15, 27, 188, 9),
(83, '6012A', '6012A Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 20, 29, 250, 9),
(84, '6110A', '6110A Toalla Beige Doble Hoja Ancho 25cm Buje de 7,6cm', 23, 30, 280, 7),
(85, '7300A3', '7300A3 Jumbo Blanco x 300m', 5, 17, 130, 19),
(86, '7310', '7310 Jumbo Blanco x 300m', 11, 19, 300, 19),
(87, '7310A', '7310A Jumbo Blanco x 300m', 8, 19, 250, 19),
(88, '7311', '7311 Jumbo Blanco x 300m', 11, 19, 300, 19),
(89, '7311A', '7311A Jumbo Blanco x 300m', 8, 19, 250, 19),
(90, '7301AA', '7301AA Jumbo Blanco x 300m', 5, 18, 150, 19),
(91, '7301A3', '7301A3 Jumbo Blanco x 300m', 5, 17, 120, 19),
(92, '7350AA', '7350AA Jumbo Blanco x 350m', 8, 19, 280, 19),
(93, '7600AA', '7600AA Jumbo Blanco x 600m', 10, 22, 250, 19),
(94, '7960A', '7960A Higienico Blanco 60m', 1, 9, 50, 19),
(95, '4160AA', '4160AA Toalla Blanca Ancho 20cm Buje de 4,6cm', 6, 16, 100, 9),
(96, '7310AA', '7310AA Jumbo Blanco x 300m', 5, 18, 150, 19),
(97, '8000', '8000 Higienico Intercalado Blanco 20cm x 24cm', 0, 0, 0, 0),
(98, '8506', '8506 Servilleta Blanca Virgen 33cm x 32cm en Caja de 600u', 0, 0, 0, 0),
(99, '8040', '8040 Servilletas de Mesa 50 Paq, x 40u c/u', 0, 0, 0, 0),
(100, '8100', '8100 Servilletas de Mesa 20 Paq, x 100u c/u', 0, 0, 0, 0),
(101, '6111A3', '6111A3 Toalla Ecologica Doble Hoja Ancho 25cm Buje de 7,6cm', 18, 28, 220, 7),
(102, '7311AA', '7311AA Jumbo Blanco x 300m x 8u', 5, 18, 150, 19),
(103, '50004', '50004 Film Termocontraible Lamina 45/70 Âµm', 0, 0, 0, 0),
(104, '50006', '50006 Film Termocontraible Lamina 70/70 Âµm', 0, 0, 0, 0),
(105, '60000', '60000 Polietileno 70/50 Âµm', 0, 0, 0, 0),
(106, '60001', '60001 Polietileno 80/50 Âµm', 0, 0, 0, 0),
(107, '60002', '60002 Polietileno 10cm,', 0, 0, 0, 0),
(108, '40015', '40015 Film Stretch Cortes C/Recuperado 38/10cm,', 0, 0, 0, 0),
(109, '40005', '40005 Film Stretch Cortes Virgen 38/10cm,', 0, 0, 0, 0),
(110, '50001', '50001 Film Termocontraible Lamina 30/50 Âµm', 0, 0, 0, 0),
(111, '50003', '50003 Film Termocontraible Lamina 37/70 Âµm', 0, 0, 0, 0),
(112, '50005', '50005 Film Termocontraible Lamina 47/70 Âµm', 0, 0, 0, 0),
(113, '40016', '40016 Film Stretch Cortes C/Recuperado 7 1/2 c/ Manguito', 0, 0, 0, 0),
(114, '6110A4', '6110A4 Toalla Beige Doble Hoja Ancho 25cm Buje de 7,6cm', 15, 27, 188, 7),
(115, '50007', '50007 Film Termocontraible Lamina 64/50 Âµm x 1,20m', 0, 0, 0, 0),
(116, '10030', '10030 Secamanos de Acero Inoxidable por Aproximacion', 0, 0, 0, 0),
(117, '7941', '7941 Higienico Blanco 30u x 40 Mts', 1, 9, 40, 19),
(118, '6011A5', '6011A5 Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 13, 26, 170, 9),
(119, '6010A5', '6010A5 Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 13, 26, 170, 7),
(120, '7310A3', '7310A3 Jumbo Blanco x 300m x 8u', 5, 17, 120, 19),
(121, '4111AA', '4111AA Toalla Blanca Ancho 20cm Buje de 4,6cmx 6u', 3, 13, 80, 9),
(122, '7311A3', '7311A3 Jumbo Blanco x 300m x 8u', 5, 17, 120, 19),
(123, '1001', ' 1001 Toalla Blanca Ancho 20cm Largo 24cm en Caja de 2500u ', 0, 0, 0, 0),
(124, '40017', '40017 Film Stretch Cortes Virgen 38/25cm,', 0, 0, 0, 0),
(125, '40018', '40018 Film Stretch Cortes C/Recuperado 38/25cm,', 0, 0, 0, 0),
(126, '7900A1', '7900A1 Higienico Blanco 30u x 100m', 0, 0, 0, 0),
(127, '6011A6', '6011A6 Rollo Blanco Doble Hoja Ancho 20cm Buje de 7,6cm', 12, 25, 150, 10),
(128, '6010A6', '6010A6 Rollo Blanco Doble Hoja Ancho 25cm Buje de 7,6cm', 12, 25, 150, 8),
(129, '50008', '50008 Termocontraible lamina 50/50 Âµm', 0, 0, 0, 0),
(130, '8505', '8505 Servilleta Blanca Vigen  33cm x 32cm en Caja de 500u', 0, 0, 0, 0),
(131, '60003', '60003 Polietileno 12/50 Âµm', 0, 0, 0, 0),
(132, '7310A1', '7310A1 Jumbo Blanco x 300m x 8u', 7, 18, 200, 19),
(133, '4170', '4170 Toalla Blanca Ancho 25cm Buje de 4,6cm', 0, 0, 0, 0),
(134, '4170A', '4170A Toalla Blanca Ancho 25cm Buje de 4,6cm', 0, 0, 0, 0),
(135, '8060', '8060 Eco Rollo de Cocina x 60 Hojas', 0, 0, 0, 0),
(136, '50009', '50009 Film Termocontraible Lamina 30/70 Âµm', 0, 0, 0, 0),
(137, '7400', '7400 Bobina Jumbo Blanco', 0, 0, 0, 0),
(138, '1111', '1111 Toalla Natural Ancho 20cm Largo 24cm en Caja de 2500u,', 0, 0, 0, 0),
(139, '1111A', '1111A Toalla Natural Ancho 20cm Largo 24cm en Caja de 2250u', 0, 0, 0, 0),
(140, '1111AA', '1111AA Toalla Natural Ancho 20cm Largo 24cm en Caja de 1900u', 0, 0, 0, 0),
(141, '1111A3', '1111A3 Toalla Natural Ancho 20cm Largo 24cm en Caja de 1620u', 0, 0, 0, 0),
(142, '1111A4', '1111A4 Toalla Natural Ancho 20cm Largo 24cm en Caja de 1260u', 0, 0, 0, 0),
(143, '8505', '8505 ECO Servilleta Blanca ECO 33cm x 32cm en Caja de 500u', 0, 0, 0, 0),
(144, '8506', '8506 ECO Servilleta Blanca ECO 33cm x 32cm en Caja de 600u', 0, 0, 0, 0),
(145, '4170AA', '4160AA Toalla Blanca Ancho 20cm Buje de 4,6cm PACK de 3 UNidades.', 6, 16, 100, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` double DEFAULT NULL,
  `categories_id` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `tipo_iva_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_fiscal_situation_tipo_cbtes`
--

CREATE TABLE `rel_fiscal_situation_tipo_cbtes` (
  `id` int(11) NOT NULL,
  `fiscal_situation_id` int(11) NOT NULL,
  `tipo_cbtes_id` int(11) NOT NULL,
  `cbte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rel_fiscal_situation_tipo_cbtes`
--

INSERT INTO `rel_fiscal_situation_tipo_cbtes` (`id`, `fiscal_situation_id`, `tipo_cbtes_id`, `cbte`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 3, 6, 1),
(5, 2, 6, 1),
(6, 2, 7, 2),
(7, 2, 8, 3),
(8, 3, 7, 2),
(9, 3, 8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_remitos_facturas`
--

CREATE TABLE `rel_remitos_facturas` (
  `id` int(11) NOT NULL,
  `remito_id` int(11) DEFAULT NULL,
  `factura_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Contador'),
(4, 'Maquinista'),
(5, 'Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state` varchar(45) NOT NULL,
  `countries_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`id`, `state`, `countries_id`) VALUES
(1, 'Buenos Aires', 1),
(2, 'Catamarca', 1),
(3, 'Chaco', 1),
(4, 'Chubut', 1),
(5, 'C.A.B.A.', 1),
(6, 'Córdoba', 1),
(7, 'Corrientes', 1),
(8, 'Entre Rios', 1),
(9, 'Formosa', 1),
(10, 'Jujuy', 1),
(11, 'La Pampa', 1),
(12, 'La Rioja', 1),
(13, 'Mendoza', 1),
(14, 'Misiones', 1),
(15, 'Neuquén', 1),
(16, 'Río Negro', 1),
(17, 'Salta', 1),
(18, 'San Juan', 1),
(19, 'San Luis', 1),
(20, 'Santa Cruz', 1),
(21, 'Santa Fe', 1),
(22, 'Santiago del Estero', 1),
(23, 'Tierra del Fuego', 1),
(24, 'Tucumán', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tax_type`
--

CREATE TABLE `tax_type` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tax_type`
--

INSERT INTO `tax_type` (`id`, `code`, `type`) VALUES
(1, 80, 'CUIT'),
(2, 86, 'CUIL'),
(3, 87, 'CDI'),
(4, 89, 'LE'),
(5, 90, 'LC'),
(6, 91, 'CI Extranjera'),
(7, 92, 'en trámite'),
(8, 93, 'Acta Nacimiento'),
(9, 95, 'CI Bs. As. RNP'),
(10, 96, 'DNI'),
(11, 94, 'Pasaporte'),
(12, 0, 'CI Policía Federal'),
(13, 1, 'CI Buenos Aires'),
(14, 2, 'CI Catamarca'),
(15, 3, 'CI Córdoba'),
(16, 4, 'CI Corrientes'),
(17, 5, 'CI Entre Ríos'),
(18, 6, 'CI Jujuy'),
(19, 7, 'CI Mendoza'),
(20, 8, 'CI La Rioja'),
(21, 9, 'CI Salta'),
(22, 10, 'CI San Juan'),
(23, 11, 'CI San Luis'),
(24, 12, 'CI Santa Fe'),
(25, 13, 'CI Santiago del Estero'),
(26, 14, 'CI Tucum'),
(27, 16, 'CI Chaco'),
(28, 17, 'CI Chubut'),
(29, 18, 'CI Formosa'),
(30, 19, 'CI Misiones'),
(31, 20, 'CI Neuqu'),
(32, 21, 'CI La Pampa'),
(33, 22, 'CI Río Negro'),
(34, 23, 'CI Santa Cruz'),
(35, 24, 'CI Tierra del Fuego'),
(36, 99, 'Doc. (Otro)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cbtes`
--

CREATE TABLE `tipo_cbtes` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `tipo_cbte` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_cbtes`
--

INSERT INTO `tipo_cbtes` (`id`, `code`, `tipo_cbte`) VALUES
(1, 1, 'Factura A'),
(2, 2, 'Nota de Débito A'),
(3, 3, 'Nota de Crédito A'),
(4, 6, 'Factura B'),
(5, 7, 'Nota de Débito B'),
(6, 8, 'Nota de Crédito B'),
(7, 4, 'Recibos A'),
(8, 5, 'Notas de Venta al contado A'),
(9, 9, 'Recibos B'),
(10, 10, 'Notas de Venta al contado B'),
(11, 63, 'Liquidacion A'),
(12, 64, 'Liquidacion B'),
(13, 34, 'Cbtes. A del Anexo I, Apartado A,inc.f),R.G.Nro. 1415'),
(14, 35, 'Cbtes. B del Anexo I,Apartado A,inc. f),R.G. Nro. 1415'),
(15, 39, 'Otros comprobantes A que cumplan con R.G.Nro. 1415'),
(16, 40, 'Otros comprobantes B que cumplan con R.G.Nro. 1415'),
(17, 60, 'Cta de Vta y Liquido prod. A'),
(18, 61, 'Cta de Vta y Liquido prod. B'),
(19, 11, 'Factura C'),
(20, 12, 'Nota de Débito C'),
(21, 13, 'Nota de Crédito C'),
(22, 15, 'Recibo C'),
(23, 49, 'Comprobante de Compra de Bienes Usados a Consumidor Final');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cbte_prov`
--

CREATE TABLE `tipo_cbte_prov` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_cbte_prov`
--

INSERT INTO `tipo_cbte_prov` (`id`, `tipo`) VALUES
(1, 'Factura'),
(2, 'Nota de Débito'),
(3, 'Nota de Crédito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_iva`
--

CREATE TABLE `tipo_iva` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `tipo_iva` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_iva`
--

INSERT INTO `tipo_iva` (`id`, `code`, `tipo_iva`) VALUES
(1, 3, '0%'),
(2, 4, '10.5%'),
(3, 5, '21%'),
(4, 6, '27%'),
(5, 8, '5%'),
(6, 9, '2.5%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `roles_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `lastname`, `is_active`, `remember_token`, `created_at`, `roles_id`, `companies_id`, `updated_at`) VALUES
(1, 'jose@toalladepapel.com.ar', '$2y$10$8sM3jIDyeWJrKM1VsIzPJeFGPS6etjD0WoQCrBHGSEDeuEip/coKS', 'Jose Maria', 'Garbini', 1, 'hOwswr4TXJOfCNxRyF2P2JgPLRvcknADM21mfPclOLgtdkxdXtcWARmng2NN', '2015-04-02 11:05:35', 1, 1, '2015-09-09 04:17:47'),
(2, 'tpcontroladm2@gmail.com', '$2y$10$fRXG.VqkLKw3dax80rUlDurtLhQyKJl6qaaobClfYd2MQiNjMjLHK', 'Cristina', 'Gomez', 1, 'Y5dX8OU0yEtkyxe6d58josiwi5aI1bYPuHDoBljMFWSSIAEFJWkAPGDudNu2', '2015-09-09 04:14:46', 2, 1, '2017-07-04 20:43:24'),
(3, 'tpcontroladm1@gmail.com', '$2y$10$9CJvJl9h6Fza1pY2pcVSLuC1iFQCzOAzYxDv5eewQ42qVrH/tvxzu', 'Claudia', 'Neri', 1, '1i5sTACl81J3dxSpkmOV0yjaRHRxoUrEN4V7wCTWcSr9xpWm1FW6xC7uGSWo', '2015-09-09 04:15:38', 2, 1, '2017-08-17 15:49:37'),
(4, 'toalladepapel@gmail.com', '$2y$10$nEvbhNd6wu5RTjUjbz7leOa2msF/N7Ulloo3MokjF/t2C3YfewDM2', 'Gabriela', 'Garbini', 1, 'KBeX56KnplSKcMeRQ8IRDkbwltaGghpZg9Zg6bvAX7ekQ3yuOS05SzT7u2dj', '2015-09-09 04:16:32', 1, 1, '2017-07-27 23:25:52'),
(5, 'maquina1@gmail.com', '$2y$10$K4.fv.d1i8PHg3vuOrxaUupKI56YB0uXB9hTXgUHorgdXlkN.T8Q2', 'Maquina', '1', 0, 'EUnrZ8TcmUzerfTUQqmCh6IjTDmFhKjIx5h0lnDnKif7X7BgSE8dzAF4Af84', '2016-10-08 13:23:20', 4, 1, '2016-11-29 16:02:31'),
(6, 'maquina2@gmail.com', '$2y$10$v.w8T8SWGOdZ5I2G5Fn0jOA1rPsgQV8rMLW0pahoY68Ug/mC2ebjO', 'Maquina', '2', 0, '', '2016-10-08 20:47:07', 4, 1, '2016-10-10 17:26:04'),
(7, 'rebobinadora1@gmail.com', '$2y$10$vxh7WQ1jKHHKt4nfmAXdJeYWYiKOUmreSvZlI10J1VPu1kZYMoUya', 'Rebobinadora', '1', 1, 'BAItdZLBKxrGBTUfnDwMkdKSAW3H7SENRUclHjQw2Ax2UvOuCfgPdCXvzP02', '2016-10-10 17:27:46', 4, 1, '2016-10-16 15:01:56'),
(8, 'rebobinadora2@gmail.com', '$2y$10$d0AaqPTSZEYO66I2B8rN3umOvY6zA1Pynpeo6J.z.kPYHSCdwCbui', 'Rebobinadora', '2', 1, '', '2016-10-10 17:28:22', 4, 1, '2016-10-10 17:28:22'),
(9, 'tpcontrolpro2@gmail.com', '$2y$10$3N5JGaZp8xqsFjWCzWQax.OXVATbjQRDSdsW6da4gcsX2nBgdOITq', 'Genaro', 'Gonzalez', 1, 'SdKIdV0xzu44aWASTCivu5ntDdd17wOElHiqx4DBm0SWatWnFC3p57dVojBU', '2016-10-14 01:37:06', 4, 1, '2016-12-13 16:41:25'),
(10, 'ventas1tdp@gmail.com', '$2y$10$CJLw0Rel51CUCs1K0hC0Re4z9eUkvWLnvv94x9ncqdEnzLd3UpyyK', 'Rocio', 'Rocio', 1, 'wj4ZW2GlWlDz6OfGwKdnoVtGFxzfq9JJk8hqgLRJ3MyMv3ceDbvBtkYwY1Tm', '2017-05-17 22:32:01', 5, 1, '2017-07-28 00:08:59'),
(11, 'tpcontroladm4@gmail.com', '$2y$10$zzhzbyjXObqe9rfme0cVGOlNwV5HrERfdT.50OTXMyS1SBtKwv2zW', 'Silvia', 'Zabalaga', 1, 'Xm08k5YWfkogIMQEBZdA2QfYKU38PCfJD5DwEE4LjV0mKxlH1aqb6wbs1nbo', '2017-07-28 02:58:49', 2, 1, '2017-07-31 14:54:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_addresses_states1_idx` (`states_id`),
  ADD KEY `fk_addresses_countries1_idx` (`countries_id`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caja_especial`
--
ALTER TABLE `caja_especial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `cierre_caja_especial`
--
ALTER TABLE `cierre_caja_especial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_companies_addresses1_idx` (`addresses_id`),
  ADD KEY `fk_companies_fiscal_situation1_idx` (`fiscal_situation_id`),
  ADD KEY `fk_companies_tax_type1_idx` (`tax_type_id`),
  ADD KEY `fk_companies_companies_type1_idx` (`companies_type_id`);

--
-- Indices de la tabla `companies_type`
--
ALTER TABLE `companies_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `conceptos_caja`
--
ALTER TABLE `conceptos_caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conceptos_caja_especial`
--
ALTER TABLE `conceptos_caja_especial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `corredores`
--
ALTER TABLE `corredores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `cta_ctes`
--
ALTER TABLE `cta_ctes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_cta_ctes_invoice_head1_idx` (`invoice_head_id`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indices de la tabla `facturas_proveedores`
--
ALTER TABLE `facturas_proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_facturas_proveedores_companies1_idx` (`companies_id`),
  ADD KEY `fk_facturas_proveedores_tipo_cbte_prov1_idx` (`tipo_cbte_prov_id`);

--
-- Indices de la tabla `fiscal_situation`
--
ALTER TABLE `fiscal_situation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `invoice_head`
--
ALTER TABLE `invoice_head`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_invoice_head_companies1_idx` (`companies_id`),
  ADD KEY `fk_invoice_head_users1_idx` (`users_id`);

--
-- Indices de la tabla `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_invoice_lines_invoice_head1_idx` (`invoice_head_id`);

--
-- Indices de la tabla `medios_pagos`
--
ALTER TABLE `medios_pagos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_pagos_medios_pagos1_idx` (`medios_pagos_id`),
  ADD KEY `fk_pagos_cta_ctes1_idx` (`cta_ctes_id`),
  ADD KEY `fk_pagos_users1_idx` (`users_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productosTDP`
--
ALTER TABLE `productosTDP`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_products_categories1_idx` (`categories_id`),
  ADD KEY `fk_products_tipo_iva1_idx` (`tipo_iva_id`);

--
-- Indices de la tabla `rel_fiscal_situation_tipo_cbtes`
--
ALTER TABLE `rel_fiscal_situation_tipo_cbtes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_rel_fiscal_situation_tipo_cbtes_fiscal_situation1_idx` (`fiscal_situation_id`),
  ADD KEY `fk_rel_fiscal_situation_tipo_cbtes_tipo_cbtes1_idx` (`tipo_cbtes_id`);

--
-- Indices de la tabla `rel_remitos_facturas`
--
ALTER TABLE `rel_remitos_facturas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_rel_remitos_facturas_invoice_head1_idx` (`remito_id`),
  ADD KEY `fk_rel_remitos_facturas_invoice_head2_idx` (`factura_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_states_countries1_idx` (`countries_id`);

--
-- Indices de la tabla `tax_type`
--
ALTER TABLE `tax_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_cbtes`
--
ALTER TABLE `tipo_cbtes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_cbte_prov`
--
ALTER TABLE `tipo_cbte_prov`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_iva`
--
ALTER TABLE `tipo_iva`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_users_roles_idx` (`roles_id`),
  ADD KEY `fk_users_companies1_idx` (`companies_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1876;
--
-- AUTO_INCREMENT de la tabla `caja_especial`
--
ALTER TABLE `caja_especial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT de la tabla `cierre_caja_especial`
--
ALTER TABLE `cierre_caja_especial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `companies_type`
--
ALTER TABLE `companies_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `conceptos_caja`
--
ALTER TABLE `conceptos_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `conceptos_caja_especial`
--
ALTER TABLE `conceptos_caja_especial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT de la tabla `corredores`
--
ALTER TABLE `corredores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cta_ctes`
--
ALTER TABLE `cta_ctes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6016;
--
-- AUTO_INCREMENT de la tabla `facturas_proveedores`
--
ALTER TABLE `facturas_proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT de la tabla `fiscal_situation`
--
ALTER TABLE `fiscal_situation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `invoice_head`
--
ALTER TABLE `invoice_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11973;
--
-- AUTO_INCREMENT de la tabla `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32738;
--
-- AUTO_INCREMENT de la tabla `medios_pagos`
--
ALTER TABLE `medios_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6518;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29394;
--
-- AUTO_INCREMENT de la tabla `productosTDP`
--
ALTER TABLE `productosTDP`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rel_fiscal_situation_tipo_cbtes`
--
ALTER TABLE `rel_fiscal_situation_tipo_cbtes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `rel_remitos_facturas`
--
ALTER TABLE `rel_remitos_facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `tax_type`
--
ALTER TABLE `tax_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `tipo_cbtes`
--
ALTER TABLE `tipo_cbtes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `tipo_cbte_prov`
--
ALTER TABLE `tipo_cbte_prov`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_iva`
--
ALTER TABLE `tipo_iva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_countries1` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_addresses_states1` FOREIGN KEY (`states_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `fk_companies_addresses1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_companies_companies_type1` FOREIGN KEY (`companies_type_id`) REFERENCES `companies_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_companies_fiscal_situation1` FOREIGN KEY (`fiscal_situation_id`) REFERENCES `fiscal_situation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_companies_tax_type1` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cta_ctes`
--
ALTER TABLE `cta_ctes`
  ADD CONSTRAINT `fk_cta_ctes_invoice_head1` FOREIGN KEY (`invoice_head_id`) REFERENCES `invoice_head` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas_proveedores`
--
ALTER TABLE `facturas_proveedores`
  ADD CONSTRAINT `fk_facturas_proveedores_companies1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_facturas_proveedores_tipo_cbte_prov1` FOREIGN KEY (`tipo_cbte_prov_id`) REFERENCES `tipo_cbte_prov` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `invoice_head`
--
ALTER TABLE `invoice_head`
  ADD CONSTRAINT `fk_invoice_head_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD CONSTRAINT `fk_invoice_lines_invoice_head1` FOREIGN KEY (`invoice_head_id`) REFERENCES `invoice_head` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos_cta_ctes1` FOREIGN KEY (`cta_ctes_id`) REFERENCES `cta_ctes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_medios_pagos1` FOREIGN KEY (`medios_pagos_id`) REFERENCES `medios_pagos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_tipo_iva1` FOREIGN KEY (`tipo_iva_id`) REFERENCES `tipo_iva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rel_fiscal_situation_tipo_cbtes`
--
ALTER TABLE `rel_fiscal_situation_tipo_cbtes`
  ADD CONSTRAINT `fk_rel_fiscal_situation_tipo_cbtes_fiscal_situation1` FOREIGN KEY (`fiscal_situation_id`) REFERENCES `fiscal_situation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rel_fiscal_situation_tipo_cbtes_tipo_cbtes1` FOREIGN KEY (`tipo_cbtes_id`) REFERENCES `tipo_cbtes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rel_remitos_facturas`
--
ALTER TABLE `rel_remitos_facturas`
  ADD CONSTRAINT `fk_rel_remitos_facturas_invoice_head1` FOREIGN KEY (`remito_id`) REFERENCES `invoice_head` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rel_remitos_facturas_invoice_head2` FOREIGN KEY (`factura_id`) REFERENCES `invoice_head` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `fk_states_countries1` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_companies1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_roles` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
