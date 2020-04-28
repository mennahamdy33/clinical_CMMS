-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2020 at 05:10 AM
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
  `cal_id` varchar(200) NOT NULL,
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

INSERT INTO `calibration` (`department`, `dcode`, `nomenclature`, `cal_id`, `time_period`, `from_date`, `to_date`, `assigned_to`, `calibration_task`, `contract_id`, `status`) VALUES
('ICU', 100, 'Ultrasound Unit', 'icu01ultras', '2 days', '2020-04-02', '2020-04-04', 'mohamed ahmed', 'propes defect', '309031', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_inspection`
--

CREATE TABLE `daily_inspection` (
  `nomenclature` varchar(200) NOT NULL,
  `dinspect_id` varchar(200) NOT NULL,
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

INSERT INTO `daily_inspection` (`nomenclature`, `dinspect_id`, `department`, `d_code`, `physical_condition`, `batteries`, `cables_port`, `self_test`, `tech_name`, `inspection_date`, `comment`) VALUES
('Ultrasound Unit', 'icu01ultras', 'ICU', 100, 'Y', 'Y', 'Y', 'Y', 'mohamed ahmed', '2020-04-25 23:02:13', 'alright');

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
  `national_id` bigint(200) NOT NULL,
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

INSERT INTO `employee` (`name`, `national_id`, `email`, `mobile_no`, `role`, `position`, `department`, `depart_code`, `qualifications`, `salary`) VALUES
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
  `warrenty_period` date DEFAULT NULL,
  `maintenance_assessment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`department`, `dep_code`, `nomenclature`, `serial_no`, `id`, `model`, `manufacturer`, `contact_manufacturer`, `local_agent`, `contact_agent`, `condition_code`, `price`, `install_date`, `warrenty_period`, `maintenance_assessment`) VALUES
