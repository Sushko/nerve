-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2017 at 08:50 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nerve`
--

-- --------------------------------------------------------

--
-- Table structure for table `extra_expense`
--

CREATE TABLE `extra_expense` (
  `extra_id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` enum('Big expense','Extra loss') NOT NULL,
  `cost` int(11) NOT NULL,
  `coment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `year` year(4) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL,
  `lex_salary_avtor` int(11) NOT NULL,
  `lex_salary_frog` int(11) NOT NULL,
  `lex_salary_globallogic` int(11) NOT NULL,
  `youleek_salary_mindshare` int(11) NOT NULL,
  `parents` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `presented` int(11) NOT NULL,
  `other` int(11) NOT NULL,
  `utilities_house_keeping` int(11) NOT NULL,
  `utilities_garage` int(11) NOT NULL,
  `utilities_internet` int(11) NOT NULL,
  `utilities_electricity` int(11) NOT NULL,
  `utilities_gas` int(11) NOT NULL,
  `utilities_water` int(11) NOT NULL,
  `food` int(11) NOT NULL,
  `domestic` int(11) NOT NULL,
  `transportation` int(11) NOT NULL,
  `car_maintain` int(11) NOT NULL,
  `clothes` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `house_stuff` int(11) NOT NULL,
  `kid_stuff` int(11) NOT NULL,
  `entertainment` int(11) NOT NULL,
  `presents` int(11) NOT NULL,
  `study_development` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `cigarette` int(11) NOT NULL,
  `invest_amount` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `usd_ratio` float NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income_and_status`
--

CREATE TABLE `income_and_status` (
  `date` date NOT NULL,
  `lex_salary_avtor` int(11) NOT NULL,
  `lex_salary_frog` int(11) NOT NULL,
  `lex_salary_globallogic` int(11) NOT NULL,
  `youleek_salary_mindshare` int(11) NOT NULL,
  `parents` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `presented` int(11) NOT NULL,
  `other` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `invest_amount` int(11) NOT NULL,
  `usd_ratio` float NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outcome`
--

CREATE TABLE `outcome` (
  `date` date NOT NULL,
  `utilities_house_keeping` int(11) NOT NULL,
  `utilities_garage` int(11) NOT NULL,
  `utilities_internet` int(11) NOT NULL,
  `utilities_electricity` int(11) NOT NULL,
  `utilities_gas` int(11) NOT NULL,
  `utilities_water` int(11) NOT NULL,
  `food` int(11) NOT NULL,
  `domestic` int(11) NOT NULL,
  `transportation` int(11) NOT NULL,
  `car_maintain` int(11) NOT NULL,
  `clothes` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `house_stuff` int(11) NOT NULL,
  `kid_stuff` int(11) NOT NULL,
  `entertainment` int(11) NOT NULL,
  `presents` int(11) NOT NULL,
  `study_development` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `cigarette` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `extra_expense`
--
ALTER TABLE `extra_expense`
  ADD PRIMARY KEY (`extra_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `extra_expense`
--
ALTER TABLE `extra_expense`
  MODIFY `extra_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
