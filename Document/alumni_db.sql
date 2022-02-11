-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 04:20 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnis`
--

CREATE TABLE `alumnis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alumnis`
--

INSERT INTO `alumnis` (`id`, `user_id`, `gender`, `profile`, `batch`, `major`, `phone`, `created_at`, `updated_at`) VALUES
(2, 2, 'Female', 'SZL3JbmtT8HxmuACkJo8Zwuc7pgYCfKBpoY0Pohz.jpg', '2021', 'WEP', '123456789235', '2021-12-30 00:11:35', '2022-01-02 17:46:42'),
(3, 3, 'Male', 'klmOifuLpf1iMdB5QUk0S9AL6veBxr6IXcWPa7cG.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:12:36', '2022-01-03 03:10:22'),
(4, 4, 'Female', 'F0uawd2vczZyHGeGdxZvx33H2UfdzfC3CmzEA9wq.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:12:41', '2022-01-05 08:19:20'),
(5, 5, 'Female', 'hWwXfn4k73CAbQMk92LLWlU3hENcDNLDqTP1Jvic.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:12:46', '2022-01-03 03:11:35'),
(6, 6, 'Male', 'iAoUqFRM5pYXcGzJjROyeiJHlw3xdsE9F7p5dR8T.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:12:51', '2022-01-04 19:24:01'),
(7, 7, 'Male', 'DZzqYwR51TDHifVEGP6cs1aVIDy2aUZShvWe1GXw.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:12:58', '2021-12-30 23:51:54'),
(8, 8, 'Female', '7dz0ow3vlke565q8b3DsvjBYbuvd36UD556SlAWN.jpg', '2021', 'SNA', '7645797546', '2021-12-30 00:13:02', '2022-01-05 07:22:55'),
(9, 9, 'Male', 'VPGdtIDfo3dy4D1QIl76BEmFtrHWnUUIvD6YVOKK.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:13:06', '2022-01-05 08:11:01'),
(10, 10, 'Female', 'vPuQ2DrgK8Edq5ep5V6X194G1H7sMt4r5aMmk33i.jpg', '2021', 'WEP', '12345678', '2021-12-30 00:13:11', '2021-12-30 23:58:36'),
(22, 28, 'Male', 'male.jpg', '2021', 'WEP', '98667763', '2022-01-05 07:25:00', '2022-01-05 07:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `alumni_skills`
--

CREATE TABLE `alumni_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alumni_id` bigint(20) UNSIGNED NOT NULL,
  `skillName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alumni_skills`
--

INSERT INTO `alumni_skills` (`id`, `alumni_id`, `skillName`, `created_at`, `updated_at`) VALUES
(1, 1, 'Database', '2021-12-30 00:22:47', '2021-12-30 00:22:47'),
(2, 1, 'Javascript', '2021-12-30 00:22:47', '2021-12-30 00:22:47'),
(3, 1, 'PHP', '2021-12-30 00:22:47', '2021-12-30 00:22:47'),
(6, 2, 'OOP', '2021-12-30 00:25:41', '2021-12-30 00:25:41'),
(7, 2, 'Javascript', '2021-12-30 00:25:41', '2021-12-30 00:25:41'),
(8, 2, 'Node JS', '2021-12-30 00:25:41', '2021-12-30 00:25:41'),
(10, 2, 'Laravel', '2021-12-30 00:25:41', '2021-12-30 00:25:41'),
(11, 2, 'Vue2', '2021-12-30 00:25:41', '2021-12-30 00:25:41'),
(12, 3, 'html', '2021-12-30 00:31:11', '2021-12-30 00:31:11'),
(13, 3, 'Css', '2021-12-30 00:31:11', '2021-12-30 00:31:11'),
(14, 3, 'Vue js', '2021-12-30 00:33:57', '2021-12-30 00:33:57'),
(15, 3, 'Kotlin', '2021-12-30 00:33:57', '2021-12-30 00:33:57'),
(16, 3, 'Python', '2021-12-30 00:33:57', '2021-12-30 00:33:57'),
(17, 3, 'Oop', '2021-12-30 00:33:57', '2021-12-30 00:33:57'),
(18, 4, 'Vue js', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(19, 4, 'Vue CLI', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(20, 4, 'Algorithm', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(21, 4, 'Python', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(22, 4, 'Oop', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(23, 4, 'Laravel', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(24, 4, 'PHP', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(25, 4, 'CSS', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(26, 4, 'html', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(27, 4, 'JavaScript', '2021-12-30 00:39:41', '2021-12-30 00:39:41'),
(29, 5, 'Algorithm', '2021-12-30 00:42:15', '2021-12-30 00:42:15'),
(30, 5, 'Python', '2021-12-30 00:42:15', '2021-12-30 00:42:15'),
(31, 5, 'Oop', '2021-12-30 00:42:15', '2021-12-30 00:42:15'),
(32, 5, 'Laravel', '2021-12-30 00:42:15', '2021-12-30 00:42:15'),
(33, 5, 'PHP', '2021-12-30 00:42:15', '2021-12-30 00:42:15'),
(34, 5, 'JavaScript', '2021-12-30 00:42:15', '2021-12-30 00:42:15'),
(35, 6, 'Vue js', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(36, 6, 'Vue CLI', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(37, 6, 'Kotlin', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(38, 6, 'Algorithm', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(39, 6, 'Python', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(40, 6, 'Oop', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(41, 6, 'Laravel', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(42, 6, 'PHP', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(43, 6, 'JavaScript', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(44, 6, 'JAVA', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(45, 6, 'CSS', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(47, 6, 'html', '2021-12-30 00:45:33', '2021-12-30 00:45:33'),
(48, 7, 'Vue CLI', '2021-12-30 00:51:43', '2021-12-30 00:51:43'),
(49, 7, 'Kotlin', '2021-12-30 00:51:43', '2021-12-30 00:51:43'),
(50, 7, 'Algorithm', '2021-12-30 00:51:43', '2021-12-30 00:51:43'),
(51, 7, 'Python', '2021-12-30 00:51:43', '2021-12-30 00:51:43'),
(53, 9, 'Vue js', '2021-12-30 01:01:51', '2021-12-30 01:01:51'),
(54, 9, 'Vue CLI', '2021-12-30 01:01:51', '2021-12-30 01:01:51'),
(55, 9, 'Kotlin', '2021-12-30 01:01:51', '2021-12-30 01:01:51'),
(56, 9, 'Algorithm', '2021-12-30 01:01:51', '2021-12-30 01:01:51'),
(57, 9, 'Python', '2021-12-30 01:01:51', '2021-12-30 01:01:51'),
(58, 10, 'Vue CLI', '2021-12-30 01:08:03', '2021-12-30 01:08:03'),
(59, 10, 'Kotlin', '2021-12-30 01:08:03', '2021-12-30 01:08:03'),
(60, 10, 'Algorithm', '2021-12-30 01:08:03', '2021-12-30 01:08:03'),
(61, 10, 'Python', '2021-12-30 01:10:03', '2021-12-30 01:10:03'),
(62, 17, 'JAVA', '2021-12-30 21:15:27', '2021-12-30 21:15:27'),
(63, 17, 'CSS', '2021-12-30 21:15:27', '2021-12-30 21:15:27'),
(64, 17, 'PHP', '2021-12-30 21:15:27', '2021-12-30 21:15:27'),
(65, 17, 'Laravel', '2021-12-30 21:15:27', '2021-12-30 21:15:27'),
(66, 17, 'Python', '2021-12-30 21:15:27', '2021-12-30 21:15:27'),
(68, 5, 'JAVA', '2022-01-03 03:12:54', '2022-01-03 03:12:54'),
(69, 8, 'Vue js', '2022-01-05 00:28:01', '2022-01-05 00:28:01'),
(70, 8, 'Vue CLI', '2022-01-05 00:28:01', '2022-01-05 00:28:01'),
(71, 8, 'Kotlin', '2022-01-05 00:28:01', '2022-01-05 00:28:01'),
(72, 8, 'CCNA', '2022-01-05 00:49:43', '2022-01-05 00:49:43'),
(73, 8, 'Algorithm', '2022-01-05 00:49:43', '2022-01-05 00:49:43'),
(74, 8, 'Python', '2022-01-05 00:49:43', '2022-01-05 00:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '2013', '2021-12-30 00:15:02', '2021-12-30 00:15:02'),
(2, '2014', '2021-12-30 00:15:08', '2021-12-30 00:15:08'),
(3, '2015', '2021-12-30 00:15:11', '2021-12-30 00:15:11'),
(4, '2016', '2021-12-30 00:15:15', '2021-12-30 00:15:15'),
(5, '2017', '2021-12-30 00:15:20', '2021-12-30 00:15:20'),
(6, '2018', '2021-12-30 00:15:24', '2021-12-30 00:15:24'),
(7, '2019', '2021-12-30 00:15:28', '2021-12-30 00:15:28'),
(8, '2020', '2021-12-30 00:15:35', '2021-12-30 00:15:35'),
(9, '2021', '2021-12-30 00:15:39', '2021-12-30 00:15:39'),
(10, '2022', '2021-12-30 00:15:43', '2021-12-30 00:15:43'),
(11, '2023', '2021-12-30 00:15:46', '2021-12-30 00:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `domain_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `domain_company`, `company_name`, `location`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Sell', 'Bikay', 'Phnom Penh, Cambodia', 'QeZGMfYEz5vaigUkBiuQDrWUHQpyTlTY3sNzTz9Q.png', '2021-12-30 00:21:05', '2022-01-04 21:03:13'),
(2, 'Edited', 'UMK', 'SiemReap', 'Uq9pRAqb15vBsnFWt7i30huTdRv6gfwwS6wxvKnb.jpg', '2021-12-30 00:35:06', '2022-01-05 00:52:30'),
(3, 'Solution', 'IG Tech', 'Phnom Penh, Cambodia', 'HicbgiUVWhCP2m4eVoqCyeoisW5ujqsUvDCrwKEE.png', '2021-12-30 00:38:19', '2022-01-04 06:31:38'),
(4, 'Bank', 'Canadia Bank', 'Phnom Penh, Cambodia', 'CxYZ6uim5hOkpqsg6CQymexBT7SG3hVxv1KamFFI.png', '2021-12-30 00:43:27', '2022-01-04 06:33:00'),
(5, 'Delivery', 'Wing', 'Phnom penh, Cambodia', 'piJ6YSBVbZCcYdvx7123hwbvQbD9SB5DxxmpeKOG.png', '2021-12-30 00:47:08', '2022-01-04 06:31:25'),
(6, 'Bank', 'AMK', 'Kondal, Cambodia', '9fRf0DYu14JdqZQDEsLosg7NGSSTI0IBEdRIwkUv.png', '2021-12-30 00:53:08', '2022-01-04 06:32:51'),
(7, 'Solution', 'ACLEDA', 'Pursat, Cambodia', 'rFiQ2D1UkfaDvaMNjOZBYJjQjjFhO4PIC49f5sxo.png', '2021-12-30 00:59:17', '2022-01-04 06:32:30'),
(8, 'Solution', 'Slash', 'Siem Reap, Cambodia', 'UjUcPyOhJLsiwKtKs4AlFTZK6E6ynIsfJMEcVCI1.png', '2021-12-30 01:04:18', '2022-01-04 06:32:09'),
(9, 'Solution', 'AIML', 'Battam Bang, Canada', 'NGZorxxkkZoCFdeLnqTghNGPMhlXuswKzfM6KKbr.jpg', '2021-12-30 01:09:22', '2022-01-05 08:16:11'),
(10, 'Bank', 'Sabay', 'Phnom Penh', 'Av4wq5m0ycXZzYzvTZ3vMnnRjkaTNoO4E2sUFx1H.png', '2021-12-30 21:16:47', '2022-01-04 19:31:38'),
(11, 'Delivery', 'Manchester United FC', 'England', 'iCwnKXtbNZswQcNRP3P8yYj7HMDbxAs2Vz36escB.png', '2021-12-30 21:19:03', '2022-01-04 20:57:21'),
(12, 'Football Stadium', 'Real Madrid', 'Madrid, Spain', 'uaBdarLC3Vr6PvrcCVgG9b40x2Oo1UV4wLkw1NyD.jpg', '2021-12-31 00:00:42', '2022-01-04 20:57:13'),
(13, 'Organization', 'Passerelles Numeriques Cambodia', 'Phnom Penh', 'S3BwBHSe3B4vSFNLUi2xnaH5eKJTNVk3o2z9jxGs.png', '2021-12-31 00:21:02', '2022-01-04 23:46:03'),
(14, 'Sell', 'Alibaba', 'China', '1USfbN2BhwaNSockfTv90QuOqNL9gzr9cQq45k5J.jpg', '2022-01-04 21:16:31', '2022-01-05 00:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `domain_companies`
--

CREATE TABLE `domain_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `domain_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domain_companies`
--

INSERT INTO `domain_companies` (`id`, `domain_name`, `created_at`, `updated_at`) VALUES
(1, 'Bank', '2021-12-30 00:18:52', '2021-12-30 00:18:52'),
(2, 'Solution', '2021-12-30 00:18:58', '2021-12-30 00:18:58'),
(3, 'Delivery', '2021-12-30 00:19:05', '2021-12-30 00:19:05'),
(4, 'Sell', '2021-12-30 00:19:17', '2021-12-30 00:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `employments`
--

CREATE TABLE `employments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `startJobDate` date NOT NULL,
  `endJobDate` date NOT NULL,
  `alumni_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `workPosition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employments`
--

INSERT INTO `employments` (`id`, `startJobDate`, `endJobDate`, `alumni_id`, `company_id`, `workPosition`, `created_at`, `updated_at`) VALUES
(1, '2022-01-10', '2022-01-10', 1, 1, 'Frontend Developer', '2021-12-30 00:21:24', '2021-12-30 00:21:24'),
(11, '2022-01-10', '2022-01-10', 10, 13, 'Wep developer', '2021-12-30 01:09:39', '2021-12-31 00:29:55'),
(12, '2021-12-31', '2021-12-31', 17, 10, 'King Development', '2021-12-30 21:16:53', '2021-12-30 21:16:53'),
(13, '2021-12-31', '2021-12-31', 17, 11, 'Manager', '2021-12-30 21:19:10', '2021-12-30 21:19:10'),
(14, '2021-12-31', '2021-12-31', 2, 10, 'Cooker', '2021-12-30 21:20:52', '2021-12-30 21:20:52'),
(15, '2021-12-31', '2021-12-31', 3, 11, 'Footballer', '2021-12-30 21:22:17', '2021-12-30 21:22:17'),
(16, '2021-12-31', '2021-12-31', 4, 10, 'Front Developer', '2021-12-30 21:23:09', '2021-12-30 21:23:09'),
(17, '2021-12-31', '2021-12-31', 5, 10, 'Mobile Developer', '2021-12-30 23:45:52', '2021-12-30 23:45:52'),
(18, '2021-12-31', '2021-12-31', 6, 11, 'Seller', '2021-12-30 23:51:10', '2021-12-30 23:51:10'),
(19, '2021-12-31', '2021-12-31', 7, 11, 'Backend Developer', '2021-12-30 23:52:10', '2021-12-30 23:52:10'),
(20, '2021-12-31', '2021-12-31', 8, 10, 'The Forest Protector', '2021-12-30 23:53:24', '2021-12-30 23:53:24'),
(21, '2021-12-31', '2021-12-31', 9, 10, 'Full Stack', '2021-12-30 23:54:38', '2021-12-30 23:54:38'),
(22, '2021-12-31', '2021-12-31', 17, 13, 'Taxi Driver', '2021-12-31 00:00:46', '2021-12-31 00:21:06'),
(24, '2022-01-27', '2022-01-27', 2, 13, 'Jelly Maker', '2022-01-02 17:52:00', '2022-01-02 17:52:00'),
(28, '2022-01-03', '2022-01-03', 5, 13, 'CG', '2022-01-03 03:14:07', '2022-01-03 03:14:07'),
(29, '2022-01-03', '2022-01-03', 5, 11, 'Cooker', '2022-01-03 03:14:21', '2022-01-03 03:14:21'),
(30, '2022-01-20', '2022-01-20', 9, 13, 'Hacker', '2022-01-03 19:12:28', '2022-01-03 19:12:28'),
(31, '2022-01-29', '2022-01-29', 9, 12, 'Delivery', '2022-01-03 19:12:48', '2022-01-03 19:12:48'),
(32, '2022-01-20', '2022-01-20', 8, 13, 'Cooker', '2022-01-05 00:48:08', '2022-01-05 00:48:08'),
(33, '2022-01-29', '2022-01-29', 8, 5, 'Killer', '2022-01-05 00:50:05', '2022-01-05 00:50:05'),
(34, '2022-01-15', '2022-01-15', 9, 11, 'Footballer', '2022-01-05 07:21:17', '2022-01-05 07:21:17'),
(35, '2022-01-22', '2022-01-22', 8, 11, 'Footballer', '2022-01-05 07:23:20', '2022-01-05 07:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_18_114144_create_alumnis_table', 1),
(6, '2021_12_19_074834_create_domain_companies_table', 1),
(7, '2021_12_19_082335_create_companies_table', 1),
(8, '2021_12_19_120009_create_skills_table', 1),
(9, '2021_12_20_014547_create_positions_table', 1),
(10, '2021_12_23_091845_create_batches_table', 1),
(11, '2021_12_24_013950_create_alumni_skills_table', 1),
(12, '2021_12_27_062336_create_employments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `skill_name`, `created_at`, `updated_at`) VALUES
(3, 'Test', '2021-12-30 00:30:11', '2021-12-30 00:30:11'),
(4, 'html', '2021-12-30 00:30:18', '2021-12-30 00:30:18'),
(5, 'CSS', '2021-12-30 00:31:52', '2021-12-30 00:31:52'),
(6, 'JAVA', '2021-12-30 00:32:00', '2021-12-30 00:32:00'),
(7, 'JavaScript', '2021-12-30 00:32:14', '2021-12-30 00:32:14'),
(8, 'PHP', '2021-12-30 00:32:27', '2021-12-30 00:32:27'),
(9, 'Laravel', '2021-12-30 00:32:36', '2021-12-30 00:32:36'),
(10, 'Oop', '2021-12-30 00:32:43', '2021-12-30 00:32:43'),
(11, 'Python', '2021-12-30 00:32:49', '2021-12-30 00:32:49'),
(12, 'Algorithm', '2021-12-30 00:33:00', '2021-12-30 00:33:00'),
(13, 'Kotlin', '2021-12-30 00:33:09', '2021-12-30 00:33:09'),
(14, 'Vue CLI', '2021-12-30 00:33:20', '2021-12-30 00:33:20'),
(15, 'Vue js', '2021-12-30 00:33:26', '2021-12-30 00:33:26'),
(16, 'CCNA', '2021-12-30 00:56:24', '2021-12-30 00:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Sophea', 'Soun', 'a2@gmail.com', NULL, '$2y$10$.on/ckaPXErodn3ovMwGIu.SUwWJ/ve/82VC4a5hJZzm5QaPnlt52', 'alumni', 'validated', NULL, '2021-12-30 00:11:35', '2021-12-30 00:24:26'),
(3, 'Dyna', 'Chhan', 'a3@gmail.com', NULL, '$2y$10$SfenUFTpvJzbNH3IydBtaOy.QX.htsFTVN0QytajKYT//9lPsIkqG', 'alumni', 'validated', NULL, '2021-12-30 00:12:36', '2021-12-30 00:29:08'),
(4, 'Sreyngit', 'Doeum', 'a4@gmail.com', NULL, '$2y$10$4YNo1vUUuABVXgBVGScQ3.4HWBVakhGhbvJr8gAyPdrgd1y6W5l.C', 'alumni', 'validated', NULL, '2021-12-30 00:12:41', '2021-12-30 00:36:22'),
(5, 'Kunthy', 'Sen', 'a5@gmail.com', NULL, '$2y$10$dfOwRcdfPWHCjKIsFT7FIe5wMNFZOOk9bXMfaskCX7PwyUpoXm40W', 'alumni', 'validated', NULL, '2021-12-30 00:12:46', '2021-12-30 00:41:14'),
(6, 'Koemsak', 'Mean', 'a6@gmail.com', NULL, '$2y$10$D.hAheYnskU6P749dBlvNe.OOAEY18/vT24LmIwZWx0IBV7g/OAxO', 'alumni', 'validated', NULL, '2021-12-30 00:12:51', '2021-12-30 00:45:00'),
(7, 'Siny', 'Sen', 'a7@gmail.com', NULL, '$2y$10$EbG9zaYLZ0wyb7O.qU40qOMteEJaYJ2G72OYxtMmDwigRIe2X5jgG', 'alumni', 'validated', NULL, '2021-12-30 00:12:58', '2021-12-30 00:49:58'),
(8, 'Thaly', 'Hen', 'a8@gmail.com', NULL, '$2y$10$EIfHLRVxmorWY2/WTYqh/ONpFPvptk/jEKR5ObhdfWU2omHjV2gV6', 'alumni', 'validated', NULL, '2021-12-30 00:13:02', '2022-01-05 01:43:45'),
(9, 'Thon', 'Theng', 'a9@gmail.com', NULL, '$2y$10$X/PeXn4YyRsSvW5EYgMCJeiHvWhKQ65qrVG3N8K.DVVzpwYeDCSSW', 'alumni', 'validated', NULL, '2021-12-30 00:13:06', '2021-12-30 01:01:33'),
(10, 'Sopheak', 'Von', 'a10@gmail.com', NULL, '$2y$10$suJOWaJeOVAxOAE8gEgvXORjkvBhSxhKE/sKm/masVeHA58PtsNeS', 'alumni', 'validated', NULL, '2021-12-30 00:13:11', '2021-12-30 01:07:44'),
(11, 'Piseth', 'Mok', 'e1@gmail.com', NULL, '$2y$10$jEUsbWhruD2Fz8iBamzGXObnh6IjglxkK2VWGvm2Thvj9UzKke6cu', 'ero', 'validated', NULL, '2021-12-30 00:13:22', '2021-12-30 01:11:14'),
(12, 'Synich', 'Hun', 'e2@gmail.com', NULL, '$2y$10$MdbJkTmwrzoSdiZcKbh9yul7G7m1TwxUeItftSVaF57Zd/ip931BS', 'ero', 'validated', NULL, '2021-12-30 00:13:28', '2021-12-30 01:13:29'),
(13, 'Sreypich', 'Ly', 'e3@gmail.com', NULL, '$2y$10$tsEiWKfWIVFDQBqyBPDozees1U/VlE3nY/HnsYweCYsFkz2uVGCXe', 'ero', 'validated', NULL, '2021-12-30 00:13:32', '2021-12-30 01:14:22'),
(14, 'Sim', 'Hul', 'e4@gmail.com', NULL, '$2y$10$JpUmYTaizh.Bx.lNOz0lZO6gNR7NNo1kcfczF9tpiQQ.PDJDJ2b9S', 'ero', 'validated', NULL, '2021-12-30 00:13:37', '2021-12-30 01:15:26'),
(15, 'Sophak', 'Huy', 'e5@gmail.com', NULL, '$2y$10$Ujn9lwsw77O5zpYLn1/1ve9L5k2qEpw/ukGHmEdTl3YAvXxxC6C0a', 'ero', 'validated', NULL, '2021-12-30 00:13:42', '2021-12-30 01:16:58'),
(16, NULL, NULL, 'admin@gmail.com', NULL, '$2y$10$oLijWdXWYorfRq80Y0E0ZOdg8HPuzLWFMnSRmJX6VDekUYYY3Z.bK', 'admin', 'validated', NULL, '2021-12-30 02:15:47', '2021-12-30 02:15:47'),
(28, 'Lyhuoy', 'In', 'lyhuoy.in@gmail.com', NULL, '$2y$10$gfSzSlvBxpBUufhOhCpWgOK/hQd7wo7l6wVbtwAFdRx1LT0jPGp1q', 'alumni', 'validated', NULL, '2022-01-05 07:25:00', '2022-01-05 07:25:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumnis`
--
ALTER TABLE `alumnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumnis_user_id_foreign` (`user_id`);

--
-- Indexes for table `alumni_skills`
--
ALTER TABLE `alumni_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domain_companies`
--
ALTER TABLE `domain_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employments`
--
ALTER TABLE `employments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumnis`
--
ALTER TABLE `alumnis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `alumni_skills`
--
ALTER TABLE `alumni_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `domain_companies`
--
ALTER TABLE `domain_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employments`
--
ALTER TABLE `employments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumnis`
--
ALTER TABLE `alumnis`
  ADD CONSTRAINT `alumnis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
