-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 
-- Версия на сървъра: 10.1.9-MariaDB
-- PHP Version: 5.6.15

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
-- Структура на таблица `chat_users`
--

DROP TABLE IF EXISTS `chat_users`;
CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_time_online` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Схема на данните от таблица `chat_users`
--

INSERT INTO `chat_users` (`id`, `email`, `first_name`, `last_name`, `avatar`, `role_id`, `last_time_online`) VALUES
(1, 'atanasoff@gmail.com', 'Atanas', 'Atanasoff', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 1, 1480713249),
(158, 'BagerMan@abv.bg', 'Bager', 'Man', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 2, 1480628567),
(159, 'test@abv.bg', 'Todor', 'Nikolov', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 2, 1480713177);

-- --------------------------------------------------------

--
-- Структура на таблица `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `students_capacity` int(11) NOT NULL,
  `difficulty_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `difficulty_levels`
--

DROP TABLE IF EXISTS `difficulty_levels`;
CREATE TABLE `difficulty_levels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `lectures`
--

DROP TABLE IF EXISTS `lectures`;
CREATE TABLE `lectures` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message` varchar(510) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` datetime NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `online_courses`
--

DROP TABLE IF EXISTS `online_courses`;
CREATE TABLE `online_courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` longblob,
  `difficulty_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `online_lectures`
--

DROP TABLE IF EXISTS `online_lectures`;
CREATE TABLE `online_lectures` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_index` int(11) NOT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Структура на таблица `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `students_courses`
--

DROP TABLE IF EXISTS `students_courses`;
CREATE TABLE `students_courses` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `password`, `secret_question`, `secret_answer`, `avatar`, `role_id`) VALUES
(1, 'atanasoff@gmail.com', 'Atanas', 'Atanasov', 'e10adc3949ba59abbe56e057f20f883e', 'My favourite class?', 'Zh class.', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 1),
(2, 'BagerMan@abv.bg', 'Bager', 'Man', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 2),
(3, 'toshko_1998@abv.bg', 'Todor', 'Nikolov', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 2),
(4, 'test@abv.bg', 'Todor', 'Nikolov', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'http://atanosoff.local/AppRoot/Resources/Images/Profile/profile_default_image.jpg', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `difficulty_levels`
--
ALTER TABLE `difficulty_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_courses`
--
ALTER TABLE `online_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `online_lectures`
--
ALTER TABLE `online_lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
