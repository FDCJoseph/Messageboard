-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 24, 2024 at 09:46 AM
-- Server version: 8.0.37
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `msgUsers`
--

CREATE TABLE `msgUsers` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `modified_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `hobby` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `msgUsers`
--

INSERT INTO `msgUsers` (`id`, `name`, `email`, `password`, `created`, `modified`, `created_ip`, `modified_ip`, `last_login_time`, `profile_picture`, `birthdate`, `gender`, `hobby`) VALUES
(1, 'OneYap', 'yap@gmail.com', 'admin123', '2024-06-13 08:48:52', '2024-06-13 08:48:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'TwoYap', 'yap2@gmail.com', 'admin123', '2024-06-13 08:54:37', '2024-06-13 08:54:37', '192.168.65.1', '192.168.65.1', NULL, NULL, NULL, NULL, NULL),
(3, 'ThreeYap', 'yap3@gmail.com', 'admin123', '2024-06-13 08:56:47', '2024-06-13 08:56:47', '192.168.65.1', '192.168.65.1', NULL, NULL, NULL, NULL, NULL),
(4, 'FourYap', 'yap4@gmail.com', '$2a$10$WgC0reOtcUkh84wfG5DSw..spqsns2K9OLYhH/lko1z2HclLkA7GK', '2024-06-13 09:07:14', '2024-06-23 12:28:10', '192.168.65.1', '192.168.65.1', '2024-06-23 12:28:10', NULL, NULL, NULL, NULL),
(5, 'FiveYap', 'yap5@gmail.com', '$2a$10$LthGEc/zgtFm0GgQ68dU8udtQmWooXMtTnx2NoxqgOrQy/dGpyE82', '2024-06-13 09:14:19', '2024-06-20 09:48:44', '192.168.65.1', '192.168.65.1', '2024-06-20 09:48:44', NULL, NULL, NULL, NULL),
(6, 'SixYap', 'yap6@gmail.com', '$2a$10$buZL3hC7VGZpGctEfSZYEeXjVLp/qVFvBM9QMU6KQTb4SeMohsC1O', '2024-06-13 09:27:18', '2024-06-13 09:27:18', '192.168.65.1', '192.168.65.1', NULL, NULL, NULL, NULL, NULL),
(7, 'Yapseven', 'yap7@gmail.com', '$2a$10$I.79Vnu4Mu6z1KLZ68b.y.wVgss2FM0WDGLh6Lt52A11ebuJ5SiKq', '2024-06-13 09:35:53', '2024-06-24 00:43:06', '192.168.65.1', '192.168.65.1', '2024-06-24 00:43:06', 'uploads/6672a1ff0cb6c.png', '2004-06-03', 'male', 'Im yap seven'),
(8, 'sadasd8', 'yap8@gmai.com', '$2a$10$GspM/E9E/t/cNiH.2vfx8eeAoDhSgY/.MkWS10rnBxg6iQeAJSh4O', '2024-06-13 09:37:42', '2024-06-16 11:21:06', '192.168.65.1', '192.168.65.1', '2024-06-16 11:18:17', 'uploads/666ecaa2d82ce.jpg', '2024-06-03', NULL, NULL),
(9, 'NineYapp', 'yap9@gmail.com', '$2a$10$41CYkQjw7vVA0CRYzh7N3eqGwZgUxP0Yfk9W98Rbu3lH7gJc1r.Ca', '2024-06-13 09:42:57', '2024-06-16 03:50:24', '192.168.65.1', '192.168.65.1', '2024-06-16 03:28:19', NULL, NULL, NULL, NULL),
(10, 'EightYap', 'yap8@gmail.com', '$2a$10$klIldZqez.vAnl5j.S0x6.q7rCgPGGnIKmpfeHyCRf.H6kRL/kS0K', '2024-06-14 08:36:57', '2024-06-15 11:15:54', '192.168.65.1', '192.168.65.1', '2024-06-15 11:15:54', NULL, NULL, NULL, NULL),
(11, 'Tenyap', 'yap10@gmail.com', '$2a$10$zlT5hT5DkWC3ms/A1jusiu4aKRctZxQbyxuAVEVZT2U2tdKpo.ANu', '2024-06-15 11:18:08', '2024-06-20 09:21:47', '192.168.65.1', '192.168.65.1', '2024-06-20 09:21:47', 'uploads/6672a8a0ac0e6.jpg', '2014-03-19', 'male', 'I like to listen songs'),
(12, 'Yape11', 'yap11@gmail.com', '$2a$10$.h.9qQ9GjkP55TQXhuMmJeQ0QIF0ssgxHx4NWNQj4nl6hrsoL1FkW', '2024-06-16 04:27:26', '2024-06-20 09:16:15', '192.168.65.1', '192.168.65.1', '2024-06-20 08:44:44', 'uploads/6673f35fb174f.png', '2024-06-12', 'male', 'Sample ');

-- --------------------------------------------------------

--
-- Table structure for table `newMsg`
--

CREATE TABLE `newMsg` (
  `msg_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_ip` varchar(255) DEFAULT NULL,
  `modified_ip` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `newMsg`
--

INSERT INTO `newMsg` (`msg_id`, `sender_id`, `recipient_id`, `message`, `created`, `modified`, `created_ip`, `modified_ip`, `is_deleted`) VALUES
(1, 7, 4, 'Sample message', '2024-06-21 08:23:23', '2024-06-21 08:23:23', '192.168.65.1', '192.168.65.1', 1),
(2, 7, 4, 'Hello, this is the start of the conversation.', '2024-06-21 08:29:34', '2024-06-21 08:29:34', '192.168.65.1', '192.168.65.1', 0),
(3, 7, 4, 'Hello my name is Yapseven. What\'s your name?', '2024-06-21 08:54:10', '2024-06-21 08:54:10', '192.168.65.1', '192.168.65.1', 0),
(4, 7, 4, 'Hey, are you there?', '2024-06-21 08:57:02', '2024-06-21 08:57:02', '192.168.65.1', '192.168.65.1', 0),
(5, 4, 7, 'Hi, I\'m here.', '2024-06-21 08:58:46', '2024-06-21 08:58:46', '192.168.65.1', '192.168.65.1', 0),
(6, 7, 4, 'Give me your name.', '2024-06-21 09:34:09', '2024-06-21 09:34:09', '192.168.65.1', '192.168.65.1', 0),
(7, 4, 7, 'My name is...', '2024-06-21 09:41:04', '2024-06-21 09:41:04', '192.168.65.1', '192.168.65.1', 0),
(8, 4, 7, 'Good morning', '2024-06-22 01:39:25', '2024-06-22 01:39:25', '192.168.65.1', '192.168.65.1', 0),
(9, 4, 7, 'good morning heyo', '2024-06-22 01:55:58', '2024-06-22 01:55:58', '192.168.65.1', '192.168.65.1', 0),
(10, 7, 4, 'morning too', '2024-06-22 01:59:29', '2024-06-22 01:59:29', '192.168.65.1', '192.168.65.1', 0),
(11, 7, 4, 'Have you eaten your breakfast?', '2024-06-22 02:13:58', '2024-06-22 02:13:58', '192.168.65.1', '192.168.65.1', 0),
(12, 7, 4, 'Let\'s talk!', '2024-06-22 02:19:56', '2024-06-22 02:19:56', '192.168.65.1', '192.168.65.1', 0),
(13, 7, 4, 'Is it working now?', '2024-06-22 02:26:06', '2024-06-22 02:26:06', '192.168.65.1', '192.168.65.1', 0),
(14, 7, 4, 'The ajax has a problem.', '2024-06-22 02:30:33', '2024-06-22 02:30:33', '192.168.65.1', '192.168.65.1', 0),
(15, 4, 7, 'Really? what is the problem?', '2024-06-22 02:31:31', '2024-06-22 02:31:31', '192.168.65.1', '192.168.65.1', 0),
(16, 7, 4, 'Idk, I\'m trying to figure it out.', '2024-06-22 02:31:59', '2024-06-22 02:31:59', '192.168.65.1', '192.168.65.1', 0),
(17, 4, 7, 'Is it okay now?', '2024-06-22 02:38:21', '2024-06-22 02:38:21', '192.168.65.1', '192.168.65.1', 0),
(18, 7, 4, 'Can you see my msg immediately?', '2024-06-22 02:46:58', '2024-06-22 02:46:58', '192.168.65.1', '192.168.65.1', 0),
(19, 4, 7, 'Let\'s try. Can you see this?', '2024-06-22 02:47:43', '2024-06-22 02:47:43', '192.168.65.1', '192.168.65.1', 0),
(20, 7, 4, 'U cant see it?', '2024-06-22 02:49:01', '2024-06-22 02:49:01', '192.168.65.1', '192.168.65.1', 0),
(21, 4, 7, 'How about now', '2024-06-22 02:56:06', '2024-06-22 02:56:06', '192.168.65.1', '192.168.65.1', 0),
(22, 7, 4, 'It is still not working', '2024-06-22 02:58:26', '2024-06-22 02:58:26', '192.168.65.1', '192.168.65.1', 0),
(23, 4, 7, 'I\'ll reload', '2024-06-22 02:59:55', '2024-06-22 02:59:55', '192.168.65.1', '192.168.65.1', 0),
(24, 7, 4, 'Nice, it\'s working now.', '2024-06-22 03:00:21', '2024-06-22 03:00:21', '192.168.65.1', '192.168.65.1', 0),
(25, 4, 7, 'Hello, there.', '2024-06-22 06:14:49', '2024-06-22 06:14:49', '192.168.65.1', '192.168.65.1', 0),
(26, 4, 7, 'Is everything okay now?', '2024-06-22 06:59:47', '2024-06-22 06:59:47', '192.168.65.1', '192.168.65.1', 0),
(27, 4, 7, 'is it fine now?', '2024-06-22 07:38:58', '2024-06-22 07:38:58', '192.168.65.1', '192.168.65.1', 0),
(28, 7, 4, 'I think its fine now', '2024-06-22 07:44:11', '2024-06-22 07:44:11', '192.168.65.1', '192.168.65.1', 0),
(29, 4, 7, 'Nice, glad to hear it', '2024-06-22 07:44:38', '2024-06-22 07:44:38', '192.168.65.1', '192.168.65.1', 0),
(30, 7, 7, 'What\'s up?', '2024-06-22 14:13:54', '2024-06-22 14:13:54', '192.168.65.1', '192.168.65.1', 0),
(31, 7, 4, 'What\'s up?', '2024-06-22 14:14:36', '2024-06-22 14:14:36', '192.168.65.1', '192.168.65.1', 0),
(32, 4, 7, 'Hello, good evening.', '2024-06-22 14:18:11', '2024-06-22 14:18:11', '192.168.65.1', '192.168.65.1', 0),
(33, 4, 7, 'Let\'s talk. Give a topic.', '2024-06-22 14:19:03', '2024-06-22 14:19:03', '192.168.65.1', '192.168.65.1', 0),
(34, 4, 7, 'Good morning!', '2024-06-23 02:49:15', '2024-06-23 02:49:15', '192.168.65.1', '192.168.65.1', 0),
(35, 4, 7, 'Hiiii', '2024-06-23 02:56:14', '2024-06-23 02:56:14', '192.168.65.1', '192.168.65.1', 0),
(36, 4, 7, 'The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.', '2024-06-23 03:12:36', '2024-06-23 03:12:36', '192.168.65.1', '192.168.65.1', 0),
(37, 7, 4, 'Too much', '2024-06-23 03:14:06', '2024-06-23 03:14:06', '192.168.65.1', '192.168.65.1', 0),
(38, 7, 4, 'good noon', '2024-06-23 04:16:06', '2024-06-23 04:16:06', '192.168.65.1', '192.168.65.1', 0),
(39, 4, 7, 'heyoo', '2024-06-23 12:28:24', '2024-06-23 12:28:24', '192.168.65.1', '192.168.65.1', 0),
(40, 4, 7, 'helloooo', '2024-06-23 13:44:52', '2024-06-23 13:44:52', '192.168.65.1', '192.168.65.1', 0),
(41, 7, 4, 'good evening', '2024-06-23 14:01:40', '2024-06-23 14:01:40', '192.168.65.1', '192.168.65.1', 0),
(42, 7, 4, 'Good morning sdjhasdhasdhkjsakdh', '2024-06-24 00:46:28', '2024-06-24 00:46:28', '192.168.65.1', '192.168.65.1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created`, `modified`, `first_name`, `last_name`, `password`, `user_id`) VALUES
(1, 'The title', 'This is the post body sample sample hey', '2024-06-06 02:57:28', '2024-06-06 10:19:28', 'One', 'Yap', 'admin123', NULL),
(2, 'A title once again', 'And the post body follows.', '2024-06-06 02:57:28', NULL, 'Two', 'Yap', 'admin123', NULL),
(3, 'Title strikes back', 'This is really exciting! Not.', '2024-06-06 02:57:28', NULL, 'Three', 'Yap', 'admin123', NULL),
(4, NULL, NULL, '2024-06-06 04:52:36', '2024-06-06 04:52:36', 'Four', 'Yap', 'admin123', NULL),
(5, NULL, NULL, '2024-06-06 04:57:20', '2024-06-06 04:57:20', 'Five', 'Yap', 'admin123', NULL),
(6, NULL, NULL, '2024-06-06 05:24:17', '2024-06-06 05:24:17', 'Six', 'Yap', 'admin123', NULL),
(7, NULL, NULL, '2024-06-06 05:27:54', '2024-06-06 05:27:54', 'Seven', 'Yap', 'admin123', NULL),
(8, NULL, NULL, '2024-06-06 06:02:55', '2024-06-06 06:02:55', 'Eight', 'Yap', 'admin123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created`, `modified`) VALUES
(1, 'OneYap', '$2a$10$SCr1YSVNYI6/4tJXMwktRukp3DR89oDzAhzsRobMJD0bSkVGFYvLW', 'admin', '2024-06-06 06:22:31', '2024-06-06 06:22:31'),
(2, 'Two', '$2a$10$BsnhDFDxwVEwsgWsxPyiYeOW9FNSGJtbBliufqe.KIzZ7g3PWYjMy', 'author', '2024-06-06 06:28:20', '2024-06-06 06:28:20'),
(3, 'ThreeYap', '$2a$10$hgD2Tfu2WcyBrrwysLqqy.dyXOvBquVhOMBPr4yMcBEZ.7vU.BS3u', 'admin', '2024-06-06 06:32:34', '2024-06-06 06:32:34'),
(4, 'FourYap', '$2a$10$llNjzckXisfcKmi/rgmlUeyT/hoHocIwe./S9Uthxd3R2QqvX9P/C', 'author', '2024-06-06 06:50:08', '2024-06-06 06:50:08'),
(5, 'FiveYap', '$2a$10$7t67Wr4Gx.uDt5JZ4E2ZNelu7od/chrhMRuAdhi0F3M570WHW1vkW', 'admin', '2024-06-06 06:50:47', '2024-06-06 06:50:47'),
(6, 'Sixna', '$2a$10$fPh58nG563Jwep7oz6V3Qe3NsTjrj8okhZLJ20F7kOLxb.n29iR5a', 'admin', '2024-06-06 06:51:28', '2024-06-06 06:51:28'),
(7, 'Sevenup', '$2a$10$C8QZPOS/la20ZN5OZ0FbjeZaewFql2YwqjJO2Z34SNcLMREILo5NW', 'admin', '2024-06-06 06:53:44', '2024-06-06 06:53:44'),
(8, 'NineYap', '$2a$10$0m.IUFD064hjjHuVu55SJ.YnohYqH9TQcE0TrUDrM0FZpv04Gy13a', 'admin', '2024-06-06 10:35:21', '2024-06-06 10:35:21'),
(9, NULL, 'cde3bgt5_root', NULL, '2024-06-13 06:53:16', '2024-06-13 06:53:16'),
(10, NULL, '', NULL, '2024-06-13 06:56:03', '2024-06-13 06:56:03'),
(11, NULL, '', NULL, '2024-06-13 07:01:06', '2024-06-13 07:01:06'),
(12, NULL, '', NULL, '2024-06-13 07:07:51', '2024-06-13 07:07:51'),
(13, NULL, 'admin123', NULL, '2024-06-13 08:39:43', '2024-06-13 08:39:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `msgUsers`
--
ALTER TABLE `msgUsers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `newMsg`
--
ALTER TABLE `newMsg`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `msgUsers`
--
ALTER TABLE `msgUsers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `newMsg`
--
ALTER TABLE `newMsg`
  MODIFY `msg_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
