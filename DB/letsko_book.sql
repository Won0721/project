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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `bk_num` int NOT NULL AUTO_INCREMENT,
  `bk_dr_num` int NOT NULL,
  `bk_me_id` varchar(40) NOT NULL,
  `bk_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '예매일자 ',
  `bk_adult` int DEFAULT '0' COMMENT '성인',
  `bk_teen` int DEFAULT '0' COMMENT '청소년',
  `bk_totalPeople` int NOT NULL COMMENT '총인원수',
  `bk_fee` int NOT NULL COMMENT '사용금액 / 회원이 실제 지불한 금액 ',
  `bk_usePoint` int DEFAULT '0' COMMENT '사용 마일리지',
  `bk_totalPrice` int NOT NULL COMMENT '총금액 = 사용금액 + 사용마일리지',
  `bk_cancellationStatus` int DEFAULT '0' COMMENT '취소유무 \n0=취소X 1=취소',
  `bk_payNum` int DEFAULT NULL,
  `bk_reservedSeatNum` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bk_num`),
  KEY `dr_numFK_idx` (`bk_dr_num`),
  KEY `me_idFK_idx` (`bk_me_id`),
  CONSTRAINT `dr_numFK` FOREIGN KEY (`bk_dr_num`) REFERENCES `drive` (`dr_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `me_idFK` FOREIGN KEY (`bk_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (164,41,'admin','2023-11-23 12:37:20',1,1,2,64800,1000,63800,1,65782572,'1,2'),(165,38,'admin','2023-11-23 12:42:03',0,2,2,60800,5000,55800,0,43947168,'15,16'),(166,42,'admin','2023-11-23 15:32:43',1,0,1,43200,1000,42200,0,91735338,'1'),(167,44,'admin','2023-11-23 21:00:32',1,1,2,166320,10000,156320,0,0,'1,2');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 21:04:11
