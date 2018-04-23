-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: bitbizzar
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `BankInfo`
--

DROP TABLE IF EXISTS `BankInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BankInfo` (
  `User_ID` int(11) NOT NULL,
  `bankName` varchar(50) NOT NULL,
  `accountNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankInfo`
--

LOCK TABLES `BankInfo` WRITE;
/*!40000 ALTER TABLE `BankInfo` DISABLE KEYS */;
INSERT INTO `BankInfo` VALUES (2,'wellsfargo',324342),(2,'bankofchina',565455),(3,'hulkbank',54654655);
/*!40000 ALTER TABLE `BankInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Email_Admins`
--

DROP TABLE IF EXISTS `Email_Admins`;
/*!50001 DROP VIEW IF EXISTS `Email_Admins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Email_Admins` AS SELECT 
 1 AS `User_Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ExOrder`
--

DROP TABLE IF EXISTS `ExOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExOrder` (
  `User_ID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `toAddress` int(50) NOT NULL,
  `fromAddress` int(11) NOT NULL,
  `OrderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderAmount` int(11) NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExOrder`
--

LOCK TABLES `ExOrder` WRITE;
/*!40000 ALTER TABLE `ExOrder` DISABLE KEYS */;
INSERT INTO `ExOrder` VALUES (25,1,19,20,'2018-04-21 02:10:38',100),(26,2,21,22,'2018-04-22 03:38:58',100);
/*!40000 ALTER TABLE `ExOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Futures`
--

DROP TABLE IF EXISTS `Futures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Futures` (
  `orderID` int(11) NOT NULL,
  `margin` varchar(50) NOT NULL,
  `endDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Futures`
--

LOCK TABLES `Futures` WRITE;
/*!40000 ALTER TABLE `Futures` DISABLE KEYS */;
/*!40000 ALTER TABLE `Futures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLimit`
--

DROP TABLE IF EXISTS `OrderLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLimit` (
  `orderID` int(11) NOT NULL,
  `pricePoint` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLimit`
--

LOCK TABLES `OrderLimit` WRITE;
/*!40000 ALTER TABLE `OrderLimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `prodID` int(11) NOT NULL AUTO_INCREMENT,
  `prodName` varchar(50) NOT NULL,
  `prodValue` int(11) NOT NULL,
  PRIMARY KEY (`prodID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'garlic coin',423),(3,'bitCoin',3500),(4,'iota',560),(6,'testcoin2',4965);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PutOption`
--

DROP TABLE IF EXISTS `PutOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PutOption` (
  `orderID` int(11) NOT NULL,
  `putPrice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PutOption`
--

LOCK TABLES `PutOption` WRITE;
/*!40000 ALTER TABLE `PutOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `PutOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeInForce`
--

DROP TABLE IF EXISTS `TimeInForce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeInForce` (
  `orderID` int(11) NOT NULL,
  `endDate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeInForce`
--

LOCK TABLES `TimeInForce` WRITE;
/*!40000 ALTER TABLE `TimeInForce` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeInForce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(50) NOT NULL,
  `User_SSN` int(11) NOT NULL,
  `User_Email` varchar(50) NOT NULL,
  `User_Phone` varchar(20) NOT NULL,
  `Admin` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'bitBizzar',0,'bitBizzar@hotmail.com','3864889816',1,'root'),(2,'batman',123345678,'batman@hotmail.com','3864889817',0,'batman'),(3,'robbin',87654321,'robin@hotmail.com','38648898168',0,'batman'),(4,'joker',87654321,'rjokinn@hotmail.com','38648898168',0,'batman'),(5,'superman',87654321,'dfdsuper@hotmail.com','38648898168',0,'batman'),(6,'killercroc',87654321,'dfdsuper@hotmail.com','38648898168',0,'batman'),(7,'pimpdaddy',85555555,'dontcallmepapasmurf@dapimp.com','4654654',0,'pimpdaddy'),(8,'quicksilver',468546,'5minutemile@speedy.com','54654',0,'iamfast'),(9,'thirdtimesacharm',546546,'igotthis@happythoughts.happy','45646',0,'pleasework'),(10,'darknessmyoldfriend',45646,'ivecometo@talkwithyou.again','5465',0,'silence'),(11,'tyr',46546,'try@try','65465',0,'whytry'),(12,'homer',11111111,'homer@doh.com','8023239994',0,'doh'),(13,'fdasf',11111111,'homer@doh.com','8023239994',0,'doh'),(14,'afdsfas',1,'dfa@dfas','1',0,'1'),(15,'lets',65465,'doh@doh','54654',0,'now'),(16,'fadsf',1313,'asdf@adfa','313',0,'1123'),(17,'hi',34802394,'hi@hi','834098',0,'344'),(18,'try',43534,'try@try','5435',0,'now'),(19,'try@try',890,'try@tryplease','890',0,'work'),(20,'hi',80,'hi@hi','890',0,'please'),(21,'success',708,'success@ididit.com','708',0,'Udontknowme'),(22,'Dora',8098,'DoradaExplora@wedidit.edu','90809',0,'swiper'),(23,'Igotchu',9809,'bazinga@looney.com','80980',0,'now'),(24,'tester',809,'tester@tester.net','9809',0,'root'),(25,'jarod',342820,'jarod.jarod@jarod','98098',0,'jarod'),(26,'jarodfinal',89080,'jarod.m.hickman@byu.edu','89098',0,'root');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wallet`
--

DROP TABLE IF EXISTS `Wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wallet` (
  `User_ID` int(11) NOT NULL,
  `walAddress` int(11) NOT NULL AUTO_INCREMENT,
  `walAmount` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  PRIMARY KEY (`walAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wallet`
--

LOCK TABLES `Wallet` WRITE;
/*!40000 ALTER TABLE `Wallet` DISABLE KEYS */;
INSERT INTO `Wallet` VALUES (2,1,150,1),(1,2,0,1),(1,3,0,1),(1,4,0,1),(1,5,0,1),(1,6,0,1),(1,7,0,1),(1,8,0,1),(1,9,0,1),(1,10,0,1),(1,11,0,1),(1,12,0,1),(1,13,0,1),(1,14,0,1),(25,15,0,1),(25,16,0,1),(25,17,0,1),(25,18,0,3),(25,19,600,1),(25,20,400,3),(26,21,600,1),(26,22,400,3);
/*!40000 ALTER TABLE `Wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Email_Admins`
--

/*!50001 DROP VIEW IF EXISTS `Email_Admins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Email_Admins` AS select `User`.`User_Email` AS `User_Email` from `User` where (`User`.`Admin` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-22 15:56:28
