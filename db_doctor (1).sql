-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 01, 2025 at 08:10 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_doctor`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add doctor', 7, 'add_doctor'),
(26, 'Can change doctor', 7, 'change_doctor'),
(27, 'Can delete doctor', 7, 'delete_doctor'),
(28, 'Can view doctor', 7, 'view_doctor'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add disease', 9, 'add_disease'),
(34, 'Can change disease', 9, 'change_disease'),
(35, 'Can delete disease', 9, 'delete_disease'),
(36, 'Can view disease', 9, 'view_disease'),
(37, 'Can add appointment', 10, 'add_appointment'),
(38, 'Can change appointment', 10, 'change_appointment'),
(39, 'Can delete appointment', 10, 'delete_appointment'),
(40, 'Can view appointment', 10, 'view_appointment'),
(41, 'Can add admin', 11, 'add_admin'),
(42, 'Can change admin', 11, 'change_admin'),
(43, 'Can delete admin', 11, 'delete_admin'),
(44, 'Can view admin', 11, 'view_admin'),
(45, 'Can add chat message', 12, 'add_chatmessage'),
(46, 'Can change chat message', 12, 'change_chatmessage'),
(47, 'Can delete chat message', 12, 'delete_chatmessage'),
(48, 'Can view chat message', 12, 'view_chatmessage'),
(49, 'Can add payment', 13, 'add_payment'),
(50, 'Can change payment', 13, 'change_payment'),
(51, 'Can delete payment', 13, 'delete_payment'),
(52, 'Can view payment', 13, 'view_payment'),
(53, 'Can add feedback', 14, 'add_feedback'),
(54, 'Can change feedback', 14, 'change_feedback'),
(55, 'Can delete feedback', 14, 'delete_feedback'),
(56, 'Can view feedback', 14, 'view_feedback'),
(57, 'Can add slots', 15, 'add_slots'),
(58, 'Can change slots', 15, 'change_slots'),
(59, 'Can delete slots', 15, 'delete_slots'),
(60, 'Can view slots', 15, 'view_slots'),
(61, 'Can add doctor available time', 16, 'add_doctoravailabletime'),
(62, 'Can change doctor available time', 16, 'change_doctoravailabletime'),
(63, 'Can delete doctor available time', 16, 'delete_doctoravailabletime'),
(64, 'Can view doctor available time', 16, 'view_doctoravailabletime'),
(65, 'Can add slots1', 17, 'add_slots1'),
(66, 'Can change slots1', 17, 'change_slots1'),
(67, 'Can delete slots1', 17, 'delete_slots1'),
(68, 'Can view slots1', 17, 'view_slots1'),
(69, 'Can add chat message', 18, 'add_chatmessage'),
(70, 'Can change chat message', 18, 'change_chatmessage'),
(71, 'Can delete chat message', 18, 'delete_chatmessage'),
(72, 'Can view chat message', 18, 'view_chatmessage'),
(73, 'Can add chat room', 19, 'add_chatroom'),
(74, 'Can change chat room', 19, 'change_chatroom'),
(75, 'Can delete chat room', 19, 'delete_chatroom'),
(76, 'Can view chat room', 19, 'view_chatroom'),
(77, 'Can add chat message1', 20, 'add_chatmessage1'),
(78, 'Can change chat message1', 20, 'change_chatmessage1'),
(79, 'Can delete chat message1', 20, 'delete_chatmessage1'),
(80, 'Can view chat message1', 20, 'view_chatmessage1'),
(81, 'Can add chat room1', 21, 'add_chatroom1'),
(82, 'Can change chat room1', 21, 'change_chatroom1'),
(83, 'Can delete chat room1', 21, 'delete_chatroom1'),
(84, 'Can view chat room1', 21, 'view_chatroom1');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$FNUM0ItNiyMl3uPW7mm4Lf$cEGxUc0h7Uiu7/uNdrTx2o8VIe6kThIJck4EdgQreOA=', '2025-03-01 06:32:58.909735', 1, 'devika', '', '', 'devika@gmail.com', 1, 1, '2025-01-19 16:16:06.794857'),
(2, 'pbkdf2_sha256$600000$emtMgerFdLfdStqEX8SsVF$4LxJoWnbdTkBbAbTBa1y7AvdKJNPLsMuJtnDLhCKCVI=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2025-03-01 06:37:42.184321');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_chatmessage`
--

DROP TABLE IF EXISTS `chat_chatmessage`;
CREATE TABLE IF NOT EXISTS `chat_chatmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `sender_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_chatmessage_receiver_id_732b2283` (`receiver_id`),
  KEY `chat_chatmessage_sender_id_80753f2b` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-01-19 16:41:26.136954', '47', 'Disease object (47)', 2, '[]', 9, 1),
(2, '2025-01-20 04:53:39.392731', '40', 'Disease object (40)', 2, '[{\"changed\": {\"fields\": [\"Symptoms\"]}}]', 9, 1),
(3, '2025-03-01 06:44:50.382386', '6', 'Dr. James Brown', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'doctor_app', 'doctor'),
(8, 'doctor_app', 'user'),
(9, 'doctor_app', 'disease'),
(10, 'doctor_app', 'appointment'),
(11, 'doctor_app', 'admin'),
(12, 'doctor_app', 'chatmessage'),
(13, 'doctor_app', 'payment'),
(14, 'doctor_app', 'feedback'),
(15, 'doctor_app', 'slots'),
(16, 'doctor_app', 'doctoravailabletime'),
(17, 'doctor_app', 'slots1'),
(18, 'chat', 'chatmessage'),
(19, 'doctor_app', 'chatroom'),
(20, 'doctor_app', 'chatmessage1'),
(21, 'doctor_app', 'chatroom1');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-01-06 09:22:21.082486'),
(2, 'auth', '0001_initial', '2025-01-06 09:22:21.838590'),
(3, 'admin', '0001_initial', '2025-01-06 09:22:22.148934'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-01-06 09:22:22.162898'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-06 09:22:22.179852'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-01-06 09:22:22.299126'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-01-06 09:22:22.387494'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-01-06 09:22:22.464006'),
(9, 'auth', '0004_alter_user_username_opts', '2025-01-06 09:22:22.482955'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-01-06 09:22:22.545838'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-01-06 09:22:22.548779'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-06 09:22:22.564793'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-01-06 09:22:22.625057'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-06 09:22:22.700083'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-01-06 09:22:22.764911'),
(16, 'auth', '0011_update_proxy_permissions', '2025-01-06 09:22:22.778873'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-06 09:22:22.848873'),
(18, 'doctor_app', '0001_initial', '2025-01-06 09:22:22.885242'),
(19, 'doctor_app', '0002_disease', '2025-01-06 09:22:22.905104'),
(20, 'doctor_app', '0003_delete_disease', '2025-01-06 09:22:22.925692'),
(21, 'doctor_app', '0004_disease', '2025-01-06 09:22:22.939655'),
(22, 'doctor_app', '0005_disease_symptoms', '2025-01-06 09:22:23.015246'),
(23, 'doctor_app', '0006_appointment', '2025-01-06 09:22:23.200882'),
(24, 'doctor_app', '0007_appointment_name_appointment_phone_number', '2025-01-06 09:22:23.349036'),
(25, 'doctor_app', '0008_admin', '2025-01-06 09:22:23.361416'),
(26, 'doctor_app', '0009_admin_utype', '2025-01-06 09:22:23.439493'),
(27, 'doctor_app', '0010_chatmessage', '2025-01-06 09:22:23.638016'),
(28, 'doctor_app', '0011_remove_chatmessage_doctor_and_more', '2025-01-06 09:22:24.159346'),
(29, 'doctor_app', '0012_doctor_doctor_fee_payment', '2025-01-06 09:22:24.295939'),
(30, 'doctor_app', '0013_payment_amount_payment_appointment_payment_doctor_and_more', '2025-01-06 09:22:24.543614'),
(31, 'doctor_app', '0014_delete_payment', '2025-01-06 09:22:24.551805'),
(32, 'doctor_app', '0015_payment', '2025-01-06 09:22:24.800139'),
(33, 'doctor_app', '0016_feedback', '2025-01-06 09:22:24.919327'),
(34, 'doctor_app', '0017_alter_user_age', '2025-01-06 09:22:24.978121'),
(35, 'doctor_app', '0018_alter_user_email', '2025-01-06 09:22:25.084475'),
(36, 'doctor_app', '0019_alter_doctor_doctor_fee_alter_doctor_email', '2025-01-06 09:22:25.339831'),
(37, 'doctor_app', '0020_user_image', '2025-01-06 09:22:25.396097'),
(38, 'sessions', '0001_initial', '2025-01-06 09:22:25.458689'),
(39, 'doctor_app', '0021_doctoravailabletime_slots', '2025-01-06 09:52:43.139794'),
(40, 'doctor_app', '0022_doctoravailabletime_day', '2025-01-06 09:55:53.021032'),
(41, 'doctor_app', '0023_slots_status', '2025-01-06 10:20:04.743088'),
(42, 'doctor_app', '0024_remove_slots_doctor_available_time_slots_date_and_more', '2025-01-06 11:40:25.567604'),
(43, 'doctor_app', '0025_remove_slots_doctor_slots_doctor_available_time_and_more', '2025-01-06 11:46:39.901905'),
(44, 'doctor_app', '0026_alter_doctoravailabletime_date', '2025-01-06 11:55:57.159756'),
(45, 'doctor_app', '0027_alter_doctoravailabletime_date_and_more', '2025-01-08 06:41:56.672818'),
(46, 'doctor_app', '0002_alter_appointment_time', '2025-01-08 08:32:13.974454'),
(47, 'doctor_app', '0002_slots1', '2025-01-08 09:05:38.520136'),
(48, 'doctor_app', '0002_alter_appointment_date', '2025-01-08 09:37:32.968946'),
(49, 'doctor_app', '0003_rename_time_appointment_slot_id', '2025-01-08 10:33:46.902626'),
(50, 'doctor_app', '0004_disease_doctortype', '2025-01-08 10:43:23.305619'),
(51, 'doctor_app', '0005_doctor_bio_doctor_clinic_place', '2025-01-08 12:11:15.590063'),
(52, 'doctor_app', '0006_rename_date_appointment_booked_date_and_more', '2025-01-10 04:32:32.344480'),
(53, 'doctor_app', '0007_payment_slot_id', '2025-01-10 05:29:35.999581'),
(54, 'doctor_app', '0008_rename_slot_id_appointment_slot', '2025-01-10 11:46:02.859858'),
(55, 'doctor_app', '0009_doctor_district', '2025-01-17 05:57:48.236939'),
(56, 'doctor_app', '0010_doctor_id_image', '2025-01-17 09:53:03.959639'),
(57, 'doctor_app', '0011_alter_payment_appointment', '2025-01-19 13:23:15.252566'),
(58, 'doctor_app', '0012_appointment_payment_status_delete_payment', '2025-01-19 13:56:10.725119'),
(59, 'doctor_app', '0013_appointment_amount', '2025-01-19 14:02:27.010693'),
(60, 'doctor_app', '0014_disease_cause_disease_description_disease_treatment', '2025-01-19 16:15:09.805537'),
(61, 'chat', '0001_initial', '2025-01-20 09:13:39.251769'),
(62, 'doctor_app', '0002_chatroom_chatmessage1', '2025-01-29 12:14:00.242958'),
(63, 'doctor_app', '0003_chatmessage1_is_viewed', '2025-01-29 12:22:00.805734'),
(64, 'doctor_app', '0004_remove_chatroom_doctor_remove_chatroom_user_and_more', '2025-01-30 04:16:37.006490'),
(65, 'doctor_app', '0005_chatmessage1', '2025-01-30 04:26:16.470011'),
(66, 'doctor_app', '0002_chatroom1', '2025-01-30 08:44:42.755918'),
(67, 'doctor_app', '0003_alter_chatmessage1_chat_room', '2025-01-30 08:50:27.991990'),
(68, 'doctor_app', '0002_delete_chatroom', '2025-01-30 12:16:33.374924'),
(69, 'doctor_app', '0003_rename_chatroom1_chatroom_and_more', '2025-01-31 09:32:44.791512'),
(70, 'doctor_app', '0002_delete_chatmessage1', '2025-01-31 09:40:14.410969'),
(71, 'doctor_app', '0003_chatmessage1', '2025-01-31 09:41:23.593780');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('oxy8wtc1baq4gn4gas8emk17g04rg0iw', '.eJxVjEEOwiAQRe_C2pAptA64dO8ZyMAwUjU0Ke3KeHfbpAvd_vfef6tA61LC2vIcRlYX1anT7xYpPXPdAT-o3iedprrMY9S7og_a9G3i_Loe7t9BoVa2OloGRDc437OB7Ei8eCMRGM3ZOmYU1xmSzNRjZLQAfrBgjWwRYlKfL99iN40:1tZY3k:5MFfRANkmFyxPj3cLJLsVhvarmDwIOCLmxs-HyorzUk', '2025-02-02 16:22:00.400725'),
('b42lu0vkn479hzineuuc4n51yeomxbs3', '.eJxVjEEOwiAQRe_C2pAptA64dO8ZyMAwUjU0Ke3KeHfbpAvd_vfef6tA61LC2vIcRlYX1anT7xYpPXPdAT-o3iedprrMY9S7og_a9G3i_Loe7t9BoVa2OloGRDc437OB7Ei8eCMRGM3ZOmYU1xmSzNRjZLQAfrBgjWwRYlKfL99iN40:1toGPC:b0TOAOT9R41cVET92xYJoyTqoW4LUk-FhxsQ90kqatI', '2025-03-15 06:32:58.921739');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_admin`
--

