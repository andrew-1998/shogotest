-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: shogo
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cur_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cur_name` (`cur_name`),
  UNIQUE KEY `cur_name_2` (`cur_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (2,'$'),(3,'евро'),(1,'руб.'),(4,'тенге');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `articul` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `price_old` decimal(10,2) NOT NULL,
  `notice` text,
  `content` text,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `currency_product_fk` (`currency_id`),
  CONSTRAINT `currency_product_fk` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,2,'data/apartment/brick/RU756978','Квартира 1','RU756978',2000000.00,1,2000000.00,'Хорошая квартира в первичке','Продается уютная, теплая и чистая двухкомнатная квартира на 15 этаже кирпичного 19-ти этажного дома в экологически чистом микрорайоне Парковый на ул. Куфонина.\nИдеальный вариант для семьи.\nОкна выходят на две стороны - северную и южную.',1),(2,1,'data/apartment/panel/RU755361','Квартира 2','RU755361',3000000.00,1,3000000.00,'Панельная вторичка','Хорошая квартира в скр Садовый. \nКомнаты изолированные, балкон застеклен.\n В шаговой доступности магазины, школа, детский сад, автобусная остановка.',1),(3,3,'data/apartment/panel/RU754273','Квартира 3','RU754273',4500000.00,1,4500000.00,'Панельный дом','Отличная евродвушка в новостройке!\nВ квартире сделана качественная чистовая отделка, которая позволит Вам реализовать Ваши планы по внутренней отделке!\nВо дворе детская площадка.\nB шаговой доступности школа, детский сад, магазины, остановка общественного транспорта.',1),(4,4,'data/apartment/panel/RU750194','Квартира 4','RU750194',6500000.00,1,6500000.00,'Панельный дом','Квартира для большой семьи. Кухня студия 20 кв.м., плюс четыре комнаты и большая лоджия. Сан узел раздельный, плитка.\nБольшая огороженная территория дома. Свое парковочное место, во дворе детские площадки. Рядом балатовский лес.',1),(5,5,'data/apartment/panel/RU752906','Квартира 5','RU752906',5500000.00,1,6000000.00,'Панельный дом','Трехкомнатная квартира на 5 этаже панельного дома в экологически чистом микрорайоне.\nВ квартире хороший и качественный ремонт, ламинат, натяжные потолки.\nОстается кухонный гарнитур и шкафы-купе, остальное по договоренности.',1),(6,6,'data/apartment/panel/RU753682','Квартира 6','RU753682',8500000.00,1,8500000.00,'Панельный дом','Трехкомнатная квартира в панельной новостройке ЖК \"Глобус\"\nВ квартире сделана качественная чистовая отделка, которая позволит Вам реализовать Ваши планы по внутренней отделке!\nВ доме видеонаблюдение, колясочная.\nВо дворе детская площадка.',1),(7,7,'data/apartment/brick/RU758860','Квартира 7','RU758860',10000000.00,1,10000000.00,'Кирпичный ЖК','Квартира для семьи. Кухня студия 20 кв.м., плюс 2 комнаты и большая лоджия. Сан узел раздельный, плитка. \nБольшая огороженная территория дома. \nСвое парковочное место, во дворе детские площадки.',1),(8,8,'data/apartment/brick/RU752485','Квартира 8','RU752485',9500000.00,1,9500000.00,'Кирпичный дом','Квартира светлая и очень тёплая. На полу линолеум, на окнах стеклопакеты. Потолки натяжные, кроме одной комнаты. Вид из окна на Каму, 2 окна и одно окно на  хоккейную и детскую площадки.',1),(9,9,'data/apartment/brick/RU750068','Квартира 9','RU750068',12500000.00,1,12500000.00,'Кирпичный дом','Шикарный ЖК с видом на Каму.',1),(10,10,'data/apartment/brick/RU751201','Квартира 10','RU751201',11500000.00,1,11500000.00,'Кирпичный дом','Жилой комплекс комфорт-класса Экопарк органично вписывается в природную среду. На берегу Камы.',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_assignment`
--

DROP TABLE IF EXISTS `product_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_assignment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_product_assignment_fk` (`product_id`),
  KEY `product_section_product_assignment_fk` (`section_id`),
  KEY `product_type_product_assignment_fk` (`type_id`),
  CONSTRAINT `product_product_assignment_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_section_product_assignment_fk` FOREIGN KEY (`section_id`) REFERENCES `product_section` (`id`),
  CONSTRAINT `product_type_product_assignment_fk` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_assignment`
--

LOCK TABLES `product_assignment` WRITE;
/*!40000 ALTER TABLE `product_assignment` DISABLE KEYS */;
INSERT INTO `product_assignment` VALUES (1,1,1,1,1),(2,2,1,1,1),(3,3,1,1,1),(4,4,1,1,1),(5,5,1,1,1),(6,6,1,1,1),(7,7,1,1,1),(8,8,1,1,1),(9,9,1,1,1),(10,10,1,1,1);
/*!40000 ALTER TABLE `product_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_param_name`
--

DROP TABLE IF EXISTS `product_param_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_param_name` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int DEFAULT '0',
  `visible` tinyint(1) NOT NULL,
  `name` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_param_name`
--

LOCK TABLES `product_param_name` WRITE;
/*!40000 ALTER TABLE `product_param_name` DISABLE KEYS */;
INSERT INTO `product_param_name` VALUES (1,1,1,'Адрес'),(2,2,1,'Тип стен'),(3,3,1,'Количество комнат'),(4,4,1,'Этаж');
/*!40000 ALTER TABLE `product_param_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_param_variant`
--

DROP TABLE IF EXISTS `product_param_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_param_variant` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int DEFAULT '0',
  `param_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `product_param_name_product_param_variant_fk` (`param_id`),
  CONSTRAINT `product_param_name_product_param_variant_fk` FOREIGN KEY (`param_id`) REFERENCES `product_param_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_param_variant`
--

LOCK TABLES `product_param_variant` WRITE;
/*!40000 ALTER TABLE `product_param_variant` DISABLE KEYS */;
INSERT INTO `product_param_variant` VALUES (1,'Город',1,1),(2,'улица',2,1),(3,'номер дома и квартиры',3,1),(4,'почтовый индекс',4,1),(5,'кирпичный',1,2),(6,'панельный',2,2);
/*!40000 ALTER TABLE `product_param_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_section`
--

DROP TABLE IF EXISTS `product_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_section` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notice` text,
  `visible` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_section`
--

LOCK TABLES `product_section` WRITE;
/*!40000 ALTER TABLE `product_section` DISABLE KEYS */;
INSERT INTO `product_section` VALUES (1,1,'data/section/apartment','Квартиры',NULL,0),(2,2,'data/section/clothers','Одежда',NULL,0),(3,3,'data/section/electronics','Электроника',NULL,0);
/*!40000 ALTER TABLE `product_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notice` text,
  `visible` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,1,'data/type/retail','розница',NULL,0),(2,2,'data/type/wholesale','оптом',NULL,0),(3,3,'data/type/alternative','альтернатива',NULL,0);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 14:42:16
