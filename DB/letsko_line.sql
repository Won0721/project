CREATE DATABASE  IF NOT EXISTS `letsko` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `letsko`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: letsko
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `li_num` int NOT NULL AUTO_INCREMENT,
  `li_distance` double DEFAULT NULL,
  `li_travelTime` time DEFAULT NULL,
  `li_use` tinyint(1) DEFAULT NULL,
  `li_te_depTerminalId` varchar(20) NOT NULL,
  `li_te_arrTerminalId` varchar(20) NOT NULL,
  PRIMARY KEY (`li_num`),
  KEY `depFK_idx` (`li_te_depTerminalId`),
  KEY `arrFK_idx` (`li_te_arrTerminalId`),
  CONSTRAINT `arrFK` FOREIGN KEY (`li_te_arrTerminalId`) REFERENCES `terminal` (`te_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depFK` FOREIGN KEY (`li_te_depTerminalId`) REFERENCES `terminal` (`te_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (31,386.6,'04:15:00',1,'동서울','부산'),(32,285.5,'03:30:00',1,'동서울','동대구'),(33,250.9,'02:55:00',1,'동서울','동해'),(34,133,'01:40:00',1,'동서울','청주(고속)'),(35,194.7,'02:30:00',1,'서울경부','상주'),(36,329.9,'04:10:00',1,'동서울','광양'),(37,180.1,'02:30:00',1,'동서울','속초'),(38,353.5,'03:55:00',1,'동서울','창원'),(40,167.4,'02:10:00',1,'동서울','양양'),(41,285.5,'03:30:00',1,'동서울','서대구'),(42,260.8,'03:20:00',1,'동서울','삼척'),(43,125.9,'01:30:00',1,'서울경부','공주'),(44,77.8,'01:10:00',1,'서울경부','안성'),(46,188.3,'02:30:00',1,'서울경부','금산');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 21:04:10
