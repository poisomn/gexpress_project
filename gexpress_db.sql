-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-10-2025 a las 01:22:00
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gexpress_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add pedido', 7, 'add_pedido'),
(26, 'Can change pedido', 7, 'change_pedido'),
(27, 'Can delete pedido', 7, 'delete_pedido'),
(28, 'Can view pedido', 7, 'view_pedido'),
(29, 'Can add user', 8, 'add_usuario'),
(30, 'Can change user', 8, 'change_usuario'),
(31, 'Can delete user', 8, 'delete_usuario'),
(32, 'Can view user', 8, 'view_usuario'),
(33, 'Can add vehiculo', 9, 'add_vehiculo'),
(34, 'Can change vehiculo', 9, 'change_vehiculo'),
(35, 'Can delete vehiculo', 9, 'delete_vehiculo'),
(36, 'Can view vehiculo', 9, 'view_vehiculo'),
(37, 'Can add cliente', 10, 'add_cliente'),
(38, 'Can change cliente', 10, 'change_cliente'),
(39, 'Can delete cliente', 10, 'delete_cliente'),
(40, 'Can view cliente', 10, 'view_cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb3_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$8b4NxwmWO2Lh6FkoeWF7qH$MriUIiwzD+gRVZr5NIOTX/hXBKVD3HqK0gjBxxO0Rag=', '2025-10-21 21:58:42.857681', 1, 'admin', '', '', 'admin@gexpress.cl', 1, 1, '2025-10-21 21:54:55.942408');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb3_spanish_ci,
  `object_repr` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb3_spanish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-10-21 22:00:43.852648', '1', 'Chris Araya (20866604-5)', 1, '[{\"added\": {}}]', 10, 1),
(2, '2025-10-21 22:01:25.546566', '2', 'Cetra Cetra (21657185-1)', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'gestion', 'pedido'),
(8, 'gestion', 'usuario'),
(9, 'gestion', 'vehiculo'),
(10, 'gestion', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-21 21:52:53.029555'),
(2, 'auth', '0001_initial', '2025-10-21 21:52:53.282253'),
(3, 'admin', '0001_initial', '2025-10-21 21:52:53.373898'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-21 21:52:53.377842'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-21 21:52:53.381353'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-21 21:52:53.418620'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-21 21:52:53.436975'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-21 21:52:53.456684'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-21 21:52:53.460268'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-21 21:52:53.481251'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-21 21:52:53.482261'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-21 21:52:53.486087'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-21 21:52:53.509843'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-21 21:52:53.529622'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-21 21:52:53.552733'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-21 21:52:53.557519'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-21 21:52:53.578520'),
(18, 'sessions', '0001_initial', '2025-10-21 21:52:53.600283'),
(19, 'gestion', '0001_initial', '2025-10-21 21:53:49.414733'),
(20, 'gestion', '0002_cliente', '2025-10-21 21:57:56.889014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb3_spanish_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb3_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('mgqcoq78r4u07elozk9a8hvzzml1r701', '.eJxVjDsOwyAQBe9CHSFg-ZiU6X0GtAur4CTCkrGrKHePkFwk7ZuZ9xYJj72mo_OWliKuQovL70aYn9wGKA9s91Xmte3bQnIo8qRdzmvh1-10_w4q9jpqzdo5MtZaDypOBSyTUdEYtqQYkAAmIPJBu-A0ep-1M6xMDmwjgPh8AbiwNpk:1vBKNO:jI2LL53r1QbOEZNuV4z1iDAfnlwu6ZuqABjN__M2K3c', '2025-11-04 21:58:42.859748');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_cliente`
--

DROP TABLE IF EXISTS `gestion_cliente`;
CREATE TABLE IF NOT EXISTS `gestion_cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rut` varchar(10) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_actualizacion` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `gestion_cliente`
--

INSERT INTO `gestion_cliente` (`id`, `rut`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, '20866604-5', 'Chris', 'Araya', 'caraya@gexpress.cl', '9987654321', 'calle 987', '2025-10-21 22:00:43.851725', '2025-10-21 22:00:43.851743'),
(3, '21560904-9', 'Alonso', 'Molina', 'amolina@gexpress.cl', '9912341234', 'calle 1234', '2025-10-21 22:29:58.464982', '2025-10-21 22:32:50.914865');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_pedido`
--

DROP TABLE IF EXISTS `gestion_pedido`;
CREATE TABLE IF NOT EXISTS `gestion_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cliente` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb3_spanish_ci,
  `estado` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `conductor_id` bigint DEFAULT NULL,
  `vehiculo_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gestion_pedido_conductor_id_fec2eb82` (`conductor_id`),
  KEY `gestion_pedido_vehiculo_id_2c7519a5` (`vehiculo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_usuario`
--

DROP TABLE IF EXISTS `gestion_usuario`;
CREATE TABLE IF NOT EXISTS `gestion_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb3_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_usuario_groups`
--

DROP TABLE IF EXISTS `gestion_usuario_groups`;
CREATE TABLE IF NOT EXISTS `gestion_usuario_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gestion_usuario_groups_usuario_id_group_id_274a8e9b_uniq` (`usuario_id`,`group_id`),
  KEY `gestion_usuario_groups_usuario_id_bd725e78` (`usuario_id`),
  KEY `gestion_usuario_groups_group_id_52d196ce` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_usuario_user_permissions`
--

DROP TABLE IF EXISTS `gestion_usuario_user_permissions`;
CREATE TABLE IF NOT EXISTS `gestion_usuario_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gestion_usuario_user_per_usuario_id_permission_id_1e2e2f70_uniq` (`usuario_id`,`permission_id`),
  KEY `gestion_usuario_user_permissions_usuario_id_621a00b7` (`usuario_id`),
  KEY `gestion_usuario_user_permissions_permission_id_f64c6062` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_vehiculo`
--

DROP TABLE IF EXISTS `gestion_vehiculo`;
CREATE TABLE IF NOT EXISTS `gestion_vehiculo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patente` varchar(10) COLLATE utf8mb3_spanish_ci NOT NULL,
  `marca` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `modelo` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `anio` int NOT NULL,
  `estado` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patente` (`patente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
