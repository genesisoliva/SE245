-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 07:00 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alansary`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` INT NOT NULL,
  `img` BLOB,
  `student_id` INT NOT NULL,
  `dorm_num` VARCHAR(20),
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `phone2` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` BIT(1),
  `role_id` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0,
  `created_at` timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DATETIME ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`student_id`, `first_name`, `middle_name, `last_name, `phone`, `email`, `password`, `role_id`, `is_active`, `created_at`) VALUES
(005501789, 'Genesis', 'J', 'Oliva', '4018081797', 'heyjosabet@gmail.com', 'password', 1, 0, '2020-03-12 16:23:01');


-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL COMMENT 'role_id',
  `role` varchar(255) DEFAULT NULL COMMENT 'role_text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Editor'),
(3, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'role_id', AUTO_INCREMENT= 1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
