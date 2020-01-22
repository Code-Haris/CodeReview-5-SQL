-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2020 at 12:28 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr_5_haris`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_Id` int(11) NOT NULL,
  `fk_endDate_Id` int(11) NOT NULL,
  `fk_booking_Id` int(11) NOT NULL,
  `Sum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_Id`, `fk_endDate_Id`, `fk_booking_Id`, `Sum`) VALUES
(1, 5, 1, 500),
(2, 6, 2, 20000),
(3, 7, 3, 5656);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_Id` int(11) NOT NULL,
  `fk_car_Id` int(11) NOT NULL,
  `fk_location_Id` int(11) NOT NULL,
  `fk_customer_Id` int(11) NOT NULL,
  `fk_start_Id` int(11) NOT NULL,
  `expectedEndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_Id`, `fk_car_Id`, `fk_location_Id`, `fk_customer_Id`, `fk_start_Id`, `expectedEndDate`) VALUES
(1, 4, 2, 4, 1, '2019-12-24 09:00:00'),
(2, 1, 1, 2, 2, '2019-12-22 21:00:00'),
(3, 2, 1, 5, 3, '2019-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_Id` int(11) NOT NULL,
  `typ` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `km` int(11) NOT NULL,
  `fk_location_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_Id`, `typ`, `name`, `km`, `fk_location_Id`) VALUES
(1, 'Porsche', '911', 213, 1),
(2, 'A4', 'Audi', 2342, 1),
(3, 'Z4', 'BMW', 1122, 1),
(4, 'F32', 'Ferrari', 1, 2),
(5, 'Punto', 'Fiat', 2344, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_Id` int(11) NOT NULL,
  `firstName` varchar(55) NOT NULL,
  `lastName` varchar(55) NOT NULL,
  `birthDate` date NOT NULL,
  `fk_login_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_Id`, `firstName`, `lastName`, `birthDate`, `fk_login_Id`) VALUES
(1, 'Name_one', 'Lastname_one', '1984-07-03', 1),
(2, 'name_two', 'lastname_two', '1949-12-01', 2),
(3, 'name_three', 'lastname_three', '1960-12-10', 3),
(4, 'name_four', 'lastname_four', '1970-12-23', 4),
(5, 'name_five', 'lastname_five', '2000-12-02', 5);

-- --------------------------------------------------------

--
-- Table structure for table `enddate`
--

CREATE TABLE `enddate` (
  `end_Id` int(11) NOT NULL,
  `fk_report_Id` int(11) NOT NULL,
  `endDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enddate`
--

INSERT INTO `enddate` (`end_Id`, `fk_report_Id`, `endDate`) VALUES
(5, 3, '2019-12-21 14:31:10'),
(6, 5, '2019-12-21 14:31:17'),
(7, 4, '2019-12-21 14:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_Id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `adress` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_Id`, `name`, `adress`) VALUES
(1, 'Hernals', 'AlserStraße 32, 1070Wien'),
(2, 'Otterkring', 'YppenPlatz 42, 1160 Wien');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_Id` int(11) NOT NULL,
  `email` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `passord` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_Id`, `email`, `username`, `passord`) VALUES
(1, 'email@gmail.com', 'name1', 'pwd'),
(2, 'email2@gmail.com', 'name2', 'pwd1'),
(3, 'email3@gmail.com', 'name3', 'pwd2'),
(4, 'email4@@gmail.com', 'name4', 'pwd3'),
(5, 'email5@@gmail.com', 'name5', 'pwd4');

-- --------------------------------------------------------

--
-- Table structure for table `premission`
--

CREATE TABLE `premission` (
  `pre_Id` int(11) NOT NULL,
  `pre_Status` tinyint(1) NOT NULL,
  `fk_login_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `premission`
--

INSERT INTO `premission` (`pre_Id`, `pre_Status`, `fk_login_Id`) VALUES
(1, 1, 1),
(2, 0, 4),
(3, 0, 5),
(4, 0, 2),
(5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_Id` int(11) NOT NULL,
  `damage` tinyint(1) NOT NULL,
  `report` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_Id`, `damage`, `report`) VALUES
(1, 0, '0'),
(2, 0, '0'),
(3, 0, 'none'),
(4, 1, 'scretch'),
(5, 1, 'destroyed');

-- --------------------------------------------------------

--
-- Table structure for table `startdate`
--

CREATE TABLE `startdate` (
  `start_Id` int(11) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `startdate`
--

INSERT INTO `startdate` (`start_Id`, `startDate`) VALUES
(1, '2019-12-21 14:26:15'),
(2, '2019-12-21 14:26:20'),
(3, '2019-12-21 14:26:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_Id`),
  ADD KEY `fk_endDate_Id` (`fk_endDate_Id`),
  ADD KEY `fk_booking_Id` (`fk_booking_Id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_Id`),
  ADD KEY `fk_location_Id` (`fk_location_Id`),
  ADD KEY `fk_car_Id` (`fk_car_Id`),
  ADD KEY `fk_start_Id` (`fk_start_Id`),
  ADD KEY `fk_customer_Id` (`fk_customer_Id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_Id`),
  ADD KEY `fk_location_Id` (`fk_location_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_Id`),
  ADD KEY `fk_login_Id` (`fk_login_Id`);

--
-- Indexes for table `enddate`
--
ALTER TABLE `enddate`
  ADD PRIMARY KEY (`end_Id`),
  ADD KEY `fk_report_Id` (`fk_report_Id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_Id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_Id`);

--
-- Indexes for table `premission`
--
ALTER TABLE `premission`
  ADD PRIMARY KEY (`pre_Id`),
  ADD KEY `fk_login_Id` (`fk_login_Id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_Id`);

--
-- Indexes for table `startdate`
--
ALTER TABLE `startdate`
  ADD PRIMARY KEY (`start_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enddate`
--
ALTER TABLE `enddate`
  MODIFY `end_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `premission`
--
ALTER TABLE `premission`
  MODIFY `pre_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `startdate`
--
ALTER TABLE `startdate`
  MODIFY `start_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`fk_endDate_Id`) REFERENCES `enddate` (`end_Id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`fk_booking_Id`) REFERENCES `booking` (`booking_Id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_location_Id`) REFERENCES `location` (`location_Id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_car_Id`) REFERENCES `car` (`car_Id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`fk_start_Id`) REFERENCES `startdate` (`start_Id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`fk_customer_Id`) REFERENCES `customer` (`customer_Id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_location_Id`) REFERENCES `location` (`location_Id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_login_Id`) REFERENCES `login` (`login_Id`);

--
-- Constraints for table `enddate`
--
ALTER TABLE `enddate`
  ADD CONSTRAINT `enddate_ibfk_1` FOREIGN KEY (`fk_report_Id`) REFERENCES `report` (`report_Id`);

--
-- Constraints for table `premission`
--
ALTER TABLE `premission`
  ADD CONSTRAINT `premission_ibfk_1` FOREIGN KEY (`fk_login_Id`) REFERENCES `login` (`login_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
