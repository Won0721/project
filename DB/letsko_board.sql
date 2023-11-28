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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bo_num` int NOT NULL AUTO_INCREMENT,
  `bo_title` varchar(50) NOT NULL,
  `bo_contents` longtext NOT NULL,
  `bo_views` int NOT NULL DEFAULT '0',
  `bo_regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bo_modDate` datetime DEFAULT NULL,
  `bo_me_id` varchar(40) NOT NULL,
  PRIMARY KEY (`bo_num`),
  KEY `FK_member_TO_board_1_idx` (`bo_me_id`),
  CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (`bo_me_id`) REFERENCES `member` (`me_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (15,'개인정보 처리방침 약관 개정 안내','개인정보 처리방침 약관 개정 안내\r\n\r\n\r\n안녕하세요.\r\n\r\n고속버스 개인정보 처리방침 관련하여 수집항목 추가 및 이용목적 추가 등 개정 관련하여 사전 안내를 드립니다.\r\n\r\n\r\n\r\n<수정 전>\r\n\r\n5. 개인정보 처리 위탁\r\n\r\n조합은 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부 전문업체에 위탁하여 운영하고 있으며, 관계 법령에 따라 위탁 계약 시 개인정보가 안전하게 관리 될 수 있도록 필요한 사항을 규정하고 있습니다. 조합의 개인정보 처리 위탁 기관 및 위탁 업무 내용은 아래와 같습니다.\r\n\r\n\r\n수탁업체\r\n\r\n위탁 업무 내용\r\n\r\n정보의 보유 및 이용 기간\r\n\r\n㈜티머니\r\n\r\n매표 발권 시스템 운영 관리, 홈페이지 및 모바일앱 운영 관리, 고객센터 운영 대행\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜티머니씨에스피\r\n\r\n상담업무 효율성 제고를 위한 고객센터 운영대행\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜아시아나IDT\r\n\r\n모바일앱 운영관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜LGCNS\r\n\r\n시스템 인프라 운영관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜팀넷코리아\r\n\r\n경품 이벤트 물품 발송 및 발송을 위한 정보관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜젤라블루\r\n\r\n경품 이벤트 물품 발송 및 발송을 위한 정보관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜동양고속\r\n\r\n고속버스 정기권 이벤트 경품 이벤트 물품 발송 및 발송을 위한 정보관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n 상기의 경우 이외에 조합은 이용자의 동의 없이 이용자의 개인정보 취급을 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 이용자에게 통지하고 사전 동의를 받도록 하겠습니다.\r\n\r\n \r\n\r\n시행일자 : 2020년 9월 23일\r\n\r\n \r\n\r\n \r\n \r\n\r\n<수정 후>\r\n\r\n\r\n5. 개인정보 처리 위탁\r\n\r\n조합은 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부 전문업체에 위탁하여 운영하고 있으며, 관계 법령에 따라 위탁 계약 시 개인정보가 안전하게 관리 될 수 있도록 필요한 사항을 규정하고 있습니다. 조합의 개인정보 처리 위탁 기관 및 위탁 업무 내용은 아래와 같습니다.\r\n\r\n수탁업체\r\n\r\n위탁 업무 내용\r\n\r\n정보의 보유 및 이용 기간\r\n\r\n㈜티머니\r\n\r\n매표 발권 시스템 운영 관리, 홈페이지 및 모바일앱 운영 관리, 고객센터 운영 대행\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜티머니씨에스피\r\n\r\n상담업무 효율성 제고를 위한 고객센터 운영대행\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜아시아나IDT\r\n\r\n모바일앱 운영관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜LGCNS\r\n\r\n시스템 인프라 운영관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜에이텍티앤\r\n\r\n매표 발권 시스템 운영 관리, 홈페이지 및 모바일앱 운영 관리, 고객센터 운영 대행\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n㈜쿠프마케팅, ㈜옴니텔, ㈜플랜피아\r\n\r\n경품 이벤트 물품 발송 및 발송을 위한 정보관리\r\n\r\n위탁 계약 종료 시 까지\r\n\r\n 상기의 경우 이외에 조합은 이용자의 동의 없이 이용자의 개인정보 취급을 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 이용자에게 통지하고 사전 동의를 받도록 하겠습니다.\r\n\r\n \r\n\r\n시행일자 : 2020년 12월 14일',2,'2023-11-21 14:02:59','2023-11-21 14:04:58','admin'),(16,'고객센터 점심시간 운영 안내',' \r\n\r\n안녕하십니까. 티머니 입니다.\r\n항상 저희 티머니를 이용해주시는 고객님께 깊은 감사를 드립니다.\r\n\r\n2019년 9월 1일부터 고객센터 점심시간이 다음과 같이 운영되어 안내드리오니 이용에 참고하여 주시기 바랍니다. \r\n\r\n■ 고객센터 점심시간 운영 안내\r\n\r\n○ 점심시간 : 12시~13시\r\n○ 상담 제한 안내\r\n- 점심시간에는 ARS 안내, 문자서비스, 장애 상담만 가능합니다.\r\n- 일반 상담 업무는 제한되며, 13시 이후부터 모든 상담이 가능합니다.\r\n\r\n앞으로 더 좋은 상담 품질 서비스가 제공될 수 있도록 노력하겠습니다.\r\n\r\n감사합니다.',0,'2023-11-21 14:03:33','2023-11-21 14:08:33','admin'),(17,'고속버스 마일리지 소멸 유효기간 안내','\r\n2017. 11. 25부터 시행된 프리미엄 고속버스 마일리지는\r\n적립일로부터 2년이 경과(2019. 11. 24부터)될 경우 이용한 해당 회사의 마일리지는 자동 소멸됩니다.\r\n\r\n\r\n\r\n- 마일리지 유효기간 확인방법 -\r\n\"마이페이지 > 마일리지 조회\" 메뉴에서 마일리지 내역을 확인\r\n \r\n',0,'2023-11-21 14:09:35',NULL,'admin'),(18,'고속버스 이용자 만족도 조사','\r\n고속버스 이용자 만족도 조사\r\n \r\n본 설문조사는 대중교통 이용자분들을 대상으로 고객만족도를 파악하여\r\n대중교통의 서비스 개선 및 안전성 확보를 유도하기 위해 시행하고 있습니다.\r\n소중한 의견을 들려주신 분들께 추첨을 통해 푸짐한 경품을 드리니 많은 참여 부탁드립니다.\r\n\r\n \r\n조사 기간 - 2020. 9.21~10.23\r\n* 참여자가 많은 경우 조기에 마감될 수 있습니다.\r\n \r\n당첨자 발표 – 한국교통안전공단 국가대중교통 DB홈페이지 공지 및 개별통보\r\n                   2020년 12월 28일(월) (https://www.kosta.or.kr/ptc)\r\n\r\n경품\r\n- 갤럭시 버즈 라이브 20명\r\n- 정관장 홍삼원 50명\r\n- 스타벅스 아이스아메리카노 기프티콘 250명\r\n \r\n* 배송이 필요한 경품의 경우 배송지 확인을 위해 사전에 연락을 드리며,\r\n연락이 되지 않으실 경우 당첨이 취소될 수 있습니다.\r\n* 휴대폰 번호를 잘못 적으실 경우 기프티콘을 받지 못하실 수 있습니다.\r\n \r\n참여 방법\r\n- 아래 링크에 접속하여 설문조사 참여\r\nhttps://neorns.surveybox.kr/?pid=S12068vriqar&ptype=1&fwid=12&grpid=rdn',2,'2023-11-21 14:10:09',NULL,'admin'),(19,'고속버스 운행안내',' \r\n\r\n [고속버스 운행안내]\r\n\r\n \r\n\r\n \r\n\r\n코로나19와 관련하여 현재 고속버스 이용고객과 공급좌석간에 큰 차이가 있어 한시적으로 일부노선의 감회운행을 시행하여 불가피하게 결행이 발생할 수 있음을 알려드리며, 예매하신 승차권에 대하여 출발전 해당차량의 운행정보를 확인하여 주시기 바랍니다.',1,'2023-11-21 14:13:22',NULL,'admin'),(20,'노쇼방지를 위한 동일카드 예매 횟수 변경 안내','[노쇼 방지를 위한 동일 카드 예매 횟수 변경 안내]\r\n\r\n○ 적용일 : 2019년 8월 17일부터~\r\n\r\n○ 대상 : KOBUS 홈페이지, 고속버스 티머니 APP 예매 (터미널 매표소 발권 시는 제외)\r\n\r\n○ 변경 내용 :\r\n- 홈페이지, 모바일 APP 예매 시 출발일 기준 동일 카드로 4회 초과 예매 제한. (1회 - 최대 6장 예매 가능) \r\n- 홈페이지, 모바일 APP 예매 시 동일 출발일 터미널 매표소 발권 횟수 포함하여 4회 초과 제한.\r\n  (단, 터미널 매표소 발권 시에는 홈페이지, 모바일 APP 예매 횟수 상관없이 발권 가능)',0,'2023-11-21 14:14:24',NULL,'admin'),(21,'고속버스 음식물 반입 자제 안내','항상 고속버스를\r\n\r\n이용해 주시는 고객님께 감사드립니다.\r\n\r\n\r\n\r\n고속버스 승차시\r\n\r\n과도한 냄새가 나는 음식물 반입을 자제하시어\r\n\r\n차량내 쾌적한 환경을 유지할 수 있도록\r\n\r\n협조하여 주시기 바랍니다.\r\n',1,'2023-11-21 14:15:48',NULL,'admin'),(22,'고양 화정터미널 매표소 이용중단 안내','고양 화정터미널 운영상의 문제로 부득이하게 터미널에 매표소의 승차권 발권이\r\n아래와 같이 중단되오니 이용에 착오 없으시기 바랍니다.\r\n \r\n○ 고양 화정터미널 매표소 승차권 발권 중단일 : 2018년 6월 1일(금) \r\n\r\n\r\n○ 고속버스 이용방법(승차권 예매 또는 해당차량 단말기 결제) \r\n\r\n① 고속버스 통합홈페이지 승차권 예매(www.kobus.co.kr)\r\n ※ 홈티켓 출력 또는 예매카드로 승차가능(차량내 단말기 태그)\r\n② 고속버스 모바일 앱 승차권 예매(모바일)\r\n③ 차량내 단말기 카드결제 후 승차(해당차량내에 빈 좌석이 있을 경우)\r\n\r\n ',0,'2023-11-21 14:16:26',NULL,'admin'),(23,'센트럴시티~영광 운행시간 조정 안내','2018.6.1(금)부터 센트럴시티~영광 노선의 운행시간이 일부 조정되오니\r\n이용에 참고 부탁드립니다.\r\n\r\n\r\n○ 운행노선 : 센트럴시티~영광\r\n\r\n○ 운행업체 : 금호고속, 중앙고속, 천일고속\r\n\r\n○ 조정내용 : 일부 배차시간 조정\r\n\r\n○ 조정일자 : 2018.6.1(금)부터',0,'2023-11-21 14:17:07',NULL,'admin'),(24,'인천-안산(중간정차)-익산 경유 안내','\r\n2018.5.14(월)부로 인천-익산, 안산-익산 노선이 통합되어\r\n운행 시 인천-안산-익산으로 경유함을 알려드립니다.\r\n이용에 참고 부탁드립니다.\r\n\r\n\r\n○ 대상노선 : 인천-익산, 인천-팔봉, 안산-익산, 안산-팔봉, 인천-정안\r\n\r\n○ 조정내용 : 일부 노선 소요시간 변경\r\n* 인천-정안 : 1시간 45분(인천-익산차량에 한함)\r\n* 인천-익산(팔봉) : 3시간 20분 \r\n\r\n○ 조정일자 : 2018.5.14(월)부터',0,'2023-11-21 14:17:25',NULL,'admin'),(25,'광주-인천공항 프리미엄 운행 안내','2023.11.21(화)부터 광주-인천공항 노선에\r\n프리미엄 버스를 운행하오니 고객 여러분의 많은 이용 부탁드립니다.\r\n\r\n○ 운행노선 : 광주-인천공항 \r\n\r\n○ 운행업체 : 금호고속\r\n\r\n○ 조정일자 : 2023.11.21(화)부터',0,'2023-11-21 14:17:44','2023-11-21 14:20:27','admin'),(26,'첨부파일','안녕하세요. LetsKo 입니다. ',0,'2023-11-23 14:05:46','2023-11-23 20:41:15','admin');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
