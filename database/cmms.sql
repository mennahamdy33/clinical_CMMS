-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2020 at 01:05 AM
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
-- Table structure for table `calibration`
--

CREATE TABLE `calibration` (
  `department` varchar(200) NOT NULL,
  `dcode` int(100) NOT NULL,
  `nomenclature` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `time_period` varchar(200) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `assigned_to` varchar(200) NOT NULL,
  `calibration_task` varchar(200) NOT NULL,
  `contract_id` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calibration`
--

INSERT INTO `calibration` (`department`, `dcode`, `nomenclature`, `serial_no`, `id`, `time_period`, `from_date`, `to_date`, `assigned_to`, `calibration_task`, `contract_id`, `status`) VALUES
('ICU', 100, 'Ultrasound Unit', '050415VS5N', 'icu01ultras', '2 days', '2020-04-02', '2020-04-04', 'mohamed ahmed', 'propes defect', '309031', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_inspection`
--

CREATE TABLE `daily_inspection` (
  `nomenclature` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `department` varchar(200) NOT NULL,
  `d_code` int(100) NOT NULL,
  `physical_condition` varchar(200) NOT NULL,
  `batteries` varchar(200) NOT NULL,
  `cables_port` varchar(200) NOT NULL,
  `self_test` varchar(200) NOT NULL,
  `tech_name` varchar(200) NOT NULL,
  `inspection_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `daily_inspection`
--

INSERT INTO `daily_inspection` (`nomenclature`, `serial_no`, `id`, `department`, `d_code`, `physical_condition`, `batteries`, `cables_port`, `self_test`, `tech_name`, `inspection_date`, `comment`) VALUES
('Ultrasound Unit', '050415VS5N', 'icu01ultras', 'ICU', 100, 'Y', 'Y', 'Y', 'Y', 'mohamed ahmed', '2020-04-25 23:02:13', 'alright');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `name` varchar(200) NOT NULL,
  `floor` varchar(200) NOT NULL,
  `building` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `b_id` int(100) NOT NULL,
  `code` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`name`, `floor`, `building`, `location`, `b_id`, `code`) VALUES
('ICU', '4', '1', '1st branch', 1, 100),
('ICU', '3', '1', '1st branch', 2, 101),
('ICU', '3', '1', '2nd branch', 1, 102),
('OP', '1', '1', '1st branch', 1, 150),
('OP', '1', '1', '2nd branch', 1, 151),
('biomedical engineering', 'P1', '1', '1st branch', 1, 160),
('biomedical engineering', 'P1', '1', '2nd branch', 1, 161),
('ER', '1', '1', '1st branch', 1, 200),
('ER', '1', '1', '2nd branch', 1, 201),
('IP', '2', '1', '1st branch', 1, 250),
('IP', '2', '1', '2nd branch', 1, 251),
('Radiology', '1', '1', '1st branch', 1, 400),
('Radiology', '1', '1', '2nd branch', 1, 401),
('OR', '3', '1', '1st branch', 1, 450),
('OR', '3', '1', '2nd branch', 1, 451),
('Anesthesiology', '3', '1', '1st branch', 1, 500),
('Anesthesiology', '3', '1', '2nd branch', 1, 501),
('Cardiology', '2', '1', '1st branch', 1, 550),
('Cardiology', '2', '1', '2nd branch', 1, 551),
('CSSD', 'P1', '1', '1st branch', 1, 600),
('CSSD', 'P1', '1', '2nd branch', 1, 601),
('OBGYN', '1', '1', '1st branch', 1, 700),
('OBGYN', '1', '1', '2nd branch', 1, 701),
('Haematology', '4', '1', '1st branch', 1, 750),
('Haematology', '4', '1', '2nd branch', 1, 751),
('Neurology', '4', '1', '1st branch', 1, 800),
('Neurology', '4', '1', '2nd branch', 1, 801),
('Oncology', '4', '1', '1st branch', 1, 850),
('Oncology', '4', '1', '2nd branch', 1, 851),
('Orthopedics', '1', '1', '1st branch', 1, 880),
('Orthopedics', '1', '1', '2nd branch', 1, 881),
('Otolaryngology ', '4', '1', '1st branch', 1, 920),
('Otolaryngology ', '4', '1', '2nd branch', 1, 921),
('Urology', '4', '1', '1st branch', 1, 950),
('Urology', '4', '1', '2nd branch', 1, 951);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `name` varchar(200) NOT NULL,
  `id` bigint(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile_no` int(100) NOT NULL,
  `role` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `department` varchar(200) NOT NULL,
  `depart_code` int(11) NOT NULL,
  `qualifications` varchar(200) NOT NULL,
  `salary` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`name`, `id`, `email`, `mobile_no`, `role`, `position`, `department`, `depart_code`, `qualifications`, `salary`) VALUES
('mohamed ahmed', 280040122104028, 'mohamedahmed@gmail.com', 1133536373, 'Engineer', 'Junior', 'biomedical engineering', 160, 'bachelor in biomedical engineering CUFE ', 5000),
('maher mohamed', 290050122104028, 'maher_mohamed@gmail.com', 1037897879, 'technician', 'junior', 'biomedical engineering', 160, 'institution of electronics', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `department` varchar(200) NOT NULL,
  `dep_code` int(100) NOT NULL,
  `nomenclature` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `contact_manufacturer` varchar(200) DEFAULT NULL,
  `local_agent` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `contact_agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL,
  `condition_code` varchar(100) NOT NULL,
  `price` varchar(200) NOT NULL,
  `install_date` date NOT NULL,
  `warrenty_period` date NOT NULL,
  `maintenance_assessment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`department`, `dep_code`, `nomenclature`, `serial_no`, `id`, `model`, `manufacturer`, `contact_manufacturer`, `local_agent`, `contact_agent`, `condition_code`, `price`, `install_date`, `warrenty_period`, `maintenance_assessment`) VALUES
('ICU', 100, 'Ultrasound Unit', '050415VS5N', 'icu01ultras', 'Vivid S5', 'GE', 'NULL', 'Alcan Medical', 'NULL', 'A', '$13,000', '2017-10-04', '2021-08-19', 'Y'),
('ICU', 100, 'patient bed', '9100', 'icu01bed', 'GO BED', 'STRYKER', 'NULL', 'ELFATH', 'NULL', 'A', '$28500', '2009-08-05', '2011-08-10', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `ppm`
--

CREATE TABLE `ppm` (
  `department` varchar(200) NOT NULL,
  `department_code` int(100) NOT NULL,
  `nomenclature` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `time_period` date NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `assigned_to` varchar(200) NOT NULL,
  `ppm_task` varchar(200) NOT NULL,
  `contract_id` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ppm`
--

INSERT INTO `ppm` (`department`, `department_code`, `nomenclature`, `serial_no`, `id`, `time_period`, `from_date`, `to_date`, `assigned_to`, `ppm_task`, `contract_id`, `status`) VALUES
('ICU', 100, 'Ultrasound Unit', '050415VS5N', 'icu01ultras', '0000-00-00', '2019-05-10', '2019-05-11', 'mohamed ahmed', 'check propes , modes cables,port', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `department` varchar(200) NOT NULL,
  `de_code` int(100) NOT NULL,
  `equip_name` varchar(200) NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
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
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`department`, `de_code`, `equip_name`, `manufacturer`, `model`, `serial_no`, `fault_date`, `priority`, `fault_description`, `job_no`, `tech_name`, `action_taken`, `solved`, `end_date`, `id`) VALUES
('ICU', 100, 'Ultrasound Unit', 'GE', '	\r\nVivid S5', '050415VS5N', '2020-01-03 05:14:00', 4, 'linear array prope defect', 2033, 'maher mohamed', 'sent a report to the company', 'yes', '2020-04-05 08:05:00', 'icu01ultras');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `nomenclature` varchar(200) NOT NULL,
  `serial_no` varchar(200) NOT NULL,
  `model` varchar(200) CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `local_agent` varchar(200) NOT NULL,
  `warrenty_period` varchar(200) NOT NULL,
  `stop_production_date` date DEFAULT NULL,
  `end_support_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`nomenclature`, `serial_no`, `model`, `manufacturer`, `local_agent`, `warrenty_period`, `stop_production_date`, `end_support_date`) VALUES
('Ultrasound Unit', '0504154G6', 'Vivid S5', 'GE', 'Alcan medical', '2 years', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calibration`
--
ALTER TABLE `calibration`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `id` (`id`),
  ADD KEY `dcode` (`dcode`);

--
-- Indexes for table `daily_inspection`
--
ALTER TABLE `daily_inspection`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `id` (`id`),
  ADD KEY `d_code` (`d_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depart_code` (`depart_code`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `dep_code` (`dep_code`);

--
-- Indexes for table `ppm`
--
ALTER TABLE `ppm`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `id` (`id`),
  ADD KEY `department_code` (`department_code`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `de_code` (`de_code`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`serial_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calibration`
--
ALTER TABLE `calibration`
  ADD CONSTRAINT `calibration_ibfk_1` FOREIGN KEY (`id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `calibration_ibfk_2` FOREIGN KEY (`dcode`) REFERENCES `department` (`code`);

--
-- Constraints for table `daily_inspection`
--
ALTER TABLE `daily_inspection`
  ADD CONSTRAINT `daily_inspection_ibfk_1` FOREIGN KEY (`id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `daily_inspection_ibfk_2` FOREIGN KEY (`d_code`) REFERENCES `department` (`code`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depart_code`) REFERENCES `department` (`code`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`dep_code`) REFERENCES `department` (`code`);

--
-- Constraints for table `ppm`
--
ALTER TABLE `ppm`
  ADD CONSTRAINT `ppm_ibfk_1` FOREIGN KEY (`id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `ppm_ibfk_2` FOREIGN KEY (`department_code`) REFERENCES `department` (`code`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`de_code`) REFERENCES `department` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
