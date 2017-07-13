-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2017 at 12:40 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

DROP TABLE IF EXISTS `chat_users`;
CREATE TABLE IF NOT EXISTS `chat_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_time_online` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`id`, `email`, `first_name`, `last_name`, `avatar`, `role_id`, `last_time_online`) VALUES
(1, 'atanasoff@gmail.com', 'Atanas', 'Atanasoff', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1, 1499942447),
(158, 'BagerMan@abv.bg', 'Bager', 'Man', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1480628567),
(159, 'test@abv.bg', 'Todor', 'Nikolov', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1480713177),
(160, 'emil_krumov@hotmail.com', 'Emil', 'Krumov', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1484040618),
(161, '', 'Atanas', 'Atanassoff', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2, 1498636294);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `students_capacity` int(11) NOT NULL,
  `difficulty_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `students_capacity`, `difficulty_level`) VALUES
(8, 'Основи на АЕ', 'Lorem Ipsusdfsdfm is simply drummy text of the printing and typesetting industry. Lorem Ipsum has been...', 42, 3),
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
(20, 'Test', 'asdf', 34, 1),
(21, 'Test Course', 'sdfsdf', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `difficulty_levels`
--

DROP TABLE IF EXISTS `difficulty_levels`;
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

DROP TABLE IF EXISTS `lectures`;
CREATE TABLE IF NOT EXISTS `lectures` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `date_end` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `title`, `description`, `date`, `date_end`, `start`, `end`, `course_id`) VALUES
(3, 'Животът, Вселената и всичко останало', 'Дъглас Адамс е супер про в писането на извратени книги. All hail Adams.', '2016-12-17', '2016-12-17', '01:00:00', '14:00:00', 8),
(4, 'На тошко евента', 'нееееееееееееееееееееееееееееееееееееееее, хич', '2017-01-24', '2017-01-24', '12:00:00', '13:00:00', 0),
(5, 'Hah... Gaaaay', 'Да видим как ще излезне това', '2017-02-02', '2017-02-02', '01:00:00', '02:00:00', 15),
(6, 'Seats Test', 'Test for seats', '2017-03-25', '2017-03-25', '01:00:00', '02:34:00', 9),
(11, 'А дали Емо е наистина велик?', 'дай да видим', '2017-06-27', '2017-06-29', '01:00:00', '14:00:00', 8),
(12, 'Hills of Rock', 'Best fucking fest ever!', '2017-06-30', '2017-07-01', '17:00:00', '23:55:00', NULL),
(15, 'Жега е', 'дасдасд', '2017-07-12', '2017-07-12', '01:00:00', '02:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `message` varchar(510) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(139, 'awd', '1486027477', 160, 1),
(140, '123456', '1490882620', 0, 158),
(141, 'passwordemo', '1490882628', 0, 158),
(142, '&chcy;&icy;&chcy;&iecy;', '1490883212', 0, 1),
(143, 'pederas sait', '1492750032', 160, 1),
(144, 'test', '1493202336', 160, 1),
(145, 'test', '1493202337', 160, 1),
(146, 'test', '1493202337', 160, 1),
(147, 'test', '1493202338', 160, 1),
(148, 'test', '1493202338', 160, 1),
(149, 'test', '1493202339', 160, 1),
(150, 'test', '1493202340', 160, 1),
(151, 'test', '1493202340', 160, 1),
(152, 'test', '1493202341', 160, 1),
(153, 'test', '1493202341', 160, 1),
(154, 'test', '1493202342', 160, 1),
(155, '&lt;script&gt;alert&lpar;1&rpar;&lt;&sol;script&gt;', '1493733908', 160, 1),
(156, 'zdr bepce', '1498636300', 161, 1),
(157, 'sdfd', '1498734221', 160, 1),
(158, 'sdf', '1498734233', 160, 1),
(159, 'cv', '1498734239', 160, 1),
(160, 'zfx', '1498734276', 160, 1),
(161, '&kcy;&ocy;&scy;&tcy;&ucy;&rcy;', '1498736899', 0, 160),
(162, 'yay', '1498739039', 160, 1),
(163, 'sdfs', '1498739245', 160, 1),
(164, 'dfgdfg', '1499171569', 0, 1),
(165, 'ghjghj', '1499171574', 0, 1),
(166, 'gjghj', '1499171576', 0, 1),
(167, 'hkhjk', '1499171578', 0, 1),
(168, 'sdg', '1499696203', 160, 1),
(169, '&jcy;&kcy;&scy;&fcy;', '1499771217', 0, 160),
(170, '&zcy;&tscy;&scy;&dcy;', '1499773615', 160, 1),
(171, 'asdad', '1499844444', 160, 1),
(172, 'chat', '1499844506', 0, 1),
(173, 'xcvcb', '1499844542', 0, 1),
(174, 'asdasd', '1499844711', 0, 1),
(175, 'hkjh', '1499844780', 0, 1),
(176, 'hallo&comma; you bastards', '1499867490', 0, 1),
(177, 'halp', '1499868137', 20, 1),
(178, 'you bastard', '1499869226', 20, 1),
(179, 'you sick fak', '1499869238', 20, 1),
(180, 'you ba4', '1499869243', 20, 1),
(181, 'y tho&quest;', '1499869247', 20, 1),
(182, 'hallo', '1499869446', 0, 0),
(183, 'hallo', '1499869457', 0, 0),
(184, '&colon;&apos;&lpar;', '1499869464', 0, 0),
(185, 'dfsfsdf', '1499869467', 0, 0),
(186, 'nkjk', '1499869516', 0, 0),
(187, 'gfdg', '1499869621', 0, 0),
(188, 'asasd', '1499869687', 1, 0),
(189, 'kjl', '1499869701', 1, 0),
(190, 'sdf', '1499870003', 1, 0),
(191, '&scy;&dcy;&fcy;&scy;&fcy;', '1499875149', 1, 1),
(192, '&fcy;&gcy;&khcy;&fcy;', '1499875151', 1, 1),
(193, '&scy;&fcy;&scy;&dcy;&fcy;', '1499875162', 1, 1),
(194, 'jkkj', '1499927243', 1, 0),
(195, 'asdsa', '1499927686', 1, 20),
(196, 'yay', '1499927692', 1, 20),
(197, 'wohoo', '1499927701', 1, 20),
(198, 'sdfsf', '1499927873', 1, 3),
(199, 'fdgd', '1499935250', 1, 2),
(200, 'asdasd', '1499938208', 20, 1),
(201, 'asd', '1499938261', 20, 1),
(202, 'asdas', '1499938274', 20, 1),
(203, 'asdad', '1499938288', 20, 1),
(204, 'test', '1499938337', 20, 1),
(205, 'boos', '1499941706', 21, 1),
(206, 'reaccs', '1499941708', 21, 1),
(207, 'only', '1499941709', 21, 1),
(208, '&colon;&apos;&lpar;', '1499941735', 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `online_courses`
--

DROP TABLE IF EXISTS `online_courses`;
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

DROP TABLE IF EXISTS `online_lectures`;
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

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `type` smallint(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_index` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `type`, `content`, `post_index`) VALUES
(2, 1, 'https://www.youtube.com/watch?v=-AN71tjEYJw', -1),
(3, 0, 'Благодаря ти, Емо, че си супер пич!', 1),
(4, 1, 'https://www.youtube.com/watch?v=QygpaIJclm4', 1),
(5, 0, 'kjjhghj', 2),
(6, 2, 'http://az616578.vo.msecnd.net/files/2016/07/02/636030757259556361-1129479309_elon-musk.jpg', 5),
(8, 0, 'jkhjhk', -7),
(9, 2, 'https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg', 10),
(10, 0, 'Index 10 again', 10),
(12, 0, '00000000', 0),
(13, 0, 'new post', -5);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'normal'),
(3, 'banned');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `id` int(11) NOT NULL,
  `seat_index` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `seat_index`, `lecture_id`, `user_id`) VALUES
