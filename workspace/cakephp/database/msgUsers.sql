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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `msgUsers`
--
ALTER TABLE `msgUsers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