DROP TABLE IF EXISTS `doctor_app_admin`;
CREATE TABLE IF NOT EXISTS `doctor_app_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `utype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_admin`
--

INSERT INTO `doctor_app_admin` (`id`, `username`, `password`, `email`, `utype`) VALUES
(1, 'admin', '123', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_appointment`
--

DROP TABLE IF EXISTS `doctor_app_appointment`;
CREATE TABLE IF NOT EXISTS `doctor_app_appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booked_date` date NOT NULL,
  `slot_id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  `doctor_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `amount` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_app_appointment_doctor_id_1f6d5366` (`doctor_id`),
  KEY `doctor_app_appointment_user_id_e19e4ae5` (`user_id`),
  KEY `doctor_app_appointment_time_id_728cedaa` (`slot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_appointment`
--

INSERT INTO `doctor_app_appointment` (`id`, `booked_date`, `slot_id`, `status`, `doctor_id`, `user_id`, `payment_status`, `amount`) VALUES
(4, '2025-01-18', 44, 'approved', 11, 1, 'pending', ''),
(5, '2025-01-18', 45, 'approved', 11, 1, 'completed', ''),
(6, '2025-01-18', 43, 'rejected', 11, 1, 'refunded', ''),
(7, '2025-01-18', 46, 'approved', 11, 1, 'paid', ''),
(8, '2025-01-18', 47, 'pending', 11, 1, 'pending', ''),
(9, '2025-01-18', 48, 'pending', 11, 1, 'pending', ''),
(10, '2025-01-19', 49, 'rejected', 11, 1, 'refunded', ''),
(11, '2025-01-19', 50, 'approved', 11, 1, 'completed', '110'),
(12, '2025-01-28', 41, 'booked', 11, 2, 'paid', '110'),
(13, '2025-02-07', 84, 'approved', 9, 3, 'paid', '140'),
(14, '2025-02-07', 85, 'approved', 9, 3, 'paid', '140'),
(15, '2025-02-07', 87, 'approved', 9, 3, 'paid', '140');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_chatmessage`
--

DROP TABLE IF EXISTS `doctor_app_chatmessage`;
CREATE TABLE IF NOT EXISTS `doctor_app_chatmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `receiver_doctor_id` bigint DEFAULT NULL,
  `receiver_user_id` bigint DEFAULT NULL,
  `sender_doctor_id` bigint DEFAULT NULL,
  `sender_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_app_chatmessage_receiver_doctor_id_cf1080ac` (`receiver_doctor_id`),
  KEY `doctor_app_chatmessage_receiver_user_id_410c2331` (`receiver_user_id`),
  KEY `doctor_app_chatmessage_sender_doctor_id_42a6241e` (`sender_doctor_id`),
  KEY `doctor_app_chatmessage_sender_user_id_fd9759f5` (`sender_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_chatmessage`
--

INSERT INTO `doctor_app_chatmessage` (`id`, `message`, `timestamp`, `receiver_doctor_id`, `receiver_user_id`, `sender_doctor_id`, `sender_user_id`) VALUES
(1, 'sxcc', '2025-01-28 08:52:52.606749', NULL, NULL, NULL, NULL),
(2, 'sxcc', '2025-01-28 08:57:20.136970', NULL, NULL, NULL, NULL),
(3, 'sxcc', '2025-01-28 09:00:43.322723', NULL, NULL, NULL, NULL),
(4, 'sxcc', '2025-01-28 09:02:53.784324', NULL, NULL, NULL, NULL),
(5, 'Hello, doctor!', '2025-01-28 09:08:50.409968', 2, NULL, NULL, 1),
(6, 'Hello, doctor!', '2025-01-28 09:09:51.453975', 2, NULL, NULL, 1),
(7, 'Hello, doctor!', '2025-01-28 09:38:34.084398', 2, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_chatmessage1`
--