(1, 1, 6, NULL),
(2, 2, 6, NULL),
(3, 3, 6, NULL),
(4, 0, 6, NULL),
(5, 5, 6, NULL),
(6, 6, 6, NULL),
(7, 0, 7, NULL),
(8, 0, 7, NULL),
(9, 3, 7, NULL),
(10, 4, 7, NULL),
(11, 0, 7, NULL),
(12, 6, 7, NULL),
(13, 0, 7, NULL),
(14, 0, 7, NULL),
(15, 0, 7, NULL),
(16, 0, 7, NULL),
(17, 0, 7, NULL),
(18, 1, 0, NULL),
(19, 2, 0, NULL),
(20, 3, 0, NULL),
(21, 4, 0, NULL),
(22, 5, 0, NULL),
(23, 6, 0, NULL),
(24, 1, 8, NULL),
(25, 2, 8, NULL),
(26, 3, 8, NULL),
(27, 4, 8, NULL),
(28, 5, 8, NULL),
(29, 6, 8, NULL),
(30, 1, 9, NULL),
(31, 2, 9, NULL),
(32, 3, 9, NULL),
(33, 0, 9, NULL),
(34, 0, 9, NULL),
(35, 6, 9, NULL),
(36, 1, 10, NULL),
(37, 2, 10, NULL),
(38, 3, 10, NULL),
(39, 4, 10, NULL),
(40, 5, 10, NULL),
(41, 0, 10, NULL),
(42, 0, 11, NULL),
(43, 2, 11, NULL),
(44, 3, 11, NULL),
(45, 0, 11, NULL),
(46, 5, 11, NULL),
(47, 6, 11, NULL),
(48, 1, 12, NULL),
(49, 2, 12, NULL),
(50, 3, 12, NULL),
(51, 4, 12, NULL),
(52, 5, 12, NULL),
(53, 0, 12, NULL),
(54, 0, 13, NULL),
(55, 2, 13, NULL),
(56, 3, 13, NULL),
(57, 0, 13, NULL),
(58, 5, 13, NULL),
(59, 6, 13, NULL),
(60, 1, 14, 12),
(61, 2, 14, NULL),
(62, 3, 14, NULL),
(63, 4, 14, NULL),
(64, 5, 14, NULL),
(65, 6, 14, NULL),
(66, 1, 15, NULL),
(67, 2, 15, NULL),
(68, 3, 15, NULL),
(69, 4, 15, 12),
(70, 5, 15, NULL),
(71, 6, 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
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

DROP TABLE IF EXISTS `students_courses`;
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

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_acc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `password`, `secret_question`, `secret_answer`, `skype`, `google_acc`, `avatar`, `role_id`) VALUES
(1, 'atanasoff@gmail.com', 'Atanas', 'Atanasov', 'e10adc3949ba59abbe56e057f20f883e', 'My favourite class?', 'Zh class.', NULL, NULL, 'http://localhost:8088/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1),
(2, 'BagerMan@abv.bg', 'Bager', 'Man', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'bagerman98', 'toshko@gmail.com', 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 3),
(3, 'toshko_1998@abv.bg', 'Todor', 'Nikolov', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 3),
(4, 'test@abv.bg', 'Todor', 'Nikolov', 'e10adc3949ba59abbe56e057f20f883e', '', '', NULL, NULL, 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 3),
(5, '', '', '', '81dc9bdb52d04dc20036dbd8313ed055', 'Emo qk li e?', 'Em da ne kat tosho vrat!', 'emo', 'gogle@gogle.gogle', 'http://localhost:8088/AtanasovWebSiteProject/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 3),
(6, 'emo@abv.bg', 'emo', 'emov', 'd7613e3be440114904df5802ef2e31c8', '', '', NULL, NULL, 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 3),
(7, 'toshko@abv.bg', 'newestg', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'korona', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(8, 'test@test.test', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '', '', '', 'toshko@gmail.com', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(9, 'test@test.tes', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(10, 'slavislavchev@abv.bg', 'Slavi', 'Slavcheva', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'gotino_zubar4e', 'bosatnajenitewe@gmail.com', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 3),
(11, 'emo@abv.bgg', 'emo', 'dog', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(12, 'emil_krumov@hotmail.com', 'Emil', 'Krumov', 'f1887d3f9e6ee7a32fe5e76f4ab80d63', '', '', 'asdas', 'sad@abv.bg', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1),
(13, 'icp@asd.bg', 'Itzo', 'Itxo', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(14, 'abba@bg.bg', 'Abba', 'Beatle', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(15, 'asd@asd.bg', 'asd', 'asd', '6867d9167683fb8f42558a81ad107f5b', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(16, 'asdsa@abv.bg', 'random', 'sdf', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(17, 'banica@abv.bg', 'banica', 'banica', 'b343c20f32a9459238a115dfa08689c1', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 1),
(18, 'nasko_naskoff@gmail.com', 'Atanas', 'Atanassoff', '6ff65f2c74ce8d93bbebaf2152032088', '', '', 'nasko', 'nasko@gmail.com', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(19, 'testtest@abv.bg', 'test', 'test', 'cc03e747a6afbbcbf8be7668acfebee5', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(20, 'chat_test@abv.bg', 'chat', 'test', '47268c1687b2c072ac7e624bced6e7a7', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2),
(21, 'boosonly@abv.bg', 'Boos', 'Reaccs', 'a4545830a99a238050b460f491b39886', '', '', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg', 2);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `difficulty_levels`
--
ALTER TABLE `difficulty_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
