-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2020 at 05:31 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmms`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `department` varchar(200) NOT NULL,
  `nomenclature` varchar(200) NOT NULL,
  `serial_no` int(100) NOT NULL,
  `id` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `contact_manufacturer` varchar(200) NOT NULL,
  `local_agent` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `contact_agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `condition_code` varchar(100) NOT NULL,
  `price` varchar(200) NOT NULL,
  `install_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `warrenty_period` datetime NOT NULL,
  `maintenance_assessment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `department` varchar(200) NOT NULL,
  `equip_name` varchar(200) NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `serial_no` int(100) NOT NULL,
  `fault_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `priority` int(100) NOT NULL,
  `fault_description` varchar(200) NOT NULL,
  `job_no` int(100) NOT NULL,
  `tech_name` varchar(200) NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `solved` varchar(200) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `id` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
