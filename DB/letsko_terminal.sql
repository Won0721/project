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
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `te_code` varchar(20) NOT NULL,
  `te_ci_num` int NOT NULL,
  PRIMARY KEY (`te_code`),
  KEY `ci_numFK_idx` (`te_ci_num`),
  CONSTRAINT `ci_numFK` FOREIGN KEY (`te_ci_num`) REFERENCES `city` (`ci_num`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES ('동서울',1),('서울경부',1),('센트럴시티(서울)',1),('고양백석',2),('고양화정',2),('광명(KTX역)',2),('광명(철산역)',2),('구리',2),('부천',2),('서수원',2),('성남(분당)',2),('수원',2),('시흥(시화)',2),('신갈시외',2),('신갈영덕',2),('신철원',2),('안산',2),('안성',2),('안성공도',2),('안성대림',2),('안성중대',2),('안성풍림',2),('안성한경',2),('안성회관',2),('안중',2),('안중오거리',2),('여주',2),('여주대',2),('영통',2),('오산',2),('용인',2),('용인신갈',2),('용인유림',2),('운천',2),('의정부',2),('이천',2),('이천마장',2),('이천부발(신하리)',2),('인천',2),('인천공항T2',2),('죽전',2),('철원',2),('평택',2),('평택대',2),('포천',2),('강릉',3),('강원대(삼척)',3),('동해',3),('삼척',3),('속초',3),('양양',3),('영월',3),('원주',3),('원주기업',3),('원주문막',3),('원주혁신',3),('춘천',3),('횡성(휴)상행',3),('횡성(휴)하행',3),('고대조치원',4),('공주',4),('금산',4),('내포',4),('논산',4),('당진',4),('당진기지시',4),('대전도룡',4),('대전복합',4),('대전청사',4),('덕산스파',4),('배방정류소',4),('보령',4),('서산',4),('선문대',4),('세종국무조정실',4),('세종시',4),('세종시청',4),('세종연구단지',4),('세종청사',4),('아산둔포',4),('아산서부',4),('아산온양',4),('아산탕정',4),('아산테크노밸리',4),('안면도',4),('연무대',4),('예산',4),('유성',4),('인삼랜드(휴)상행',4),('인삼랜드(휴)하행',4),('정산',4),('정안(휴)상행',4),('정안(휴)하행',4),('조치원',4),('창기리',4),('천안',4),('천안공단',4),('천안아산역',4),('청양',4),('탕정삼성LCD',4),('태안',4),('홍대조치원',4),('홍성',4),('북청주',5),('상봉',5),('서충주',5),('제천',5),('제천하소',5),('청주(고속)',5),('청주(센트럴)',5),('청주공항',5),('충주',5),('황간',5),('강진',6),('고흥',6),('광양',6),('광주(유·스퀘어)',6),('광주비아',6),('나주',6),('녹동',6),('능주',6),('담양',6),('동광양',6),('목포',6),('무안',6),('문장',6),('벌교',6),('보성',6),('섬진강(휴)상행',6),('섬진강(휴)하행',6),('순천',6),('순천신대지구',6),('신대CGV',6),('여수',6),('여천',6),('영광',6),('영암',6),('옥과',6),('완도',6),('원동',6),('장성',6),('장흥',6),('지도',6),('진도',6),('함평',6),('해남',6),('해제',6),('화순',6),('고창',7),('군산',7),('김제',7),('남원',7),('애통리',7),('익산',7),('익산팔봉',7),('자치인재원',7),('전북혁신',7),('전주고속터미널',7),('전주호남제일문',7),('정읍',7),('태인',7),('흥덕',7),('김해',8),('김해장유',8),('마산',8),('마산내서',8),('부산',8),('서부산(사상)',8),('울산',8),('울산신복',8),('진주',8),('진주개양',8),('진주혁신',8),('진해',8),('창원',8),('창원역',8),('통영',8),('경북도청',9),('경주',9),('구미',9),('낙동강(휴)상행',9),('낙동강(휴)하행',9),('대구용계',9),('동대구',9),('상주',9),('서대구',9),('선산(휴)상행',9),('선산(휴)하행',9),('안동',9),('영덕',9),('영주',9),('영천',9),('영천망정동',9),('예천',9),('점촌',9),('포항',9),('포항시청',9),('풍기',9);
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
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