('ICU', 100, 'Ultrasound Unit', '050415VS5N', 'icu01ultras', 'Vivid S5', 'GE', 'NULL', 'Alcan Medical', 'NULL', 'A', '$13,000', '2017-10-04', '2021-08-19', 'Y'),
('Otolaryngology', 920, 'ELECTROMAGNETIC SURGICAL NAVIGATION SYSTEM', '196H3F4', 'M01ELECTROSURG-OTO', 'FUSION™ ENT', 'Medtronic', NULL, 'Alcan medical', NULL, 'A', '200000', '2017-06-15', '2021-06-15', 'Y'),
('Urology', 950, 'PROSTATE BIOPSY NEEDLE ', '22D3', 'M01PROSNEEDLE-URO', 'BIOPSY GUN', 'Amecath', NULL, 'ElFATH', NULL, 'A', '$100', '2016-01-20', NULL, 'N'),
('Urology', 951, 'PROSTATE BIOPSY NEEDLE ', '22D6', 'M02PROSNEEDLE-URO', 'BIOPSY GUN', 'Amecath', NULL, 'ElFATH', NULL, 'A', '$100', '2016-01-20', NULL, 'N'),
('Otolaryngology', 920, 'ENT WORKSTATION', '234efs5', 'M01ENTWS-OTO', 'OTONAM 200', 'NAMROL ', NULL, 'Alcan medical', NULL, 'A', '71000', '2019-08-05', '2024-08-05', 'Y'),
('Otolaryngology', 921, 'ENT WORKSTATION', '244efs5', 'M03ENTWS-OTO', 'OTONAM 200', 'NAMROL ', NULL, 'Alcan medical', NULL, 'A', '71000', '2019-08-05', '2024-08-05', 'Y'),
('Urology', 950, 'Urological Table,Exam', '2536hd632', 'M01TAB-URO', 'CFUR301', 'OAKWORKS', NULL, 'Alcan Medical', NULL, 'A', '$30000', '2018-03-08', '2024-03-08', 'Y'),
('Urology', 951, 'Urological Table,Exam', '2536hd634', 'M02TAB-URO', 'CFUR301', 'OAKWORKS', NULL, 'Alcan Medical', NULL, 'A', '$30000', '2018-06-15', '2024-06-15', 'Y'),
('Urology', 950, 'UTERINE MORCELLATOR', '2ER4FD3', 'M01MORC-URO', 'POWERDRIVE MACRO', 'WISAP Medical Technology ', NULL, 'ELFATH', NULL, 'A', '20000', '2017-10-30', '2020-10-30', 'N'),
('Urology', 951, 'UTERINE MORCELLATOR', '2ER9FD6', 'M02MORC-URO', 'POWERDRIVE MACRO', 'WISAP Medical Technology ', NULL, 'ELFATH', NULL, 'A', '20000', '2017-10-30', '2020-10-30', 'N'),
('Urology', 950, 'UROLOGICAL SURGERY LASER', '3234f5g3', 'M01LASER-URO', 'MEDILAS® H UROPULSE®\r\n', 'Dornier MedTech', NULL, 'Alcan medical', NULL, 'A', '300000', '2019-08-11', '2024-08-11', 'Y'),
('Urology', 951, 'UROLOGY FORCEPS  ', '323f222w2', 'M02FORC-URO', '61002X SERIES', 'ENDOMED', NULL, 'ELFATH', NULL, 'A', '8000', '2019-03-25', NULL, 'N'),
('Urology', 950, 'UROLOGY FORCEPS ', '323f342w2', 'M01FORC-URO', '61002X SERIES', 'ENDOMED', NULL, 'ELFATH', NULL, 'A', '8000', '2019-03-25', NULL, 'N'),
('Urology', 951, 'UROLOGICAL SURGERY LASER', '3255f5g3', 'M02LASER-URO', 'MEDILAS® H UROPULSE®\r\n', 'Dornier MedTech', NULL, 'Alcan medical', NULL, 'A', '300000', '2019-08-11', '2024-08-11', 'Y'),
('Urology', 951, 'PORTABLE BLADDER SCANNER,WITH TROLLEY', '345T644S2', 'M02BLASCAN-URO', 'PORTASCAN 3D', 'LABORIE', NULL, 'ELFATH', NULL, 'A', '$50000', '2010-11-02', '2015-11-02', 'N'),
('Urology', 950, 'PORTABLE BLADDER SCANNER,WITH TROLLEY ', '345T67SS2', 'M01BLASCAN-URO', 'PORTASCAN 3D', 'LABORIE', NULL, 'ELFATH', NULL, 'A', '$50000', '2010-11-02', '2015-11-02', 'N'),
('Urology', 950, 'KIDNEY STONE EXTRACTION ENDOSCOPIC BASKET', '34S3', 'M01STONEENDO-URO', 'SBS', 'MEDpro', NULL, 'ELFATH', NULL, 'A', '3000', '2018-05-20', NULL, 'N'),
('Urology', 951, 'DIGITAL URINARY FLOW METER', '3F3445', 'M02URIFLOW-URO', 'PICO FLOW2\r\n', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$40000', '2019-07-04', '2023-07-04', 'Y'),
('Urology', 950, 'DIGITAL URINARY FLOW METER', '3F3476', 'M01URIFLOW-URO', 'PICO FLOW2\r\n', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$40000', '2019-07-04', '2023-07-04', 'Y'),
('Otolaryngology', 920, 'OTOSCOPE', '45233D45', 'M01SCOPE-OTO', '01.13500.021', 'KaWe - KIRCHNER & WILHELM', NULL, 'Alcan medical', NULL, 'A', '2000', '2019-11-04', NULL, 'N'),
('Otolaryngology', 920, 'PHARYNGOSCOPE', '4536Q1', 'M01PHARSCOPE-OTO', 'EFL 11-20-30/40', 'EndoMed Systems ', NULL, 'ELFATH', NULL, 'A', '4500', '2020-01-26', NULL, 'N'),
('Otolaryngology', 921, 'PHARYNGOSCOPE', '4536Y3', 'M02PHARSCOPE-OTO', 'EFL 11-20-30/40', 'EndoMed Systems ', NULL, 'ELFATH', NULL, 'A', '4500', '2020-01-16', NULL, 'N'),
('Otolaryngology', 921, 'OTOSCOPE', '45773D45', 'M02SCOPE-OTO', '01.13500.021', 'KaWe - KIRCHNER & WILHELM', NULL, 'Alcan medical', NULL, 'A', '2000', '2019-11-04', NULL, 'N'),
('Urology', 951, 'CYSTO-RESECTOSCOPE / STRAIGHT', '4hd63', 'M02CYSTO-URO', '630-235-10B', 'EMED', NULL, 'ELFATH', NULL, 'A', '25000', '2019-11-10', '2025-11-10', 'N'),
('Urology', 950, 'CYSTO-RESECTOSCOPE / STRAIGHT', '4hd67', 'M01CYSTO-URO', '630-235-10B', 'EMED', NULL, 'ELFATH', NULL, 'A', '25000', '2019-11-10', '2025-11-10', 'N'),
('Urology', 951, 'INTRACORPOREAL LITHOTRIPTER ', '563289F46G', 'M02INTRALITHO-URO', 'INTRALITH ULTRA', 'US Healthcare solutions', NULL, 'Alcan medical', NULL, 'A', '$50000', '2010-11-10', '2013-11-10', 'N'),
('Urology', 950, 'INTRACORPOREAL LITHOTRIPTER ', '567489F46G', 'M01INTRALITHO-URO', 'INTRALITH ULTRA', 'US Healthcare solutions', NULL, 'Alcan medical', NULL, 'A', '$50000', '2010-11-10', '2013-11-10', 'N'),
('Urology', 951, 'COMPUTER-BASED URODYNAMIC SYSTEM / ON CASTERS', '87JF9', 'M02DYNSYS-URO', 'PICO SMART', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$70000', '2019-11-20', NULL, 'Y'),
('Urology', 950, 'COMPUTER-BASED URODYNAMIC SYSTEM / ON CASTERS', '87JJ8', 'M01DYNSYS-URO', 'PICO SMART', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$70000', '2019-10-16', NULL, 'Y'),
('ICU', 100, 'BED,PATIENT', '9100', 'M01BED-ICU', 'GO BED', 'STRYKER', 'NULL', 'ELFATH', 'NULL', 'A', '$28500', '2009-08-05', '2011-08-10', 'N'),
('Otolaryngology', 921, 'SINUSCOPE ', 'AH25D7J', 'M02SINU-OTO', 'RIGID HD', 'OLYMPUS', NULL, 'Alcan medical', NULL, 'A', '6000', '2018-06-15', '2020-06-15', 'N'),
('Otolaryngology', 920, 'SINUSCOPE ', 'AH25DW2', 'M01SINU-OTO', 'RIGID HD', 'OLYMPUS', NULL, 'Alcan medical', NULL, 'A', '6000', '2018-06-15', '2022-06-15', 'N'),
('Orthopedics', 880, 'DRILL SURGICAL POWER TOOL', 'AHG3265S', 'M01DRILL-ORTHO', 'MBQ-700 SERIES', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '23000', '2018-04-23', '2020-04-23', 'N'),
('Orthopedics', 881, 'DRILL SURGICAL POWER TOOL', 'AHG9965S', 'M02DRILL-ORTHO', 'MBQ-700 SERIES', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '23000', '2015-10-12', NULL, 'N'),
('Orthopedics', 881, 'ARTHROSCOPY SHAVER', 'DWD323E', 'M02SHAVER-ORTHO', 'SV-8002', 'Vimex Endoscopy ', NULL, 'Alcan medical', NULL, 'A', '25000', '2019-04-19', '2023-04-19', 'N'),
('Orthopedics', 880, 'ARTHROSCOPY SHAVER', 'DWD3F5Y', 'M01SHAVER-ORTHO', 'SV-8002', 'Vimex Endoscopy ', NULL, 'Alcan medical', NULL, 'A', '25000', '2019-07-04', '2023-07-04', 'N'),
('Orthopedics', 880, 'ELECTRIC MENISCAL RASP', 'GD52BS7', 'M01RASP-ORTHO', 'OMNISPAN™', 'DePuySynthes', NULL, 'ELFATH', NULL, 'A', '15000', '2018-03-08', NULL, 'N'),
('Orthopedics', 881, 'ELECTRIC CAST SAW ', 'H62N8022', 'M02CASTSAW-ORTHO', 'CC5', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '20000', '2017-04-19', '2020-04-14', 'N'),
('Orthopedics', 880, 'ELECTRIC CAST SAW ', 'H62N802J', 'M01CASTSAW-ORTHO', 'CC5', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '20000', '2017-04-19', '2020-04-14', 'N'),
('Orthopedics', 880, 'SURGERY ORTHOPEDIC EXTENSION DEVICE', 'HWY62GD', 'M01SURGERYBED-ORTHO', '9923046', 'OPT SurgiSystems', NULL, 'Alcan medical', NULL, 'A', '16000', '2017-04-19', '2021-04-19', 'N'),
('Orthopedics', 881, 'SURGERY ORTHOPEDIC EXTENSION DEVICE', 'HWY65GD', 'M02SURGERYBED-ORTHO', '9923046', 'OPT SurgiSystems', NULL, 'Alcan medical', NULL, 'A', '16000', '2017-04-19', '2021-04-19', 'N'),
('Otolaryngology', 920, 'ENT SURGERY MICROSCOPE ', 'Q21WS2', 'M01MICROSCO-OTO', 'KAPS PRO ENT M', 'Karl Kaps ', NULL, 'ELFATH', NULL, 'A', '45000', '2013-08-05', NULL, 'N'),
('Otolaryngology', 920, 'ENT CHAIR,EXAM', 'SED232W1', 'M01CHAIR-OTO', '2683', 'Promotal', NULL, 'ELFATH', NULL, 'A', '12000', '2016-10-22', '2020-10-22', 'N'),
('Otolaryngology', 921, 'ENT CHAIR,EXAM', 'SED2341D', 'M02CHAIR-OTO', '2683', 'Promotal', NULL, 'ELFATH', NULL, 'A', '12000', '2016-10-22', '2020-10-22', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `ppm`
--

CREATE TABLE `ppm` (
  `department` varchar(200) NOT NULL,
  `department_code` int(100) NOT NULL,
  `nomenclature` varchar(200) NOT NULL,
  `ppm_id` varchar(200) NOT NULL,
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

INSERT INTO `ppm` (`department`, `department_code`, `nomenclature`, `ppm_id`, `time_period`, `from_date`, `to_date`, `assigned_to`, `ppm_task`, `contract_id`, `status`) VALUES
('ICU', 100, 'Ultrasound Unit', 'icu01ultras', '0000-00-00', '2019-05-10', '2019-05-11', 'mohamed ahmed', 'check propes , modes cables,port', NULL, NULL);

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
  `fault_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `priority` int(100) NOT NULL,
  `fault_description` varchar(200) NOT NULL,
  `job_no` int(100) NOT NULL,
  `tech_name` varchar(200) NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `solved` varchar(200) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `report_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`department`, `de_code`, `equip_name`, `manufacturer`, `model`, `fault_date`, `priority`, `fault_description`, `job_no`, `tech_name`, `action_taken`, `solved`, `end_date`, `report_id`) VALUES
('ICU', 100, 'Ultrasound Unit', 'GE', '	\r\nVivid S5', '2020-01-03 05:14:00', 4, 'linear array prope defect', 2033, 'maher mohamed', 'sent a report to the company', 'yes', '2020-04-05 08:05:00', 'icu01ultras');

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
  ADD KEY `calibration_ibfk_1` (`cal_id`),
  ADD KEY `calibration_ibfk_2` (`dcode`);

--
-- Indexes for table `daily_inspection`
--
ALTER TABLE `daily_inspection`
  ADD KEY `id` (`dinspect_id`),
  ADD KEY `daily_inspection_ibfk_2` (`d_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`national_id`),
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
  ADD KEY `id` (`ppm_id`),
  ADD KEY `department_code` (`department_code`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD KEY `reports_ibfk_2` (`de_code`),
  ADD KEY `id` (`report_id`) USING BTREE;

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
  ADD CONSTRAINT `calibration_ibfk_1` FOREIGN KEY (`cal_id`) REFERENCES `equipment` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `calibration_ibfk_2` FOREIGN KEY (`dcode`) REFERENCES `department` (`code`) ON UPDATE NO ACTION;

--
-- Constraints for table `daily_inspection`
--
ALTER TABLE `daily_inspection`
  ADD CONSTRAINT `daily_inspection_ibfk_1` FOREIGN KEY (`dinspect_id`) REFERENCES `equipment` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `daily_inspection_ibfk_2` FOREIGN KEY (`d_code`) REFERENCES `department` (`code`) ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `ppm_ibfk_1` FOREIGN KEY (`ppm_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `ppm_ibfk_2` FOREIGN KEY (`department_code`) REFERENCES `department` (`code`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `equipment` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`de_code`) REFERENCES `department` (`code`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
