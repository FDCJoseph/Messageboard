-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 24, 2024 at 09:49 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `newMsg`
--
ALTER TABLE `newMsg`
  ADD PRIMARY KEY (`msg_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `newMsg`
--
ALTER TABLE `newMsg`
  MODIFY `msg_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
