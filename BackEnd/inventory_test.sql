-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2022 at 10:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_profile`
--

CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `canApproveInventory` tinyint(1) NOT NULL,
  `canDistributeInventory` tinyint(1) NOT NULL,
  `canApproveLeave` tinyint(1) NOT NULL,
  `canManageAsset` tinyint(1) NOT NULL,
  `image` longtext NOT NULL,
  `phone1` bigint(20) UNSIGNED DEFAULT NULL,
  `phone2` bigint(20) UNSIGNED DEFAULT NULL,
  `type` smallint(5) UNSIGNED NOT NULL CHECK (`type` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_profile`
--

INSERT INTO `accounts_profile` (`id`, `supervisor_id`, `user_id`, `canApproveInventory`, `canDistributeInventory`, `canApproveLeave`, `canManageAsset`, `image`, `phone1`, `phone2`, `type`) VALUES
(1, 1, 1, 1, 0, 1, 1, '', 0, 0, 0),
(2, 1, 2, 1, 1, 0, 1, '', 0, 0, 0),
(3, 1, 3, 0, 1, 0, 0, '', 0, 0, 0),
(6, NULL, 7, 0, 0, 0, 0, '', 1877654986, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `asset_asset`
--

CREATE TABLE `asset_asset` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `purchaseDate` datetime(6) NOT NULL,
  `warranty` bigint(20) UNSIGNED NOT NULL CHECK (`warranty` >= 0),
  `creationDate` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL CHECK (`type` >= 0),
  `status` smallint(5) UNSIGNED NOT NULL CHECK (`status` >= 0),
  `user_id` int(11) NOT NULL,
  `next_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset_asset`
--

INSERT INTO `asset_asset` (`id`, `name`, `model`, `serial`, `purchaseDate`, `warranty`, `creationDate`, `description`, `type`, `status`, `user_id`, `next_user_id`) VALUES
(1, 'HP Laptop', 'HP Probook G4', 'ABCD1234', '2021-01-20 00:00:00.000000', 1094, '2021-10-05 11:31:53.748374', 'It\'s a laptop', 2, 0, 2, NULL),
(2, 'Dell Desktop', 'Dell Optiplex', 'ABCD1234', '2021-01-19 00:00:00.000000', 1096, '2021-10-05 11:33:15.213076', 'It\'s a desktop', 1, 0, 2, NULL),
(3, 'Epson Color Printer', 'L565', 'ABCD1234', '2021-01-01 00:00:00.000000', 120, '2021-10-06 10:07:08.977057', 'Color printer', 3, 0, 3, NULL),
(4, 'HP Printer', '505dw', 'ABCD1234', '2021-01-01 00:00:00.000000', 90, '2021-10-06 10:15:20.846778', 'Laser black printer', 3, 0, 1, NULL),
(5, 'Clone Desktop PC', 'Core i7', 'ABCD1234', '2021-01-01 00:00:00.000000', 365, '2021-10-06 10:20:54.600401', 'Clone PC', 1, 0, 3, NULL),
(6, 'Network Access Switch', 'C9200L-48P-4X-E', 'ABCD1234', '2021-01-01 00:00:00.000000', 1095, '2021-10-06 14:51:06.860524', 'Distribution Switch', 0, 0, 3, NULL),
(7, 'Core Router', 'Cisco Catalyst 8500', 'ABCD1234', '2021-01-01 00:00:00.000000', 365, '2021-10-07 15:23:59.491737', 'Core network router', 0, 0, 1, NULL),
(11, 'TESTTEST1', 'TESTTEST1', 'TESTTEST14321', '2021-01-17 00:00:00.000000', 120, '2022-01-20 12:34:29.645103', 'ABCD 1234', 0, 2, 3, 2),
(12, 'Angular Asset 1', 'ANG', 'ANG1', '2022-02-14 06:00:00.000000', 0, '2022-02-14 16:22:07.002814', '', 0, 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_assethistory`
--

CREATE TABLE `asset_assethistory` (
  `id` bigint(20) NOT NULL,
  `creationDate` datetime(6) NOT NULL,
  `asset_id` bigint(20) NOT NULL,
  `fromUser_id` int(11) NOT NULL,
  `toUser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset_assethistory`
--

INSERT INTO `asset_assethistory` (`id`, `creationDate`, `asset_id`, `fromUser_id`, `toUser_id`) VALUES
(1, '2021-10-06 10:15:20.947326', 4, 1, 1),
(2, '2021-10-06 10:20:54.633925', 5, 1, 1),
(3, '2021-10-06 14:51:06.897203', 6, 1, 1),
(4, '2021-10-07 15:23:59.519948', 7, 1, 1),
(5, '2021-10-07 15:27:37.114333', 7, 1, 1),
(6, '2021-10-07 15:28:21.503225', 1, 1, 2),
(7, '2021-10-07 15:28:34.276023', 5, 1, 3),
(9, '2022-01-20 12:34:30.131462', 11, 1, 1),
(10, '2022-01-20 15:04:41.779460', 3, 1, 1),
(11, '2022-02-14 16:22:07.154225', 12, 1, 1),
(12, '2022-02-17 10:46:48.873837', 12, 1, 2),
(13, '2022-02-17 10:48:49.259764', 11, 1, 3),
(14, '2022-03-03 15:41:57.714174', 12, 2, 3),
(15, '2022-03-06 16:19:23.720323', 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('5b236ea28580facc84fb0f7297f07ef5f725b985', '2022-03-13 15:18:22.579551', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add inventory', 8, 'add_inventory'),
(30, 'Can change inventory', 8, 'change_inventory'),
(31, 'Can delete inventory', 8, 'delete_inventory'),
(32, 'Can view inventory', 8, 'view_inventory'),
(33, 'Can add requisition', 9, 'add_requisition'),
(34, 'Can change requisition', 9, 'change_requisition'),
(35, 'Can delete requisition', 9, 'delete_requisition'),
(36, 'Can view requisition', 9, 'view_requisition'),
(37, 'Can add leave', 10, 'add_leave'),
(38, 'Can change leave', 10, 'change_leave'),
(39, 'Can delete leave', 10, 'delete_leave'),
(40, 'Can view leave', 10, 'view_leave'),
(41, 'Can add asset', 11, 'add_asset'),
(42, 'Can change asset', 11, 'change_asset'),
(43, 'Can delete asset', 11, 'delete_asset'),
(44, 'Can view asset', 11, 'view_asset'),
(45, 'Can add asset history', 12, 'add_assethistory'),
(46, 'Can change asset history', 12, 'change_assethistory'),
(47, 'Can delete asset history', 12, 'delete_assethistory'),
(48, 'Can view asset history', 12, 'view_assethistory'),
(49, 'Can add Token', 13, 'add_token'),
(50, 'Can change Token', 13, 'change_token'),
(51, 'Can delete Token', 13, 'delete_token'),
(52, 'Can view Token', 13, 'view_token'),
(53, 'Can add token', 14, 'add_tokenproxy'),
(54, 'Can change token', 14, 'change_tokenproxy'),
(55, 'Can delete token', 14, 'delete_tokenproxy'),
(56, 'Can view token', 14, 'view_tokenproxy'),
(57, 'Can add route user', 15, 'add_routeuser'),
(58, 'Can change route user', 15, 'change_routeuser'),
(59, 'Can delete route user', 15, 'delete_routeuser'),
(60, 'Can view route user', 15, 'view_routeuser'),
(61, 'Can add route', 16, 'add_route'),
(62, 'Can change route', 16, 'change_route'),
(63, 'Can delete route', 16, 'delete_route'),
(64, 'Can view route', 16, 'view_route');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$Wjptq2C600kcx62LRvEL0j$VNefonq6hIwfJvrWBAZroZGXLFS73w2hn9/V7sUEmgI=', '2022-06-19 11:08:38.724287', 1, 'shoaib.rahman', 'Mina Shoaib', 'Rahman', 'shoaib.rahman@beza.gov.bd', 1, 1, '2021-09-08 06:13:19.000000'),
(2, 'pbkdf2_sha256$320000$S0fecXlZ5tZjVl5tV0uQJ0$rKZGVsqPD/fWDzaYGFcNv0DylOCFA2Kv/zWTgkXtvvo=', '2022-03-06 16:33:03.803476', 0, 'test1', 'Test', '1', '', 0, 1, '2021-09-08 06:14:00.148304'),
(3, 'pbkdf2_sha256$320000$6tirxmwSreT6bl5fogNRPN$jsfCh9M0H+c6eF9BDZPa7EQxpoksAaMEfUrEP/G9kfE=', '2022-03-06 16:33:14.402849', 0, 'test2', 'Test', '2', '', 0, 1, '2021-09-08 08:51:27.557734'),
(7, 'pbkdf2_sha256$320000$UALbbTJrw9NIi9kGCNBovh$oZtWkOEOP6/CtVtkdLgkBwzyhDyl9JixUKy+wCRmFpg=', NULL, 0, 'driver.hanif', 'Md.', 'Hanif', '', 0, 1, '2022-06-19 10:47:06.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-09-15 12:10:49.524600', '1', 'shoaib.rahman', 2, '[{\"changed\": {\"fields\": [\"CanApproveInventory\"]}}]', 7, 1),
(2, '2021-09-15 12:10:55.389155', '2', 'test1', 2, '[{\"changed\": {\"fields\": [\"CanDistributeInventory\"]}}]', 7, 1),
(3, '2021-09-20 10:05:04.042650', '1', 'shoaib.rahman', 2, '[{\"changed\": {\"fields\": [\"CanApproveLeave\"]}}]', 7, 1),
(4, '2021-09-20 14:23:50.561695', '1', 'shoaib.rahman', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(5, '2021-10-05 10:02:19.583167', '1', 'shoaib.rahman', 2, '[{\"changed\": {\"fields\": [\"CanManageAsset\"]}}]', 7, 1),
(6, '2021-10-05 11:35:23.069733', '1', 'HP Laptop', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(7, '2021-10-05 11:35:33.673451', '2', 'Dell Desktop', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(8, '2022-02-22 16:09:03.942884', '3', 'Test 2', 2, '[{\"changed\": {\"fields\": [\"CanDistributeInventory\"]}}]', 7, 1),
(9, '2022-03-01 17:10:11.234424', '3', 'Test 2', 2, '[{\"changed\": {\"fields\": [\"Supervisor\"]}}]', 7, 1),
(10, '2022-03-02 13:54:29.727546', '8', 'Leave object (8)', 3, '', 10, 1),
(11, '2022-03-06 16:15:57.008981', '2', 'Test 1', 2, '[{\"changed\": {\"fields\": [\"CanApproveInventory\"]}}]', 7, 1),
(12, '2022-03-06 16:17:05.360247', '2', 'Test 1', 2, '[{\"changed\": {\"fields\": [\"CanManageAsset\"]}}]', 7, 1),
(13, '2022-06-19 10:47:06.412195', '7', 'driver.hanif', 1, '[{\"added\": {}}]', 4, 1),
(14, '2022-06-19 10:47:58.193412', '7', 'driver.hanif', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(15, '2022-06-19 10:48:07.763876', '6', 'Md. Hanif', 2, '[{\"changed\": {\"fields\": [\"Type\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'accounts', 'profile'),
(1, 'admin', 'logentry'),
(11, 'asset', 'asset'),
(12, 'asset', 'assethistory'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(13, 'authtoken', 'token'),
(14, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(16, 'driver', 'route'),
(15, 'driver', 'routeuser'),
(8, 'inventory', 'inventory'),
(9, 'inventory', 'requisition'),
(10, 'leave', 'leave'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-08 06:12:34.112380'),
(2, 'auth', '0001_initial', '2021-09-08 06:12:41.432030'),
(3, 'accounts', '0001_initial', '2021-09-08 06:12:43.406783'),
(4, 'accounts', '0002_alter_profile_supervisor', '2021-09-08 06:12:43.453597'),
(5, 'accounts', '0003_alter_profile_supervisor', '2021-09-08 06:12:44.690984'),
(6, 'accounts', '0004_auto_20210830_1220', '2021-09-08 06:12:45.913181'),
(7, 'admin', '0001_initial', '2021-09-08 06:12:47.575828'),
(8, 'admin', '0002_logentry_remove_auto_add', '2021-09-08 06:12:47.645385'),
(9, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-08 06:12:47.690432'),
(10, 'contenttypes', '0002_remove_content_type_name', '2021-09-08 06:12:48.218525'),
(11, 'auth', '0002_alter_permission_name_max_length', '2021-09-08 06:12:49.032180'),
(12, 'auth', '0003_alter_user_email_max_length', '2021-09-08 06:12:49.138797'),
(13, 'auth', '0004_alter_user_username_opts', '2021-09-08 06:12:49.166851'),
(14, 'auth', '0005_alter_user_last_login_null', '2021-09-08 06:12:49.621120'),
(15, 'auth', '0006_require_contenttypes_0002', '2021-09-08 06:12:49.661677'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2021-09-08 06:12:49.813329'),
(17, 'auth', '0008_alter_user_username_max_length', '2021-09-08 06:12:50.070035'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2021-09-08 06:12:50.161903'),
(19, 'auth', '0010_alter_group_name_max_length', '2021-09-08 06:12:50.272178'),
(20, 'auth', '0011_update_proxy_permissions', '2021-09-08 06:12:50.319551'),
(21, 'auth', '0012_alter_user_first_name_max_length', '2021-09-08 06:12:50.397860'),
(22, 'inventory', '0001_initial', '2021-09-08 06:12:53.076639'),
(23, 'inventory', '0002_alter_inventory_count', '2021-09-08 06:12:53.181813'),
(24, 'inventory', '0003_auto_20210908_1211', '2021-09-08 06:12:53.969797'),
(25, 'sessions', '0001_initial', '2021-09-08 06:12:54.387260'),
(26, 'inventory', '0004_auto_20210914_1247', '2021-09-14 06:47:37.729482'),
(27, 'inventory', '0005_auto_20210914_1556', '2021-09-14 09:57:07.417713'),
(28, 'inventory', '0005_auto_20210914_1610', '2021-09-14 16:10:11.176189'),
(29, 'inventory', '0005_auto_20210914_1618', '2021-09-14 16:18:14.300757'),
(30, 'accounts', '0005_auto_20210915_1209', '2021-09-15 12:09:55.033544'),
(31, 'accounts', '0006_profile_canapproveleave', '2021-09-19 12:17:12.638907'),
(32, 'leave', '0001_initial', '2021-09-19 12:56:16.929889'),
(33, 'leave', '0002_alter_leave_approvedate', '2021-09-19 14:36:02.139989'),
(34, 'leave', '0003_auto_20210924_1127', '2021-09-30 10:19:05.215864'),
(35, 'accounts', '0007_profile_canmanageasset', '2021-10-05 10:02:06.065306'),
(36, 'asset', '0001_initial', '2021-10-05 10:54:29.367929'),
(37, 'leave', '0004_alter_leave_id', '2021-10-05 10:54:30.101548'),
(38, 'asset', '0002_auto_20211005_1127', '2021-10-05 11:27:28.288363'),
(39, 'asset', '0003_alter_asset_type', '2021-10-05 11:28:09.316172'),
(40, 'asset', '0002_auto_20211005_1129', '2021-10-05 11:29:55.103078'),
(41, 'asset', '0003_assethistory', '2021-10-06 09:57:22.247800'),
(42, 'asset', '0004_auto_20211006_1217', '2021-10-06 12:17:14.970293'),
(43, 'asset', '0004_auto_20211006_1230', '2021-10-06 12:38:27.957951'),
(44, 'asset', '0005_remove_asset_approved', '2021-10-06 14:47:47.027729'),
(45, 'accounts', '0008_alter_profile_user', '2022-01-20 12:55:39.420586'),
(46, 'accounts', '0009_alter_profile_user', '2022-01-20 13:05:22.104168'),
(47, 'asset', '0006_auto_20220125_1824', '2022-02-06 14:52:27.873223'),
(48, 'asset', '0007_alter_asset_id_alter_assethistory_id', '2022-02-06 14:52:31.117464'),
(49, 'leave', '0005_auto_20220125_1824', '2022-02-06 14:52:31.841008'),
(50, 'leave', '0006_alter_leave_id', '2022-02-06 14:52:33.045579'),
(51, 'authtoken', '0001_initial', '2022-02-06 16:53:52.848854'),
(52, 'authtoken', '0002_auto_20160226_1747', '2022-02-06 16:53:52.941460'),
(53, 'authtoken', '0003_tokenproxy', '2022-02-06 16:53:52.961648'),
(54, 'accounts', '0008_profile_image_profile_phone1_profile_phone2_and_more', '2022-06-16 15:00:14.351093'),
(55, 'asset', '0008_alter_asset_type', '2022-06-16 15:27:04.308047'),
(56, 'driver', '0001_initial', '2022-06-16 15:29:14.061586'),
(57, 'accounts', '0009_alter_profile_phone1_alter_profile_phone2', '2022-06-19 10:46:51.964034'),
(58, 'accounts', '0010_profile_canmanagedriver', '2022-06-19 10:51:55.281848'),
(59, 'driver', '0002_alter_route_car_alter_route_driver', '2022-06-21 15:41:29.845680'),
(60, 'accounts', '0011_remove_profile_canmanagedriver', '2022-12-27 15:01:36.098760');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('00uyxeldtag7cxs9x34wanvfvganovqg', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGw3f:BMEqeUmQILQh2Efo7lvspGd_5DDqT39szGLj06qiMD4', '2022-02-21 10:55:23.322063'),
('0c4ci2w78zc8bs8wfw8urai9kasfbljc', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1o2nAs:ILkrqJ8ersApWXGDNGvBZWivLeafT_tKhFfZ39H_-LE', '2022-07-03 11:08:38.771917'),
('12xtr7dqb5lhgha6rmvci05ulscmkczj', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHNv3:5b5cNPSyH4bBREDtOZpgXZxia-dTVoYqaqDrT9BGEEg', '2022-02-22 16:40:21.774211'),
('1cz02u2c3wtefebapcpwpolnsxkod2ww', 'e30:1nGx7I:6Q7u617tDixMUqsRw4WqweN01bG2KRi8exTR16-fqFw', '2022-02-21 12:03:12.500422'),
('1imo16s36vd1atrvl3ushamcugh8asru', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZGagUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSpiwuQovT70bIj9J2kO_YbrPkua3LRHJX5EG7HOZcntfD_Tuo2Ou3Do4BqOhz8KDBmsIRXbAelOFACkarAb3jXEyOhrRnq0L0DpBH5SmL9we9bzc3:1n9OEN:YWZ1DgcMJJykCQiIobhmjbXpiS-tlJ14KU1AhUCv_LI', '2022-01-31 15:23:15.201054'),
('1knsfbdjlj3pej6uj1p4ohjqg7a9eafg', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nPi7W:JyNGKBUHzD4g4tNapKvPWReESDx_RqwoyWeLGXi9rNw', '2022-03-17 15:51:38.937170'),
('1ttye71r6dgksxcpillp9kebsv4wtigj', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nQoBN:0cFTf8TUnXXi3RWmrgRG25z7QFPwZ1OvyJCS6PHVpEU', '2022-03-20 16:32:09.930823'),
('274ltht5by98vgbllhhlxha861embzn2', '.eJxVjDsOwjAQBe_iGllZ_3ZDSc8ZrPXaIQEUS3FSIe4OkVJA-2bmvVTkbR3j1soSp6zOCtTpd0ssjzLvIN95vlUtdV6XKeld0Qdt-lpzeV4O9-9g5DZ-6y6gcZ4wMBAw2CEkI9xbkmIzie-hI8SOHaIjygawcBiCBS8wFDLq_QGxLDbA:1nJ8i9:SapbGMRBoMpalY2JZzX8I3HEAiWxe6xhjSY9qfbgeHs', '2022-02-27 12:50:17.770641'),
('2rci601v5d167j09jzv1ozuyja8fqwzv', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nPJlY:x3cIibk2xtt3POoJXOWeV2EMAA5gGKF9AWnG15C49Vw', '2022-03-16 13:51:20.770541'),
('2vlom9a8d89fd8o69qdwpyru1kqrabvo', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHfP1:UB7I9gUuhC2effFBar2e1lqeApbr1gO1Meny_DGUWaU', '2022-02-23 11:20:27.591293'),
('35v0f5zilii9vto10cl5uvki0177mnrk', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGzKk:POyD_t2FKAcOaJhovSaLYhyL6vXuRlp1RIIJcIa2ccs', '2022-02-21 14:25:14.834598'),
('36jkuvzs13i8x35km66v3m69dktepto0', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKYiR:Wkiwu1xx6cTSlsgizKH4lC0J_uMS9fIYO5_viCzSjL0', '2022-03-03 10:48:27.126844'),
('394hwa3z99xses4d2dg9fqj3bo4m9mlm', 'e30:1nGxIa:qfKH77IR1V_-s1Zw5vC9CdH1iOKUSicwHNy16PyfTRU', '2022-02-21 12:14:52.920908'),
('3b0kfjav8sjt43169z6juqkd4gxtmifu', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKXiH:Lp4vpCrLSVCA3Fjcd3KSMK38B_PLMCJZS7Io7SRydw0', '2022-03-03 09:44:13.672441'),
('3fi7xxwqhg3ibx3opnmcgctr78jql9d8', '.eJxVjDsOwjAQBe_iGlnrD3ZCSZ8zRLveNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1UUadfjfC9JC6A75jvc06zXVdJtK7og_a9DCzPK-H-3dQsJVv7dn1vZNs0KMBIhYGhEwexIZIzkA0kMGn1MVgmHJnJXigAC7ms83q_QHuRjfg:1mu9CU:rBKxMSnkjOovorvY1LaMTlUvE69VLTmGSO6Heira2ZU', '2021-12-20 14:18:18.450946'),
('3utn2522c1hqxernom0aavft18xrvqny', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKaBd:OMbX7-ru31dFas9EgUM2E7MxNOuuuqvEPw-6IQgkCrg', '2022-03-03 12:22:41.477734'),
('3y3wnl17uvtiwhefwmkrje6bsx0gjvei', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGy3J:foi7iLpPQUZLgPKQ39WSkL0IBZbwH0taeMwXyJZyPWo', '2022-02-21 13:03:09.890985'),
('44ko66vf303yq81hwgxpbmbnwmztw2qn', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nPIzG:PnQ-aA5_8HwOqZ0L0sNUtogUSWxgh-l8bErimL_tqXI', '2022-03-16 13:01:26.969531'),
('47xgnra3pg8rgeh239na8j7aumtldodf', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGzOg:oOrrLFiiJZmko9oFBQJPf8WBVuQYUxRh80vWiQfaHTk', '2022-02-21 14:29:18.042980'),
('4klzedohcuv2jsmasoy5isywbjb851cc', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGymm:cMiRH8gymDHJcC4g3KEb4y-pXKTUIkiemhYQ83OZyko', '2022-02-21 13:50:08.780216'),
('5w7z373h11cqc9r49923xvq9nzjvu5w8', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZGagUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSpiwuQovT70bIj9J2kO_YbrPkua3LRHJX5EG7HOZcntfD_Tuo2Ou3Do4BqOhz8KDBmsIRXbAelOFACkarAb3jXEyOhrRnq0L0DpBH5SmL9we9bzc3:1n9OEt:TR1u0AQA0YkpUcR7DFo6XBl_m3xbQAaMBV-qUYnsUgg', '2022-01-31 15:23:47.681121'),
('61t7z7z5c1pd3zy87hh5y6rg8hiwytgo', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKBvZ:GPFr5WZPTN4NUuStVsxPaoNpQ_bbl5CEFrKjcP-DMKM', '2022-03-02 10:28:29.225590'),
('620h189pus1ppaar0bynisd3qwgzjdi3', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nQoBy:vhwXlPtAgu2SI-VbKObTKkhfL38So9dF3ARXocxEKHU', '2022-03-20 16:32:46.103334'),
('6afqjwsjy21p7u5yhrsq2teisruceb8x', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKaEQ:3aA2xoIUnlWiWT8ALNFg7L9UN6ArKjLR38x0JP20olg', '2022-03-03 12:25:34.514410'),
('6al8w7b9lqppu89bhzddg0m42qhbfp5g', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nJSdQ:uEUExAPN7WtIkHVM6eViVahH4Ke9WJGWHih2aau23b0', '2022-02-28 10:06:44.614707'),
('6b736kd14d4e8xrcjkzhnd2myc0bqxjn', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nH0yA:wq7u5eTITPRcYLrdJ06o6sqwRhoT3sWe7HGk33xslXQ', '2022-02-21 16:10:02.716045'),
('6cagyvibqc3uagfyftf8dqf5vv62trcw', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKC22:DBKHgfkbAMdvxszb3LbCWKC5V_aI5XTA4mjgmsbI-QM', '2022-03-02 10:35:10.949556'),
('6i0myy225njp24dh1r4xmetcdfa62873', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKaAL:QfjBxaLbyRZOmkFqd7mIxFCO2UgFGnTredZU3lDyPcI', '2022-03-03 12:21:21.201209'),
('6ju5icepno8nxqxytqzr5ug3yu194dz1', '.eJxVjDsOwjAQBe_iGlnrD3ZCSZ8zRLveNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1UUadfjfC9JC6A75jvc06zXVdJtK7og_a9DCzPK-H-3dQsJVv7dn1vZNs0KMBIhYGhEwexIZIzkA0kMGn1MVgmHJnJXigAC7ms83q_QHuRjfg:1miBK7:1zLVi02wMZGDG2W8LL3Gtc75oXo7rl-_Yid5O67j_fo', '2021-11-17 14:08:43.210361'),
('7blrkjzhkdub5iyxb3jti6y9iny3fw3w', '.eJwNyEESgCAIAMC_-ALFQOwzDoKM58xT099rj_uEJvueba9xtSlrhjNkNSdCSKJQSPxgwEQRpUvUOpxiT1hMoQv94z7Y2U05k3HFGt4PoYoaOA:1nJ8iX:m7dKaXHJVY9aIgPXCSZMxRloLz2vY4LSxUMlC6bmwnk', '2022-02-27 12:50:41.741737'),
('7cg6ydbmsfy7dxa6lezp98q93vupi4px', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKEMH:bHhInrhU7NJmqFJs4vE8onX73KlNDd6P5J6yp0VX8tk', '2022-03-02 13:04:13.921662'),
('7fvemr61vbudvgufuzyvpxexvywje3o5', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nKXiW:SLwdw3hnzGKooEZ2wUhFdEwSZ_EoRxU4W6n6fuklTaM', '2022-03-03 09:44:28.051319'),
('7mjd33omu79p8507b73n3juh6ix0udso', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKYkC:sPZZ0L4VjSBl1YMO4iIkeCbEs2RHUZblkw2iNKlN-qI', '2022-03-03 10:50:16.958929'),
('7mznwjkbpxi9cquf66byw5dlya92433f', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nH0q3:oz5rlu_qizwJmEyy9tJvjfxhflB5iNbdXsgHjeop9sE', '2022-02-21 16:01:39.849872'),
('7r1x0j8wnb4b14tmuj3w3m940l75wqun', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKcU3:OIa66Ja367mvdU_6RM-Xf6A4Z6D73pl3U8TLFs5lDhg', '2022-03-03 14:49:51.153243'),
('8hd9jqcp1dy9k58bgymo0u0m4e3okl4u', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nTKMo:v9NfxFylj3mtqOvpRACELk15CtLpavMrAx9EwW46F2I', '2022-03-27 15:18:22.625275'),
('8mkk0yv73tckfbdgoij4ung3o8hf5x7n', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nQoCQ:lJ1GCYTBoHhySgasSiePaxi94Bk4ygeHcaHjgMPm_aM', '2022-03-20 16:33:14.453847'),
('8oukdwj0v9k18vl2pvupqhnxmr5fsfop', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKaAi:IugbqeiLg_Gm9gWza_7UYsWpUtitVs5U8t8u8GR0ESg', '2022-03-03 12:21:44.995159'),
('9opl9a1ealm45lk9bcjvvc9b08p574ky', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nJuee:bKv92zNaGGsd4_i3BWVrWZecsjcH7w95hEqez2b0H9I', '2022-03-01 16:01:52.819044'),
('9wmgkyxgqg7jjflyvjkv8fbe3f22nf3f', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKFAC:r36STWsWKUngvUtapfHmX16qcKtv9mKejvDzDnhV4wc', '2022-03-02 13:55:48.502826'),
('abzw4nxpsi8rwzy9lhli2bl7q3wh1loo', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nKa8w:FriS3w0MjLuRkgHfAhBkyBuJcaQS7IXfQIrqIvFQnqk', '2022-03-03 12:19:54.279648'),
('aic4ct219dmkfv1dnfwqu1zdhe7l0ek9', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nH0MN:sDwcqUylfrqnL3M4v5V9Q2yPyBIukn41MlhQO8UI2gE', '2022-02-21 15:30:59.232539'),
('as31jz20e9mx0gq4426qjeormwa2abjj', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nP0Oa:02WFmMQiPchhDqxxKvNZ8siIBXJqVWdt0V2wR87_L14', '2022-03-15 17:10:20.304144'),
('avcz7q4nej2d84gafyizwzgo07m5smv1', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGzSD:ZVzAcApFcim3AxB3ZAgTwWYzJFG_3I_eFF3DeMNpFxk', '2022-02-21 14:32:57.124939'),
('avhccjx9aetdlyw3b8im845schhsivc0', '.eJwNybkNgDAMAMBdMoGfPDbLRFbsKDWBCrE7XHtP6nZfq987zr5sr3QkroOz0RBULJUyqoBAm6YuE0Uy67DpAAwRpbA3iP9VyN0rlfR-YLUYYQ:1nI5Vr:9nmWryvNNfIxLR00nHrtsZGDuzVsOrW3U-sbjmpsgFI', '2022-02-24 15:13:15.336298'),
('b081beszl8nn4qsixi35q30nepuy9n7g', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nQoBm:ykjlOoHty4l_MaDXGxt9WpQcfp2Ohou6AZQzt2E4L-0', '2022-03-20 16:32:34.369385'),
('b20tivrv6pcr577j4sxm3n6olnlo1b7n', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKEKv:12DEpEvaJsqnAQ2Zr4CRDmtRfHnSvi6sI_JNJdzLLr8', '2022-03-02 13:02:49.877868'),
('bw7e90no3suljl4p71cip8pxcccbut5a', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nKYik:87xixlcpGLi8SxDLLbC6jWCJJr_GQogyiUeJDC_dyUU', '2022-03-03 10:48:46.403402'),
('ck7113xd9hoyvsk30b99bvzpkdbgae0z', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHNsn:2Rcayqe4Bu-S7koTUnJDj0-QvOGJlZme_Z5BGOMMHNY', '2022-02-22 16:38:01.591470'),
('cut7pfanjpvnqoeyquwjuvn2s8zb29pi', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nQnvA:0NmcEYZSwaCLcXQ2Ky8Q7z1jF5YB8edmuYMKvk422XU', '2022-03-20 16:15:24.628348'),
('cy9rcjyhmytxz8h2j5uvz8fuo40wb0cd', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKERw:BBtP68UPkjS3_QwVoFAgryyiLYjOWQuUge_5zJj6gnQ', '2022-03-02 13:10:04.876514'),
('df5x0f9299np9nxxz35zugfxilp5hyf3', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nQnyq:ipucJ7OEt6WgFgHTWioeF2QfyfVW1_9wLN0VhUnDRpI', '2022-03-20 16:19:12.705752'),
('dfcvfbq2nlyu2mujag763hbszsssovsr', '.eJxVjDsOwjAQBe_iGlnrD3ZCSZ8zRLveNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1UUadfjfC9JC6A75jvc06zXVdJtK7og_a9DCzPK-H-3dQsJVv7dn1vZNs0KMBIhYGhEwexIZIzkA0kMGn1MVgmHJnJXigAC7ms83q_QHuRjfg:1mY1zx:-MC7HL3_D0vVxcvUZcPJIFOw5Nx6LKkxya0BDl_Q9gk', '2021-10-20 14:09:57.229584'),
('dub6mxcpqmmxebrk6ql2j8vy8fx5b3d2', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nQoCF:gxbEqVMW3KA_TAwWaXZYssin8B2444t2Y00tY8IXkeE', '2022-03-20 16:33:03.869064'),
('e6110l050u9c2wy9ahb3uwydf47o9pmw', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZGagUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSpiwuQovT70bIj9J2kO_YbrPkua3LRHJX5EG7HOZcntfD_Tuo2Ou3Do4BqOhz8KDBmsIRXbAelOFACkarAb3jXEyOhrRnq0L0DpBH5SmL9we9bzc3:1n9OFJ:0E0QqQgJAKYI29z6TXZzKzCNYyIhZ2i6eAPYS8q7GLk', '2022-01-31 15:24:13.451608'),
('ea8u0i109l11ehpf04c9p0j769v8m2s8', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nMkBJ:AdkwJYKs_K5bmqlQiOCWFopJDQWF80lZPeMna6qoJSE', '2022-03-09 11:27:17.797358'),
('eg8g9041xiujaobvt8e6tl44at4n97kh', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nHgrm:aFCrM9CJb0jJ2DZHArbJz_go8i4b3I1PW1uFiebnTpQ', '2022-02-23 12:54:14.300020'),
('ehk5zymadaz72tfo8u955e8sau780b7f', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nAQz7:vQa5cQN3mSMIXPtJrYoidaLmRrS-ev1fDBQaDVAB_mc', '2022-02-03 12:31:49.405696'),
('ejivh5e4owx4ajwr297d3z68arisresa', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHg3U:gvqK0RLDLP5xdL-NK_N7WNfs_ladmzp7yW4LXS9POuI', '2022-02-23 12:02:16.082176'),
('fchjxdzfkj84gd4vhzhrc0qjqopzzbs7', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nQnxj:nS-3URlLA4D_xYFdhwPrUHoqeothmWazm_05hVRS4ZU', '2022-03-20 16:18:03.856220'),
('flujxnwgxds08blm7b90g3xi02xz6npn', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHfN5:fXJcvIO2FGLFP6yATf7irgzmp4yt-71HZK2dIECaqgg', '2022-02-23 11:18:27.384450'),
('fycuhjo5qktqidh15jkuu96po5ezstlv', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nMnTh:IlrILzJ5MUo2LQiF1tUA05LX5Q7pd-iizflitsClN1Q', '2022-03-09 14:58:29.816080'),
('g8i8aeliru64lzpzfbcsy1py5gvawgn6', 'e30:1nGxC8:ysSHnvQ2KxZr9p-q88IVU0acVwpyw5-ndotPLg-Q2Qw', '2022-02-21 12:08:12.927733'),
('ghljb6t5jibvijphr4cq1rn36bb1enyc', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nLiDs:JTUhxhxMbb_sNCgD_7Sb72KxvV1_aEFmMSAxfJVm7nM', '2022-03-06 15:09:40.768512'),
('gkg0qjlp0klqb64y0khoyasbfl1ok0le', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nAQHF:m8Tq5awXjbINKhdJXV3tSDtthnUfInw4rgpkiLn4n84', '2022-02-03 11:46:29.138572'),
('gm6kfcnrxpj7xa29tsjt0e6ts5vhdsy1', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGz0d:yC8VPSRftS6wTR2kb0CMTiR98svi0F5bIQqJkwSscmM', '2022-02-21 14:04:27.966429'),
('h3fvyung2cpw47ch5fw4gd21xephdhgg', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nMkjp:KbvuxfptVqUpTYruU4_shQwkYhV2ExGrNJFqJRYq-VM', '2022-03-09 12:02:57.209379'),
('h4cgo98y8uym9qy2tj67plbbpyqw4d0u', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nHjsn:OwU_QT8_73I624yIyK9EPkTb0OXXPUrrlQqKr1QGl1U', '2022-02-23 16:07:29.864501'),
('hnr39jevzmw1n9m7x2dngaqh06wijl2b', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGxPu:akbPdJ2Vse_DDjkQctr9MCTYkHie5x8ZW0WD570JNnY', '2022-02-21 12:22:26.167490'),
('hxyox9ri748papfc1vbqckfwpuejyr6w', '.eJwNysENgCAMBdBdOgGU8ktchoCl4SxyMu6u7_weqm3fs-41rjrbmnSQORcE6yckCBKfTdR7MjdWICLDMVTDKBzhrOI5D_5niTAEpfcDhw8YlA:1nI5aB:cXppjtt0lzh3h-wqpg37SciHLvYsryM0V_p-Cs2bdl4', '2022-02-24 15:17:43.013249'),
('hzxwfzhlhyondk94wwhtbzk7powi569k', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGyxQ:JyaZ8ZRpa6U8FKk0IfW9PicTnLEQa0-1CmUU5UGXjYU', '2022-02-21 14:01:08.763753'),
('i9fsk6jb2arvwlpavpkua7a1jgwgxsci', 'e30:1nGx6d:FtzZFK56FvBaXKzUMGDI88798IxX013aBbHVbPIuebM', '2022-02-21 12:02:31.491693'),
('jyo1ihq1sjwi4bdz25cierstasbqyco2', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nMQo1:mQ6eI7Igk2vwBNVTrA59wO2xHZ5sfKLmYSoieANbkOw', '2022-03-08 14:45:57.748885'),
('kfx7aslumpypsta9zsdozwpeqivn63y1', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKcby:eq_5uv03ZZI0SSFI3XfEqnj4GCw9FAFiIvGh3zsxN-E', '2022-03-03 14:58:02.228233'),
('ktoqs3udti6u04qy5qnfpzvmjq4d9g8r', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nP0O9:-8IWyGg9-Ei7PYAcxFlsMa6E22dy8gwr702DGk2UFzg', '2022-03-15 17:09:53.648064'),
('l6mot194ffucjcedugropn75zg8l83qf', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nBVBE:5mghCRwA2P5XfBJ8OHaXoyzk-hTxRa70PQOYnSN9818', '2022-02-06 11:12:44.009167'),
('lbanqs08ilpgkwrfklypdd6t4tqphezl', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nLiBz:FvrzWwcZbTk0EbgI5_HGXurdp5OtXC4LRNwecGjU35Y', '2022-03-06 15:07:43.442466'),
('lm3es2ywyqgfvtlz1ks8f2tg9e1y628f', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZGagUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSpiwuQovT70bIj9J2kO_YbrPkua3LRHJX5EG7HOZcntfD_Tuo2Ou3Do4BqOhz8KDBmsIRXbAelOFACkarAb3jXEyOhrRnq0L0DpBH5SmL9we9bzc3:1n9OHJ:vTI6fagvwjRlfF_Ymq6y_tdOTfjGEC_4_58Fr9ppoz0', '2022-01-31 15:26:17.188682'),
('m8kbfrr89ihfwuzpswmacb76x1kag5ni', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nH0Yc:RJn9yWysaguk-YZpDk4IXzj-K9eDv6G7K5h91EQz74E', '2022-02-21 15:43:38.647166'),
('mixmcu8bw464sh440ue63jv742f9pn5q', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKC3S:wX5kzXiVJg0RY5WEgcSvT7sjjxRaKG_aZ90rIw5eUK8', '2022-03-02 10:36:38.070140'),
('mr9n64j0szsyg4hj6fppnum03ed8fibx', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGyAw:kqINtXolT8xhEqk9bt-LT8rlybpQMIw94L65gpoaAhg', '2022-02-21 13:11:02.603787'),
('mzhdwzv2zly874w2yhjfz98xgphbdvz6', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKC46:HWOo2dGSQsZyuT1f7Znn4YTNk4ZS6h6HeR9c2vJnt0U', '2022-03-02 10:37:18.734592'),
('n0p5p0qgcs30ns5fmxvwtyhm6rihi30l', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nMkha:bVklZnz7V3ocP_aQmVUwojLpY5MVbIKu89hnPgaq5xQ', '2022-03-09 12:00:38.894755'),
('ndw25zo6s2minqj9coj8njuqrtsexr97', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nQnuY:_chzkCDSj4ZP5uKrHN86R7oyuVlJNXxFEJKT-BdWZ38', '2022-03-20 16:14:46.877499'),
('nfrpgobs8v8imdmnt746xq377p6f6dz0', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKC1r:r5pONirkC66CAnc4HjPrWtIf6NZsArW4qGnzeHXDd6g', '2022-03-02 10:34:59.533033'),
('o0ska48asc03gtfv2nm87lrcx56aprz7', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nPJlF:JdAWsMnyYru3w8Bef-HM-aK8bLwmr38243uQkcDODoY', '2022-03-16 13:51:01.814606'),
('p59n7v0y5qzzbqadmq202xy3l7lfyi6y', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nMn6p:rA7pcJc-7KqMlFWNajTahtydd7ds_54e6zby-4hwYn0', '2022-03-09 14:34:51.296571'),
('pf48facg44bum8iy99gek7wz8x63gcwg', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZGagUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSpiwuQovT70bIj9J2kO_YbrPkua3LRHJX5EG7HOZcntfD_Tuo2Ou3Do4BqOhz8KDBmsIRXbAelOFACkarAb3jXEyOhrRnq0L0DpBH5SmL9we9bzc3:1n9OGv:Zd4cLHurp9HU15mET78d8WAKwPhr_OgiDLhjzPuOPUw', '2022-01-31 15:25:53.164193'),
('pgr9udierk12y4wndk9pgqs93t14s57p', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nKYfK:DFTKH-15mI75qz4YRkcuOVrnt9o1TFw_FexosKuDXHU', '2022-03-03 10:45:14.724090'),
('pmizl9u6hbcetv5slm57ndla5zbjvnek', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKByK:qWm9oM1O6jJsLWTcrqZC1g9QkLh882Nv1LLHZ960Lbs', '2022-03-02 10:31:20.474293'),
('pnmolp69ghl1awqc9hznivvhxmvyv2uv', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGw4z:ZytYXIzRSgjJMnTjtaE_rBU9SRKkNOuVCSDcfYn_L6o', '2022-02-21 10:56:45.472947'),
('ppv0okvdqw5l63xywczlx6um6twwm7m7', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHfyX:CWKq45VjI1hSITNd8kGg6SxB9WKyZKwq3kQR3WEov1U', '2022-02-23 11:57:09.734152'),
('ps0pfgmxqbdr1yemu80vdrh1ecif1nwn', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nMmpG:-p1pYCEYP-1OWbDWVq1uC9hpKxswIQzdIHcQ4CPpJD4', '2022-03-09 14:16:42.425840'),
('px55avshvyjeil4cm7pzppr25gmfww5x', '.eJxVjDsOwyAQRO9CHSF-i0nK9DkDWmAJTiKQjF1FuXtsyYVdzrw382Uel7n4pdPkx8RuTLLLsQsY31Q3kF5Yn43HVudpDHxT-E47f7REn_vung4K9rKuLV1BIJC1QoMyVg2gHCaE4ARpRKnNEChiJmFBZRcS6DWbLImMU8R-f9I6OCg:1mOGRg:NdT75i4esi79ImCmI0GW5GVgWNYyvvskCy4G8fsql9Y', '2021-09-23 09:34:12.730588'),
('q8j93btxhpgajjml2ft4gusmfrme4ctz', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZGagUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSpiwuQovT70bIj9J2kO_YbrPkua3LRHJX5EG7HOZcntfD_Tuo2Ou3Do4BqOhz8KDBmsIRXbAelOFACkarAb3jXEyOhrRnq0L0DpBH5SmL9we9bzc3:1n9ODt:nvUi5xES2d1JOXd5G427tv5lD1pVejGluv8lz3VrznU', '2022-01-31 15:22:45.444894'),
('qmgicf88a847usbnqq5aylrpqsk02j9b', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nJVH7:stOWPqva0obtz9RefFN9qHqSwrnUn2uZoxdZjsxL2SQ', '2022-02-28 12:55:53.662114'),
('qmotid4d89hm587qz8a5txit1sbt7ppy', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGzAW:UDa4OfOFZrO9Wc2DTmX7nnT3LHh9YjjRhp_S0Moz2_g', '2022-02-21 14:14:40.808083'),
('qysirka107l5u0dyu30onr00yrst0w02', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nPhy4:Bl5TpMGy6BPeqd4eaTdFB-rEA-J5FJc1eUOWosCYLac', '2022-03-17 15:41:52.466612'),
('r9n0dvq3we8egkq2qmyi9nno5v1z7q6l', '.eJxVjDsOwjAQBe_iGlnrD3ZCSZ8zRLveNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1UUadfjfC9JC6A75jvc06zXVdJtK7og_a9DCzPK-H-3dQsJVv7dn1vZNs0KMBIhYGhEwexIZIzkA0kMGn1MVgmHJnJXigAC7ms83q_QHuRjfg:1markt:NXHUKjtz7RzdaAGiDi0ZYTLETKoV4yG9_tozAu2gSP0', '2021-10-28 09:50:07.713654'),
('rfsw7e42wnf0ps9y8rrvojvf75frrj18', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nMki4:xGdUWy3DvFOlTdxC3suqgLEt7scetDC_HSwvKylXHfI', '2022-03-09 12:01:08.228840'),
('rl2tytx6jeizgf6jtfj05sa3i1n8vezr', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGyyn:TPYeFzCYtAKNq4JuCsFbuRKjCwEZqBEbC-QlW5m1BuA', '2022-02-21 14:02:33.915864'),
('rmyo8dqgidizfffj4hrr67x4uti15ped', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nMS2n:pZ-Fl6Q6QZrcIwFzN0pKVZVVwpg-qgP8Hjd9W5_Byu4', '2022-03-08 16:05:17.975831'),
('rzw7571g5lgpghntsiosjtb6vwya0w81', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nMmon:va1_k9G-P6iDNoL2lcUdCp1P4Nf_1824aXH7LDDwEi4', '2022-03-09 14:16:13.876876'),
('s50lx4jeogom7822mfo6s9uquphs1q25', 'e30:1nKBt4:RYjAPV4P1MyeApUDiKCMLGpoaFePlYRGrAsHnO4YWcY', '2022-03-02 10:25:54.816299'),
('s5ndrj54ff4l18divbbxfup055qk6b8a', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nHgXZ:MENY4YCEYvSdpVCqz7WpbWSeytgmU9PbDhlsRA4S6Kg', '2022-02-23 12:33:21.943747'),
('s6jhs4q32kj79ah6btg9lpfeqyeg92b6', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKXtx:-V06MMOndAkUARfB1DAUmljNgdByQ9A924MUY9oFVuo', '2022-03-03 09:56:17.365075'),
('s8czld34xnxatphey4z3zgh2i1s61x6d', 'e30:1nGx28:JkzZ0GmX_GvgrdOy_19PztKCUBxb6LJVIwccN5t6mmQ', '2022-02-21 11:57:52.611403'),
('srvax7ttp7zbfmobgiy3a3jbzwfxjnq4', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGz8m:yPC422YFILp5XsOnqkPg_bBKctew_XtCcT2mluNkZFg', '2022-02-21 14:12:52.403702'),
('tbqqeyl9yyw161ghenjst22skx32apdw', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKEQ2:dZBXi_dnMq9MgFPoa0GkHoxiR2vux3pSVMBZGwEOR8M', '2022-03-02 13:08:06.373602'),
('tn40d0qflrg93nrqsgd7jsxzxbmt1ys0', '.eJxVjDsOwjAQBe_iGlnrD3ZCSZ8zRLveNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1UUadfjfC9JC6A75jvc06zXVdJtK7og_a9DCzPK-H-3dQsJVv7dn1vZNs0KMBIhYGhEwexIZIzkA0kMGn1MVgmHJnJXigAC7ms83q_QHuRjfg:1n7WvL:5cZrFQKyZcUqQDP5za55P2y26KgF3Eedu-MduVG3nCk', '2022-01-26 12:15:55.322537'),
('tt0njs03e94ci2k4pfzokibtj9vczdnx', 'e30:1nGxIq:wKeGMvv6AEB7iL4E5fq8sokZ49pyQiyFc4b8ZQVadls', '2022-02-21 12:15:08.456582'),
('usr0pebc8o1sjfsydlp6nt8ydbty9ynn', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nHh1s:P1GLqayw7Kz5zSc6tvRmqQXWqTCHAxGfPnoOcuHWD2E', '2022-02-23 13:04:40.275479'),
('v5czbsgkk1tm2wcge0nqfn3k80zgawg4', '.eJxVjDsOwjAQBe_iGln-Z01JnzNYG6-NA8iW4qRC3J1ESgHtm5n3ZgG3tYStpyXMxK5MssvvNmF8pnoAemC9Nx5bXZd54ofCT9r52Ci9bqf7d1Cwl73WLmqDKoL00jplpAcBYsjoCbIEMNpHzCSEFilZq2kQaeceFBE5ZdnnC7FMNsE:1nI5WY:5cbhhnRv9qLLt_e6MTrU0Ehzlr2ncL1ReUu-2gE3ssE', '2022-02-24 15:13:58.089849'),
('vg6949xi23zyueljp6kvu0xy667ouaor', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nMS6Y:KcOEx_MFBnN9THDRbJa3U911OT3MpRGCPZPQQ9OCnhk', '2022-03-08 16:09:10.361690'),
('vgpnbm4lsspm7fhihda5gdapiiuhls08', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nH0rd:E9B8ZnCm-m0xqGqeMjKLcvLQRS6Gi324rA74CWnqQPM', '2022-02-21 16:03:17.936333'),
('vp9zbv5uriliug6qht9811s2m9qeiqno', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGw9S:2YEy--149Ah2Dg9gp6vrsXSCbr0Z32NckiB3e-zEtUk', '2022-02-21 11:01:22.694470'),
('vwg8o3udvdms4izbbnnr310741le8cbh', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nI20c:FYqeDgZ3DygR-xl6Sq5lV3cy_cxbixnBwtxv9TKP8N8', '2022-02-24 11:28:46.363235'),
('w30ul2gmgm0bbuin3lhr2llldnl4sf6j', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nMS5r:HFMtc3RcGQPc-tonZGjMTGW3_x50RXRHoTnygBpeFV8', '2022-03-08 16:08:27.792454'),
('wmeirhpthej6aauyd31gevjqagdleawa', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nPhxo:YWk99804SBbKvAociSovGhL-w5NaGFU-jU4SeL1fT6M', '2022-03-17 15:41:36.465399'),
('woggcth25y4vsem7i048zazqvo9f2l6x', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nKYfX:NYIPgIoWv9IumtuxM55HMZAXpWMSr12kJ7j-RJi8XDA', '2022-03-03 10:45:27.900745'),
('wpdmk1djo7oocego9f0x56f8i9z33qsc', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGzN2:hatXgXvfrdvXzegyl7zb8JveMXfAoXltlIyVsHKtbiU', '2022-02-21 14:27:36.149675'),
('wt0w9g27ay08xw5z2kqu7y4veatinvsp', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGxLP:KeDImg9XQeUGACwv5WTjfXdNKuq4XoY_hhgf3e1gB4E', '2022-02-21 12:17:47.188970'),
('wxopkfx50x9ett8bttqc8qtk1u6s39no', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nQoC8:5re89MCbgzHxHDKAkFGmy2CcmXW5-ZxcrQ0-rlVOmo4', '2022-03-20 16:32:56.417914'),
('wyq54du4hvwzjkkwadqxdg1rp28q5s5e', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nPhxa:cbAO8SUBiHgvTiVn-8dNHpfcmz2GVJRLh2rS2YO3_Ok', '2022-03-17 15:41:22.345897'),
('x8yosl6x2qedo964vn4gldy54rvz7xvk', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGxOr:Mkk5g-LFT8Ikd5sZXS41zvi8dTIn4Z0jK5rpBDhqxiQ', '2022-02-21 12:21:21.574956'),
('xkwtdahew5dwpfwwql2be4cj70qrn1y1', '.eJxVjDsOwjAQBe_iGln-yKxNSc8ZrPXuBgeQI8VJFXF3iJQC2jczb1MZ16XmtcucR1YXZdXpdytIT2k74Ae2-6Rpass8Fr0r-qBd3yaW1_Vw_w4q9vqtwZBxggNYBBThZNmQ-MQcvEHrZQCmYgmDc-BDLJEopBjEu7P1wOr9AQW7OFU:1nGw7z:tXRM6meO1_LQHecMEy9aDCbilThn9XAE-YgAaqbHHyQ', '2022-02-21 10:59:51.086940'),
('xryrposib5fw0lnv77qz3bxyfag3759k', '.eJxVjDsOwjAQBe_iGlnrD3ZCSZ8zRLveNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1UUadfjfC9JC6A75jvc06zXVdJtK7og_a9DCzPK-H-3dQsJVv7dn1vZNs0KMBIhYGhEwexIZIzkA0kMGn1MVgmHJnJXigAC7ms83q_QHuRjfg:1mSxmb:An2uRochMvVJsbGPC9y6OPIg29t9IkupPexCcDToEhE', '2021-10-06 14:39:13.628674'),
('xzsmpkphy4ra64xzdhbk3spka05s7zm9', '.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2ZYqffLWJ6UNtBvmO7dZ56W5c58l3hBx382jM9L4f7d1Bx1G8tqEg0iooDsC5KlbTKHjwVFA41AoKfMCn02RpJoJNGqQoIXaxJk2TvD-rNN9M:1nQnwK:fxGU03SLEMbmG76KFu9F0jIc-CN2at6ngMD3LIg86PU', '2022-03-20 16:16:36.769826'),
('ygk35mlqxfaf9vj87u57v5x5m1a8u73p', '.eJwFwdENgCAMBcBdmKClLUGXIc9Cw7fIl3F3797UsJ_Z9hp3m1gznalXKkrqosFH9exAzkLwwVYKVQsTAMoGi-sKN-l5mIV25c5I3w-HfBms:1nI5bz:8OARxXjEaZtoLyM26NS5NgPoa3_MR9Bisqm_NDGB9C0', '2022-02-24 15:19:35.037513'),
('yokvcoaut7ytucxwn0x8atu96zc4571c', '.eJwFwUESgCAIAMC_-AIBBewzDiGO56xT09_bfVO351792XH1ZXulI2UWLFWFDRQMaPKJbo3Ug4Z6bZBVJFsRKaoDQcJ4MkF1mKGYvh9glRhg:1nJ8hu:L9efENcbhdPi-Of8Hnt6R_B4z3CO4He8LyzI1nFu168', '2022-02-27 12:50:02.067765'),
('yt5bd8jzd24w91edhfwox5xalwthiiz1', '.eJxVjEEOwiAQRe_C2hCgMqUu3XsGMswwUjUlKe3KeHfbpAvdvvf-f6uI61Li2vIcR1YXZdXplyWkZ552wQ-c7lVTnZZ5THpP9GGbvlXOr-vR_h0UbGVbd8QC4J1Fcj2gnIPzFozHhIaGLGCS9T2TSwgbEclBgjCFDjgMflCfL_IhOJg:1nKYev:3xpMIdh4klgWDs_eytgf6rRx8faMf_qmbwS_caeSPeM', '2022-03-03 10:44:49.623708'),
('yww8f4e1q37o1fwhzo8xbqajzneind37', '.eJxVjEEOwiAQRe_C2hBaBgGX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERozj9bhHpwXUH6Y711iS1ui5zlLsiD9rl1BI_r4f7d1Cwl2_tCT2PHLMbnCJtwTJFBp81Ds7aaD1k7Y0zEYHPaBRoQNIMitE4TeL9AfQVOBQ:1nMQnR:WWXXq2LLzS3AI7DigZI_S4pAOt1lazBX0gEiaiD9OkQ', '2022-03-08 14:45:21.002210');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_inventory`
--

CREATE TABLE `inventory_inventory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `lastModifiedDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_inventory`
--

INSERT INTO `inventory_inventory` (`id`, `name`, `description`, `unit`, `count`, `lastModifiedDate`) VALUES
(1, 'Pen', 'Some black pens', 'piece', 11, '2022-03-06 16:14:14.715486'),
(2, 'Paper', '', 'ream', 89, '2022-03-13 10:07:32.239166'),
(3, 'Tissue Box', '', 'box', 397, '2022-03-06 16:33:18.618895'),
(4, 'Eraser', 'Pen mark eraser', 'unit', 48, '2022-02-23 14:20:29.408186'),
(5, 'Black Marker', 'Black marker pen', 'piece', 203, '2022-03-03 15:30:19.024663');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_requisition`
--

CREATE TABLE `inventory_requisition` (
  `id` int(11) NOT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `comment` longtext DEFAULT NULL,
  `approver_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `distributed` tinyint(1) DEFAULT NULL,
  `distributor_id` int(11) DEFAULT NULL,
  `approveDate` datetime(6) DEFAULT NULL,
  `distributionDate` datetime(6) DEFAULT NULL,
  `requestDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_requisition`
--

INSERT INTO `inventory_requisition` (`id`, `approved`, `title`, `amount`, `comment`, `approver_id`, `inventory_id`, `user_id`, `distributed`, `distributor_id`, `approveDate`, `distributionDate`, `requestDate`) VALUES
(1, 1, 'A pen needed', 1, '', 1, 1, 2, 0, NULL, NULL, NULL, '2021-09-14 16:18:14.230531'),
(2, 1, 'A pen is needed', 1, '', 1, 1, 2, 1, 3, NULL, NULL, '2021-09-14 16:18:14.230531'),
(3, 1, 'Paper needed', 1, '', 1, 2, 2, 1, 3, NULL, NULL, '2021-09-14 16:18:14.230531'),
(4, 1, '2 pens needed', 2, '', 1, 1, 2, 1, 3, NULL, NULL, '2021-09-14 16:18:14.230531'),
(5, 1, '2 ream A4 paper needed', 2, '', 1, 2, 2, 1, 3, NULL, '2022-02-23 12:00:45.363256', '2021-09-14 16:18:14.230531'),
(6, 1, 'A pen needed', 1, '', 1, 1, 2, 1, 3, NULL, '2022-02-23 14:20:33.184253', '2021-09-14 16:18:14.230531'),
(7, 1, 'A tissue box needed', 1, '', 1, 3, 2, 1, 3, '2021-09-15 14:05:43.538057', '2022-02-23 12:00:48.472513', '2021-09-14 16:18:14.230531'),
(8, 1, 'A tissue box needed', 1, '', 1, 3, 3, 1, 2, NULL, '2021-09-15 14:06:11.281622', '2021-09-14 16:18:14.230531'),
(9, 1, 'Bulk pen needed', 20, '', 1, 1, 3, 1, 2, NULL, NULL, '2021-09-14 16:18:14.230531'),
(10, 1, 'A eraser is needed', 1, '', 1, 4, 3, 1, 2, NULL, '2021-09-14 16:18:45.077219', '2021-09-14 16:18:14.230531'),
(11, 1, 'A pen needed', 1, '', 1, 1, 1, 1, 2, '2021-09-20 13:59:59.392668', '2021-09-20 14:00:08.305256', '2021-09-15 14:04:11.466589'),
(12, 1, 'A pen needed', 1, '', 1, 1, 1, 1, 2, '2021-09-20 15:12:41.938529', '2021-09-20 15:13:04.492710', '2021-09-20 15:11:50.248775'),
(13, 1, 'Paper needed', 1, 'Paper needed', 1, 2, 1, 0, 2, '2021-09-23 15:42:58.080078', NULL, '2021-09-20 15:12:21.410452'),
(14, 1, 'One pen needed', 1, '', 1, 1, 2, 0, 3, '2022-02-23 12:00:05.074379', NULL, '2021-09-23 15:04:35.433900'),
(15, 1, 'One pen needed', 1, '', 1, 1, 3, 1, 3, '2022-02-23 11:59:58.644102', '2022-02-23 12:00:50.672980', '2021-09-23 15:28:37.467337'),
(16, 1, 'One pen needed', 1, '', 1, 1, 3, 1, 3, '2022-02-23 12:00:23.960390', '2022-02-23 12:00:52.074377', '2021-09-23 15:32:00.129144'),
(17, 0, 'One erasure needed', 1, '', 1, 4, 3, 0, NULL, NULL, NULL, '2021-09-23 15:40:42.576799'),
(18, 1, 'Eraser Needed', 1, '', 1, 4, 1, 1, 3, '2022-02-23 14:16:06.219609', '2022-02-23 14:20:29.357896', '2021-10-19 12:39:15.769500'),
(19, 0, 'A tissue box needed', 1, NULL, 3, 3, 2, 0, NULL, NULL, NULL, '2022-02-22 14:39:52.766573'),
(20, 1, 'A tissue box needed', 1, NULL, 2, 3, 1, 1, 3, '2022-03-06 16:33:07.510793', '2022-03-06 16:33:18.566885', '2022-03-06 16:14:35.615823'),
(21, 0, 'A tissue box needed', 1, 'a tissue box', 1, 3, 3, 0, NULL, NULL, NULL, '2022-03-06 16:32:26.944407');

-- --------------------------------------------------------

--
-- Table structure for table `leave_leave`
--

CREATE TABLE `leave_leave` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `creationDate` datetime(6) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approveDate` datetime(6) DEFAULT NULL,
  `startDate` datetime(6) NOT NULL,
  `endDate` datetime(6) NOT NULL,
  `dayCount` int(10) UNSIGNED NOT NULL CHECK (`dayCount` >= 0),
  `comment` longtext NOT NULL,
  `approver_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_leave`
--

INSERT INTO `leave_leave` (`id`, `title`, `creationDate`, `approved`, `approveDate`, `startDate`, `endDate`, `dayCount`, `comment`, `approver_id`, `user_id`) VALUES
(1, 'One day leave', '2021-09-19 14:36:12.044043', 1, '2021-09-20 11:48:14.375050', '2021-10-20 00:00:00.000000', '2021-10-20 00:00:00.000000', 1, 'Just a one day leave', 1, 1),
(3, 'Two days leave needed', '2021-09-20 10:53:30.419958', 1, '2021-09-20 11:58:32.845873', '2021-09-28 00:00:00.000000', '2021-09-29 00:00:00.000000', 2, 'Two days leave need for travelling', 1, 3),
(4, 'Three days leave needed', '2021-09-20 15:14:12.116276', 1, '2021-10-10 12:46:10.555886', '2021-11-01 00:00:00.000000', '2021-11-03 00:00:00.000000', 3, 'Three days leave needed', 1, 1),
(5, 'One day leave needed', '2021-09-23 15:30:38.977191', 1, '2022-03-02 13:48:46.924806', '2021-11-01 00:00:00.000000', '2021-11-01 00:00:00.000000', 1, 'A one day leave', 1, 3),
(6, 'One day leave', '2021-10-10 10:28:04.994864', 1, '2021-10-10 12:46:04.698911', '2021-10-20 00:00:00.000000', '2021-10-20 00:00:00.000000', 1, 'One day leave', 1, 1),
(7, 'A two days leave', '2022-03-02 13:00:53.823998', 1, '2022-03-02 13:48:38.033564', '2022-03-06 00:00:00.000000', '2022-03-07 00:00:00.000000', 2, 'Two days leave needed for family.', 1, 3),
(9, 'A one day leave needed', '2022-03-02 13:55:53.480667', 1, '2022-03-02 14:06:18.435158', '2022-03-03 00:00:00.000000', '2022-03-03 00:00:00.000000', 1, 'A one day emergency leave needed.', 1, 1),
(10, 'A three days leave needed', '2022-03-02 14:08:20.245557', 1, '2022-03-02 14:08:30.041594', '2022-03-15 00:00:00.000000', '2022-03-17 00:00:00.000000', 3, 'Three days leave needed for family vacation.', 1, 1),
(11, 'A one day leave need', '2022-03-06 16:17:48.874181', 1, '2022-03-06 16:18:11.470840', '2022-03-07 00:00:00.000000', '2022-03-07 00:00:00.000000', 1, ' A one day leave', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_profile_supervisor_id_479813ed_fk_auth_user_id` (`supervisor_id`);

--
-- Indexes for table `asset_asset`
--
ALTER TABLE `asset_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_asset_user_id_54771fbb_fk_auth_user_id` (`user_id`),
  ADD KEY `asset_asset_next_user_id_0451c2dc_fk_auth_user_id` (`next_user_id`);

--
-- Indexes for table `asset_assethistory`
--
ALTER TABLE `asset_assethistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_assethistory_fromUser_id_59c10a11_fk_auth_user_id` (`fromUser_id`),
  ADD KEY `asset_assethistory_toUser_id_c48abf98_fk_auth_user_id` (`toUser_id`),
  ADD KEY `asset_assethistory_asset_id_3b133b1f_fk` (`asset_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `inventory_inventory`
--
ALTER TABLE `inventory_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `inventory_requisition`
--
ALTER TABLE `inventory_requisition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_requisition_approver_id_46fa8cdf_fk_auth_user_id` (`approver_id`),
  ADD KEY `inventory_requisitio_inventory_id_115ab4a2_fk_inventory` (`inventory_id`),
  ADD KEY `inventory_requisition_user_id_c6cdb914_fk_auth_user_id` (`user_id`),
  ADD KEY `inventory_requisition_distributor_id_4f5e5642_fk_auth_user_id` (`distributor_id`);

--
-- Indexes for table `leave_leave`
--
ALTER TABLE `leave_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_leave_approver_id_7c2c50d7_fk_auth_user_id` (`approver_id`),
  ADD KEY `leave_leave_user_id_b4b01ea9_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `asset_asset`
--
ALTER TABLE `asset_asset`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `asset_assethistory`
--
ALTER TABLE `asset_assethistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `inventory_inventory`
--
ALTER TABLE `inventory_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_requisition`
--
ALTER TABLE `inventory_requisition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `leave_leave`
--
ALTER TABLE `leave_leave`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD CONSTRAINT `accounts_profile_supervisor_id_479813ed_fk_auth_user_id` FOREIGN KEY (`supervisor_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `asset_asset`
--
ALTER TABLE `asset_asset`
  ADD CONSTRAINT `asset_asset_next_user_id_0451c2dc_fk_auth_user_id` FOREIGN KEY (`next_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `asset_asset_user_id_54771fbb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `asset_assethistory`
--
ALTER TABLE `asset_assethistory`
  ADD CONSTRAINT `asset_assethistory_asset_id_3b133b1f_fk` FOREIGN KEY (`asset_id`) REFERENCES `asset_asset` (`id`),
  ADD CONSTRAINT `asset_assethistory_fromUser_id_59c10a11_fk_auth_user_id` FOREIGN KEY (`fromUser_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `asset_assethistory_toUser_id_c48abf98_fk_auth_user_id` FOREIGN KEY (`toUser_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `inventory_requisition`
--
ALTER TABLE `inventory_requisition`
  ADD CONSTRAINT `inventory_requisitio_inventory_id_115ab4a2_fk_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_inventory` (`id`),
  ADD CONSTRAINT `inventory_requisition_approver_id_46fa8cdf_fk_auth_user_id` FOREIGN KEY (`approver_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `inventory_requisition_distributor_id_4f5e5642_fk_auth_user_id` FOREIGN KEY (`distributor_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `inventory_requisition_user_id_c6cdb914_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `leave_leave`
--
ALTER TABLE `leave_leave`
  ADD CONSTRAINT `leave_leave_approver_id_7c2c50d7_fk_auth_user_id` FOREIGN KEY (`approver_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `leave_leave_user_id_b4b01ea9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
