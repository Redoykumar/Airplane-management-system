-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 04, 2019 at 01:13 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Airline_reservation_system_1`
--
CREATE DATABASE IF NOT EXISTS `Airline_reservation_system_1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Airline_reservation_system_1`;

-- --------------------------------------------------------

--
-- Table structure for table `Airlines`
--
-- Creation: Jul 26, 2019 at 07:24 PM
--

DROP TABLE IF EXISTS `Airlines`;
CREATE TABLE `Airlines` (
  `Acode` varchar(10) NOT NULL,
  `Aname` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Airlines`:
--

--
-- Truncate table before insert `Airlines`
--

TRUNCATE TABLE `Airlines`;
--
-- Dumping data for table `Airlines`
--

INSERT DELAYED IGNORE INTO `Airlines` VALUES
('AR01', 'Alitalia'),
('AR02', 'Avianca'),
('AR03', 'Iberia'),
('AR04', 'Oman Air'),
('AR05', 'SilkAir'),
('AR06', 'Korean Air'),
('AR07', 'Finnair'),
('AR08', 'AirAsia'),
('AR09', 'Emirates'),
('AR10', 'Scoot');

-- --------------------------------------------------------

--
-- Table structure for table `Airplane`
--
-- Creation: Aug 03, 2019 at 08:45 PM
--

