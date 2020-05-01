-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2020 at 11:30 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CMMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `calibration`
--

CREATE TABLE IF NOT EXISTS `calibration` (
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

CREATE TABLE IF NOT EXISTS `daily_inspection` (
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

CREATE TABLE IF NOT EXISTS `department` (
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
('Laboratory', '4', '1', '1st branch', 1, 750),
('Laboratory', '4', '1', '2nd branch', 1, 751),
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

CREATE TABLE IF NOT EXISTS `employee` (
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

CREATE TABLE IF NOT EXISTS `equipment` (
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
('IP', 250, 'PATIENT-BED', '0150BB0', 'M01BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0155BB5', 'M02BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0160BB10', 'M03BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0165BB15', 'M04BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'Patient-BED', '0170BB20', 'M05BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0175BB25', 'M06BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0180BB30', 'M07BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0185BB35', 'M08BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0190BB40', 'M09BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('IP', 250, 'PATIENT-BED', '0195BB45', 'M10BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'Alcan Medical', 'NULL', 'A', '12000', '2017-04-15', '2020-04-15', 'N'),
('ICU', 100, 'Ultrasound Unit', '050415VS5N', 'icu01ultras', 'Vivid S5', 'GE', 'NULL', 'Alcan Medical', 'NULL', 'A', '$13,000', '2017-10-04', '2021-08-19', 'Y'),
('IP', 251, 'BLOOD-GLUCOMETER', '10011LGB605', 'M07GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2018-02-14', '2021-02-14', 'N'),
('IP', 251, 'BLOOD-GLUCOMETER', '10013LGB607', 'M08GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2018-02-14', '2021-02-14', 'N'),
('IP', 251, 'BLOOD-GLUCOMETER', '10015LGB609', 'M09GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2018-02-14', '2021-02-14', 'N'),
('IP', 251, 'BLOOD-GLUCOMETER', '10017LGB611', 'M10GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2018-02-14', '2021-02-14', 'N'),
('IP', 250, 'BLOODGLUCOMETER', '1002LGB500', 'M01GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2017-01-14', '2021-01-14', 'N'),
('IP', 250, 'BLOODGLUCOMETERS', '1003LGB300\r\n', 'M02GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '400', '2017-01-14', '2021-01-14', 'N'),
('IP', 250, 'BLOODGLUCOMETER', '1004LGB200', 'M03GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ALFATH', 'NULL', 'A', '480', '2017-01-14', '2021-01-14', 'N'),
('IP', 250, 'BLOODGLUCOMETER', '1005LGB100', 'M04GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2017-01-14', '2021-01-14', 'N'),
('IP', 250, 'BLOODGLUCOMETER', '1006LGB400', 'M05GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2017-01-14', '2021-01-14', 'N'),
('IP', 251, 'BLOOD-GLUCOMETER', '1009LGB602', 'M06GLU-IP', 'CEISO15197ISO13485', 'SEJOY', 'NULL', 'ELFATH', 'NULL', 'A', '480', '2018-02-14', '2021-02-14', 'N'),
('IP', 251, 'PATIENT-BED', '1151BB0', 'M11BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1155BB5', 'M12BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1160BB10', 'M13BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1165BB15', 'M14BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1170BB20', 'M15BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '\r\n12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1175BB25', 'M16BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '\r\n12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1180BB30', 'M17BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '\r\n12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1185BB35', 'M18BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '\r\n12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1190BB40', 'M19BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '\r\n12500', '2018-03-15', '2021-03-15', 'N'),
('IP', 251, 'PATIENT-BED', '1195BB45', 'M20BED-IP', 'EUCLIDE45', 'ANTANTO', 'NULL', 'ALCAN MEDICAL', 'NULL', 'A', '\r\n12500', '2018-03-15', '2021-03-15', 'N'),
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
('Laboratory', 751, 'LABORATORY DRYING OVEN,HYBRIDIZATION ,BENCHTOP', '35G33', 'M02DRYOVE-LAB', 'OV 4000', 'Analytikajena', NULL, 'EGA-TECH', NULL, 'A', '40000', '2018-03-10', '2021-03-10', 'Y'),
('Laboratory', 750, 'LABORATORY DRYING OVEN,HYBRIDIZATION ,BENCHTOP', '35GS52', 'M01DRYOVE-LAB', 'OV 4000', 'Analytikajena', NULL, 'EGA-TECH', NULL, 'A', '40000', '2018-03-10', '2021-03-10', 'Y'),
('Urology', 951, 'DIGITAL URINARY FLOW METER', '3F3445', 'M02URIFLOW-URO', 'PICO FLOW2\r\n', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$40000', '2019-07-04', '2023-07-04', 'Y'),
('Urology', 950, 'DIGITAL URINARY FLOW METER', '3F3476', 'M01URIFLOW-URO', 'PICO FLOW2\r\n', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$40000', '2019-07-04', '2023-07-04', 'Y'),
('IP', 251, 'SPHYGMOMANOMETER', '420601SP01', 'M06MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '7000', '2018-03-05', '2021-04-05', 'N'),
('IP', 250, 'SPHYGMOMANOMETER', '420601SP05', 'M01MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '6000', '2017-04-05', '2020-04-05', 'N'),
('IP', 250, 'SPHYGMOMANOMETER', '420605SP05', 'M02MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '6000', '2017-04-05', '2020-04-05', 'N'),
('IP', 250, 'SPHYGMOMANOMETER', '420610SP05', 'M03MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '6000', '2017-04-05', '2020-04-05', 'N'),
('IP', 250, 'SPHYGMOMANOMETER', '420615SP05', 'M04MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '6000', '2017-04-05', '2017-04-05', 'N'),
('IP', 251, 'SPHYGMOMANOMETER', '420620SP01', 'M07MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '7000', '2018-03-05', '2021-04-05', 'N'),
('IP', 250, 'SPHYGMOMANOMETER', '420620SP05', 'M05MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '6000', '2017-04-05', '2020-04-05', 'N'),
('IP', 251, 'SPHYGMOMANOMETER', '420625SP05', 'M08MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '7000', '2018-03-05', '2021-04-05', 'N'),
('IP', 251, 'SPHYGMOMANOMETER', '420630SP05', 'M09MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '7000', '2018-03-05', '2021-04-05', 'N'),
('IP', 251, 'SPHYGMOMANOMETER', '420635SP05', 'M10MANOMETER-IP', 'SMD-420601', 'SUNMED', 'NULL', 'ELFATH', 'NULL', 'A', '7000', '2018-03-05', '2021-04-05', 'N'),
('Otolaryngology', 920, 'OTOSCOPE', '45233D45', 'M01SCOPE-OTO', '01.13500.021', 'KaWe - KIRCHNER & WILHELM', NULL, 'Alcan medical', NULL, 'A', '2000', '2019-11-04', NULL, 'N'),
('Otolaryngology', 920, 'PHARYNGOSCOPE', '4536Q1', 'M01PHARSCOPE-OTO', 'EFL 11-20-30/40', 'EndoMed Systems ', NULL, 'ELFATH', NULL, 'A', '4500', '2020-01-26', NULL, 'N'),
('Otolaryngology', 921, 'PHARYNGOSCOPE', '4536Y3', 'M02PHARSCOPE-OTO', 'EFL 11-20-30/40', 'EndoMed Systems ', NULL, 'ELFATH', NULL, 'A', '4500', '2020-01-16', NULL, 'N'),
('Otolaryngology', 921, 'OTOSCOPE', '45773D45', 'M02SCOPE-OTO', '01.13500.021', 'KaWe - KIRCHNER & WILHELM', NULL, 'Alcan medical', NULL, 'A', '2000', '2019-11-04', NULL, 'N'),
('Urology', 951, 'CYSTO-RESECTOSCOPE / STRAIGHT', '4hd63', 'M02CYSTO-URO', '630-235-10B', 'EMED', NULL, 'ELFATH', NULL, 'A', '25000', '2019-11-10', '2025-11-10', 'N'),
('Urology', 950, 'CYSTO-RESECTOSCOPE / STRAIGHT', '4hd67', 'M01CYSTO-URO', '630-235-10B', 'EMED', NULL, 'ELFATH', NULL, 'A', '25000', '2019-11-10', '2025-11-10', 'N'),
('Urology', 951, 'INTRACORPOREAL LITHOTRIPTER ', '563289F46G', 'M02INTRALITHO-URO', 'INTRALITH ULTRA', 'US Healthcare solutions', NULL, 'Alcan medical', NULL, 'A', '$50000', '2010-11-10', '2013-11-10', 'N'),
('Urology', 950, 'INTRACORPOREAL LITHOTRIPTER ', '567489F46G', 'M01INTRALITHO-URO', 'INTRALITH ULTRA', 'US Healthcare solutions', NULL, 'Alcan medical', NULL, 'A', '$50000', '2010-11-10', '2013-11-10', 'N'),
('IP', 250, 'MONITOR', '600PLM7', 'M01MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '15000', '2017-04-30', '2021-04-30', 'Y'),
('Laboratory', 751, 'FORCED CONVECTION LABORATORY INCUBATOR', '627GD22', 'M02FORCINCU-LAB', 'HETTCUBE 400 | 400 R', 'Andreas HETTICH GmbH & Co.KG', NULL, 'Alcan medical', NULL, 'A', '15000', '2019-04-03', '2024-04-03', 'Y'),
('Laboratory', 750, 'FORCED CONVECTION LABORATORY INCUBATOR', '627GD52', 'M01FORCINCU-LAB', 'HETTCUBE 400 | 400 R', 'Andreas HETTICH GmbH & Co.KG', NULL, 'Alcan medical', NULL, 'A', '15000', '2019-01-20', '2024-01-20', 'Y'),
('IP', 250, 'MONITOR', '700PLM5', 'M02MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '15000', '2017-04-30', '2021-04-30', 'Y'),
('Laboratory', 750, 'CLEAN ROOM / MODULAR', '7Y528J9', 'M01CLEANROOM-LAB', 'STERIS FINN-AQUA ', 'STERIS', NULL, 'Alcan medical', NULL, 'A', '65000', '2019-02-10', '2025-02-10', 'Y'),
('Laboratory', 751, 'CLEAN ROOM / MODULAR', '7Y538J9', 'M02CLEANROOM-LAB', 'STERIS FINN-AQUA ', 'STERIS', NULL, 'Alcan medical', NULL, 'A', '65000', '2019-03-20', '2025-03-20', 'Y'),
('IP', 250, 'MONITOR', '800PLM3', 'M03MONITOR-IP', '12.INCH', 'TOPINTH', 'NULL', 'Alcan Medical', 'NULL', 'A', '15000', '2017-04-30', '2021-04-30', 'Y'),
('Urology', 951, 'COMPUTER-BASED URODYNAMIC SYSTEM / ON CASTERS', '87JF9', 'M02DYNSYS-URO', 'PICO SMART', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$70000', '2019-11-20', NULL, 'Y'),
('Urology', 950, 'COMPUTER-BASED URODYNAMIC SYSTEM / ON CASTERS', '87JJ8', 'M01DYNSYS-URO', 'PICO SMART', 'MEDICA', NULL, 'MEDICA', NULL, 'A', '$70000', '2019-10-16', NULL, 'Y'),
('IP', 250, 'MONITOR', '900PLM9', 'M04MONITOR-IP', '12.INCH', 'TOPINTH', 'NULL', 'Alcan Medical', 'NULL', 'A', '15000', '2017-04-30', '2021-04-30', 'Y'),
('ICU', 100, 'BED,PATIENT', '9100', 'M01BED-ICU', 'GO BED', 'STRYKER', 'NULL', 'ELFATH', 'NULL', 'A', '$28500', '2009-08-05', '2011-08-10', 'N'),
('IP', 250, 'MONITOR', '966PLM96', 'M05MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '15000', '2017-04-30', '2021-04-30', 'Y'),
('IP', 251, 'MONITOR', '967PLM96', 'M06MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '20000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 251, 'MONITOR', '968PLM96', 'M07MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '20000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 251, 'MONITOR', '969PLM96', 'M08MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '20000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 251, 'MONITOR', '971PLM96', 'M10MONITOR-IP', '12.INCH', 'TOPNITH', 'NULL', 'Alcan Medical', 'NULL', 'A', '20000', '2018-03-05', '2022-03-05', 'Y'),
('Otolaryngology', 921, 'SINUSCOPE ', 'AH25D7J', 'M02SINU-OTO', 'RIGID HD', 'OLYMPUS', NULL, 'Alcan medical', NULL, 'A', '6000', '2018-06-15', '2020-06-15', 'N'),
('Otolaryngology', 920, 'SINUSCOPE ', 'AH25DW2', 'M01SINU-OTO', 'RIGID HD', 'OLYMPUS', NULL, 'Alcan medical', NULL, 'A', '6000', '2018-06-15', '2022-06-15', 'N'),
('Orthopedics', 880, 'DRILL SURGICAL POWER TOOL', 'AHG3265S', 'M01DRILL-ORTHO', 'MBQ-700 SERIES', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '23000', '2018-04-23', '2020-04-23', 'N'),
('Orthopedics', 881, 'DRILL SURGICAL POWER TOOL', 'AHG9965S', 'M02DRILL-ORTHO', 'MBQ-700 SERIES', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '23000', '2015-10-12', NULL, 'N'),
('Anesthesiology', 500, 'Mindray Anaesthesia Machine', 'anZww22', 'M01ANES-ANESTH', '\r\nPAS-200C', 'Poweam', NULL, 'ELFATH', NULL, 'A', '78000', '2017-04-14', '2019-04-14', 'Y'),
('Anesthesiology', 501, 'Mindray Anaesthesia Machine', 'azZwq32', 'M02ANES-ANESTH', 'PAS-200C', 'Poweam', NULL, 'ELFATH', NULL, 'A', '78000', '2017-04-14', '2019-04-14', 'Y'),
('CSSD', 600, 'MEDICAL STERILIZER / CSSD / STEAM', 'c22ss11d', 'M01STEAM-CSSD', 'SQ-Z', 'SANQIANG', NULL, 'medik', NULL, 'A', '90000', '2020-04-29', '2021-04-29', 'Y'),
('CSSD', 601, 'MEDICAL STERILIZER / CSSD / STEAM', 'c23ss00d', 'M02STEAMST-CSSD', 'SQ-Z', '	\r\nSANQIANG', NULL, 'medik', NULL, 'A', '90000', '2020-04-30', '2021-04-30', 'Y'),
('CSSD', 600, 'Laboratory Autoclave', 'ca11223', 'M01AUTOCAVE-CSSD', 'BKQ-B50(II)', 'BIOBASE', NULL, 'medik', NULL, 'A', '3000', '2019-11-11', '2020-11-11', 'N'),
('CSSD', 601, 'Laboratory Autoclave', 'ca11277', 'M02AUTOCAVE-CSSD', 'BKQ-B50(II)', 'BIOBASE', NULL, 'medik', NULL, 'A', '3000', '2019-10-04', '2020-10-04', 'N'),
('IP', 250, 'WEIGHING-SCALE', 'DEG10009M', 'M02SCALE-IP', 'DIGITAL-SCALE', 'FRK', 'NULL', 'ELFATH', 'NULL', 'A', '2000', '2017-05-05', '2019-05-05', 'Y'),
('IP', 251, 'WEIGHING-SCALE', 'DEG10010M', 'M03SCALE-IP', 'DIGITAL-SCALE', 'FRK', 'NULL', 'ELFATH', 'NULL', 'A', '2500', '2018-03-05', '2020-03-05', 'Y'),
('IP', 251, 'WEIGHING-SCALE', 'DEG10910M', 'M04SCALE-IP', 'DIGITAL-SCALE', 'FRK', 'NULL', 'ELFATH', 'NULL', 'A', '2500', '2018-03-05', '2020-03-05', 'Y'),
('IP', 250, 'WEIGHING-SCALE', 'DEG20019L', 'M01SCALE-IP', 'DIGITAL-SCALE', 'FRK', 'NULL', 'ELFATH', 'NULL', 'A', '2000', '2017-05-05', '2019-05-05', 'Y'),
('Orthopedics', 881, 'ARTHROSCOPY SHAVER', 'DWD323E', 'M02SHAVER-ORTHO', 'SV-8002', 'Vimex Endoscopy ', NULL, 'Alcan medical', NULL, 'A', '25000', '2019-04-19', '2023-04-19', 'N'),
('Orthopedics', 880, 'ARTHROSCOPY SHAVER', 'DWD3F5Y', 'M01SHAVER-ORTHO', 'SV-8002', 'Vimex Endoscopy ', NULL, 'Alcan medical', NULL, 'A', '25000', '2019-07-04', '2023-07-04', 'N'),
('Orthopedics', 880, 'ELECTRIC MENISCAL RASP', 'GD52BS7', 'M01RASP-ORTHO', 'OMNISPAN™', 'DePuySynthes', NULL, 'ELFATH', NULL, 'A', '15000', '2018-03-08', NULL, 'N'),
('Laboratory', 750, 'TYPE A2 BIOLOGICAL SAFETY CABINET ', 'GE52J722', 'M01BIOCABINET-LAB', '11231BBC86\r\n', 'Biobase', NULL, 'ELFATH', NULL, 'A', '25000', '2010-01-20', '2014-01-20', 'N'),
('Laboratory', 751, 'BIOLOGICAL SAFETY CABINET,TYPE A2 ', 'GE52J744', 'M02BIOCABINET-LAB', '11231BBC86', 'Biobase', NULL, 'ELFATH', NULL, 'A', '25000', '2010-01-30', '2014-01-30', 'N'),
('Orthopedics', 881, 'ELECTRIC CAST SAW ', 'H62N8022', 'M02CASTSAW-ORTHO', 'CC5', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '20000', '2017-04-19', '2020-04-14', 'N'),
('Orthopedics', 880, 'ELECTRIC CAST SAW ', 'H62N802J', 'M01CASTSAW-ORTHO', 'CC5', 'DeSoutter Medical', NULL, 'DeSoutter Medical', NULL, 'A', '20000', '2017-04-19', '2020-04-14', 'N'),
('Orthopedics', 880, 'SURGERY ORTHOPEDIC EXTENSION DEVICE', 'HWY62GD', 'M01SURGERYBED-ORTHO', '9923046', 'OPT SurgiSystems', NULL, 'Alcan medical', NULL, 'A', '16000', '2017-04-19', '2021-04-19', 'N'),
('Orthopedics', 881, 'SURGERY ORTHOPEDIC EXTENSION DEVICE', 'HWY65GD', 'M02SURGERYBED-ORTHO', '9923046', 'OPT SurgiSystems', NULL, 'Alcan medical', NULL, 'A', '16000', '2017-04-19', '2021-04-19', 'N'),
('Laboratory', 750, 'PCR CABINET ', 'K637FAA2', 'M01PCR-LAB', 'UVP PCR UV³', 'Analytikajena', NULL, 'EGA-TECH', NULL, 'A', '35000', '2017-08-02', '2019-09-20', 'N'),
('Laboratory', 751, 'PCR CABINET ', 'K637FAA7', 'M02PCR-LAB', 'UVP PCR UV³', 'Analytikajena', NULL, 'EGA-TECH', NULL, 'A', '35000', '2017-06-23', '2021-04-09', 'N'),
('IP', 250, 'VENTILLATORS', 'O800VVX1', 'M01VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '624000', '2017-07-10', '2021-06-10', 'Y'),
('IP', 251, 'VENTILLATORS', 'O800VVX11', 'M06VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '627000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 251, 'VENTILLATORS', 'O800VVX15', 'M07VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '627000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 251, 'VENTILLATORS', 'O800VVX17', 'M08VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '627000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 251, 'VENTILLATORS', 'O800VVX19', 'M09VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '627000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 250, 'VENTILLATORS', 'O800VVX20', 'M03VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '624000', '2017-07-10', '2021-06-10', 'Y'),
('IP', 251, 'VENTILLATORS', 'O800VVX21', 'M10VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '627000', '2018-03-05', '2022-03-05', 'Y'),
('IP', 250, 'VENTILLATORS', 'O800VVX3', 'M04VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '624000', '2017-07-10', '2021-06-10', 'Y'),
('IP', 250, 'VENTILLATORS', 'O800VVX5', 'M02VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '624000', '2017-07-10', '2021-06-10', 'Y'),
('IP', 250, 'VENTILLATORS', 'O800VVX9', 'M05VENT-IP', 'ACM812A', 'ACM', 'NULL', 'Alcan Medical', 'NULL', 'A', '624000', '2017-07-10', '2021-06-10', 'Y'),
('IP', 250, 'TROLLEY', 'P5150YA', 'M03TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4000', '2017-06-10', '2025-06-10', 'N'),
('IP', 250, 'TROLLEY', 'P5200YA', 'M04TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4000', '2017-06-10', '2025-06-10', 'N'),
('IP', 251, 'TROLLEY', 'P5215YA', 'M07TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4700', '2018-03-10', '2026-03-10', 'N'),
('IP', 251, 'TROLLEY', 'P5220YA', 'M08TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4700', '2018-03-10', '2026-03-10', 'N'),
('IP', 251, 'TROLLEY', 'P5230YA', 'M09TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4700', '2018-03-10', '2026-03-10', 'N'),
('IP', 251, 'TROLLEY', 'P52500YA', 'M10TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4700', '2018-03-10', '2026-03-10', 'N'),
('IP', 250, 'TROLLEY', 'P5250YA', 'M05TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4000', '2017-06-10', '2025-06-10', 'N'),
('IP', 251, 'TROLLEY', 'P5255YA', 'M06TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4700', '2018-03-10', '2026-03-10', 'N'),
('Otolaryngology', 920, 'ENT SURGERY MICROSCOPE ', 'Q21WS2', 'M01MICROSCO-OTO', 'KAPS PRO ENT M', 'Karl Kaps ', NULL, 'ELFATH', NULL, 'A', '45000', '2013-08-05', NULL, 'N'),
('Otolaryngology', 920, 'ENT CHAIR,EXAM', 'SED232W1', 'M01CHAIR-OTO', '2683', 'Promotal', NULL, 'ELFATH', NULL, 'A', '12000', '2016-10-22', '2020-10-22', 'N'),
('Otolaryngology', 921, 'ENT CHAIR,EXAM', 'SED2341D', 'M02CHAIR-OTO', '2683', 'Promotal', NULL, 'ELFATH', NULL, 'A', '12000', '2016-10-22', '2020-10-22', 'N'),
('Anesthesiology', 500, 'laryngoscope', 'sf5G55', 'M02SCOPE-ANESTH', 'HYHJ-KC', 'HAIYE', NULL, 'midk', NULL, 'A', '7000', '2019-11-11', '2022-11-09', 'N'),
('Anesthesiology', 501, 'laryngoscope', 'sf5Gu7', 'M03SCOPE-ANESTH', 'HYHJ-KC', 'HAIYE', NULL, 'midk', NULL, 'A', '7000', '2019-11-11', '2022-11-09', 'N'),
('Anesthesiology', 500, 'laryngoscope', 'ss4G55', 'M01SCOPE-ANESTH', 'HYHJ-KC', 'HAIYE', NULL, 'midk', NULL, 'A', '7000', '2019-11-09', '2022-11-09', 'N'),
('Laboratory', 751, 'LABORATORY COLD ROOM', 'Y3672G269', 'M02COLDROOM-LAB', 'JSSC-700C', 'JSR', NULL, 'Alcan medical', NULL, 'A', '100000', '2019-09-20', '2024-09-20', 'Y'),
('Laboratory', 750, 'LABORATORY COLD ROOM', 'Y3672G278', 'M01COLDROOM-LAB', 'JSSC-700C', 'JSR', NULL, 'Alcan medical', NULL, 'A', '100000', '2019-10-20', '2024-10-20', 'Y'),
('IP', 250, 'TROLLEY', 'Y5000PA', 'M01TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4000', '2017-06-10', '2025-06-10', 'N'),
('IP', 250, 'TROLLEY', 'Y5100PA', 'M02TROLLEY-IP', 'AG-MT001A1', 'AEGEA', 'NULL', 'ELFATH', 'NULL', 'A', '4000', '2017-06-10', '2025-06-10', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `ppm`
--

CREATE TABLE IF NOT EXISTS `ppm` (
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

CREATE TABLE IF NOT EXISTS `reports` (
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

CREATE TABLE IF NOT EXISTS `store` (
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
