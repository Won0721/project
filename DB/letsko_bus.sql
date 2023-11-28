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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `bus_num` int NOT NULL AUTO_INCREMENT,
  `bus_carNumber` varchar(10) DEFAULT NULL,
  `bus_totalSeat` int DEFAULT NULL,
  `bus_co_num` int NOT NULL,
  `bus_seatGrade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bus_num`),
  KEY `FKbus_co_num_idx` (`bus_co_num`),
  CONSTRAINT `FKbus_co_num` FOREIGN KEY (`bus_co_num`) REFERENCES `company` (`co_num`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (42,'01금호7894',41,1,'일반'),(43,'02금호4887',28,1,'우등'),(44,'03금호1113',21,1,'프리미엄'),(45,'01동부1453',41,92,'일반'),(46,'02동부9862',28,92,'우등'),(47,'03동부4538',21,92,'프리미엄'),(48,'01동양7842',41,93,'일반'),(49,'02동양3245',28,93,'우등'),(50,'03동양8512',21,93,'프리미엄'),(51,'01중앙1257',41,94,'일반'),(52,'02중앙3242',28,94,'우등'),(53,'03중앙4532',21,94,'프리미엄'),(54,'01천일2348',41,95,'일반'),(55,'02천일4821',28,95,'우등'),(56,'03천일5623',21,95,'프리미엄'),(57,'01삼화3326',41,96,'일반'),(58,'02삼화9831',28,96,'우등'),(59,'03삼화7123',21,96,'프리미엄'),(60,'01한일5496',41,97,'일반'),(61,'02한일6234',28,97,'우등'),(62,'03한일8643',21,97,'프리미엄'),(63,'01속리5638',41,98,'일반'),(64,'02속리7413',28,98,'우등'),(65,'03속리5831',21,98,'프리미엄');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
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
