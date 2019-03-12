CREATE DATABASE  IF NOT EXISTS `serialsdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `serialsdb`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: serialsdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `episodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `episode_name` varchar(100) NOT NULL,
  `episode_number` int(11) NOT NULL,
  `related_show` int(11) NOT NULL,
  `related_season` int(11) NOT NULL,
  `long_description` text,
  `short_description` text,
  `featured_image` varchar(100) NOT NULL,
  `date_of_publish` varchar(100) DEFAULT NULL,
  `last_modified_date` varchar(100) DEFAULT NULL,
  `video_fragment_url` varchar(100) NOT NULL,
  `users_rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_show` (`related_show`),
  KEY `related_season` (`related_season`),
  CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`related_show`) REFERENCES `shows` (`id`),
  CONSTRAINT `episodes_ibfk_2` FOREIGN KEY (`related_season`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,'Episode One',1,8,1,'Lorem ispum','Lorem ispum','image-1551701244050.jpg','2/22/2019, 5:50:13 PM','3/4/2019, 2:07:24 PM','https://youtu.be/6Vptpkawdmc',5),(4,'Episode One',1,8,8,'Lorem ispum','Lorem ispum','image-1551175848696.jpg','2/26/2019, 12:10:48 PM','2/26/2019, 12:10:48 PM','https://www.youtube.com/watch?v=8bNlffXEcC0',8);
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-10 15:27:53