DROP TABLE IF EXISTS `doctor_app_chatmessage1`;
CREATE TABLE IF NOT EXISTS `doctor_app_chatmessage1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `sender` varchar(10) NOT NULL,
  `is_viewed_by_user` tinyint(1) NOT NULL,
  `is_viewed_by_doctor` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `chat_room_id` bigint NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_app_chatmessage1_chat_room_id_2c2b4fd9` (`chat_room_id`),
  KEY `doctor_app_chatmessage1_doctor_id_6edbf800` (`doctor_id`),
  KEY `doctor_app_chatmessage1_user_id_f9d2e635` (`user_id`),
  KEY `doctor_app__chat_ro_2a4c89_idx` (`chat_room_id`,`created_at`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_chatmessage1`
--

INSERT INTO `doctor_app_chatmessage1` (`id`, `message`, `sender`, `is_viewed_by_user`, `is_viewed_by_doctor`, `created_at`, `is_deleted`, `chat_room_id`, `doctor_id`, `user_id`) VALUES
(4, 'hlooo', 'doctor', 1, 1, '2025-02-10 11:14:42.593496', 0, 4, 9, NULL),
(5, 'ammu', 'doctor', 1, 1, '2025-02-10 11:15:20.601808', 0, 4, 9, NULL),
(6, 'hloo linda', 'user', 1, 0, '2025-02-14 09:07:31.537763', 0, 4, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_chatroom`
--

DROP TABLE IF EXISTS `doctor_app_chatroom`;
CREATE TABLE IF NOT EXISTS `doctor_app_chatroom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctor_app_chatroom1_user_id_doctor_id_7314817b_uniq` (`user_id`,`doctor_id`),
  KEY `doctor_app_chatroom1_doctor_id_ef3ec9a6` (`doctor_id`),
  KEY `doctor_app_chatroom1_user_id_5c783a26` (`user_id`),
  KEY `doctor_app__user_id_034bc6_idx` (`user_id`,`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_chatroom`
--

INSERT INTO `doctor_app_chatroom` (`id`, `doctor_id`, `user_id`) VALUES
(4, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_disease`
--

DROP TABLE IF EXISTS `doctor_app_disease`;
CREATE TABLE IF NOT EXISTS `doctor_app_disease` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `symptoms` json NOT NULL DEFAULT (_utf8mb3'[]'),
  `doctortype` varchar(50) NOT NULL,
  `cause` longtext NOT NULL DEFAULT (_utf8mb3''),
  `description` longtext NOT NULL DEFAULT (_utf8mb3''),
  `treatment` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_disease`
--

INSERT INTO `doctor_app_disease` (`id`, `name`, `type`, `symptoms`, `doctortype`, `cause`, `description`, `treatment`) VALUES
(1, 'Flu', 'Viral', '[\"Fever\", \"Cough\", \"Fatigue\"]', 'General Physician', 'Influenza virus', 'A contagious respiratory illness caused by influenza viruses.', 'Rest, fluids, antiviral medications'),
(2, 'Diabetes', 'Metabolic', '[\"Increased thirst\", \"Frequent urination\", \"Fatigue\"]', 'Endocrinologist', 'Genetics, lifestyle factors', 'A condition that affects how the body uses blood sugar (glucose).', 'Insulin therapy, lifestyle changes'),
(3, 'Cancer', 'Oncology', '[\"Weight loss\", \"Fatigue\", \"Pain\"]', 'Oncologist', 'Environmental factors, genetics', 'A group of diseases involving abnormal cell growth with the potential to spread to other parts of the body.', 'Chemotherapy, radiation, surgery'),
(4, 'Malaria', 'Parasitic', '[\"Fever\", \"Chills\", \"Sweating\"]', 'General Physician', 'Plasmodium parasite', 'A life-threatening disease caused by parasites transmitted through mosquito bites.', 'Antimalarial medications'),
(5, 'Hypertension', 'Cardiovascular', '[\"Headaches\", \"Dizziness\", \"Shortness of breath\"]', 'Cardiologist', 'Obesity, stress, smoking', 'A condition where the force of the blood against the artery walls is too high.', 'Medications, lifestyle changes'),
(6, 'Tuberculosis', 'Bacterial', '[\"Cough\", \"Night sweats\", \"Weight loss\"]', 'Pulmonologist', 'Mycobacterium tuberculosis', 'A serious infectious disease that primarily affects the lungs.', 'Antibiotics'),
(7, 'Asthma', 'Respiratory', '[\"Wheezing\", \"Cough\", \"Shortness of breath\"]', 'Pulmonologist', 'Genetic, environmental triggers', 'A chronic disease that causes inflammation and narrowing of the airways.', 'Inhalers, bronchodilators'),
(8, 'Arthritis', 'Musculoskeletal', '[\"Joint pain\", \"Swelling\", \"Stiffness\"]', 'Rheumatologist', 'Genetic, injury', 'Inflammation of the joints causing pain, stiffness, and swelling.', 'Pain relievers, anti-inflammatory drugs'),
(9, 'HIV/AIDS', 'Viral', '[\"Fatigue\", \"Fever\", \"Swollen lymph nodes\"]', 'Infectious Disease Specialist', 'HIV virus', 'A virus that attacks the immune system, making it difficult to fight off infections.', 'Antiretroviral therapy'),
(10, 'Migraine', 'Neurological', '[\"Severe headache\", \"Nausea\", \"Sensitivity to light\"]', 'Neurologist', 'Genetic, environmental triggers', 'A type of headache characterized by intense pain, often on one side of the head.', 'Pain relief medications, lifestyle changes'),
(11, 'Cholera', 'Bacterial', '[\"Diarrhea\", \"Dehydration\", \"Vomiting\"]', 'General Physician', 'Vibrio cholerae bacteria', 'A bacterial disease caused by consuming contaminated water or food.', 'Rehydration, antibiotics'),
(12, 'Pneumonia', 'Bacterial', '[\"Cough\", \"Chest pain\", \"Fever\"]', 'Pulmonologist', 'Bacterial or viral infections', 'An infection that inflames the air sacs in one or both lungs.', 'Antibiotics, rest, fluids'),
(13, 'Leukemia', 'Cancer', '[\"Fatigue\", \"Frequent infections\", \"Easy bruising\"]', 'Oncologist', 'Genetic mutations', 'A cancer of the blood or bone marrow characterized by abnormal white blood cells.', 'Chemotherapy, bone marrow transplant'),
(14, 'Ebola', 'Viral', '[\"Fever\", \"Headache\", \"Bleeding\"]', 'Infectious Disease Specialist', 'Ebola virus', 'A highly contagious and deadly virus that causes severe hemorrhagic fever.', 'Supportive care, experimental treatments'),
(15, 'Dengue Fever', 'Viral', '[\"Fever\", \"Headache\", \"Joint pain\"]', 'General Physician', 'Dengue virus', 'A mosquito-borne viral infection causing flu-like symptoms.', 'Pain relief, fluids, mosquito control'),
(16, 'Pneumonia', 'Bacterial', '[\"Cough\", \"Chest pain\", \"Fever\"]', 'Pulmonologist', 'Bacterial or viral infections', 'An infection that inflames the air sacs in one or both lungs.', 'Antibiotics, rest, fluids'),
(17, 'Kidney Disease', 'Renal', '[\"Fatigue\", \"Swelling\", \"Nausea\"]', 'Nephrologist', 'Diabetes, hypertension', 'A condition in which the kidneys lose their ability to filter waste from the blood.', 'Dialysis, kidney transplant'),
(18, 'Stroke', 'Neurological', '[\"Sudden numbness\", \"Confusion\", \"Difficulty speaking\"]', 'Neurologist', 'Blocked or ruptured blood vessels in the brain', 'A medical emergency where the blood supply to part of the brain is interrupted.', 'Clot-busting medications, surgery'),
(19, 'Celiac Disease', 'Autoimmune', '[\"Diarrhea\", \"Weight loss\", \"Fatigue\"]', 'Gastroenterology', 'Gluten protein', 'An immune reaction to eating gluten that damages the small intestine.', 'Gluten-free diet'),
(20, 'Lung Cancer', 'Cancer', '[\"Cough\", \"Chest pain\", \"Weight loss\"]', 'Oncologist', 'Smoking, environmental exposure', 'Cancer that forms in the tissues of the lungs.', 'Surgery, chemotherapy, radiation'),
(21, 'Tuberculosis', 'Bacterial', '[\"Persistent cough\", \"Weight loss\", \"Night sweats\"]', 'Pulmonologist', 'Mycobacterium tuberculosis', 'A bacterial infection that primarily affects the lungs.', 'Antibiotics'),
(22, 'Chronic Obstructive Pulmonary Disease (COPD)', 'Respiratory', '[\"Shortness of breath\", \"Cough\", \"Wheezing\"]', 'Pulmonologist', 'Smoking, air pollution', 'A group of lung diseases that block airflow and make it difficult to breathe.', 'Inhalers, steroids, oxygen therapy'),
(23, 'Hepatitis B', 'Viral', '[\"Fatigue\", \"Jaundice\", \"Abdominal pain\"]', 'Hepatologist', 'Hepatitis B virus', 'A viral infection that attacks the liver and can lead to cirrhosis or liver cancer.', 'Antiviral medications'),
(24, 'Alzheimer’s Disease', 'Neurological', '[\"Memory loss\", \"Confusion\", \"Difficulty completing tasks\"]', 'Neurologist', 'Genetics, age', 'A progressive disease that destroys memory and other important mental functions.', 'No cure, symptom management'),
(25, 'Parkinson’s Disease', 'Neurological', '[\"Tremors\", \"Bradykinesia\", \"Muscle stiffness\"]', 'Neurologist', 'Genetics, environmental factors', 'A neurodegenerative disorder that affects movement control.', 'Medications, surgery'),
(26, 'Heart Attack', 'Cardiovascular', '[\"Chest pain\", \"Shortness of breath\", \"Dizziness\"]', 'Cardiologist', 'Atherosclerosis', 'A blockage of blood flow to the heart muscle, leading to tissue damage.', 'Angioplasty, medications, surgery'),
(27, 'Multiple Sclerosis', 'Neurological', '[\"Fatigue\", \"Numbness\", \"Difficulty walking\"]', 'Neurologist', 'Immune system attack on nerves', 'A disease of the central nervous system that disrupts communication between the brain and the body.', 'Immunotherapy, symptom management'),
(28, 'Anemia', 'Blood', '[\"Fatigue\", \"Paleness\", \"Shortness of breath\"]', 'Hematologist', 'Iron deficiency', 'A condition in which you lack enough healthy red blood cells to carry adequate oxygen to your body\'s tissues.', 'Iron supplements, blood transfusions'),
(29, 'Shingles', 'Viral', '[\"Rash\", \"Pain\", \"Itching\"]', 'Dermatologist', 'Varicella-zoster virus', 'A reactivation of the varicella-zoster virus that causes a painful rash.', 'Antiviral medications, pain relief'),
(30, 'Tuberculosis', 'Bacterial', '[\"Cough\", \"Fever\", \"Night sweats\"]', 'Pulmonologist', 'Mycobacterium tuberculosis', 'A bacterial infection that affects the lungs.', 'Antibiotics'),
(31, 'Meningitis', 'Bacterial', '[\"Fever\", \"Headache\", \"Stiff neck\"]', 'Neurologist', 'Bacteria, viruses', 'An inflammation of the membranes surrounding the brain and spinal cord.', 'Antibiotics, pain relief'),
(32, 'Epilepsy', 'Neurological', '[\"Seizures\", \"Loss of consciousness\", \"Staring spells\"]', 'Neurologist', 'Genetic, brain injury', 'A neurological disorder that causes repeated seizures.', 'Antiepileptic drugs'),
(33, 'Hepatitis C', 'Viral', '[\"Fatigue\", \"Abdominal pain\", \"Jaundice\"]', 'Hepatologist', 'HCV virus', 'A viral infection that attacks the liver and can lead to cirrhosis or liver cancer.', 'Antiviral medications'),
(34, 'Gastritis', 'Gastrointestinal', '[\"Stomach pain\", \"Nausea\", \"Vomiting\"]', 'Gastroenterologist', 'Alcohol, infection, stress', 'An inflammation of the stomach lining.', 'Antacids, antibiotics'),
(35, 'Cystic Fibrosis', 'Genetic', '[\"Persistent cough\", \"Difficulty breathing\", \"Frequent lung infections\"]', 'Pulmonologist', 'CFTR gene mutation', 'A genetic disorder that affects the lungs and digestive system.', 'Lung therapy, enzyme supplements'),
(36, 'Huntington’s Disease', 'Neurological', '[\"Involuntary movements\", \"Cognitive decline\", \"Personality changes\"]', 'Neurologist', 'HTT gene mutation', 'A genetic disorder that causes the progressive breakdown of nerve cells in the brain.', 'No cure, symptom management'),
(37, 'Sickle Cell Anemia', 'Blood', '[\"Pain episodes\", \"Fatigue\", \"Swelling in hands and feet\"]', 'Hematologist', 'Hemoglobin mutation', 'A genetic disorder where red blood cells are shaped like a crescent, leading to blockages in blood flow.', 'Pain relief, blood transfusions'),
(38, 'Stroke', 'Neurological', '[\"Sudden numbness\", \"Confusion\", \"Difficulty speaking\"]', 'Neurologist', 'Blocked or ruptured arteries', 'A medical emergency where blood flow to the brain is interrupted, leading to brain damage.', 'Clot-busting drugs, rehabilitation'),
(39, 'Gout', 'Musculoskeletal', '[\"Severe pain\", \"Swelling\", \"Redness in joints\"]', 'Rheumatologist', 'Excess uric acid', 'A form of arthritis characterized by sudden, severe pain, redness, and swelling in the joints.', 'Anti-inflammatory medications'),
(40, 'Polio', 'Viral', '[\"Paralysis\", \"Fatigue\", \"Fever\", \"vomit\"]', 'Infectious Disease Specialist', 'Poliovirus', 'A highly contagious viral disease that can lead to paralysis.', 'Supportive care, vaccination'),
(41, 'Schizophrenia', 'Psychiatric', '[\"Hallucinations\", \"Delusions\", \"Disorganized thinking\"]', 'Psychiatrist', 'Genetic, environmental factors', 'A serious mental disorder affecting a person\'s ability to think clearly and function normally.', 'Antipsychotic medications'),
(42, 'Panic Disorder', 'Psychiatric', '[\"Rapid heart rate\", \"Shortness of breath\", \"Sweating\"]', 'Psychiatrist', 'Genetic, stress', 'A type of anxiety disorder characterized by sudden and repeated episodes of intense fear.', 'Cognitive therapy, medications'),
(43, 'Bipolar Disorder', 'Psychiatric', '[\"Mood swings\", \"Depression\", \"Manic episodes\"]', 'Psychiatrist', 'Genetic, environmental stress', 'A mental disorder causing extreme mood swings between depression and mania.', 'Mood stabilizers, psychotherapy'),
(44, 'Chronic Fatigue Syndrome', 'Neurological', '[\"Severe fatigue\", \"Sleep problems\", \"Muscle pain\"]', 'General Physician', 'Unknown causes', 'A disorder characterized by persistent and unexplained fatigue that isn\'t relieved by rest.', 'Rest, lifestyle changes'),
(45, 'Acid Reflux', 'Gastrointestinal', '[\"Heartburn\", \"Chest pain\", \"Regurgitation\"]', 'Gastroenterologist', 'Dietary habits, obesity', 'A condition where stomach acid frequently leaks into the esophagus.', 'Antacids, proton pump inhibitors'),
(46, 'Liver Cirrhosis', 'Hepatological', '[\"Fatigue\", \"Jaundice\", \"Abdominal pain\"]', 'Hepatologist', 'Chronic alcohol use, hepatitis', 'A liver disease characterized by scarring of the liver tissue.', 'Liver transplant, medications'),
(47, 'Psoriasis', 'Dermatological', '[\"Red patches\", \"Scaly skin\", \"Itching\"]', 'Dermatologist', 'Immune system dysfunction', 'An autoimmune disorder that leads to the rapid growth of skin cells, forming scales and red patches.', 'Topical treatments, light therapy'),
(48, 'Asthma', 'Respiratory', '[\"Wheezing\", \"Cough\", \"Shortness of breath\"]', 'Pulmonologist', 'Genetic, environmental triggers', 'A chronic disease that causes inflammation and narrowing of the airways.', 'Inhalers, bronchodilators'),
(49, 'Chronic Sinusitis', 'Respiratory', '[\"Facial pain\", \"Nasal congestion\", \"Loss of smell\"]', 'ENT Specialist', 'Allergies, infections', 'Inflammation of the sinuses that lasts for a long time.', 'Nasal corticosteroids, saline nasal irrigation'),
(50, 'Sleep Apnea', 'Sleep Disorder', '[\"Loud snoring\", \"Gasping for air\", \"Daytime fatigue\"]', 'Pulmonologist', 'Obesity, anatomical factors', 'A serious sleep disorder where breathing repeatedly stops and starts.', 'CPAP therapy, lifestyle changes'),
(51, 'Chronic Bronchitis', 'Respiratory', '[\"Cough\", \"Mucus production\", \"Wheezing\"]', 'Pulmonologist', 'Smoking, air pollution', 'A form of chronic obstructive pulmonary disease (COPD) characterized by a persistent cough.', 'Bronchodilators, steroids'),
(52, 'Emphysema', 'Respiratory', '[\"Shortness of breath\", \"Coughing\", \"Wheezing\"]', 'Pulmonologist', 'Smoking, air pollution', 'A lung condition that causes shortness of breath due to damaged air sacs.', 'Bronchodilators, oxygen therapy'),
(53, 'Pneumothorax', 'Respiratory', '[\"Sudden chest pain\", \"Shortness of breath\"]', 'Pulmonologist', 'Injury, lung disease', 'A collapsed lung that occurs when air leaks into the space between the lung and chest wall.', 'Chest tube insertion, surgery'),
(54, 'Interstitial Lung Disease', 'Respiratory', '[\"Shortness of breath\", \"Dry cough\"]', 'Pulmonologist', 'Environmental factors, autoimmune diseases', 'A group of lung diseases affecting the interstitium.', 'Medications, oxygen therapy'),
(55, 'Pulmonary Hypertension', 'Cardiovascular', '[\"Shortness of breath\", \"Fatigue\", \"Chest pain\"]', 'Cardiologist', 'Genetic, lung diseases', 'High blood pressure in the blood vessels that supply the lungs.', 'Medications, oxygen therapy'),
(56, 'Atrial Fibrillation', 'Cardiovascular', '[\"Palpitations\", \"Weakness\", \"Dizziness\"]', 'Cardiologist', 'Heart disease, high blood pressure', 'An irregular and often rapid heart rate that can lead to blood clots.', 'Medications, cardioversion'),
(57, 'Heart Failure', 'Cardiovascular', '[\"Shortness of breath\", \"Fatigue\", \"Swelling in legs\"]', 'Cardiologist', 'Coronary artery disease, high blood pressure', 'A condition in which the heart cannot pump enough blood to meet the body\'s needs.', 'Medications, lifestyle changes'),
(58, 'Arrhythmia', 'Cardiovascular', '[\"Palpitations\", \"Dizziness\", \"Fainting\"]', 'Cardiologist', 'Heart disease, electrolyte imbalances', 'An irregular heartbeat that can lead to complications.', 'Medications, pacemaker'),
(59, 'Coronary Artery Disease', 'Cardiovascular', '[\"Chest pain\", \"Shortness of breath\"]', 'Cardiologist', 'Atherosclerosis', 'A condition caused by the buildup of plaque in the coronary arteries.', 'Medications, angioplasty'),
(60, 'Peripheral Artery Disease', 'Cardiovascular', '[\"Leg pain\", \"Weakness\"]', 'Cardiologist', 'Atherosclerosis', 'A circulatory condition in which narrowed arteries reduce blood flow to the limbs.', 'Medications, lifestyle changes'),
(61, 'Deep Vein Thrombosis', 'Cardiovascular', '[\"Swelling\", \"Pain in leg\"]', 'Cardiologist', 'Prolonged immobility, blood clotting disorders', 'A blood clot that forms in a deep vein, usually in the legs.', 'Anticoagulants, compression stockings'),
(62, 'Varicose Veins', 'Cardiovascular', '[\"Swollen veins\", \"Aching legs\"]', 'Cardiologist', 'Genetics, prolonged standing', 'Enlarged veins that can be seen just under the surface of the skin.', 'Compression stockings, surgery'),
(63, 'Cerebral Palsy', 'Neurological', '[\"Muscle stiffness\", \"Difficulty with movement\"]', 'Neurologist', 'Brain injury during birth', 'A group of disorders affecting movement and muscle tone.', 'Physical therapy, medications'),
(64, 'Amyotrophic Lateral Sclerosis (ALS)', 'Neurological', '[\"Muscle weakness\", \"Difficulty speaking\"]', 'Neurologist', 'Genetic, environmental factors', 'A progressive neurodegenerative disease affecting nerve cells in the brain and spinal cord.', 'Medications, supportive care'),
(65, 'Dementia', 'Neurological', '[\"Memory loss\", \"Difficulty with communication\"]', 'Neurologist', 'Age, genetics', 'A decline in cognitive function severe enough to interfere with daily life.', 'Medications, supportive care'),
(66, 'Tourette Syndrome', 'Neurological', '[\"Tics\", \"Involuntary movements\"]', 'Neurologist', 'Genetic, environmental factors', 'A neurological disorder characterized by repetitive, involuntary movements and vocalizations.', 'Behavioral therapy, medications'),
(67, 'Myasthenia Gravis', 'Neurological', '[\"Muscle weakness\", \"Fatigue\"]', 'Neurologist', 'Autoimmune response', 'A chronic autoimmune disorder that affects the communication between nerves and muscles.', 'Medications, thymectomy'),
(68, 'Guillain-Barré Syndrome', 'Neurological', '[\"Weakness\", \"Numbness\"]', 'Neurologist', 'Autoimmune response', 'A rare disorder where the bodys immune system attacks the nerves.', 'Plasmapheresis, immunoglobulin therapy'),
(69, 'Cognitive Impairment', 'Neurological', '[\"Memory problems\", \"Difficulty concentrating\"]', 'Neurologist', 'Age, brain injury', 'A decline in cognitive function that affects daily activities.', 'Cognitive therapy, medications'),
(70, 'Epilepsy', 'Neurological', '[\"Seizures\", \"Loss of consciousness\"]', 'Neurologist', 'Genetic, brain injury', 'A neurological disorder characterized by recurrent seizures.', 'Antiepileptic drugs'),
(71, 'Bacterial Meningitis', 'Neurological', '[\"Fever\", \"Stiff neck\", \"Headache\"]', 'Neurologist', 'Bacterial infection', 'An infection of the protective membranes covering the brain and spinal cord.', 'Antibiotics, corticosteroids'),
(72, 'Cerebral Aneurysm', 'Neurological', '[\"Severe headache\", \"Vision changes\"]', 'Neurologist', 'Weakness in blood vessel wall', 'A bulge in a blood vessel in the brain that can rupture.', 'Surgery, monitoring'),
(73, 'Hepatic Encephalopathy', 'Hepatological', '[\"Confusion\", \"Sleep disturbances\"]', 'Hepatologist', 'Liver disease', 'A decline in brain function due to severe liver disease.', 'Medications, dietary changes'),
(74, 'Fatty Liver Disease', 'Hepatological', '[\"Fatigue\", \"Abdominal discomfort\"]', 'Hepatologist', 'Obesity, diabetes', 'A condition where fat builds up in the liver.', 'Lifestyle changes, medications'),
(75, 'Liver Cancer', 'Hepatological', '[\"Weight loss\", \"Abdominal pain\"]', 'Hepatologist', 'Chronic liver disease', 'Cancer that forms in the tissues of the liver.', 'Surgery, chemotherapy, targeted therapy'),
(76, 'Chronic Hepatitis', 'Hepatological', '[\"Fatigue\", \"Jaundice\"]', 'Hepatologist', 'Viral infection', 'Long-term inflammation of the liver.', 'Antiviral medications, lifestyle changes'),
(77, 'Gallstones', 'Gastrointestinal', '[\"Abdominal pain\", \"Nausea\"]', 'Gastroenterologist', 'Excess cholesterol, bile salts', 'Solid particles that form in the gallbladder.', 'Surgery, medications'),
(78, 'Irritable Bowel Syndrome (IBS)', 'Gastrointestinal', '[\"Abdominal pain\", \"Bloating\"]', 'Gastroenterologist', 'Diet, stress', 'A common disorder affecting the large intestine.', 'Dietary changes, medications'),
(79, 'Crohn’s Disease', 'Gastrointestinal', '[\"Abdominal pain\", \"Diarrhea\"]', 'Gastroenterologist', 'Autoimmune response', 'A type of inflammatory bowel disease that affects the lining of the digestive tract.', 'Medications, surgery'),
(80, 'Ulcerative Colitis', 'Gastrointestinal', '[\"Diarrhea\", \"Abdominal pain\"]', 'Gastroenterologist', 'Autoimmune response', 'A chronic inflammatory bowel disease that causes inflammation in the digestive tract.', 'Medications, surgery'),
(81, 'Celiac Disease', 'Gastrointestinal', '[\"Diarrhea\", \"Weight loss\"]', 'Gastroenterologist', 'Gluten intolerance', 'An autoimmune disorder where ingestion of gluten leads to damage in the small intestine.', 'Gluten-free diet'),
(82, 'Diverticulitis', 'Gastrointestinal', '[\"Abdominal pain\", \"Fever\"]', 'Gastroenterologist', 'Diverticula inflammation', 'Inflammation or infection of small pouches that can form in the lining of the digestive system.', 'Antibiotics, dietary changes'),
(83, 'Peptic Ulcer Disease', 'Gastrointestinal', '[\"Abdominal pain\", \"Nausea\"]', 'Gastroenterologist', 'H. pylori infection, NSAIDs', 'Sores that develop on the lining of the stomach or the first part of the small intestine.', 'Antibiotics, acid reducers'),
(84, 'Cholecystitis', 'Gastrointestinal', '[\"Abdominal pain\", \"Nausea\"]', 'Gastroenterologist', 'Gallstones', 'Inflammation of the gallbladder.', 'Surgery, medications'),
(85, 'Pancreatitis', 'Gastrointestinal', '[\"Abdominal pain\", \"Nausea\"]', 'Gastroenterologist', 'Alcohol use, gallstones', 'Inflammation of the pancreas.', 'Medications, surgery'),
(86, 'Constipation', 'Gastrointestinal', '[\"Infrequent bowel movements\", \"Abdominal discomfort\"]', 'Gastroenterologist', 'Diet, dehydration', 'A common digestive issue characterized by infrequent bowel movements.', 'Dietary changes, laxatives'),
(87, 'Hemorrhoids', 'Gastrointestinal', '[\"Painful swelling\", \"Bleeding\"]', 'Gastroenterologist', 'Straining during bowel movements', 'Swollen veins in the lower rectum and anus.', 'Dietary changes, topical treatments'),
(88, 'Acid Reflux', 'Gastrointestinal', '[\"Heartburn\", \"Regurgitation\"]', 'Gastroenterologist', 'Diet, obesity', 'A condition where stomach acid frequently flows back into the esophagus.', 'Antacids, lifestyle changes'),
(89, 'Psoriasis', 'Dermatological', '[\"Red patches\", \"Scaly skin\"]', 'Dermatologist', 'Immune system dysfunction', 'An autoimmune condition that causes the rapid growth of skin cells.', 'Topical treatments, phototherapy'),
(90, 'Eczema', 'Dermatological', '[\"Itching\", \"Redness\", \"Dry skin\"]', 'Dermatologist', 'Genetic, environmental factors', 'A condition that makes the skin red and inflamed.', 'Moisturizers, topical steroids'),
(91, 'Acne', 'Dermatological', '[\"Pimples\", \"Blackheads\", \"Oily skin\"]', 'Dermatologist', 'Hormonal changes, bacteria', 'A skin condition that occurs when hair follicles become clogged with oil and dead skin cells.', 'Topical treatments, oral medications'),
(92, 'Rosacea', 'Dermatological', '[\"Facial redness\", \"Pimples\"]', 'Dermatologist', 'Genetic, environmental factors', 'A chronic skin condition that causes redness and visible blood vessels in the face.', 'Topical treatments, laser therapy'),
(93, 'Melanoma', 'Dermatological', '[\"Changes in moles\", \"Skin lesions\"]', 'Dermatologist', 'UV exposure', 'The most serious type of skin cancer that develops in the melanocytes.', 'Surgery, immunotherapy, chemotherapy'),
(94, 'Basal Cell Carcinoma', 'Dermatological', '[\"Pearly bumps\", \"Skin lesions\"]', 'Dermatologist', 'UV exposure', 'A type of skin cancer that begins in the basal cells.', 'Surgery, topical medications'),
(95, 'Squamous Cell Carcinoma', 'Dermatological', '[\"Red patches\", \"Open sores\"]', 'Dermatologist', 'UV exposure', 'A type of skin cancer that begins in the squamous cells.', 'Surgery, radiation therapy'),
(96, 'Contact Dermatitis', 'Dermatological', '[\"Red rash\", \"Itching\"]', 'Dermatologist', 'Allergens, irritants', 'A skin rash caused by contact with a substance that irritates the skin or triggers an allergic reaction.', 'Topical steroids, avoidance of irritants'),
(97, 'Warts', 'Dermatological', '[\"Small bumps on skin\"]', 'Dermatologist', 'Human papillomavirus (HPV)', 'Growths on the skin caused by a viral infection.', 'Cryotherapy, topical treatments'),
(98, 'Fungal Infections', 'Dermatological', '[\"Itching\", \"Redness\"]', 'Dermatologist', 'Fungi', 'Infections caused by fungi that can affect the skin, hair, and nails.', 'Antifungal medications'),
(99, 'Lichen Planus', 'Dermatological', '[\"Itchy, purple rash\"]', 'Dermatologist', 'Unknown', 'An inflammatory condition that affects the skin and mucous membranes.', 'Topical steroids, antihistamines'),
(100, 'Alopecia Areata', 'Dermatological', '[\"Hair loss\"]', 'Dermatologist', 'Autoimmune response', 'A condition that causes hair to fall out in patches.', 'Corticosteroids, topical treatments'),
(101, 'Vitiligo', 'Dermatological', '[\"Loss of skin color\"]', 'Dermatologist', 'Autoimmune response', 'A condition that causes the skin to lose its pigment.', 'Topical treatments, light therapy'),
(102, 'Seborrheic Dermatitis', 'Dermatological', '[\"Red, flaky skin\"]', 'Dermatologist', 'Yeast, skin oil', 'A common skin condition that causes scaly patches and red skin.', 'Topical antifungals, corticosteroids'),
(103, 'Tinea Pedis (Athlete’s Foot)', 'Dermatological', '[\"Itching\", \"Burning sensation\"]', 'Dermatologist', 'Fungi', 'A fungal infection that affects the skin on the feet.', 'Antifungal creams, powders'),
(104, 'Tinea Corporis (Ringworm)', 'Dermatological', '[\"Red, circular rash\"]', 'Dermatologist', 'Fungi', 'A fungal infection that causes a ring-shaped rash on the skin.', 'Antifungal medications'),
(105, 'Scabies', 'Dermatological', '[\"Intense itching\", \"Rash\"]', 'Dermatologist', 'Mites', 'A contagious skin infestation caused by a mite.', 'Topical scabicides, antihistamines'),
(106, 'Impetigo', 'Dermatological', '[\"Red sores\", \"Crusty lesions\"]', 'Dermatologist', 'Bacteria', 'A highly contagious skin infection that causes red sores.', 'Antibiotic ointments, oral antibiotics'),
(107, 'Cellulitis', 'Dermatological', '[\"Redness\", \"Swelling\"]', 'Dermatologist', 'Bacteria', 'A common and potentially serious bacterial skin infection.', 'Antibiotics'),
(108, 'Keloids', 'Dermatological', '[\"Raised scars\"]', 'Dermatologist', 'Genetic predisposition', 'Overgrowth of scar tissue at the site of a healed skin injury.', 'Corticosteroid injections, surgery'),
(109, 'Chronic Urticaria (Hives)', 'Dermatological', '[\"Itchy welts\", \"Swelling\"]', 'Dermatologist', 'Allergic reactions', 'A condition characterized by the sudden appearance of itchy welts on the skin.', 'Antihistamines, corticosteroids'),
(110, 'Pityriasis Rosea', 'Dermatological', '[\"Rash\", \"Itching\"]', 'Dermatologist', 'Viral infection', 'A skin condition that causes a rash, often in a Christmas tree pattern.', 'Topical treatments, antihistamines'),
(111, 'Erythema Multiforme', 'Dermatological', '[\"Target-like lesions\"]', 'Dermatologist', 'Infections, medications', 'A condition that causes red patches or spots on the skin.', 'Corticosteroids, antihistamines');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_doctor`
--

DROP TABLE IF EXISTS `doctor_app_doctor`;
CREATE TABLE IF NOT EXISTS `doctor_app_doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `specialization` varchar(150) NOT NULL,
  `qualification` varchar(150) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  `utype` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `doctor_fee` varchar(10) NOT NULL,
  `bio` longtext NOT NULL DEFAULT (_utf8mb3''),
  `clinic_place` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `id_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_doctor`
--

INSERT INTO `doctor_app_doctor` (`id`, `name`, `phone_number`, `specialization`, `qualification`, `experience`, `email`, `password`, `utype`, `status`, `image`, `doctor_fee`, `bio`, `clinic_place`, `district`, `id_image`) VALUES
(1, 'sachin', '9567920682', 'Oncologist', 'MBBS', 'six years', 's@gmail.com', '12345678', 'doctor', 'approved', 'doctors/doct.jpg', '500', 'fgdsds', 'gsvgh', 'Thrissur', NULL),
(2, 'Dr. John Doe', '1234567891', 'Cardiology', 'MBBS, MD', '10 years', 'john.doe@example.com', 'password1', 'doctor', 'approved', 'doctors/sai.jpg', '150', 'Dr. John Doe is a cardiologist with over 10 years of experience in treating heart diseases.', 'Heart Clinic, New York', 'Kannur', NULL),
(3, 'Dr. Jane Smith', '1234567892', 'Neurology', 'MBBS, MS', '8 years', 'jane.smith@example.com', 'password2', 'doctor', 'approved', 'doctors/anna.jpg', '200', 'Dr. Jane Smith specializes in neurology and has helped many patients with neurological disorders.', 'Brain Care Center, Los Angeles', 'Thrissur', NULL),
(4, 'Dr. Mark Johnson', '1234567893', 'Orthopedics', 'MBBS, DNB', '12 years', 'mark.johnson@example.com', 'password3', 'doctor', 'approved', 'doctors/anna.jpg', '180', 'Dr. Mark Johnson is an orthopedic surgeon with a focus on joint replacements and bone health.', 'Bone Health Clinic, Chicago', 'Kannur', NULL),
(5, 'Dr. Emily White', '1234567894', 'Dermatology', 'MBBS, MD', '7 years', 'emily.white@example.com', 'password4', 'doctor', 'approved', 'doctors/anna.jpg', '100', 'Dr. Emily White is a dermatologist known for her expertise in skincare and acne treatment.', 'Glow Skin Clinic, Miami', 'Thrissur', NULL),
(6, 'Dr. James Brown', '1234567895', 'Pediatrics', 'MBBS, DCH', '5 years', 'james.brown@example.com', 'password5', 'doctor', 'approved', 'doctors/anna.jpg', '120', 'Dr. James Brown is a pediatrician who specializes in the care of infants and children.', 'Pediatric Care Center, Houston', 'Kollam', ''),
(7, 'Dr. Sarah Davis', '1234567896', 'Gynecology', 'MBBS, DGO', '15 years', 'sarah.davis@example.com', 'password6', 'doctor', 'approved', 'doctors/anna.jpg', '250', 'Dr. Sarah Davis has over 15 years of experience in women\'s health, including prenatal and postnatal care.', 'Women\'s Health Clinic, San Francisco', 'Thrissur', NULL),
(8, 'Dr. Robert Miller', '1234567897', 'Ophthalmology', 'MBBS, MS', '9 years', 'robert.miller@example.com', 'password7', 'doctor', 'approved', 'doctors/anna.jpg', '130', 'Dr. Robert Miller specializes in eye care, including cataract surgery and vision correction treatments.', 'Vision Care Center, Seattle', 'Kollam', NULL),
(9, 'Dr. Linda Taylor', '1234567898', 'Gastroenterology', 'MBBS, MD', '6 years', 'linda@gmail.com', '123', 'doctor', 'approved', 'doctors/anna.jpg', '140', 'Dr. Linda Taylor is a gastroenterologist focused on treating digestive system disorders and diseases.', 'Digestive Health Clinic, Dallas', 'Idukki', NULL),
(10, 'Dr. William Wilson', '1234567899', 'ENT', 'MBBS, MS', '14 years', 'william.wilson@example.com', 'password9', 'doctor', 'approved', 'doctors/anna.jpg', '160', 'Dr. William Wilson has over 14 years of experience in diagnosing and treating ear, nose, and throat issues.', 'ENT Specialist Clinic, Atlanta', 'Idukki', NULL),
(11, 'Dr. Patricia Moore', '12345678910', 'Oncologist', 'MBBS, MD', '20 years', 'pat@gmail.com', '123', 'doctor', 'approved', 'doctors/anna.jpg', '110', 'Dr. Patricia Moore is a general physician with a broad experience in diagnosing and treating a wide range of medical conditions.', 'General Health Clinic, Boston', 'Kollam', NULL),
(12, 'dr dev', '9567956892', 'orthopedic', 'MBBS', 'five years', 'dev@gmail.com', '12345678', 'doctor', 'approved', 'doctors/IMG_20241221_141303.jpg', '250', 'a', 'a', 'Thrissur', NULL),
(13, 'hr', '9565655555', 'orthopedic', 'mbbs', 'five', 'kma49209@gmail.com', '12345678', 'doctor', 'approved', 'doctors/IMG-20250114-WA0003.jpg', '250', 'a', 'a', 'Kollam', NULL),
(14, 'hr', '9565655555', 'orthopedic', 'mbbs', 'five', 'kma49209@gmail.com', '12345678', 'doctor', 'approved', 'doctors/IMG-20250114-WA0003_a2ZSZwz.jpg', '250', 'a', 'a', 'Idukki', NULL),
(15, 'hr', '9565655555', 'orthopedic', 'mbbs', 'five', 'kma49209@gmail.com', '12345678', 'doctor', 'approved', 'doctors/IMG-20250114-WA0003_8w4j0ie.jpg', '250', '', '', 'Idukki', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_doctoravailabletime`
--

DROP TABLE IF EXISTS `doctor_app_doctoravailabletime`;
CREATE TABLE IF NOT EXISTS `doctor_app_doctoravailabletime` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `doctor_id` bigint NOT NULL,
  `day` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_app_doctoravailabletime_doctor_id_398c337d` (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_doctoravailabletime`
--

INSERT INTO `doctor_app_doctoravailabletime` (`id`, `date`, `start_time`, `end_time`, `is_available`, `doctor_id`, `day`) VALUES
(1, '2025-01-18', '17:35:00.000000', '21:30:00.000000', 1, 11, 'Saturday'),
(2, '2025-01-29', '15:00:00.000000', '22:00:00.000000', 1, 11, 'Wednesday'),
(3, '2025-02-08', '14:00:00.000000', '18:00:00.000000', 1, 9, 'Saturday'),
(4, '2025-02-10', '12:10:00.000000', '17:00:00.000000', 1, 9, 'Monday'),
(5, '2025-02-15', '16:14:00.000000', '23:00:00.000000', 1, 9, 'Saturday'),
(6, '2025-02-16', '08:00:00.000000', '12:00:00.000000', 1, 9, 'Sunday'),
(7, '2025-02-17', '08:00:00.000000', '12:00:00.000000', 1, 9, 'Monday'),
(8, '2025-02-18', '08:00:00.000000', '12:00:00.000000', 1, 9, 'Tuesday'),
(9, '2025-02-19', '08:00:00.000000', '12:00:00.000000', 1, 9, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_feedback`
--

DROP TABLE IF EXISTS `doctor_app_feedback`;
CREATE TABLE IF NOT EXISTS `doctor_app_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  `rating` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_app_feedback_user_id_f6f8c06f` (`user_id`),
  KEY `doctor_app_feedback_doctor_id_4a67875f_fk_doctor_app_doctor_id` (`doctor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_slots`
--

DROP TABLE IF EXISTS `doctor_app_slots`;
CREATE TABLE IF NOT EXISTS `doctor_app_slots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `is_booked` tinyint(1) NOT NULL,
  `status` varchar(100) NOT NULL,
  `doctor_available_time_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_app_slots1_doctor_available_time_id_0f0fc78e` (`doctor_available_time_id`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_slots`
--

INSERT INTO `doctor_app_slots` (`id`, `date`, `start_time`, `end_time`, `is_booked`, `status`, `doctor_available_time_id`) VALUES
(41, '2025-01-18', '17:35:00.000000', '18:05:00.000000', 1, 'available', 1),
(42, '2025-01-18', '18:05:00.000000', '18:35:00.000000', 0, 'available', 1),
(43, '2025-01-18', '18:35:00.000000', '19:05:00.000000', 0, 'available', 1),
(44, '2025-01-18', '19:05:00.000000', '19:35:00.000000', 1, 'available', 1),
(45, '2025-01-18', '19:35:00.000000', '20:05:00.000000', 1, 'available', 1),
(46, '2025-01-18', '20:05:00.000000', '20:35:00.000000', 1, 'available', 1),
(47, '2025-01-18', '20:35:00.000000', '21:05:00.000000', 1, 'available', 1),
(48, '2025-01-18', '17:35:00.000000', '18:05:00.000000', 1, 'available', 1),
(49, '2025-01-18', '18:05:00.000000', '18:35:00.000000', 1, 'available', 1),
(50, '2025-01-18', '18:35:00.000000', '19:05:00.000000', 1, 'available', 1),
(51, '2025-01-18', '19:05:00.000000', '19:35:00.000000', 0, 'available', 1),
(52, '2025-01-18', '19:35:00.000000', '20:05:00.000000', 0, 'available', 1),
(53, '2025-01-18', '20:05:00.000000', '20:35:00.000000', 0, 'available', 1),
(54, '2025-01-18', '20:35:00.000000', '21:05:00.000000', 0, 'available', 1),
(55, '2025-01-29', '15:00:00.000000', '15:30:00.000000', 0, 'available', 2),
(56, '2025-01-29', '15:30:00.000000', '16:00:00.000000', 0, 'available', 2),
(57, '2025-01-29', '16:00:00.000000', '16:30:00.000000', 0, 'available', 2),
(58, '2025-01-29', '16:30:00.000000', '17:00:00.000000', 0, 'available', 2),
(59, '2025-01-29', '17:00:00.000000', '17:30:00.000000', 0, 'available', 2),
(60, '2025-01-29', '17:30:00.000000', '18:00:00.000000', 0, 'available', 2),
(61, '2025-01-29', '18:00:00.000000', '18:30:00.000000', 0, 'available', 2),
(62, '2025-01-29', '18:30:00.000000', '19:00:00.000000', 0, 'available', 2),
(63, '2025-01-29', '19:00:00.000000', '19:30:00.000000', 0, 'available', 2),
(64, '2025-01-29', '19:30:00.000000', '20:00:00.000000', 0, 'available', 2),
(65, '2025-01-29', '20:00:00.000000', '20:30:00.000000', 0, 'available', 2),
(66, '2025-01-29', '20:30:00.000000', '21:00:00.000000', 0, 'available', 2),
(67, '2025-01-29', '21:00:00.000000', '21:30:00.000000', 0, 'available', 2),
(68, '2025-01-29', '21:30:00.000000', '22:00:00.000000', 0, 'available', 2),
(69, '2025-01-29', '15:00:00.000000', '15:30:00.000000', 0, 'available', 2),
(70, '2025-01-29', '15:30:00.000000', '16:00:00.000000', 0, 'available', 2),
(71, '2025-01-29', '16:00:00.000000', '16:30:00.000000', 0, 'available', 2),
(72, '2025-01-29', '16:30:00.000000', '17:00:00.000000', 0, 'available', 2),
(73, '2025-01-29', '17:00:00.000000', '17:30:00.000000', 0, 'available', 2),
(74, '2025-01-29', '17:30:00.000000', '18:00:00.000000', 0, 'available', 2),
(75, '2025-01-29', '18:00:00.000000', '18:30:00.000000', 0, 'available', 2),
(76, '2025-01-29', '18:30:00.000000', '19:00:00.000000', 0, 'available', 2),
(77, '2025-01-29', '19:00:00.000000', '19:30:00.000000', 0, 'available', 2),
(78, '2025-01-29', '19:30:00.000000', '20:00:00.000000', 0, 'available', 2),
(79, '2025-01-29', '20:00:00.000000', '20:30:00.000000', 0, 'available', 2),
(80, '2025-01-29', '20:30:00.000000', '21:00:00.000000', 0, 'available', 2),
(81, '2025-01-29', '21:00:00.000000', '21:30:00.000000', 0, 'available', 2),
(82, '2025-01-29', '21:30:00.000000', '22:00:00.000000', 0, 'available', 2),
(83, '2025-02-08', '14:00:00.000000', '14:30:00.000000', 0, 'available', 3),
(84, '2025-02-08', '14:30:00.000000', '15:00:00.000000', 1, 'available', 3),
(85, '2025-02-08', '15:00:00.000000', '15:30:00.000000', 1, 'available', 3),
(86, '2025-02-08', '15:30:00.000000', '16:00:00.000000', 0, 'available', 3),
(87, '2025-02-08', '16:00:00.000000', '16:30:00.000000', 1, 'available', 3),
(88, '2025-02-08', '16:30:00.000000', '17:00:00.000000', 0, 'available', 3),
(89, '2025-02-08', '17:00:00.000000', '17:30:00.000000', 0, 'available', 3),
(90, '2025-02-08', '17:30:00.000000', '18:00:00.000000', 0, 'available', 3),
(91, '2025-02-08', '14:00:00.000000', '14:30:00.000000', 0, 'available', 3),
(92, '2025-02-08', '14:30:00.000000', '15:00:00.000000', 0, 'available', 3),
(93, '2025-02-08', '15:00:00.000000', '15:30:00.000000', 0, 'available', 3),
(94, '2025-02-08', '15:30:00.000000', '16:00:00.000000', 0, 'available', 3),
(95, '2025-02-08', '16:00:00.000000', '16:30:00.000000', 0, 'available', 3),
(96, '2025-02-08', '16:30:00.000000', '17:00:00.000000', 0, 'available', 3),
(97, '2025-02-08', '17:00:00.000000', '17:30:00.000000', 0, 'available', 3),
(98, '2025-02-08', '17:30:00.000000', '18:00:00.000000', 0, 'available', 3),
(99, '2025-02-10', '12:10:00.000000', '12:40:00.000000', 0, 'available', 4),
(100, '2025-02-10', '12:40:00.000000', '13:10:00.000000', 0, 'available', 4),
(101, '2025-02-10', '13:10:00.000000', '13:40:00.000000', 0, 'available', 4),
(102, '2025-02-10', '13:40:00.000000', '14:10:00.000000', 0, 'available', 4),
(103, '2025-02-10', '14:10:00.000000', '14:40:00.000000', 0, 'available', 4),
(104, '2025-02-10', '14:40:00.000000', '15:10:00.000000', 0, 'available', 4),
(105, '2025-02-10', '15:10:00.000000', '15:40:00.000000', 0, 'available', 4),
(106, '2025-02-10', '15:40:00.000000', '16:10:00.000000', 0, 'available', 4),
(107, '2025-02-10', '16:10:00.000000', '16:40:00.000000', 0, 'available', 4),
(108, '2025-02-10', '12:10:00.000000', '12:40:00.000000', 0, 'available', 4),
(109, '2025-02-10', '12:40:00.000000', '13:10:00.000000', 0, 'available', 4),
(110, '2025-02-10', '13:10:00.000000', '13:40:00.000000', 0, 'available', 4),
(111, '2025-02-10', '13:40:00.000000', '14:10:00.000000', 0, 'available', 4),
(112, '2025-02-10', '14:10:00.000000', '14:40:00.000000', 0, 'available', 4),
(113, '2025-02-10', '14:40:00.000000', '15:10:00.000000', 0, 'available', 4),
(114, '2025-02-10', '15:10:00.000000', '15:40:00.000000', 0, 'available', 4),
(115, '2025-02-10', '15:40:00.000000', '16:10:00.000000', 0, 'available', 4),
(116, '2025-02-10', '16:10:00.000000', '16:40:00.000000', 0, 'available', 4),
(117, '2025-02-15', '16:14:00.000000', '16:44:00.000000', 0, 'available', 5),
(118, '2025-02-15', '16:44:00.000000', '17:14:00.000000', 0, 'available', 5),
(119, '2025-02-15', '17:14:00.000000', '17:44:00.000000', 0, 'available', 5),
(120, '2025-02-15', '17:44:00.000000', '18:14:00.000000', 0, 'available', 5),
(121, '2025-02-15', '18:14:00.000000', '18:44:00.000000', 0, 'available', 5),
(122, '2025-02-15', '18:44:00.000000', '19:14:00.000000', 0, 'available', 5),
(123, '2025-02-15', '19:14:00.000000', '19:44:00.000000', 0, 'available', 5),
(124, '2025-02-15', '19:44:00.000000', '20:14:00.000000', 0, 'available', 5),
(125, '2025-02-15', '20:14:00.000000', '20:44:00.000000', 0, 'available', 5),
(126, '2025-02-15', '20:44:00.000000', '21:14:00.000000', 0, 'available', 5),
(127, '2025-02-15', '21:14:00.000000', '21:44:00.000000', 0, 'available', 5),
(128, '2025-02-15', '21:44:00.000000', '22:14:00.000000', 0, 'available', 5),
(129, '2025-02-15', '22:14:00.000000', '22:44:00.000000', 0, 'available', 5),
(130, '2025-02-15', '16:14:00.000000', '16:44:00.000000', 0, 'available', 5),
(131, '2025-02-15', '16:44:00.000000', '17:14:00.000000', 0, 'available', 5),
(132, '2025-02-15', '17:14:00.000000', '17:44:00.000000', 0, 'available', 5),
(133, '2025-02-15', '17:44:00.000000', '18:14:00.000000', 0, 'available', 5),
(134, '2025-02-15', '18:14:00.000000', '18:44:00.000000', 0, 'available', 5),
(135, '2025-02-15', '18:44:00.000000', '19:14:00.000000', 0, 'available', 5),
(136, '2025-02-15', '19:14:00.000000', '19:44:00.000000', 0, 'available', 5),
(137, '2025-02-15', '19:44:00.000000', '20:14:00.000000', 0, 'available', 5),
(138, '2025-02-15', '20:14:00.000000', '20:44:00.000000', 0, 'available', 5),
(139, '2025-02-15', '20:44:00.000000', '21:14:00.000000', 0, 'available', 5),
(140, '2025-02-15', '21:14:00.000000', '21:44:00.000000', 0, 'available', 5),
(141, '2025-02-15', '21:44:00.000000', '22:14:00.000000', 0, 'available', 5),
(142, '2025-02-15', '22:14:00.000000', '22:44:00.000000', 0, 'available', 5),
(143, '2025-02-16', '08:00:00.000000', '08:30:00.000000', 0, 'available', 6),
(144, '2025-02-16', '08:30:00.000000', '09:00:00.000000', 0, 'available', 6),
(145, '2025-02-16', '09:00:00.000000', '09:30:00.000000', 0, 'available', 6),
(146, '2025-02-16', '09:30:00.000000', '10:00:00.000000', 0, 'available', 6),
(147, '2025-02-16', '10:00:00.000000', '10:30:00.000000', 0, 'available', 6),
(148, '2025-02-16', '10:30:00.000000', '11:00:00.000000', 0, 'available', 6),
(149, '2025-02-16', '11:00:00.000000', '11:30:00.000000', 0, 'available', 6),
(150, '2025-02-16', '11:30:00.000000', '12:00:00.000000', 0, 'available', 6),
(151, '2025-02-16', '08:00:00.000000', '08:30:00.000000', 0, 'available', 6),
(152, '2025-02-16', '08:30:00.000000', '09:00:00.000000', 0, 'available', 6),
(153, '2025-02-16', '09:00:00.000000', '09:30:00.000000', 0, 'available', 6),
(154, '2025-02-16', '09:30:00.000000', '10:00:00.000000', 0, 'available', 6),
(155, '2025-02-16', '10:00:00.000000', '10:30:00.000000', 0, 'available', 6),
(156, '2025-02-16', '10:30:00.000000', '11:00:00.000000', 0, 'available', 6),
(157, '2025-02-16', '11:00:00.000000', '11:30:00.000000', 0, 'available', 6),
(158, '2025-02-16', '11:30:00.000000', '12:00:00.000000', 0, 'available', 6),
(159, '2025-02-17', '08:00:00.000000', '08:30:00.000000', 0, 'available', 7),
(160, '2025-02-17', '08:30:00.000000', '09:00:00.000000', 0, 'available', 7),
(161, '2025-02-17', '09:00:00.000000', '09:30:00.000000', 0, 'available', 7),
(162, '2025-02-17', '09:30:00.000000', '10:00:00.000000', 0, 'available', 7),
(163, '2025-02-17', '10:00:00.000000', '10:30:00.000000', 0, 'available', 7),
(164, '2025-02-17', '10:30:00.000000', '11:00:00.000000', 0, 'available', 7),
(165, '2025-02-17', '11:00:00.000000', '11:30:00.000000', 0, 'available', 7),
(166, '2025-02-17', '11:30:00.000000', '12:00:00.000000', 0, 'available', 7),
(167, '2025-02-17', '08:00:00.000000', '08:30:00.000000', 0, 'available', 7),
(168, '2025-02-17', '08:30:00.000000', '09:00:00.000000', 0, 'available', 7),
(169, '2025-02-17', '09:00:00.000000', '09:30:00.000000', 0, 'available', 7),
(170, '2025-02-17', '09:30:00.000000', '10:00:00.000000', 0, 'available', 7),
(171, '2025-02-17', '10:00:00.000000', '10:30:00.000000', 0, 'available', 7),
(172, '2025-02-17', '10:30:00.000000', '11:00:00.000000', 0, 'available', 7),
(173, '2025-02-17', '11:00:00.000000', '11:30:00.000000', 0, 'available', 7),
(174, '2025-02-17', '11:30:00.000000', '12:00:00.000000', 0, 'available', 7),
(175, '2025-02-18', '08:00:00.000000', '08:30:00.000000', 0, 'available', 8),
(176, '2025-02-18', '08:30:00.000000', '09:00:00.000000', 0, 'available', 8),
(177, '2025-02-18', '09:00:00.000000', '09:30:00.000000', 0, 'available', 8),
(178, '2025-02-18', '09:30:00.000000', '10:00:00.000000', 0, 'available', 8),
(179, '2025-02-18', '10:00:00.000000', '10:30:00.000000', 0, 'available', 8),
(180, '2025-02-18', '10:30:00.000000', '11:00:00.000000', 0, 'available', 8),
(181, '2025-02-18', '11:00:00.000000', '11:30:00.000000', 0, 'available', 8),
(182, '2025-02-18', '11:30:00.000000', '12:00:00.000000', 0, 'available', 8),
(183, '2025-02-18', '08:00:00.000000', '08:30:00.000000', 0, 'available', 8),
(184, '2025-02-18', '08:30:00.000000', '09:00:00.000000', 0, 'available', 8),
(185, '2025-02-18', '09:00:00.000000', '09:30:00.000000', 0, 'available', 8),
(186, '2025-02-18', '09:30:00.000000', '10:00:00.000000', 0, 'available', 8),
(187, '2025-02-18', '10:00:00.000000', '10:30:00.000000', 0, 'available', 8),
(188, '2025-02-18', '10:30:00.000000', '11:00:00.000000', 0, 'available', 8),
(189, '2025-02-18', '11:00:00.000000', '11:30:00.000000', 0, 'available', 8),
(190, '2025-02-18', '11:30:00.000000', '12:00:00.000000', 0, 'available', 8),
(191, '2025-02-19', '08:00:00.000000', '08:30:00.000000', 0, 'available', 9),
(192, '2025-02-19', '08:30:00.000000', '09:00:00.000000', 0, 'available', 9),
(193, '2025-02-19', '09:00:00.000000', '09:30:00.000000', 0, 'available', 9),
(194, '2025-02-19', '09:30:00.000000', '10:00:00.000000', 0, 'available', 9),
(195, '2025-02-19', '10:00:00.000000', '10:30:00.000000', 0, 'available', 9),
(196, '2025-02-19', '10:30:00.000000', '11:00:00.000000', 0, 'available', 9),
(197, '2025-02-19', '11:00:00.000000', '11:30:00.000000', 0, 'available', 9),
(198, '2025-02-19', '11:30:00.000000', '12:00:00.000000', 0, 'available', 9),
(199, '2025-02-19', '08:00:00.000000', '08:30:00.000000', 0, 'available', 9),
(200, '2025-02-19', '08:30:00.000000', '09:00:00.000000', 0, 'available', 9),
(201, '2025-02-19', '09:00:00.000000', '09:30:00.000000', 0, 'available', 9),
(202, '2025-02-19', '09:30:00.000000', '10:00:00.000000', 0, 'available', 9),
(203, '2025-02-19', '10:00:00.000000', '10:30:00.000000', 0, 'available', 9),
(204, '2025-02-19', '10:30:00.000000', '11:00:00.000000', 0, 'available', 9),
(205, '2025-02-19', '11:00:00.000000', '11:30:00.000000', 0, 'available', 9),
(206, '2025-02-19', '11:30:00.000000', '12:00:00.000000', 0, 'available', 9);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_app_user`
--

DROP TABLE IF EXISTS `doctor_app_user`;
CREATE TABLE IF NOT EXISTS `doctor_app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `age` varchar(3) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  `utype` varchar(10) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_app_user`
--

INSERT INTO `doctor_app_user` (`id`, `name`, `phone_number`, `age`, `email`, `password`, `utype`, `image`) VALUES
(1, 'nikhil', '9567920682', '24', 'n@gmail.com', '123', 'user', 'users/anna.jpg'),
(2, 'sree', '9567980982', '24', 'sree@gmail.com', '123', 'user', 'doctors/anna.jpg'),
(3, 'ammu', '9567980982', '24', 'ammu@gmail.com', '123', 'user', 'doctors/anna.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
