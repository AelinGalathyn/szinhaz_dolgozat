-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2023 at 01:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `14s_ismetles`
--

-- --------------------------------------------------------

--
-- Table structure for table `kuponok`
--

CREATE TABLE `kuponok` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `percentage` tinyint(4) NOT NULL,
  `code` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kuponok`
--

INSERT INTO `kuponok` (`id`, `title`, `percentage`, `code`) VALUES
(1, 'Wicked', 10, 'WCKD-101010'),
(2, 'Waitress', 20, 'WTRS-202020'),
(3, 'Frozen', 5, 'FRZN-555555'),
(4, 'Cabaret', 20, 'CBRT-202020');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kuponok`
--
ALTER TABLE `kuponok`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kuponok`
--
ALTER TABLE `kuponok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
