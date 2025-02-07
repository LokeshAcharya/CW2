-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 06:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lokesh cw2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `IsMember` char(1) DEFAULT NULL,
  `Fee` decimal(10,2) DEFAULT NULL,
  `PrePaid` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `SessionID`, `CustomerID`, `BookingDate`, `IsMember`, `Fee`, `PrePaid`) VALUES
(1, 1, 1, '2024-07-22', 'Y', NULL, 'N'),
(2, 1, 2, '2024-07-22', 'N', 1500.00, 'N'),
(3, 1, 3, '2024-07-22', 'Y', 1000.00, 'Y'),
(4, 1, 4, '2024-08-25', 'N', 1500.00, 'N'),
(5, 2, 4, '2024-07-22', 'Y', 1000.00, 'N'),
(6, 4, 5, '2024-07-05', 'Y', 1000.00, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `consoles`
--

CREATE TABLE `consoles` (
  `ConsoleID` int(11) NOT NULL,
  `ConsoleName` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consoles`
--

INSERT INTO `consoles` (`ConsoleID`, `ConsoleName`, `Quantity`) VALUES
(1, 'Xbox 360', 3),
(2, 'PS3', 2),
(3, 'PS2', 3),
(4, 'Nintendo 64', 2),
(5, 'Nintendo Switch', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MemberType` varchar(20) DEFAULT NULL,
  `MembershipFee` decimal(10,2) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Address`, `MemberType`, `MembershipFee`, `JoinDate`, `DateOfBirth`) VALUES
(1, 'Saanvi', 'Bhatta', 'Baneshwor, Kathmandu', 'Standard', 1500.00, '2024-01-01', '2015-03-01'),
(2, 'Bill', 'Gates', 'Maitidevi, Kathmandu', 'Premium', 20000.00, '2024-07-06', '2001-10-12'),
(3, 'Elon', 'Musk', 'Putalisadak, Kathmandu', 'Premium', 20000.00, '2024-03-28', '2003-07-20'),
(4, 'Kamala', 'Harris', 'Kapan, Kathmandu', 'Standard', 1500.00, '2024-01-05', '1973-05-01'),
(5, 'Rishi', 'Sunak', 'Somewhere, Kathmandu', 'Standard', 1500.00, '2024-07-05', '1980-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `GameID` int(11) NOT NULL,
  `GameName` varchar(100) DEFAULT NULL,
  `PEGI` varchar(10) DEFAULT NULL,
  `ConsoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`GameID`, `GameName`, `PEGI`, `ConsoleID`) VALUES
(1, 'Elden Ring: Shadow of Erdtree', 'PG', 1),
(2, 'Final Fantasy VII Rebirth', 'PG', 2),
(3, 'Destiny 2: The Final Shape', 'PG', 3),
(4, 'Tekken 8', 'PG', 2),
(5, 'Persona 3 Reload', 'PG', 4),
(6, 'Cavern of Dreams', '15', 5);

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `MachineID` int(11) NOT NULL,
  `GameName` varchar(50) DEFAULT NULL,
  `ReleaseYear` int(11) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`MachineID`, `GameName`, `ReleaseYear`, `Floor`) VALUES
(23, 'COC', 2010, 1),
(45, 'Spiderman', 2016, 2),
(1234, 'PUBG', 2004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessionconsoles`
--

CREATE TABLE `sessionconsoles` (
  `SessionConsoleID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `ConsoleID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessionconsoles`
--

INSERT INTO `sessionconsoles` (`SessionConsoleID`, `SessionID`, `ConsoleID`, `Quantity`) VALUES
(1, 1, 3, 2),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SessionID` int(11) NOT NULL,
  `SessionDay` varchar(10) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `SessionType` varchar(10) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SessionID`, `SessionDay`, `StartTime`, `EndTime`, `SessionType`, `Floor`, `Price`) VALUES
(1, 'Sunday', '09:00:00', '21:00:00', 'Free', 1, 1500.00),
(2, 'Sunday', '09:00:00', '21:00:00', 'Free', 2, 1000.00),
(3, 'Saturday', '09:00:00', '21:00:00', 'Free', 1, 1500.00),
(4, 'Friday', '18:00:00', '22:00:00', 'Special', 2, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessionstaff`
--

CREATE TABLE `sessionstaff` (
  `SessionStaffID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessionstaff`
--

INSERT INTO `sessionstaff` (`SessionStaffID`, `SessionID`, `StaffID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `StaffName` varchar(50) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `Role`) VALUES
(1, 'Sagar Aryal', 'Cafe'),
(2, 'Bikesh Khagdi', 'Maintenance'),
(3, 'Saroj Sapkota', 'Counter'),
(4, 'Jonathan Shrestha', 'Counter'),
(5, 'Rohan Chaudhary', 'Maintenance'),
(6, 'Rajeev Karmacharya', 'Cafe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `consoles`
--
ALTER TABLE `consoles`
  ADD PRIMARY KEY (`ConsoleID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`GameID`),
  ADD KEY `ConsoleID` (`ConsoleID`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`MachineID`);

--
-- Indexes for table `sessionconsoles`
--
ALTER TABLE `sessionconsoles`
  ADD PRIMARY KEY (`SessionConsoleID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `ConsoleID` (`ConsoleID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `sessionstaff`
--
ALTER TABLE `sessionstaff`
  ADD PRIMARY KEY (`SessionStaffID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`ConsoleID`) REFERENCES `consoles` (`ConsoleID`);

--
-- Constraints for table `sessionconsoles`
--
ALTER TABLE `sessionconsoles`
  ADD CONSTRAINT `sessionconsoles_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `sessionconsoles_ibfk_2` FOREIGN KEY (`ConsoleID`) REFERENCES `consoles` (`ConsoleID`);

--
-- Constraints for table `sessionstaff`
--
ALTER TABLE `sessionstaff`
  ADD CONSTRAINT `sessionstaff_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `sessionstaff_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
