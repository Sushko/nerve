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
  `title` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `type` enum('Big expense','Extra loss') NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`extra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_expense`
--

LOCK TABLES `extra_expense` WRITE;
/*!40000 ALTER TABLE `extra_expense` DISABLE KEYS */;
INSERT INTO `extra_expense` VALUES (1,2013,'September','Отпуск: Крит(Греция)','Big expense',2300000),(2,2014,'February','ДТП','Big expense',2100000),(3,2014,'March','ДТП','Big expense',5500000),(4,2014,'April','ДТП','Big expense',3600000),(5,2014,'August','Отпуск: Турция','Big expense',3600000),(6,2014,'September','Машина: Nissan Qashqai','Big expense',19100000),(7,2014,'Some month','UAH devaluation: bonuses ','Extra loss',1800000),(8,2014,'Some month','UAH devaluation: OTP deposit','Extra loss',1800000),(9,2014,'Some month','USD buy','Extra loss',3600000),(10,2015,'January','Отпуск: билеты США','Big expense',3400000),(11,2015,'May','Отпуск: США','Big expense',5730000),(12,2015,'Some month','USD buy','Extra loss',2350000),(13,2015,'Some month','Lend','Extra loss',2350000),(14,2016,'February','Отпуск: Буковель','Big expense',1500000),(15,2016,'June','Отпуск: Испания','Big expense',5390000),(16,2016,'September','Отпуск: Испания','Big expense',3130000),(17,2016,'November','Отпуск: Австрия','Big expense',660000),(18,2016,'December','Отпуск: Австрия','Big expense',2070000),(19,2016,'Some month','Lend','Extra loss',3945000),(20,2016,'Some month','Present','Extra loss',2630000),(21,2017,'May','Роддом: Вера','Big expense',2650000),(22,2017,'August','Отпуск: Карпаты','Big expense',1289500);
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
  `inc_Lex` int(11) NOT NULL,
  `inc_Youleek` int(11) NOT NULL,
  `inc_add1` int(11) NOT NULL,
  `inc_add2` int(11) NOT NULL,
  `out_base` int(11) NOT NULL,
  `out_extra` int(11) NOT NULL,
  `out_vacation` int(11) NOT NULL,
  `invest_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_in_time`
--