DROP TABLE IF EXISTS `Airplane`;
CREATE TABLE `Airplane` (
  `RegNO` varchar(10) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `seats` varchar(10) NOT NULL,
  `Acode` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Airplane`:
--   `Acode`
--       `Airlines` -> `Acode`
--   `code`
--       `Airport` -> `Code`
--

--
-- Truncate table before insert `Airplane`
--

TRUNCATE TABLE `Airplane`;
--
-- Dumping data for table `Airplane`
--

INSERT DELAYED IGNORE INTO `Airplane` VALUES
('AP01', 'Airbus A333-300', '300', 'AR03', 'COC'),
('AP02', 'Airbus A340-300', '295', 'AR02', 'CNT'),
('AP03', 'Airbus A320neo', '420', 'AR04', 'COR'),
('AP05', 'Airbus A330-200', '372 ', 'AR02', 'COR'),
('AP06', 'Boeing 717', '450', 'AR08', 'MZW'),
('AP07', 'Boeing 737-700', ' 440', 'AR07', 'PGI'),
('AP08', 'Boeing 747-200', '256', 'AR09', 'NDF'),
('AP09', 'Embraer RJ140', '550 ', 'AR05', 'MZW'),
('AP10', 'Airbus A300', '550', 'AR03', 'COR'),
('AP11', 'Airbus A340-200', '416', 'AR01', 'MZW');

-- --------------------------------------------------------

--
-- Table structure for table `Airport`
--
-- Creation: Aug 03, 2019 at 08:06 PM
--

DROP TABLE IF EXISTS `Airport`;
CREATE TABLE `Airport` (
  `Code` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Airport`:
--

--
-- Truncate table before insert `Airport`
--

TRUNCATE TABLE `Airport`;
--
-- Dumping data for table `Airport`
--

INSERT DELAYED IGNORE INTO `Airport` VALUES
('CNT', 'Charata Airport', 'Argentina', 'Charata'),
('COC', 'Concordia Airport', 'Argentina', 'Concordia'),
('COR', 'Pajas Blancas Airport', 'Argentina ', 'Cordoba'),
('CPC', 'Chapelco Airport', 'Argentina ', 'San Martin DeLos'),
('GBB', 'Gara Djebilet Airport', 'Algeria', 'Djebilet'),
('INZ', 'In Salah Airport', 'Algeria ', 'In Salah'),
('MZW', 'Mechria Airport', 'Algeria', 'Mechria'),
('NDD', 'Sumbe Airport', 'Angola', 'Sumbe'),
('NDF', 'Ndalatandos Airport', ' Angola', 'Ndalatandos'),
('NGV', 'Ngiva Airport', 'Angola', 'Ngiva'),
('PGI', 'Chitato Airport', 'Angola', 'Chitato');

-- --------------------------------------------------------

--
-- Table structure for table `Booking_office`
--
-- Creation: Aug 03, 2019 at 10:44 PM
--

DROP TABLE IF EXISTS `Booking_office`;
CREATE TABLE `Booking_office` (
  `Office_id` varchar(10) NOT NULL,
  `Office_Name` varchar(100) NOT NULL,
  `Flight` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Booking_office`:
--   `Flight`
--       `Flight` -> `Flight`
--

--
-- Truncate table before insert `Booking_office`
--

TRUNCATE TABLE `Booking_office`;
--
-- Dumping data for table `Booking_office`
--

INSERT DELAYED IGNORE INTO `Booking_office` VALUES
('B01', 'Biman Bangladesh Dhaka Offices', 'F10'),
('B02', 'Corporate Sales Office ', 'F02'),
('B03', 'Regent Sales Outlets ', 'F04'),
('B04', 'Regent Sales Outlets ', 'F07'),
('B05', 'Emirates Gulshan (Town office)', 'F10'),
('B06', 'Sales Office (Dhaka)', 'F08'),
('B07', 'Etihad Airways Bangladesh Office', 'F09'),
('B08', 'Etihad Airways Bangladesh Office', 'F03'),
('B09', 'Qatar Airways Ltd.', 'F06'),
('B10', 'Air Galaxy Limited', 'F05');

-- --------------------------------------------------------

--
-- Table structure for table `Fare`
--
-- Creation: Aug 03, 2019 at 09:34 PM
--

DROP TABLE IF EXISTS `Fare`;
CREATE TABLE `Fare` (
  `Fare_type` varchar(50) NOT NULL,
  `Fare_dec` varchar(10) NOT NULL,
  `conditions` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Fare`:
--

--
-- Truncate table before insert `Fare`
--

TRUNCATE TABLE `Fare`;
--
-- Dumping data for table `Fare`
--

INSERT DELAYED IGNORE INTO `Fare` VALUES
('Business', '115$', 'With fees'),
('Economy', '200$', 'With fees'),
('First', '100$', 'With fees'),
('Premium economy', '150$', 'With fees');

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--
-- Creation: Jul 27, 2019 at 03:35 PM
--

DROP TABLE IF EXISTS `Flight`;
CREATE TABLE `Flight` (
  `Flight` varchar(10) NOT NULL,
  `Class` varchar(10) NOT NULL,
  `Ffrom` varchar(10) NOT NULL,
  `Fto` varchar(10) NOT NULL,
  `Dep_time` time NOT NULL,
  `Dep_date` date NOT NULL,
  `Arr_time` time NOT NULL,
  `Arr_date` date NOT NULL,
  `Acode` varchar(10) NOT NULL,
  `RouteNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Flight`:
--   `Acode`
--       `Airlines` -> `Acode`
--   `RouteNo`
--       `Route` -> `RouteNO`
--

--
-- Truncate table before insert `Flight`
--

TRUNCATE TABLE `Flight`;
--
-- Dumping data for table `Flight`
--

INSERT DELAYED IGNORE INTO `Flight` VALUES
('F01', 'First', 'Amritsar', 'MANCHESTER', '06:12:17', '2019-08-15', '08:31:27', '2019-08-24', 'AR01', 'R06'),
('F02', 'Business', 'Amritsar', 'Madrid', '07:27:25', '2019-08-22', '10:17:24', '2019-08-26', 'AR02', 'R07'),
('F03', 'Business', 'Amritsar', 'Johannesb', '10:17:24', '2019-08-08', '10:17:24', '2019-08-02', 'AR03', 'R03'),
('F04', 'Economy', 'Agra', 'Francisco', '10:17:24', '2019-08-16', '10:17:24', '2019-08-16', 'AR04', 'R02'),
('F05', 'Economy', 'Agra', 'Bangkok', '10:17:24', '2019-08-23', '10:17:24', '2019-08-07', 'AR05', 'R01'),
('F06', 'First', 'Amritsar', 'Orlando', '10:17:24', '2019-08-14', '10:17:24', '2019-08-27', 'AR06', 'R10'),
('F07', 'Economy', 'Amritsar', 'Kuala Lum', '10:17:24', '2019-08-14', '10:17:24', '2019-08-29', 'AR07', 'R08'),
('F08', 'First', 'Amritsar', 'Male', '10:17:24', '2019-08-14', '10:17:24', '2019-08-09', 'AR08', 'R05'),
('F09', 'Business', 'Amritsar', 'Madrid', '10:17:24', '2019-08-17', '10:17:24', '2019-08-26', 'AR09', 'R07'),
('F10', 'Economy', 'Agra', 'Francisco', '10:17:24', '2019-08-24', '10:17:24', '2019-08-26', 'AR10', 'R02');

-- --------------------------------------------------------

--
-- Table structure for table `Passenger`
--
-- Creation: Aug 03, 2019 at 10:52 PM
--

DROP TABLE IF EXISTS `Passenger`;
CREATE TABLE `Passenger` (
  `pid` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Age` int(3) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Office_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Passenger`:
--   `Office_id`
--       `Booking_office` -> `Office_id`
--

--
-- Truncate table before insert `Passenger`
--

TRUNCATE TABLE `Passenger`;
--
-- Dumping data for table `Passenger`
--

INSERT DELAYED IGNORE INTO `Passenger` VALUES
('P01', 'Redoy kumar das', 'Male', 22, 'Nikunja 2 ', 'Redoykumar0@gmail.com', '+8801744484183', 'B01'),
('P02', 'Prnoy shaha ', 'Male', 23, 'Nikunja 2', 'prnoysha@gmail.com', '+8801733269587', 'B03'),
('P03', 'Tonmoy hajari ', 'Male', 22, 'Bogura', 'Tonmoyhajary@gmail.com', '+8801922546846', 'B10'),
('P04', 'Dibakor roy', 'Male', 23, 'Nikanja 2', 'dibakorroy@gmail.com', '+8801795836914', 'B09'),
('P05', 'Asaduljaman romio ', 'Male', 23, 'Jamalpur ', 'Asaduljamanromio@gmail.com ', '+88017985369', 'B06'),
('P06', 'Shohan khan', 'Male', 23, 'nikanja 2', 'Shohankhan@yahoo.com', '+8801756968359', 'B05'),
('P07', 'Hridoy khan', 'Male', 24, 'Basundhara', 'Shohankhan@gmail.com', '+8801775512211', 'B04'),
('P08', 'Rokey khan', 'Male', 22, 'Gaibandha ', 'Rokeykhan@gmail.com', '+88015448269541', 'B02'),
('P09', 'Rayhan khan', 'Male', 22, 'Gaibandha', 'Rokeykhan@gmail.com', '+88017695871332', 'B05'),
('P10', 'Etrat jahan ', 'Male', 21, 'Airport', 'Etratjahan@gmail.com ', '+8801754896588', 'B04');

-- --------------------------------------------------------

--
-- Table structure for table `Route`
--
-- Creation: Aug 03, 2019 at 09:50 PM
--

DROP TABLE IF EXISTS `Route`;
CREATE TABLE `Route` (
  `RouteNO` varchar(10) NOT NULL,
  `Route_dese` varchar(100) NOT NULL,
  `Fare_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Route`:
--   `Fare_type`
--       `Fare` -> `Fare_type`
--

--
-- Truncate table before insert `Route`
--

TRUNCATE TABLE `Route`;
--
-- Dumping data for table `Route`
--

INSERT DELAYED IGNORE INTO `Route` VALUES
('R01', 'Agra to Bangkok', 'Business'),
('R02', 'Agra to San Francisco', 'First'),
('R03', 'Amritsar to Johannesburg', 'Premium economy'),
('R04', 'Amritsar to Manchester', 'First'),
('R05', 'Amritsar to Male', 'Economy'),
('R06', 'Amritsar to MANCHESTER', 'Premium economy'),
('R07', 'Amritsar to Madrid', 'Business'),
('R08', 'Amritsar to Kuala Lumpur', 'Economy'),
('R09', 'Amritsar to Washington', 'Economy'),
('R10', 'Amritsar to Orlando', 'Business');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Airlines`
--
ALTER TABLE `Airlines`
  ADD PRIMARY KEY (`Acode`);

--
-- Indexes for table `Airplane`
--
ALTER TABLE `Airplane`
  ADD PRIMARY KEY (`RegNO`),
  ADD KEY `Acode` (`Acode`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `Airport`
--
ALTER TABLE `Airport`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Booking_office`
--
ALTER TABLE `Booking_office`
  ADD PRIMARY KEY (`Office_id`),
  ADD KEY `Flight` (`Flight`);

--
-- Indexes for table `Fare`
--
ALTER TABLE `Fare`
  ADD PRIMARY KEY (`Fare_type`);

--
-- Indexes for table `Flight`
--
ALTER TABLE `Flight`
  ADD PRIMARY KEY (`Flight`),
  ADD UNIQUE KEY `Acode` (`Acode`),
  ADD KEY `RouteNo` (`RouteNo`);

--
-- Indexes for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `Office_id` (`Office_id`);

--
-- Indexes for table `Route`
--
ALTER TABLE `Route`
  ADD PRIMARY KEY (`RouteNO`),
  ADD KEY `Fare_type` (`Fare_type`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Airplane`
--
ALTER TABLE `Airplane`
  ADD CONSTRAINT `Airplane_ibfk_1` FOREIGN KEY (`Acode`) REFERENCES `Airlines` (`Acode`),
  ADD CONSTRAINT `Airplane_ibfk_2` FOREIGN KEY (`code`) REFERENCES `Airport` (`Code`);

--
-- Constraints for table `Booking_office`
--
ALTER TABLE `Booking_office`
  ADD CONSTRAINT `Booking_office_ibfk_1` FOREIGN KEY (`Flight`) REFERENCES `Flight` (`Flight`);

--
-- Constraints for table `Flight`
--
ALTER TABLE `Flight`
  ADD CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`Acode`) REFERENCES `Airlines` (`Acode`),
  ADD CONSTRAINT `Flight_ibfk_2` FOREIGN KEY (`RouteNo`) REFERENCES `Route` (`RouteNO`);

--
-- Constraints for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`Office_id`) REFERENCES `Booking_office` (`Office_id`);

--
-- Constraints for table `Route`
--
ALTER TABLE `Route`
  ADD CONSTRAINT `Route_ibfk_1` FOREIGN KEY (`Fare_type`) REFERENCES `Fare` (`Fare_type`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for Airlines
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Airplane
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Airport
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Booking_office
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Fare
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Flight
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Passenger
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Route
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for Airline_reservation_system_1
--

--
-- Truncate table before insert `pma__bookmark`
--

TRUNCATE TABLE `pma__bookmark`;
--
-- Truncate table before insert `pma__relation`
--

TRUNCATE TABLE `pma__relation`;
--
-- Truncate table before insert `pma__savedsearches`
--

TRUNCATE TABLE `pma__savedsearches`;
--
-- Truncate table before insert `pma__central_columns`
--

TRUNCATE TABLE `pma__central_columns`;SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
