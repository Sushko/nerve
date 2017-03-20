-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2017 at 08:43 
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
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `goals_in_time`
--

CREATE TABLE `goals_in_time` (
  `year` year(4) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL,
  `income` int(11) NOT NULL,
  `outcome` int(11) NOT NULL,
  `invest_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `goals_name`
--

CREATE TABLE `goals_name` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  `year` year(4) NOT NULL
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
-- Table structure for table `income_group`
--

CREATE TABLE `income_group` (
  `group_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `colunm_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `income_group`
--

INSERT INTO `income_group` (`group_id`, `title`, `colunm_name`) VALUES
(1, 'Avtor (Лёша)', 'lex_salary_avtor'),
(2, 'Frog (Лёша)', 'lex_salary_frog'),
(3, 'GlobalLogic (Лёша)', 'lex_salary_globallogic'),
(4, 'Mindshare (Youleek)', 'youleek_salary_mindshare'),
(5, 'Родители', 'parents'),
(6, 'Продажи', 'sales'),
(7, 'Подарки', 'presented'),
(8, 'Другое', 'other');

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

-- --------------------------------------------------------

--
-- Table structure for table `outcome_group`
--

CREATE TABLE `outcome_group` (
  `group_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `colunm_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outcome_group`
--

INSERT INTO `outcome_group` (`group_id`, `title`, `colunm_name`) VALUES
(1, 'ОСББ', 'utilities_house_keeping'),
(2, 'Гараж', 'utilities_garage'),
(3, 'Интернет', 'utilities_internet'),
(4, 'Свет', 'utilities_electricity'),
(5, 'Газ', 'utilities_gas'),
(6, 'Вода', 'utilities_water'),
(7, 'Питание', 'food'),
(8, 'Хоз.товары и бытовые траты', 'domestic'),
(9, 'Бензин/дорога', 'transportation'),
(10, 'Расходы на машину', 'car_maintain'),
(11, 'Одежда', 'clothes'),
(12, 'Здоровье', 'health'),
(13, 'Вещи для дома/быта', 'house_stuff'),
(14, 'Игрушки, др. вещи для ребёнка', 'kid_stuff'),
(15, 'Досуг', 'entertainment'),
(16, 'Подарки', 'presents'),
(17, 'Обучение, развитие', 'study_development'),
(18, 'Телефон', 'phone'),
(19, 'Сигареты', 'cigarette');

-- --------------------------------------------------------

--
-- Table structure for table `plans_in_time`
--

CREATE TABLE `plans_in_time` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plans_name`
--

CREATE TABLE `plans_name` (
  `plan_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `out_group_id` int(11) NOT NULL,
  `cost` int(15) NOT NULL
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
-- Indexes for table `goals_name`
--
ALTER TABLE `goals_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_group`
--
ALTER TABLE `income_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `outcome_group`
--
ALTER TABLE `outcome_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `plans_in_time`
--
ALTER TABLE `plans_in_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans_name`
--
ALTER TABLE `plans_name`
  ADD PRIMARY KEY (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `extra_expense`
--
ALTER TABLE `extra_expense`
  MODIFY `extra_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `goals_name`
--
ALTER TABLE `goals_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_group`
--
ALTER TABLE `income_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `outcome_group`
--
ALTER TABLE `outcome_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `plans_in_time`
--
ALTER TABLE `plans_in_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plans_name`
--
ALTER TABLE `plans_name`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
