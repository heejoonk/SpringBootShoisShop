-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `adminid` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('admin','admin','관리자','010-7777-7777'),('scott','tiger','홍길동','010-6400-6068');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `best_pro_view`
--

DROP TABLE IF EXISTS `best_pro_view`;
/*!50001 DROP VIEW IF EXISTS `best_pro_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `best_pro_view` AS SELECT 
 1 AS `pseq`,
 1 AS `name`,
 1 AS `price2`,
 1 AS `image`,
 1 AS `savefilename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `pseq` int NOT NULL,
  `quantity` int NOT NULL,
  `indate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cseq`),
  KEY `fk1_idx` (`userid`),
  KEY `fk2_idx` (`pseq`),
  CONSTRAINT `fk1` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`pseq`) REFERENCES `product` (`pseq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'one',2,1,'2024-11-21 17:56:09'),(2,'two',3,1,'2024-11-21 17:56:15'),(4,'scott',37,1,'2024-11-22 16:20:53'),(5,'scott',40,1,'2024-11-22 16:21:16'),(7,'scott',2,1,'2024-11-22 16:34:09'),(8,'scott',20,1,'2024-11-22 16:34:16');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_view`
--

DROP TABLE IF EXISTS `cart_view`;
/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_view` AS SELECT 
 1 AS `cseq`,
 1 AS `userid`,
 1 AS `mname`,
 1 AS `pseq`,
 1 AS `pname`,
 1 AS `quantity`,
 1 AS `price2`,
 1 AS `indate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `userid` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `zip_num` varchar(45) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  `provider` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('2794053001',NULL,'강희준',NULL,'heejoon73@daum.net',NULL,NULL,NULL,NULL,'2024-11-22 12:08:40','kakao'),('one','1111','김나리','017-777-7777','acc@abc.com','133-110','서울시 성동구 성수동로 32','1번지21호',NULL,'2024-11-21 17:47:41','1'),('scott','1234','김하나','010-7777-5555','scott@abc.com','03163','서울 종로구 인사동길 12','대일빌딩 701호',' (인사동)','2024-11-22 15:11:57','1'),('two','2222','김길동','011-123-4567','acc@abc.com','130-120','서울시 송파구 잠실로 121','리센츠아파트 201-505',NULL,'2024-11-21 17:46:56','1');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_pro_view`
--

DROP TABLE IF EXISTS `new_pro_view`;
/*!50001 DROP VIEW IF EXISTS `new_pro_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_pro_view` AS SELECT 
 1 AS `pseq`,
 1 AS `name`,
 1 AS `price2`,
 1 AS `image`,
 1 AS `savefilename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `odseq` int NOT NULL AUTO_INCREMENT,
  `oseq` int NOT NULL,
  `pseq` int NOT NULL,
  `quantity` int NOT NULL,
  `result` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`odseq`),
  KEY `fk4_idx` (`oseq`),
  KEY `fk5_idx` (`pseq`),
  CONSTRAINT `fk4` FOREIGN KEY (`oseq`) REFERENCES `orders` (`oseq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk5` FOREIGN KEY (`pseq`) REFERENCES `product` (`pseq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,2,1,1),(2,1,3,2,1),(3,2,4,3,1),(4,2,5,2,1),(5,3,3,1,1),(6,3,2,1,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_view` AS SELECT 
 1 AS `odseq`,
 1 AS `oseq`,
 1 AS `indate`,
 1 AS `userid`,
 1 AS `mname`,
 1 AS `zip_num`,
 1 AS `address1`,
 1 AS `address2`,
 1 AS `address3`,
 1 AS `phone`,
 1 AS `pseq`,
 1 AS `price2`,
 1 AS `quantity`,
 1 AS `result`,
 1 AS `pname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `oseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  `zip_num` varchar(30) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oseq`),
  KEY `fk3_idx` (`userid`),
  CONSTRAINT `fk3` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'one','2024-11-21 17:59:13','100-100','서울시 종로구 관철동길 12','아무개빌딩','(관철동)'),(2,'two','2024-11-21 18:00:23','200-200','서울시 관악구 신림로 100','XX빌라 200호','(신림동)'),(3,'one','2024-11-21 18:00:52','100-100','서울시 종로구 관철동길 12','아무개빌딩','(관철동)');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pseq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `price1` int DEFAULT NULL,
  `price2` int DEFAULT NULL,
  `price3` int DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `savefilename` varchar(255) DEFAULT NULL,
  `useyn` varchar(3) DEFAULT 'Y',
  `bestyn` varchar(3) DEFAULT 'N',
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pseq`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'크로그다일부츠',2,40000,50000,10000,'오리지날 크로그다일부츠 입니다.','w2.jpg','w2.jpg','Y','Y ','2024-11-21 17:51:56'),(2,'롱부츠',2,40000,50000,10000,'따뜻한 롱부츠 입니다.','w-28.jpg','w-28.jpg','Y','N','2024-11-21 17:52:00'),(3,'힐',1,10000,12000,2000,'여성용전용 힐','w-14.jpg','w-14.jpg','Y','N','2024-11-21 17:52:02'),(4,'회색힐',1,10000,12000,2000,'여성용전용 힐','w-23.jpg','w-23.jpg','Y','Y','2024-11-21 17:52:05'),(5,'여성부츠',2,12000,18000,6000,'여성용 부츠','w4.jpg','w4.jpg','Y','N','2024-11-21 17:52:12'),(6,'핑크샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-24.jpg','w-24.jpg','Y','Y','2024-11-21 17:52:16'),(7,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w11.jpg','w11.jpg','Y','Y','2024-11-21 17:52:19'),(8,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-13.jpg','w-13.jpg','Y','N','2024-11-21 17:52:22'),(9,'샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-09.jpg','w-09.jpg','Y','N','2024-11-21 17:52:25'),(10,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-05.jpg','w-05.jpg','Y','Y','2024-11-21 17:52:28'),(11,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-05.jpg','w-05.jpg','Y','N','2024-11-21 17:52:31'),(12,'크로그다일부츠',2,40000,50000,10000,'오리지날 크로그다일부츠 입니다.','w2.jpg','w2.jpg','Y','N','2024-11-22 15:49:44'),(13,'롱부츠',2,40000,50000,10000,'따뜻한 롱부츠 입니다.','w-28.jpg','w-28.jpg','Y','N','2024-11-22 15:49:44'),(14,'힐',1,10000,12000,2000,'여성용전용 힐','w-14.jpg','w-14.jpg','Y','N','2024-11-22 15:49:45'),(15,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w-25.jpg','w-25.jpg','Y','Y','2024-11-22 15:49:45'),(16,'회색힐',1,10000,12000,2000,'여성용전용 힐','w-23.jpg','w-23.jpg','Y','Y','2024-11-22 15:49:45'),(17,'여성부츠',2,12000,18000,6000,'여성용 부츠','w4.jpg','w4.jpg','Y','N','2024-11-22 15:49:45'),(18,'핑크샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-24.jpg','w-24.jpg','Y','Y','2024-11-22 15:49:45'),(19,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w11.jpg','w11.jpg','Y','Y','2024-11-22 15:49:45'),(20,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-13.jpg','w-13.jpg','Y','N','2024-11-22 15:49:45'),(21,'샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-09.jpg','w-09.jpg','Y','N','2024-11-22 15:49:45'),(22,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-05.jpg','w-05.jpg','Y','N','2024-11-22 15:49:45'),(23,'크로그다일부츠',2,40000,50000,10000,'오리지날 크로그다일부츠 입니다.','w2.jpg','w2.jpg','Y','N','2024-11-22 15:49:53'),(24,'롱부츠',2,40000,50000,10000,'따뜻한 롱부츠 입니다.','w-28.jpg','w-28.jpg','Y','N','2024-11-22 15:49:53'),(25,'힐',1,10000,12000,2000,'여성용전용 힐','w-14.jpg','w-14.jpg','Y','N','2024-11-22 15:49:53'),(26,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w-25.jpg','w-25.jpg','Y','Y','2024-11-22 15:49:53'),(27,'회색힐',1,10000,12000,2000,'여성용전용 힐','w-23.jpg','w-23.jpg','Y','Y','2024-11-22 15:49:53'),(28,'여성부츠',2,12000,18000,6000,'여성용 부츠','w4.jpg','w4.jpg','Y','N','2024-11-22 15:49:53'),(29,'핑크샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-24.jpg','w-24.jpg','Y','Y','2024-11-22 15:49:53'),(30,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w11.jpg','w11.jpg','Y','Y','2024-11-22 15:49:53'),(31,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-13.jpg','w-13.jpg','Y','N','2024-11-22 15:49:53'),(32,'샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-09.jpg','w-09.jpg','Y','N','2024-11-22 15:49:53'),(33,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-05.jpg','w-05.jpg','Y','N','2024-11-22 15:49:53'),(34,'크로그다일부츠',2,40000,50000,10000,'오리지날 크로그다일부츠 입니다.','w2.jpg','w2.jpg','Y','N','2024-11-22 15:49:57'),(35,'롱부츠',2,40000,50000,10000,'따뜻한 롱부츠 입니다.','w-28.jpg','w-28.jpg','Y','N','2024-11-22 15:49:57'),(36,'힐',1,10000,12000,2000,'여성용전용 힐','w-14.jpg','w-14.jpg','Y','N','2024-11-22 15:49:57'),(37,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w-25.jpg','w-25.jpg','Y','Y','2024-11-22 15:49:57'),(38,'회색힐',1,10000,12000,2000,'여성용전용 힐','w-23.jpg','w-23.jpg','Y','Y','2024-11-22 15:49:57'),(39,'여성부츠',2,12000,18000,6000,'여성용 부츠','w4.jpg','w4.jpg','Y','N','2024-11-22 15:49:57'),(40,'핑크샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-24.jpg','w-24.jpg','Y','Y','2024-11-22 15:49:57'),(41,'슬리퍼',5,5000,5500,500,'편안한 슬리퍼입니다.','w11.jpg','w11.jpg','Y','Y','2024-11-22 15:49:57'),(42,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-13.jpg','w-13.jpg','Y','N','2024-11-22 15:49:57'),(43,'샌달',3,5000,5500,500,'사계절용 샌달입니다.','w-09.jpg','w-09.jpg','Y','N','2024-11-22 15:49:57'),(44,'스니커즈',4,15000,20000,5000,'활동성이 좋은 스니커즈입니다.','w-05.jpg','w-05.jpg','Y','N','2024-11-22 15:49:57');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `reply` varchar(1000) DEFAULT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  `secret` varchar(3) DEFAULT 'N',
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`qseq`),
  KEY `fk6_idx` (`userid`),
  CONSTRAINT `fk6` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'one','배송관련 문의입니다','현재 배송상태와 예상 배송일을 답변 부탁합니다',NULL,'2024-11-21 18:06:19','N',''),(2,'two','환불관련','환불절차 안내부탁드려요.... 배송사 선택은 어떻게 되는지도...',NULL,'2024-11-21 18:06:23','N',''),(3,'one','사이즈 교환 하고 싶어요','사이즈가 예상보다 작습니다. 교환절차를 안내부탁드려요',NULL,'2024-11-21 18:06:30','N',''),(4,'two','배송이 많이 지연되고 있습니다','언제 받을 수 있나요',NULL,'2024-11-21 18:06:34','N',''),(5,'one','불량품 교환 문의','교환 또는 환불 등의 안내가 필요합니다. 유선안내부탁드려요',NULL,'2024-11-21 18:06:38','Y','1234'),(6,'two','환불관련','환불절차 안내부탁드려요.... 배송사 선택은 어떻게 되는지도...',NULL,'2024-11-21 18:08:35','N',''),(7,'two','환불관련','환불절차 안내부탁드려요.... 배송사 선택은 어떻게 되는지도...',NULL,'2024-11-21 18:08:39','N',''),(8,'one','사이즈 교환 하고 싶어요','사이즈가 예상보다 작습니다. 교환절차를 안내부탁드려요',NULL,'2024-11-21 18:08:43','N','');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `best_pro_view`
--

/*!50001 DROP VIEW IF EXISTS `best_pro_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_pro_view` AS select `product`.`pseq` AS `pseq`,`product`.`name` AS `name`,`product`.`price2` AS `price2`,`product`.`image` AS `image`,`product`.`savefilename` AS `savefilename` from `product` where (`product`.`bestyn` = 'Y') order by `product`.`indate` desc limit 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cart_view`
--

/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_view` AS select `c`.`cseq` AS `cseq`,`c`.`userid` AS `userid`,`m`.`name` AS `mname`,`c`.`pseq` AS `pseq`,`p`.`name` AS `pname`,`c`.`quantity` AS `quantity`,`p`.`price2` AS `price2`,`c`.`indate` AS `indate` from ((`cart` `c` join `product` `p`) join `member` `m`) where ((`c`.`pseq` = `p`.`pseq`) and (`c`.`userid` = `m`.`userid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `new_pro_view`
--

/*!50001 DROP VIEW IF EXISTS `new_pro_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_pro_view` AS select `product`.`pseq` AS `pseq`,`product`.`name` AS `name`,`product`.`price2` AS `price2`,`product`.`image` AS `image`,`product`.`savefilename` AS `savefilename` from `product` where (`product`.`useyn` = 'Y') order by `product`.`indate` desc limit 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_view` AS select `d`.`odseq` AS `odseq`,`o`.`oseq` AS `oseq`,`o`.`indate` AS `indate`,`o`.`userid` AS `userid`,`m`.`name` AS `mname`,`o`.`zip_num` AS `zip_num`,`o`.`address1` AS `address1`,`o`.`address2` AS `address2`,`o`.`address3` AS `address3`,`m`.`phone` AS `phone`,`d`.`pseq` AS `pseq`,`p`.`price2` AS `price2`,`d`.`quantity` AS `quantity`,`d`.`result` AS `result`,`p`.`name` AS `pname` from (((`orders` `o` join `order_detail` `d`) join `member` `m`) join `product` `p`) where ((`o`.`oseq` = `d`.`oseq`) and (`o`.`userid` = `m`.`userid`) and (`d`.`pseq` = `p`.`pseq`)) */;
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

-- Dump completed on 2024-11-25  9:30:09
