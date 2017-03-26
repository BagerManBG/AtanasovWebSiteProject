-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2017 at 11:10 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atanasko`
--
CREATE DATABASE IF NOT EXISTS `atanasko` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `atanasko`;

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE IF NOT EXISTS `chat_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_time_online` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`id`, `email`, `first_name`, `last_name`, `avatar`, `role_id`, `last_time_online`) VALUES
(1, 'atanasoff@gmail.com', 'Atanas', 'Atanasoff', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1, 1486311394),
(158, 'BagerMan@abv.bg', 'Bager', 'Man', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1480628567),
(159, 'test@abv.bg', 'Todor', 'Nikolov', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1480713177),
(160, 'emil_krumov@hotmail.com', 'Emil', 'Krumov', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1484040618);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `students_capacity` int(11) NOT NULL,
  `difficulty_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `students_capacity`, `difficulty_level`) VALUES
(8, 'Основи на АЕ', 'Lorem Ipsusdfsdfm is simply drummy text of the printing and typesetting industry. Lorem Ipsum has been...', 42, 3),
(9, 'Example Course', 'Test КУРs', 40, 1),
(10, 'Authentication Test', 'Auth', 12, 1),
(11, 'Authentication Test', 'Auth', 12, 1),
(12, 'asdsasd', 'asdasd', 3, 1),
(13, 'Test 3', 'test', 34, 1),
(14, 'Test Redirect', '14', 12, 1),
(15, 'Redirect Test', 'asdf', 13, 1),
(16, 'Here I go again', 'sadsd', 14, 1),
(17, 'I think I got it', 'sadasd', 14, 1),
(18, 'Nope, not yet', 'Just another desperate try', 15, 1),
(19, 'Come on..', 'asdasd', 24, 1),
(20, 'Test', 'asdf', 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `difficulty_levels`
--

CREATE TABLE IF NOT EXISTS `difficulty_levels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `difficulty_levels`
--

INSERT INTO `difficulty_levels` (`id`, `name`) VALUES
(1, 'Имай си'),
(2, 'Beginnerz'),
(3, 'Intermediate');

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE IF NOT EXISTS `lectures` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `title`, `description`, `date`, `start`, `end`, `course_id`) VALUES
(3, 'Животът, Вселената и всичко останало', 'Дъглас Адамс е супер про в писането на извратени книги. All hail Adams.', '2016-12-17', '01:00:00', '14:00:00', 8),
(4, 'На тошко евента', 'нееееееееееееееееееееееееееееееееееееееее, хич', '2017-01-24', '12:00:00', '13:00:00', 0),
(5, 'Hah... Gaaaay', 'Да видим как ще излезне това', '2017-02-02', '01:00:00', '02:00:00', 15),
(6, 'Seats Test', 'Test for seats', '2017-03-25', '01:00:00', '02:34:00', 9);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `message` varchar(510) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `send_time`, `sender_id`, `receiver_id`) VALUES
(1, 'asdf', '1480874156', 2, 1),
(2, 'bager', '1480874426', 2, 1),
(3, '&Acy;&ucy;&iecy; &kcy;&acy;&lcy;&tcy;&acy;&kcy;', '1484040631', 160, 1),
(4, '&mcy;&ncy;&ocy;&gcy;&ocy; &yacy;&kcy; &chcy;&acy;&tcy; &ucy;&iecy; &vcy;&rcy;&acy;&tcy;', '1484040639', 160, 1),
(5, '&tcy;&ocy; &bcy;&acy;&tscy;&acy; &ucy;&iecy;', '1484040644', 160, 1),
(6, '&vcy;&acy;&jcy;', '1484040649', 160, 1),
(7, '&mcy;&acy;&lcy;&kcy;&ocy; &bcy;&acy;&vcy;&ncy;&ocy; &mcy;&acy; &tcy;&ocy; &icy; &ncy;&icy;&iecy; &scy;&mcy;&iecy; &bcy;&acy;&vcy;&ncy;&icy;&comma; &ncy;&yacy;&mcy;&acy; &kcy;&vcy;&ocy; &dcy;&acy; &scy;&iecy; &scy;&hardcy;&dcy;&icy;&mcy;', '1484040672', 160, 1),
(8, '&icy; &scy;&kcy;&rcy;&ocy;&lcy; &lcy;&icy; &icy;&mcy;&acy; &vcy;&iecy;', '1484040696', 160, 1),
(9, '&vcy;&acy;&jcy;', '1484040699', 160, 1),
(10, '&acy;&icy; &dcy;&acy; &ncy;&iecy; &mcy;&icy; &scy;&icy;&jcy;&ncy;&vcy;&acy;&shcy;', '1484040734', 160, 1),
(11, '&iecy;&jcy; &bcy;&ocy;&ncy;&acy;&kcy;', '1484040741', 160, 1),
(12, '&tcy;&ucy;&kcy;&acy; &icy;&scy;&kcy;&acy;&mcy; &dcy;&acy; &kcy;&ucy;&pcy;&yacy; &iecy;&dcy;&icy;&ncy; &mcy;&acy;&tcy;&rcy;&acy;&kcy;', '1484040759', 160, 1),
(13, '&acy;&mcy;&acy; &khcy;&icy;&chcy; &ncy;&iecy; &scy;&icy; &pcy;&rcy;&acy;&vcy;&yacy; &tcy;&acy;&shcy;&acy;&kcy;', '1484040780', 160, 1),
(14, '&icy; &scy;&yacy; &icy;&scy;&kcy;&acy;&mcy; &dcy;&acy; &mcy;&icy; &kcy;&acy;&zhcy;&iecy;&shcy; &kcy;&acy;&kcy;', '1484040797', 160, 1),
(15, '&ncy;&acy; &rcy;&acy;&pcy;&acy; &scy;&icy; &dcy;&acy; &scy;&lcy;&ocy;&zhcy;&acy; &bcy;&acy;&kcy;&icy;&ncy;&gcy; &tcy;&rcy;&acy;&kcy;', '1484040814', 160, 1),
(16, '&chcy;&iecy; &icy;&ncy;&acy;&chcy;&iecy; &shchcy;&icy; &chcy;&ucy;&pcy;&yacy; &kcy;&rcy;&acy;&kcy;', '1484040825', 160, 1),
(17, '&ncy;&iecy; &mcy;&iecy; &pcy;&rcy;&acy;&vcy;&icy; &scy;&vcy;&ocy;&jcy; &vcy;&rcy;&acy;&gcy;', '1484040863', 160, 1),
(18, '&acy;&zcy; &scy;&hardcy;&mcy; &tcy;&icy; &pcy;&rcy;&icy;&yacy;&tcy;&iecy;&lcy; &mcy;&ncy;&ocy;&gcy;&ocy; &dcy;&rcy;&acy;&gcy;', '1484040874', 160, 1),
(19, '&zcy;&acy; &tcy;&iecy;&bcy;&iecy; &scy;&pcy;&icy;&rcy;&acy;&mcy; &vcy;&lcy;&acy;&kcy;', '1484040887', 160, 1),
(20, '&scy;&acy;&mcy;&ocy;&lcy;&iecy;&tcy;&icy; &scy;&vcy;&acy;&lcy;&yacy;&mcy; &chcy;&acy;&kcy;', '1484040896', 160, 1),
(21, '&ncy;&acy; &kcy;&ocy;&tcy;&iecy;&tcy;&acy;&tcy;&acy; &kcy;&acy;&zcy;&vcy;&acy;&mcy; &dcy;&zcy;&acy;&kcy;', '1484040908', 160, 1),
(22, '&ncy;&acy;&scy;&kcy;&ocy; &gcy;&ocy; &iecy;&bcy;&iecy; &chcy;&icy;&chcy;&acy;&kcy;', '1484040919', 160, 1),
(23, '&pcy;&acy;&tcy;&iecy;&tcy;&acy;&tcy;&acy; &kcy;&acy;&zcy;&vcy;&acy;&tcy; &kcy;&vcy;&acy;&kcy;', '1484040946', 160, 1),
(24, '&Mcy;&iecy;&scy;&tcy;&iecy;&ncy; &zhcy;&icy;&tcy;&iecy;&lcy; &ncy;&acy; &Kcy;&acy;&zcy;&acy;&khcy;&scy;&tcy;&acy;&ncy; &scy;&iecy; &ncy;&acy;&rcy;&icy;&chcy;&acy; &kcy;&acy;&zcy;&acy;&kcy;', '1484041018', 160, 1),
(25, '&scy;&tcy;&ocy;&pcy;&hardcy;&tcy; &iecy; &ncy;&iecy;&ncy;&ucy;&zhcy;&iecy;&ncy; &zcy;&ncy;&acy;&kcy;', '1484041040', 160, 1),
(26, '&zhcy;&ocy;&rcy;&ocy; &pcy;&lcy;&acy;&vcy;&acy; &ncy;&acy; &kcy;&acy;&yacy;&kcy;', '1484041067', 160, 1),
(27, '&yacy;&kcy;&ocy; &iecy; &dcy;&acy; &scy;&icy; &gcy;&ocy;&tcy;&icy;&ncy;&comma; &ncy;&ocy; &gcy;&ocy;&tcy;&icy;&ncy;&ocy; &lcy;&icy; &iecy; &dcy;&acy; &scy;&icy; &yacy;&kcy;', '1484041079', 160, 1),
(28, '&ncy;&acy;&vcy;&hardcy;&ncy;&kcy;&acy; &icy;&mcy;&acy; &mcy;&acy;&lcy;&kcy;&ocy; &scy;&ncy;&yacy;&kcy;', '1484041090', 160, 1),
(29, '&kcy;&ocy;&jcy;&tcy;&ocy; &scy;&icy; &pcy;&icy;&shcy;&iecy; &scy; &gcy; &ucy;&iecy; &kcy;&acy;&lcy;&tcy;&acy;&kcy;', '1484041109', 160, 1),
(30, '&kcy;&vcy;&ocy; &mcy;&iecy; &scy;&icy;&jcy;&ncy;&vcy;&acy;&shcy; &kcy;&acy;&tcy; &scy;&lcy;&ocy;&vcy;&acy;&kcy;', '1484041133', 160, 1),
(31, '&shchcy;&iecy; &tcy;&iecy; &pcy;&rcy;&acy;&tcy;&yacy; &vcy;&hardcy;&vcy; &Gcy;&ucy;&lcy;&acy;&gcy;', '1484041146', 160, 1),
(32, '&zcy;&acy; &tcy;&iecy;&bcy; &mcy;&icy;&ncy;&acy;&khcy; &ncy;&acy; &dcy;&rcy;&ucy;&gcy;&icy;&yacy; &bcy;&rcy;&yacy;&gcy;', '1484041170', 160, 1),
(33, '&ncy;&acy;&dcy;&mcy;&icy;&ncy;&acy;&khcy; &kcy;&ocy;&ncy;&scy;&kcy;&icy; &bcy;&yacy;&gcy;', '1484041179', 160, 1),
(34, '&bcy;&acy;&zcy;&acy;&tcy;&acy; &ncy;&icy; &ncy;&iecy; &iecy; &ocy;&bcy;&shchcy;&ocy;&comma; &acy; &tcy;&icy; &scy;&icy; &gcy;&iecy;&jcy;&tcy;&acy;&kcy;', '1484041352', 160, 1),
(35, 'jasldjaskldjlj', '1485268016', 158, 1),
(36, '&Bcy;&acy;&vcy;&ncy;&yacy;&rcy;', '1485268026', 158, 1),
(37, '1', '1485268030', 158, 1),
(38, '&dcy;&fcy;&scy;&kcy;&fcy;&scy;&kcy;&dcy;&lcy;', '1485268040', 158, 1),
(39, '&fcy;&semi;', '1485268043', 158, 1),
(40, '&dcy;', '1485268044', 158, 1),
(41, '&scy;', '1485268045', 158, 1),
(42, '&acy;', '1485268046', 158, 1),
(43, '&zcy;', '1485268047', 158, 1),
(44, '&tscy;', '1485268048', 158, 1),
(45, '&softcy;', '1485268049', 158, 1),
(46, '&scy;', '1485268050', 158, 1),
(47, '&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;', '1485268064', 158, 1),
(48, '&dcy;', '1485268067', 158, 1),
(49, '&dcy;', '1485268067', 158, 1),
(50, '&dcy;', '1485268067', 158, 1),
(51, '&dcy;', '1485268067', 158, 1),
(52, '&dcy;', '1485268067', 158, 1),
(53, '&dcy;', '1485268068', 158, 1),
(54, '&dcy;', '1485268068', 158, 1),
(55, '&dcy;', '1485268068', 158, 1),
(56, '&dcy;', '1485268068', 158, 1),
(57, '&dcy;', '1485268068', 158, 1),
(58, '&dcy;', '1485268068', 158, 1),
(59, '&dcy;', '1485268069', 158, 1),
(60, '&dcy;', '1485268069', 158, 1),
(61, '&dcy;', '1485268069', 158, 1),
(62, '&dcy;', '1485268069', 158, 1),
(63, '&dcy;', '1485268069', 158, 1),
(64, '&dcy;', '1485268070', 158, 1),
(65, '&dcy;', '1485268070', 158, 1),
(66, '&dcy;', '1485268070', 158, 1),
(67, '&dcy;', '1485268070', 158, 1),
(68, '&dcy;', '1485268070', 158, 1),
(69, '&dcy;', '1485268071', 158, 1),
(70, '&dcy;', '1485268071', 158, 1),
(71, '&dcy;', '1485268071', 158, 1),
(72, '&dcy;', '1485268071', 158, 1),
(73, '&dcy;', '1485268072', 158, 1),
(74, '&dcy;', '1485268072', 158, 1),
(75, '&dcy;', '1485268072', 158, 1),
(76, '&dcy;', '1485268072', 158, 1),
(77, '&dcy;', '1485268073', 158, 1),
(78, '&dcy;', '1485268073', 158, 1),
(79, '&dcy;', '1485268073', 158, 1),
(80, '&dcy;', '1485268073', 158, 1),
(81, '&dcy;', '1485268073', 158, 1),
(82, '&dcy;', '1485268074', 158, 1),
(83, '&dcy;', '1485268074', 158, 1),
(84, '&dcy;', '1485268074', 158, 1),
(85, '&dcy;', '1485268074', 158, 1),
(86, '&dcy;', '1485268074', 158, 1),
(87, '&dcy;', '1485268075', 158, 1),
(88, '&softcy;', '1485268079', 158, 1),
(89, '&softcy;', '1485268080', 158, 1),
(90, '&softcy;', '1485268080', 158, 1),
(91, '&softcy;', '1485268080', 158, 1),
(92, '&softcy;', '1485268080', 158, 1),
(93, '&softcy;', '1485268080', 158, 1),
(94, '&softcy;', '1485268081', 158, 1),
(95, '&softcy;', '1485268081', 158, 1),
(96, '&softcy;', '1485268081', 158, 1),
(97, '&dcy;', '1485268082', 158, 1),
(98, '&acy;', '1485268082', 158, 1),
(99, '&acy;', '1485268083', 158, 1),
(100, '&scy;', '1485268083', 158, 1),
(101, '&scy;', '1485268083', 158, 1),
(102, '&dcy;', '1485268084', 158, 1),
(103, '&fcy;', '1485268084', 158, 1),
(104, '&gcy;', '1485268084', 158, 1),
(105, '&khcy;', '1485268085', 158, 1),
(106, '&jcy;', '1485268085', 158, 1),
(107, '&kcy;', '1485268085', 158, 1),
(108, '&lcy;', '1485268086', 158, 1),
(109, '&lcy;', '1485268086', 158, 1),
(110, '&lcy;', '1485268086', 158, 1),
(111, '&icy;', '1485268087', 158, 1),
(112, '&ucy;', '1485268087', 158, 1),
(113, '&hardcy;', '1485268087', 158, 1),
(114, '&hardcy;', '1485268087', 158, 1),
(115, '&tcy;', '1485268088', 158, 1),
(116, '&tcy;', '1485268088', 158, 1),
(117, '&rcy;', '1485268088', 158, 1),
(118, '&rcy;', '1485268089', 158, 1),
(119, '&iecy;', '1485268089', 158, 1),
(120, '&iecy;', '1485268089', 158, 1),
(121, '&iecy;', '1485268089', 158, 1),
(122, '&dcy;', '1485268092', 158, 1),
(123, '&dcy;', '1485268092', 158, 1),
(124, '&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;&dcy;', '1485268196', 160, 1),
(125, 'mzdsdsa', '1485268628', 1, 158),
(126, '&Acy;&tcy;&acy;&ncy;&acy;&scy;&ocy;&vcy; &shchcy;&iecy; &ncy;&icy; &shcy;&icy;&shcy;&iecy; &shcy;&iecy;&scy;&tcy;&icy;&tscy;&icy;', '1485517890', 160, 1),
(127, '&fcy;&semi;&dcy;&fcy;&semi;&fcy;&fcy;&lcy;&fcy;&lcy;&fcy;&lcy;', '1485517898', 160, 1),
(128, '&mcy;&fcy;&mcy;&fcy;&mcy;&fcy;&mcy;&fcy;&mcy;&fcy;&mcy;&fcy;', '1485517900', 160, 1),
(129, '&Acy;&tcy;&acy;&ncy;&acy;&scy;&ocy;&vcy; - &mcy;&ncy;&ocy;&gcy;&ocy; &yacy;&kcy;', '1485517910', 160, 1),
(130, '&Vcy;&scy;&iecy;&kcy;&icy; &dcy;&rcy;&ucy;&gcy; &iecy; &bcy;&ocy;&ncy;&acy;&kcy;', '1485517919', 160, 1),
(131, '&Bcy;&ucy;&ncy;&acy;&kcy;&ast;', '1485517924', 160, 1),
(132, '&Icy; &ncy;&icy; &pcy;&rcy;&acy;&tcy;&icy; &vcy; &Gcy;&ucy;&lcy;&acy;&gcy;', '1485517933', 160, 1),
(133, 'dawda', '1486027472', 160, 1),
(134, 'dawda', '1486027473', 160, 1),
(135, 'daw', '1486027474', 160, 1),
(136, 'daw', '1486027474', 160, 1),
(137, 'daw', '1486027474', 160, 1),
(138, 'dwad', '1486027475', 160, 1),
(139, 'awd', '1486027477', 160, 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_courses`
--

CREATE TABLE IF NOT EXISTS `online_courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` longblob,
  `difficulty_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_courses`
--

INSERT INTO `online_courses` (`id`, `name`, `description`, `picture`, `difficulty_level`) VALUES
(1, 'English Language Basics', 'ми да има, пък', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_lectures`
--

CREATE TABLE IF NOT EXISTS `online_lectures` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_index` int(11) NOT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_lectures`
--

INSERT INTO `online_lectures` (`id`, `title`, `lecture_index`, `video_link`, `course_id`) VALUES
(1, 'Тест Онлайн', 1, 'https://www.youtube.com/watch?v=tnBQmEqBCY0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE IF NOT EXISTS `seats` (
  `id` int(11) NOT NULL,
  `seat_index` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `seat_index`, `lecture_id`, `user_id`) VALUES
(1, 1, 6, NULL),
(2, 2, 6, NULL),
(3, 3, 6, NULL),
(4, 0, 6, 5),
(5, 5, 6, NULL),
(6, 6, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students_courses`
--

CREATE TABLE IF NOT EXISTS `students_courses` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_courses`
--

INSERT INTO `students_courses` (`student_id`, `course_id`) VALUES
(5, 8),
(5, 8),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `password`, `secret_question`, `secret_answer`, `avatar`, `role_id`) VALUES
(1, 'atanasoff@gmail.com', 'Atanas', 'Atanasov', 'e10adc3949ba59abbe56e057f20f883e', 'My favourite class?', 'Zh class.', 'http://localhost:8088/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1),
(2, 'BagerMan@abv.bg', 'Bager', 'Man', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(3, 'toshko_1998@abv.bg', 'Todor', 'Nikolov', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(4, 'test@abv.bg', 'Todor', 'Nikolov', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(5, 'emil_krumov@hotmail.com', 'Emil', 'Krumov', '588bbc7137db3eff5ac3e352aff3666e', 'Emo qk li e?', 'Em da ne kat tosho vrat!', 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1),
(6, 'emo@abv.bg', 'emo', 'emov', 'd7613e3be440114904df5802ef2e31c8', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_difficulty_index` (`difficulty_level`);

--
-- Indexes for table `difficulty_levels`
--
ALTER TABLE `difficulty_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_course_index` (`course_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_courses`
--
ALTER TABLE `online_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_course_difficulty_index` (`difficulty_level`);

--
-- Indexes for table `online_lectures`
--
ALTER TABLE `online_lectures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lecture_course_id_index` (`course_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seat_lecture_id_index` (`lecture_id`),
  ADD KEY `seats_user_id_index` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD KEY `student_course_index` (`student_id`),
  ADD KEY `course_student_index` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_role_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `difficulty_levels`
--
ALTER TABLE `difficulty_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `online_courses`
--
ALTER TABLE `online_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `online_lectures`
--
ALTER TABLE `online_lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
