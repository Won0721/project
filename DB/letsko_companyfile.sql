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
-- Table structure for table `companyfile`
--

DROP TABLE IF EXISTS `companyfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyfile` (
  `cf_num` int NOT NULL AUTO_INCREMENT,
  `cf_name` varchar(255) DEFAULT NULL,
  `cf_originalname` varchar(255) DEFAULT NULL,
  `cf_co_num` int NOT NULL,
  PRIMARY KEY (`cf_num`),
  KEY `FKcf_co_num_idx` (`cf_co_num`),
  CONSTRAINT `FKcf_co_num` FOREIGN KEY (`cf_co_num`) REFERENCES `company` (`co_num`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyfile`
--

LOCK TABLES `companyfile` WRITE;
/*!40000 ALTER TABLE `companyfile` DISABLE KEYS */;
INSERT INTO `companyfile` VALUES (119,'/companyFiles/2023/11/22/d8bebf23-0e56-46ed-a35a-efdcebc85d20_금호고속.png','금호고속.png',1),(120,'/companyFiles/2023/11/22/1c8eab46-88a4-4ac7-876a-009787dd3a11_동부고속.png','동부고속.png',92),(121,'/companyFiles/2023/11/22/c270816f-3c7e-42ab-867a-e478e6978cda_동양고속.png','동양고속.png',93),(122,'/companyFiles/2023/11/22/4bb9c7d1-ffba-4b3c-a0cc-9edab53d0433_중앙고속.png','중앙고속.png',94),(123,'/companyFiles/2023/11/22/20c9ac55-540c-480d-86ee-6933e8e8ec20_천일고속.png','천일고속.png',95),(124,'/companyFiles/2023/11/22/01d10eb7-003a-4e16-877b-eb40da5b49e9_삼화고속.png','삼화고속.png',96),(125,'/companyFiles/2023/11/22/7a38c7e2-c8a2-4ae8-9d55-027fee06826e_한일고속.png','한일고속.png',97),(126,'/companyFiles/2023/11/22/ee9a2042-7a78-4f11-b466-b9cc1604b058_속리산고속.png','속리산고속.png',98),(127,'/companyFiles/2023/11/23/39907038-edc3-4e26-a093-d7c30d564f84_금호고속.png','금호고속.png',99);
/*!40000 ALTER TABLE `companyfile` ENABLE KEYS */;
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
