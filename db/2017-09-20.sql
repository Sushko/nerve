-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `extra_expense`
--

DROP TABLE IF EXISTS `extra_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_expense` (
  `extra_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` enum('Big expense','Extra loss') NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`extra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_expense`
--

LOCK TABLES `extra_expense` WRITE;
/*!40000 ALTER TABLE `extra_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals_in_time`
--

DROP TABLE IF EXISTS `goals_in_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goals_in_time` (
  `year` year(4) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL,
  `income` int(11) NOT NULL,
  `outcome` int(11) NOT NULL,
  `invest_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_in_time`
--

LOCK TABLES `goals_in_time` WRITE;
/*!40000 ALTER TABLE `goals_in_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals_in_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals_name`
--

DROP TABLE IF EXISTS `goals_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goals_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_name`
--

LOCK TABLES `goals_name` WRITE;
/*!40000 ALTER TABLE `goals_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `government` int(11) NOT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (2012,'August',1039800,0,0,0,160000,0,0,0,0,42118,60000,0,9593,125198,17300,658960,569875,329421,840400,605000,693046,193600,142120,107850,30000,1435000,0,0,0,0,0,8,'Start to track income');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_and_status`
--

DROP TABLE IF EXISTS `income_and_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_and_status` (
  `date` date NOT NULL,
  `lex_salary_avtor` int(11) NOT NULL,
  `lex_salary_frog` int(11) NOT NULL,
  `lex_salary_globallogic` int(11) NOT NULL,
  `youleek_salary_mindshare` int(11) NOT NULL,
  `parents` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `presented` int(11) NOT NULL,
  `government` int(11) NOT NULL,
  `other` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `invest_amount` int(11) NOT NULL,
  `usd_ratio` float NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_and_status`
--

LOCK TABLES `income_and_status` WRITE;
/*!40000 ALTER TABLE `income_and_status` DISABLE KEYS */;
INSERT INTO `income_and_status` VALUES ('2012-08-31',1039800,0,0,0,160000,0,0,0,0,0,0,8,'Start to track income');
/*!40000 ALTER TABLE `income_and_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_group`
--

DROP TABLE IF EXISTS `income_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `colunm_name` varchar(30) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_group`
--

LOCK TABLES `income_group` WRITE;
/*!40000 ALTER TABLE `income_group` DISABLE KEYS */;
INSERT INTO `income_group` VALUES (1,'Avtor (Лёша)','lex_salary_avtor'),(2,'Frog (Лёша)','lex_salary_frog'),(3,'GlobalLogic (Лёша)','lex_salary_globallogic'),(4,'Mindshare (Youleek)','youleek_salary_mindshare'),(5,'Родители','parents'),(6,'Продажи','sales'),(7,'Подарки','presented'),(8,'Социальные выплаты','government'),(9,'Другое','other');
/*!40000 ALTER TABLE `income_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome`
--

DROP TABLE IF EXISTS `outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome`
--

LOCK TABLES `outcome` WRITE;
/*!40000 ALTER TABLE `outcome` DISABLE KEYS */;
INSERT INTO `outcome` VALUES ('2017-03-01',0,0,0,0,0,0,16357,0,0,115900,0,0,0,0,0,0,0,0,0),('2017-03-02',0,0,0,0,0,0,11544,0,2400,0,0,0,0,0,10000,0,0,0,0),('2017-03-03',0,0,0,0,0,0,7480,57087,0,350000,0,32500,0,19900,0,0,0,0,0),('2017-03-04',0,0,0,0,0,0,223276,125518,0,0,0,0,143500,14820,0,0,701000,0,0),('2017-03-05',0,0,0,0,0,0,42200,1000,0,0,0,38000,0,0,18000,0,0,0,0),('2017-03-06',0,0,0,0,0,0,0,2000,0,0,262000,0,0,0,0,0,84000,0,0),('2017-03-07',0,0,0,0,0,0,4800,51400,0,0,0,52465,0,0,0,0,0,0,0),('2017-03-08',0,0,0,0,0,0,34925,0,139920,0,0,13315,0,10300,9850,0,0,0,0),('2017-03-09',0,0,0,0,0,0,10000,0,0,65000,0,0,0,0,10000,0,0,0,0),('2017-03-10',0,0,0,0,0,0,39600,0,2400,0,0,0,50100,0,0,0,0,0,0),('2017-03-11',0,0,0,0,0,0,0,35000,0,0,0,0,0,0,0,0,0,0,0),('2017-03-12',0,0,0,0,0,0,0,0,0,0,0,0,0,0,20000,0,0,0,0),('2017-03-13',0,0,0,0,0,0,6550,0,2400,0,0,70000,0,0,0,10000,0,0,0),('2017-03-14',0,0,0,0,0,0,0,0,2400,0,0,20000,0,0,0,0,0,0,0),('2017-03-15',0,0,0,0,0,0,23519,0,0,0,0,23940,0,0,0,0,0,0,0),('2017-03-16',0,0,0,0,0,0,0,0,3400,0,0,137670,0,0,0,0,0,0,0),('2017-03-17',0,0,0,0,0,0,22476,271350,5200,0,0,45500,0,0,0,0,0,0,0),('2017-03-18',0,0,0,0,0,0,27000,0,0,0,0,0,0,0,0,0,0,0,0),('2017-03-19',0,0,0,0,0,0,2190,0,0,0,0,0,0,0,0,0,0,0,0),('2017-03-20',0,0,0,0,0,0,7000,0,0,0,0,0,0,0,0,10000,0,0,0),('2017-03-21',0,0,0,0,0,0,26766,920,2400,0,337000,0,0,0,10000,0,0,0,0),('2017-03-22',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-03-23',0,0,0,0,0,0,0,0,2400,0,6000,25000,0,0,10000,0,0,0,0),('2017-03-24',0,0,0,0,0,0,8998,0,0,0,0,0,0,0,0,0,0,0,0),('2017-03-25',0,0,0,0,0,0,56087,25000,0,2000,0,15566,0,0,0,0,0,0,0),('2017-03-26',0,0,0,0,0,0,6000,0,124701,51900,0,0,0,0,0,0,0,0,0),('2017-03-27',0,0,0,0,0,0,0,0,0,247600,0,0,0,0,0,10000,0,0,0),('2017-03-28',0,0,0,0,0,0,30647,0,21200,0,0,59000,0,0,10000,0,0,0,0),('2017-03-29',0,0,0,0,0,0,26395,600,0,0,0,56000,0,97100,0,0,0,0,0),('2017-03-30',0,0,0,0,0,0,7000,0,2400,0,0,0,0,0,10000,0,0,0,0),('2017-03-31',42118,60000,0,9593,125198,17300,18150,0,18200,8000,0,104090,0,0,0,0,650000,0,0);
/*!40000 ALTER TABLE `outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_group`
--

DROP TABLE IF EXISTS `outcome_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `colunm_name` varchar(30) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_group`
--

LOCK TABLES `outcome_group` WRITE;
/*!40000 ALTER TABLE `outcome_group` DISABLE KEYS */;
INSERT INTO `outcome_group` VALUES (1,'ОСББ','utilities_house_keeping'),(2,'Гараж','utilities_garage'),(3,'Интернет','utilities_internet'),(4,'Свет','utilities_electricity'),(5,'Газ','utilities_gas'),(6,'Вода','utilities_water'),(7,'Питание','food'),(8,'Хоз.товары и бытовые траты','domestic'),(9,'Бензин/дорога','transportation'),(10,'Расходы на машину','car_maintain'),(11,'Одежда','clothes'),(12,'Здоровье','health'),(13,'Вещи для дома/быта','house_stuff'),(14,'Игрушки, др. вещи для ребёнка','kid_stuff'),(15,'Досуг','entertainment'),(16,'Подарки','presents'),(17,'Обучение, развитие','study_development'),(18,'Телефон','phone'),(19,'Сигареты','cigarette');
/*!40000 ALTER TABLE `outcome_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_in_time`
--

DROP TABLE IF EXISTS `plans_in_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans_in_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December','Some month') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_in_time`
--

LOCK TABLES `plans_in_time` WRITE;
/*!40000 ALTER TABLE `plans_in_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_in_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_name`
--

DROP TABLE IF EXISTS `plans_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans_name` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `out_group_id` int(11) NOT NULL,
  `cost` int(15) NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_name`
--

LOCK TABLES `plans_name` WRITE;
/*!40000 ALTER TABLE `plans_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-20  9:58:14