LOCK TABLES `goals_in_time` WRITE;
/*!40000 ALTER TABLE `goals_in_time` DISABLE KEYS */;
INSERT INTO `goals_in_time` VALUES (2017,'September',2800,0,0,0,1500,0,0,920),(2017,'October',2800,0,1,0,1500,0,0,921),(2017,'November',2800,0,1,0,1500,0,0,921),(2017,'December',2800,0,20,0,1500,0,0,938),(2018,'January',3000,0,100,0,1500,200,0,1090),(2018,'February',3000,0,100,0,1000,200,1000,590),(2018,'March',3000,0,400,0,1500,200,0,1360),(2018,'April',3000,0,400,0,1500,1000,0,560),(2018,'May',3000,0,400,0,1500,200,0,1360),(2018,'June',3000,0,400,0,1500,200,0,1360),(2018,'July',3000,0,400,0,1500,200,1000,360),(2018,'August',3000,0,500,0,1000,200,1500,450),(2018,'September',3500,0,500,0,1700,300,0,1600),(2018,'October',3500,0,500,0,1700,300,0,1600),(2018,'November',3500,0,500,0,1700,300,0,1600),(2018,'December',3500,0,500,0,1700,1000,0,900),(2019,'January',3500,0,500,0,1700,300,0,1600),(2019,'February',3500,0,500,0,1200,300,1000,1100),(2019,'March',3500,0,500,0,1700,300,0,1600),(2019,'April',3500,0,500,0,1700,1000,0,900),(2019,'May',3500,0,600,0,1700,300,0,1690),(2019,'June',3500,0,700,0,1700,300,0,1780),(2019,'July',3500,0,700,0,1700,300,1500,280),(2019,'August',3500,0,800,0,1200,300,2000,370),(2019,'September',3700,0,1000,0,1800,300,0,2130),(2019,'October',3700,0,1000,0,1800,300,0,2130),(2019,'November',3700,0,1000,0,1800,300,0,2130),(2019,'December',3700,0,1000,0,1800,1000,0,1430),(2020,'January',3700,0,1000,0,1800,300,0,2130),(2020,'February',3700,0,1000,0,1300,300,1500,1130),(2020,'March',3700,0,1000,100,1800,300,0,2220),(2020,'April',3700,0,1000,100,1800,1000,0,1520),(2020,'May',3700,0,1000,100,1800,300,0,2220),(2020,'June',3700,1000,1000,100,1800,300,0,3120),(2020,'July',3700,1000,1000,100,1800,300,2000,1120),(2020,'August',3900,1000,1200,100,1300,300,2000,1980),(2020,'September',3900,1000,1200,100,2000,300,0,3280),(2020,'October',3900,1000,1200,300,2000,300,0,3460),(2020,'November',3900,1000,1200,300,2000,300,0,3460),(2020,'December',3900,1000,1500,300,2000,1000,0,3030),(2021,'January',3900,1000,1500,300,2000,500,0,3530),(2021,'February',3900,1000,1500,300,1500,500,2000,2030),(2021,'March',3900,1000,1500,300,2000,500,0,3530),(2021,'April',3900,1000,1500,300,2000,1000,0,3030),(2021,'May',3900,1000,1500,500,2000,500,0,3710),(2021,'June',3900,1000,1500,500,2000,500,0,3710),(2021,'July',3900,1000,1500,500,2000,500,2000,1710),(2021,'August',3900,1000,2000,500,1500,500,2500,2160),(2021,'September',4000,1000,2000,500,2500,500,0,3750),(2021,'October',4000,1000,2000,500,2200,500,0,4050),(2021,'November',4000,1000,2000,500,2200,500,0,4050),(2021,'December',4000,1000,2000,700,2200,1000,0,3730),(2022,'January',4000,1500,2000,1000,2200,500,0,4950),(2022,'February',4000,1500,2000,1000,1700,500,3000,2450),(2022,'March',4000,1500,2000,1000,2200,500,0,4950),(2022,'April',4000,1500,2000,1000,2200,1000,0,4450),(2022,'May',4500,1500,2000,1000,2200,500,0,5400),(2022,'June',4500,1500,2000,1000,2200,500,0,5400),(2022,'July',4500,1500,2000,1000,2200,500,2500,2900),(2022,'August',4500,1500,2500,1500,1700,500,2500,4300),(2022,'September',4500,1500,2500,1500,2500,500,0,6000),(2022,'October',4500,1500,2500,1500,2500,500,0,6000),(2022,'November',4500,1500,2500,1500,2500,500,0,6000),(2022,'December',4500,1500,2500,1500,2500,1000,0,5500),(2023,'January',4500,1500,2500,1500,2500,500,0,6000),(2023,'February',4500,1500,2500,1500,2000,500,3500,3000),(2023,'March',4500,1500,2500,1500,2500,500,0,6000),(2023,'April',4500,1500,2500,1500,2500,1000,0,5500),(2023,'May',4500,1500,2500,1500,2500,500,0,6000),(2023,'June',4500,1500,2500,1500,2500,500,0,6000),(2023,'July',4500,1500,2500,1500,2500,500,2500,3500),(2023,'August',4500,1500,2500,1500,2000,500,2500,4000),(2023,'September',5000,2000,3000,2000,3000,500,0,7300);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_name`
--

LOCK TABLES `goals_name` WRITE;
/*!40000 ALTER TABLE `goals_name` DISABLE KEYS */;
INSERT INTO `goals_name` VALUES (1,'Car for Youleek',10000,2017),(2,'Townhouse',60000,2020),(3,'Car for Lex',10000,2020),(4,'Townhouse',20000,2021),(5,'Masha education',20000,2027),(6,'Masha education',20000,2028),(7,'Masha education',20000,2029),(8,'Masha education',20000,2030),(9,'Masha education',20000,2031),(10,'Vera education',20000,2033),(11,'Vera education',20000,2034),(12,'Vera education',20000,2035),(13,'Vera education',20000,2036),(14,'Mash appartments',50000,2036),(15,'Vera education',20000,2037),(16,'Vera appartment',50000,2042);
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
  `carry-out` int(11) NOT NULL,
  `usd_ratio` float NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (2011,'November',1000000,0,0,0,0,0,0,70000,0,0,0,53000,0,0,0,78162,105968,60000,0,0,98132,0,10420,0,0,0,0,0,0,0,0,8,''),(2011,'December',1000000,0,0,0,0,0,0,70000,0,15000,0,0,26300,44975,15560,327244,214809,162000,120344,253550,520217,422738,67600,0,0,0,0,0,0,0,0,8,''),(2012,'January',1000000,0,0,0,0,0,0,70000,0,0,50000,0,0,0,0,281287,54837,92900,8374,0,85831,187800,43100,15000,50578,0,0,0,0,0,0,8,''),(2012,'February',1000000,0,0,0,0,0,0,70000,0,30000,50000,13000,14244,45700,31100,281819,118993,150200,4308,60981,280780,87990,50000,36050,176339,0,0,0,0,0,0,8,''),(2012,'March',1000000,0,0,0,0,0,0,70000,0,15000,50000,13000,0,0,0,253431,251532,134300,1494,41800,127996,935094,0,20300,125300,0,0,0,0,0,0,8,''),(2012,'April',1000000,0,0,0,0,0,0,70000,0,15000,50000,13000,14317,29742,19450,267631,217639,124100,315000,34976,309894,172500,155675,36100,110200,0,0,0,0,0,0,8,''),(2012,'May',1000000,0,0,0,0,0,0,70000,0,15000,50000,0,0,0,0,317858,205033,92000,7000,102652,25680,155970,54000,221954,101370,0,0,0,0,0,0,8,''),(2012,'June',1000000,0,0,0,0,0,0,70000,0,15000,50000,26000,0,7980,23340,326630,156223,108000,0,32600,37136,816126,22200,21069,84765,0,0,0,0,0,0,8,''),(2012,'July',1000000,0,0,0,0,0,0,70000,0,15000,50000,13000,0,0,0,319107,169871,112250,182000,118440,77574,8600,0,21750,118230,0,0,0,0,0,0,8,''),(2012,'August',1039800,0,0,0,160000,0,0,0,0,15000,50000,13000,0,5804,19450,288154,197390,100800,33100,74800,97339,255600,0,90250,28312,0,0,0,0,0,0,8,'Start to track income'),(2012,'September',943300,0,0,0,0,0,0,0,0,15000,50000,13000,0,0,0,291191,154317,127800,49900,166576,32095,0,19722,75920,0,0,0,0,0,0,0,8,''),(2012,'October',993600,0,0,0,0,0,0,0,0,15000,50000,15000,16622,5804,23340,270270,112649,133000,1500,188223,45550,550000,0,161490,14253,0,0,0,0,0,0,8,''),(2012,'November',943300,0,0,0,0,0,0,240000,0,15000,50000,11000,0,0,0,236371,141953,170200,8500,140200,29979,250000,4719,48500,231947,0,0,0,0,0,0,8,''),(2012,'December',247700,1206500,0,0,0,0,0,100000,0,15000,50000,13000,10670,30467,23340,316991,244282,100700,58400,218696,33000,23556,89988,78755,104822,0,0,0,0,0,0,8,''),(2013,'January',71000,1771000,0,0,0,0,0,100000,0,30000,50000,13000,0,0,0,355721,117786,169359,16750,6930,106785,0,189050,61820,144611,0,0,0,0,0,0,8,''),(2013,'February',0,1771700,0,0,0,0,0,100000,0,15000,50000,13000,7852,32643,19450,274997,207097,132100,6880,6900,312725,0,1452,38137,43200,0,0,0,0,0,0,8,''),(2013,'March',0,1774000,0,0,0,0,0,85000,140000,15000,50000,13000,0,0,0,310961,281175,135800,8290,187300,112562,610818,5080,112111,47100,0,0,0,700000,867,0,8,'Start to save money'),(2013,'April',0,1770000,0,0,0,0,0,85000,0,15000,50000,13000,16429,32643,23340,336948,108933,151800,239000,104615,13244,942644,46000,136500,72500,0,0,0,700000,1733,0,8,''),(2013,'May',0,1770000,0,0,0,0,0,85000,0,20000,50000,13000,0,0,0,342786,169254,79700,8000,7000,21191,14150,0,264898,14500,10000,0,0,700000,2600,0,8,'Added study_development field in outcome'),(2013,'June',0,1913300,0,0,0,0,0,85000,0,20000,50000,13000,18402,5804,27230,402822,273756,135195,8788,226790,48278,65840,42857,150998,6000,5500,0,0,500000,2975,0,8,''),(2013,'July',0,2147000,0,0,0,0,0,85000,0,20000,50000,13000,0,0,0,405402,148951,181856,1100,326100,73491,35674,67174,98650,237122,0,0,0,740000,3650,0,8,''),(2013,'August',0,2616400,2865000,0,0,0,0,85000,0,20000,50000,13000,10000,7254,23340,436016,173571,179111,12000,26710,57239,0,48800,118800,12600,5000,0,0,2880000,5356,0,8,''),(2013,'September',0,0,1950700,1350800,0,0,690000,85000,0,0,0,13000,0,0,0,278579,213252,142800,52456,864359,56950,405600,98405,654785,10085,0,0,0,560000,6056,0,8,'Start to track savings'),(2013,'October',0,0,2182500,938000,0,0,0,95000,0,40000,100000,13000,5206,4353,15560,327487,141905,230600,779800,574300,16925,50000,0,331373,34800,0,0,0,740000,7231,0,8,''),(2013,'November',0,0,1957000,1670000,0,0,0,0,0,20000,50000,13000,0,0,0,532774,146386,223700,10426,288086,205449,625000,378800,135967,90500,0,0,0,2000000,9669,0,8,''),(2013,'December',400000,0,1970000,1640000,0,0,0,0,0,40000,100000,26000,10000,15200,35600,399919,228047,229800,37114,117023,117389,467160,21280,408700,361669,0,0,0,1750000,12781,0,8,''),(2014,'January',0,0,4170000,1630000,0,0,0,0,0,0,0,0,0,0,0,312760,45277,212400,18180,0,19951,1291400,0,91460,234469,0,0,0,0,11126,0,8.4,''),(2014,'February',0,0,2140000,910000,0,0,0,0,270000,20000,50000,13000,14561,32643,42175,287976,116919,228100,105080,10394,114411,158200,51100,45700,70000,0,0,0,900000,12008,0,9,''),(2014,'March',0,0,3000000,2250000,0,0,0,0,1950000,40000,100000,26000,0,0,0,362654,198590,37600,0,345500,205405,142000,15500,2500,35000,0,0,0,3400000,12395,0,10.8,''),(2014,'April',0,0,2720000,1850000,0,0,0,0,2500000,0,0,0,0,0,0,408717,175488,35150,0,160700,298543,102100,54800,0,58500,0,0,0,3600000,15311,0,11.4,''),(2014,'May',0,0,3150000,0,0,0,0,0,200000,20000,50000,0,0,0,0,410402,268400,57350,12000,651310,87394,0,14000,29395,108600,0,0,0,1200000,16433,0,11.9,''),(2014,'June',0,0,2830000,610000,0,0,0,0,0,50000,50000,39000,0,0,0,475688,246311,123900,4664,373033,286172,1090900,0,395971,18500,0,0,0,600000,16933,0,11.9,''),(2014,'July',0,0,5780000,4430000,0,0,0,0,0,20000,50000,0,11616,23580,63450,349754,668255,150900,0,265328,179000,1188900,18600,222650,111000,500000,0,0,6600000,19933,0,11.7,''),(2014,'August',0,0,3210000,1520000,0,0,0,0,270000,20000,50000,39000,0,0,0,553256,430111,186350,2000,330050,182439,85000,115420,137321,86200,400000,0,0,2630000,21448,0,13.5,''),(2014,'September',0,0,3350000,1430000,0,0,50000,0,0,40000,110000,0,10000,5445,20070,418916,101122,199900,114800,200118,106754,0,0,46000,36200,0,0,0,5700000,11979,0,14,''),(2014,'October',0,0,3100000,1630000,0,0,200000,0,0,20000,60000,0,0,0,0,360562,58926,296800,1900,196235,228845,0,35640,762619,489400,320000,0,0,560000,11958,0,13,''),(2014,'November',0,0,3760000,1590000,0,0,0,0,0,0,0,0,0,0,0,0,397700,149366,160400,626900,423679,116284,8682,23592,106870,283242,320000,0,600000,12313,0,15.8,''),(2014,'December',0,0,4650000,1590000,0,0,0,120000,100000,20000,60000,39000,11615,38115,56830,475401,716037,454750,533094,971000,82048,2173900,0,136045,412878,387500,0,0,900000,12572,0,18,''),(2015,'January',0,0,4880000,1550000,405000,0,0,0,0,40000,120000,0,0,0,0,575181,188008,319366,7900,13590,357369,40700,0,176500,268952,485000,0,0,975000,12887,0,19.5,''),(2015,'February',0,0,6870000,1290000,0,0,0,0,110000,60000,60000,0,0,0,0,354124,158000,279880,25325,207600,327764,250000,15800,153700,139600,290000,0,0,5280000,14145,0,27.5,''),(2015,'March',0,0,5790000,2010000,0,0,0,0,0,20000,60000,0,21678,87120,46830,557590,616994,446580,968100,81000,144498,0,42900,17000,61350,511000,0,0,2630000,15107,0,23.1,''),(2015,'April',0,0,5630000,1710000,235000,0,0,0,0,20000,60000,40000,0,0,0,467211,162934,379836,470000,407100,1794877,23400,20630,80200,497700,499000,0,0,2725000,17152,0,22.5,''),(2015,'May',0,0,5160000,1400000,1125000,0,0,0,0,0,0,0,0,0,0,142958,190650,0,0,21200,98728,2400000,0,33570,0,0,0,0,4395000,16793,0,20.6,''),(2015,'June',0,0,5430000,1660000,320000,0,0,0,0,40000,120000,0,16958,32480,40836,596912,296562,393374,0,501800,116971,0,0,273120,125550,140000,0,0,2870000,18106,0,21.7,''),(2015,'July',0,0,5510000,800000,50000,0,0,0,0,20000,60000,0,0,0,0,484000,99990,413703,0,4500,1836163,0,0,0,45000,861625,0,0,4650000,20089,0,22,''),(2015,'August',0,0,5530000,2370000,220000,0,0,0,50000,20000,60000,40000,9830,0,29544,523060,432068,227269,34770,174800,207358,0,43500,194000,26400,180600,0,0,4550000,21904,0,22.2,''),(2015,'September',0,0,5410000,1720000,0,20000,50000,0,0,20000,60000,0,0,0,0,297670,339992,427149,119425,465300,31665,1275040,0,198725,165790,695000,0,0,450000,22106,0,21.6,''),(2015,'October',0,0,5650000,1660000,225000,0,0,0,0,20000,60000,0,0,57520,0,632668,317498,327130,3000,285575,105008,1722381,39751,1213058,96800,784600,0,0,3630000,23552,0,22.6,''),(2015,'November',0,0,6000000,1700000,40000,0,0,0,0,0,0,40000,0,0,0,417493,365760,321000,549100,172098,191273,129000,0,272500,246200,885300,0,0,1000000,23921,0,24,''),(2015,'December',0,0,5870000,2740000,0,0,0,0,0,40000,120000,0,37128,0,59088,829985,456501,598121,1320250,214369,104190,93600,91500,511300,1002570,737600,0,0,3500000,25305,0,23.5,''),(2016,'January',0,0,6080000,1390000,245000,0,20000,0,0,20000,60000,0,0,0,0,565719,231842,349726,118300,161000,104399,2900,9000,223700,74895,477400,0,0,3675000,26803,0,24.5,''),(2016,'February',0,0,6730000,1660000,0,0,0,0,0,20000,60000,40000,0,115200,0,271985,82460,304097,81990,70700,111949,0,3450,46000,185900,1029143,0,0,4050000,28322,0,27.2,''),(2016,'March',0,0,6440000,1990000,0,0,0,0,0,20000,60000,0,0,0,0,534168,485099,408674,293800,356000,196216,55600,1900,114005,28415,1098188,0,0,4310000,28483,0,26,''),(2016,'April',0,0,6270000,1770000,420000,0,0,0,120000,0,0,0,30487,180000,44316,558991,526971,311389,1967400,524190,50000,350529,4299,112000,372928,1094778,0,0,4625000,30338,0,25.3,''),(2016,'May',0,0,6210000,1760000,540000,187500,0,0,0,0,160000,0,0,0,0,338003,378905,392823,115500,25000,81680,0,9500,237500,177406,996120,0,0,5278500,32356,0,25.1,''),(2016,'June',0,0,6150000,1890000,500000,10000,109000,0,0,0,0,40000,26513,90000,39100,704391,277881,469893,120950,404800,119885,0,5415,575142,261050,309500,0,0,5891200,32556,0,24.9,''),(2016,'July',0,0,6130000,2110000,0,37000,0,0,0,120000,0,0,0,0,0,629507,574183,353497,2000,25000,456864,136500,299760,226300,262230,765500,0,0,2500000,33442,0,24.8,''),(2016,'August',0,0,6300000,2730000,0,25000,0,0,0,20000,120000,40000,0,0,0,571814,837102,277073,859000,597699,408360,460460,18500,222700,10000,125500,0,0,371300,33419,0,25.5,''),(2016,'September',0,0,6410000,0,0,90000,0,0,0,0,60000,0,0,0,0,433746,105837,257589,352500,216100,677408,0,0,20200,194310,684000,0,0,6740000,34500,0,26,''),(2016,'October',0,0,6340000,0,510000,0,0,0,0,40000,60000,0,0,0,0,743702,303025,419518,115600,440350,417785,517900,0,518260,376900,971500,0,0,3305000,34550,0,25.7,''),(2016,'November',0,0,6310000,0,0,0,0,0,0,0,120000,0,28000,0,76500,336407,83081,361570,257990,866300,1660220,47000,0,0,144900,810000,0,0,0,34550,0,25.6,''),(2016,'December',0,0,6480000,0,210000,0,0,0,0,0,120000,40000,0,0,0,890070,566385,249135,273680,624000,1135722,899036,76783,293300,342400,710200,0,0,3180000,35700,0,26.3,''),(2017,'January',0,0,6710000,0,707500,0,0,0,0,60000,60000,0,48814,195914,47000,537735,138571,434420,127200,9900,287446,433750,15500,31000,254756,840100,0,0,3250000,36200,0,27.3,''),(2017,'February',0,0,6640000,0,0,0,0,0,0,20000,60000,40000,15397,136850,18800,493415,295627,289801,0,96400,479493,382800,114900,153500,69510,779600,0,0,3200000,37200,0,27,''),(2017,'March',0,0,6610000,0,30000,35000,0,0,0,42118,60000,0,9593,125198,17300,658960,569875,329421,840400,605000,693046,193600,142120,107850,30000,1435000,0,0,540000,37000,0,26.9,''),(2017,'April',0,0,7560000,0,435000,0,0,0,4000,42118,60000,0,25296,66039,15800,733470,897722,232838,512200,712100,507611,383900,62950,186400,406800,1440600,0,0,0,37000,3609800,26.8,'Start to track balance'),(2017,'May',0,0,6980000,0,0,0,0,0,0,42118,60000,40000,23200,22961,23300,766933,321402,330997,39000,0,943475,272400,2500,106132,103200,554300,0,0,2650000,37000,5093800,26.3,''),(2017,'June',0,0,7591300,0,50000,0,110000,170000,0,42118,60000,0,14712,41051,23000,932748,407738,296818,122041,529031,76044,181162,18210,207022,156209,410000,0,0,6500000,39500,5986200,26,''),(2017,'July',0,0,6830000,0,0,0,0,1200000,0,42118,60000,30663,15216,26003,0,875989,453708,321035,207800,79840,926563,1379383,137199,417100,217740,58000,0,0,3120000,40500,2932000,25.9,''),(2017,'August',0,0,6710000,0,0,0,0,80000,0,42118,60000,40000,16056,20000,21081,567461,361574,225660,298000,422500,475385,35500,144914,67530,190650,29100,0,0,1785000,40500,2430300,25.5,'');
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
  `invest_amount` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `carry-out` int(11) NOT NULL,
  `usd_ratio` float NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_and_status`
