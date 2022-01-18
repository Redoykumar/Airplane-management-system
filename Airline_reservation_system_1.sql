-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 27, 2019 at 05:42 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Airline_reservation_system_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Airlines`
--

CREATE TABLE `Airlines` (
  `Acode` varchar(10) NOT NULL,
  `Aname` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Airplane`
--

CREATE TABLE `Airplane` (
  `RegNO` varchar(10) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `seats` varchar(10) NOT NULL,
  `Acode` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Airport`
--

CREATE TABLE `Airport` (
  `Code` varchar(10) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Country` varchar(10) NOT NULL,
  `City` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Booking_office`
--

CREATE TABLE `Booking_office` (
  `Office_id` varchar(10) NOT NULL,
  `Office_Name` varchar(10) NOT NULL,
  `Flight` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Fare`
--

CREATE TABLE `Fare` (
  `Fare_type` varchar(10) NOT NULL,
  `Fare_dec` varchar(10) NOT NULL,
  `conditions` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `Passenger`
--

CREATE TABLE `Passenger` (
  `pid` varchar(10) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Age` int(3) NOT NULL,
  `Address` varchar(10) NOT NULL,
  `Email` varchar(10) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Office_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Route`
--

CREATE TABLE `Route` (
  `RouteNO` varchar(10) NOT NULL,
  `Route_dese` varchar(10) NOT NULL,
  `Fare_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