--

LOCK TABLES `income_and_status` WRITE;
/*!40000 ALTER TABLE `income_and_status` DISABLE KEYS */;
INSERT INTO `income_and_status` VALUES ('2017-08-31',0,0,6710000,0,0,0,0,80000,0,1785000,40500,2430300,25.5,'');
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
  `title` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `column_name` varchar(30) NOT NULL,
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
INSERT INTO `outcome` VALUES ('2017-08-01',0,0,0,0,0,0,13376,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-02',0,0,0,0,0,0,2500,0,0,0,0,0,0,0,0,46150,0,0,0),('2017-08-03',0,0,0,0,0,0,62545,30000,0,0,0,0,0,0,0,0,0,0,0),('2017-08-04',0,0,0,0,0,0,64730,1048,7400,0,0,10545,0,0,0,0,0,0,0),('2017-08-05',0,0,0,0,0,0,2500,0,0,0,0,0,0,0,0,0,22900,0,0),('2017-08-06',0,0,0,0,0,0,6933,0,0,0,0,32000,0,0,0,0,0,0,0),('2017-08-07',0,0,0,0,0,0,17070,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-08',0,0,0,0,0,0,18400,44766,2400,44000,0,72000,0,85200,0,0,0,0,0),('2017-08-09',0,0,0,0,0,0,37022,0,0,0,0,287340,35500,0,0,0,0,0,0),('2017-08-10',0,0,0,0,0,0,11455,0,1200,0,0,6400,0,0,0,0,0,0,0),('2017-08-11',0,0,0,0,0,0,9075,0,1200,115000,0,0,0,0,0,0,0,0,0),('2017-08-12',0,0,0,0,0,0,162092,41375,0,0,0,0,0,9674,0,0,0,0,0),('2017-08-13',0,0,0,0,0,0,4065,0,0,0,0,1260,0,0,0,0,0,0,0),('2017-08-14',0,0,0,0,0,0,0,0,2400,0,0,0,0,0,0,10000,0,0,0),('2017-08-15',0,0,0,0,0,0,14609,0,2400,0,0,26245,0,0,13500,0,0,0,0),('2017-08-16',0,0,0,0,0,0,0,30000,0,12000,0,16000,0,0,0,0,0,0,0),('2017-08-17',0,0,0,0,0,0,0,33000,2400,0,0,0,0,0,0,48000,0,0,0),('2017-08-18',0,0,0,0,0,0,11077,0,20000,25000,0,0,0,0,0,67000,0,0,0),('2017-08-19',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-20',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-21',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-22',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-23',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-24',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-25',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('2017-08-26',0,0,0,0,0,0,9000,4585,0,0,0,23595,0,13040,6360,0,0,0,0),('2017-08-27',0,0,0,0,0,0,49406,0,0,0,261000,0,0,37000,6200,0,6200,0,0),('2017-08-28',0,0,0,0,0,0,2500,0,20000,0,55000,0,0,0,6470,0,0,0,0),('2017-08-29',0,0,0,0,0,0,4200,40000,3400,0,0,0,0,0,10000,0,0,0,0),('2017-08-30',0,0,0,0,0,0,46501,106800,20000,0,0,0,0,0,10000,0,0,0,0),('2017-08-31',42118,60000,40000,16056,20000,21081,18405,30000,142860,102000,106500,0,0,0,15000,19500,0,0,0);
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
  `column_name` varchar(30) NOT NULL,
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
-- Table structure for table `outcome_planned`
--

DROP TABLE IF EXISTS `outcome_planned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_planned` (
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
-- Dumping data for table `outcome_planned`
--

LOCK TABLES `outcome_planned` WRITE;
/*!40000 ALTER TABLE `outcome_planned` DISABLE KEYS */;
INSERT INTO `outcome_planned` VALUES ('2017-09-01',17,24,6,10,31,12,265,115,150,75,115,115,75,0,150,0,340,0,0);
/*!40000 ALTER TABLE `outcome_planned` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_in_time`
--

LOCK TABLES `plans_in_time` WRITE;
/*!40000 ALTER TABLE `plans_in_time` DISABLE KEYS */;
INSERT INTO `plans_in_time` VALUES (1,1,'October'),(2,2,'October'),(3,4,'October'),(4,5,'October'),(5,6,'October'),(6,7,'October'),(7,8,'October'),(8,1,'November'),(9,2,'November'),(10,4,'November'),(11,5,'November'),(12,6,'November'),(13,7,'November'),(14,8,'November'),(15,1,'December'),(16,2,'December'),(17,4,'December'),(18,5,'December'),(19,6,'December'),(20,7,'December'),(21,8,'December'),(22,3,'November'),(23,14,'October'),(24,16,'October'),(25,12,'October'),(26,10,'October'),(27,10,'October'),(28,10,'October'),(29,10,'October'),(30,14,'November'),(31,14,'November'),(32,12,'November'),(33,12,'November'),(34,10,'November'),(35,10,'November'),(36,10,'November'),(37,10,'December'),(38,10,'December'),(39,18,'October'),(40,19,'October'),(41,20,'October'),(42,21,'October'),(43,22,'October'),(44,24,'October'),(45,25,'October'),(46,25,'October'),(47,17,'November'),(48,19,'November'),(49,23,'November'),(50,18,'December'),(51,19,'December'),(52,27,'October'),(53,26,'November'),(54,30,'October'),(55,30,'December'),(56,30,'November'),(57,30,'November'),(58,28,'November'),(59,28,'December'),(60,28,'December'),(61,31,'October'),(62,32,'October');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_name`
--

LOCK TABLES `plans_name` WRITE;
/*!40000 ALTER TABLE `plans_name` DISABLE KEYS */;
INSERT INTO `plans_name` VALUES (1,'Коммун.: ОСББ',1,45000),(2,'Коммун.: Гараж',2,60000),(3,'Коммун.: Интернет',3,14000),(4,'Коммун.: Свет',4,20000),(5,'Коммун.: Газ',5,80000),(6,'Коммун.: Вода',6,30000),(7,'Парковка',10,100000),(8,'Школа (Маша)',17,850000),(9,'Юля одежда',11,50000),(10,'Юля одежда',11,100000),(11,'Лёша одежда',11,50000),(12,'Лёша одежда',11,10000),(13,'Маша одежда',11,50000),(14,'Маша одежда',11,100000),(15,'Вера одежда',11,50000),(16,'Вера одежда',11,100000),(17,'Вера вакцинация',12,200000),(18,'Вера массаж',12,150000),(19,'Бассейн',15,150000),(20,'Маша кардиолог',12,100000),(21,'Маша вакцинация',12,20000),(22,'Юля массаж',12,200000),(23,'Юля чистка лица',8,100000),(24,'Туалетная вода',8,100000),(25,'Косметика',8,120000),(26,'Вера крестины',15,700000),(27,'Маша ДР',15,700000),(28,'Новый Год',15,200000),(29,'Дни рождения',15,50000),(30,'Дни рождения',15,100000),(31,'Маша видео',15,250000),(32,'Страховка',10,100000);
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

-- Dump completed on 2017-10-13 10:44:54
