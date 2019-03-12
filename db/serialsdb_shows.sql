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
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `date_of_start` varchar(100) DEFAULT NULL,
  `poster_image` varchar(500) NOT NULL,
  `long_description` text,
  `short_description` text,
  `priority` int(11) NOT NULL,
  `date_of_publish` varchar(500) DEFAULT NULL,
  `last_modified_date` varchar(500) DEFAULT NULL,
  `video_fragment_url` varchar(500) NOT NULL,
  `users_rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (8,'Dardevil','The man without fear','2014-04-02','image-1551174739018.jpg','Marvel%27s%20Daredevil%2C%20or%20simply%20Daredevil%2C%20is%20an%20American%20web%20television%20series%20created%20for%20Netflix%20by%20Drew%20Goddard%2C%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name.%20It%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20of%20the%20franchise%2C%20and%20is%20the%20first%20in%20a%20series%20of%20shows%20that%20lead%20to%20The%20Defenders%20crossover%20miniseries.%20The%20series%20is%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20with%20DeKnight%20Productions%20for%20the%20first%20season%20and%20Goddard%20Textiles%20for%20the%20first%20and%20second%20seasons.%20Steven%20S.%20DeKnight%20serves%20as%20showrunner%20on%20the%20first%20season%2C%20with%20Doug%20Petrie%20and%20Marco%20Ramirez%20taking%20over%20for%20the%20second%20season%2C%20and%20Erik%20Oleson%20joining%20the%20series%20as%20its%20showrunner%20for%20its%20third%20season%3B%20Goddard%20serves%20as%20a%20consultant%20for%20the%20series.%0A%0ACharlie%20Cox%20stars%20as%20Matt%20Murdock%20/%20Daredevil%2C%20a%20blind%20lawyer-by-day%20who%20fights%20crime%20as%20a%20masked%20vigilante%20by%20night.%20Deborah%20Ann%20Woll%2C%20Elden%20Henson%2C%20Rosario%20Dawson%2C%20and%20Vincent%20D%27Onofrio%20also%20star%2C%20with%20Toby%20Leonard%20Moore%2C%20Vondie%20Curtis-Hall%2C%20Bob%20Gunton%2C%20and%20Ayelet%20Zurer%20joining%20them%20for%20season%20one%2C%20Jon%20Bernthal%2C%20%C9lodie%20Yung%2C%20and%20Stephen%20Rider%20joining%20the%20cast%20for%20season%20two%2C%20and%20Wilson%20Bethel%20and%20Jay%20Ali%20joining%20in%20season%20three.%20Daredevil%20entered%20development%20in%20late%202013%2C%20a%20year%20after%20the%20film%20rights%20to%20the%20character%20reverted%20to%20Marvel%2C%20with%20Goddard%20initially%20hired%20in%20December%202013.%20DeKnight%20replaced%20him%20as%20showrunner%20and%20Cox%20was%20hired%20to%20star%20in%20May%202014.%20Filming%20takes%20place%20in%20New%20York%20City%2C%20in%20areas%20that%20still%20look%20like%20the%20old%20Hell%27s%20Kitchen.','Marvel%27s%20Daredevil%2C%20or%20simply%20Daredevil%2C%20is%20an%20American%20web%20television%20series%20created%20for%20Netflix%20by%20Drew%20Goddard%2C%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name.%20It%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20of%20the%20franchise%2C%20and%20is%20the%20first%20in%20a%20series%20of%20shows%20that%20lead%20to%20The%20Defenders%20crossover%20miniseries.%20The%20series%20is%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20with%20DeKnight%20Productions%20for%20the%20first%20season%20and%20Goddard%20Textiles%20for%20the%20first%20and%20second%20seasons.%20Steven%20S.%20DeKnight%20serves%20as%20showrunner%20on%20the%20first%20season%2C%20with%20Doug%20Petrie%20and%20Marco%20Ramirez%20taking%20over%20for%20the%20second%20season%2C%20and%20Erik%20Oleson%20joining%20the%20series%20as%20its%20showrunner%20for%20its%20third%20season%3B%20Goddard%20serves%20as%20a%20consultant%20for%20the%20series.',1,'2/14/2019, 10:14:45 PM','3/7/2019, 5:50:33 PM','https://youtu.be/E0Y8PxNdvng',6),(9,'Gotham','Rise of Dark Knight','2014-06-26','image-1551174755274.jpg','Lorem ipsum neque elementum adipiscing augue, tellus nostra nunc euismod orci in, dictum faucibus pellentesque euismod tincidunt ante est fermentum quam pretium ut cubilia, nostra nec lacus sodales malesuada nullam donec, semper enim felis hendrerit class lectus viverra sociosqu lacus dictumst gravida mollis nunc himenaeos elit iaculis pulvinar vehicula morbi augue urna porta, habitasse tempor faucibus metus inceptos lacinia nunc ultricies integer aliquam suspendisse mollis arcu elit habitasse himenaeos urna bibendum proin nunc felis quisque id nam sodales augue, quisque interdum felis pretium tempus aenean mi sagittis facilisis eu rhoncus, sodales pharetra pellentesque lectus vivamus eu fringilla scelerisque tempus egestas.','Lorem ipsum neque elementum adipiscing augue, tellus nostra nunc euismod orci in',1,'2/14/2019, 10:16:58 PM','3/4/2019, 5:12:34 PM','https://youtu.be/E0Y8PxNdvng',8),(11,'Downton Abbey','War changes everything','2010-09-26','image-1551174790902.jpg','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m',0,'2/15/2019, 8:57:15 PM','3/4/2019, 5:12:51 PM','https://youtu.be/6hLTX9HmWRY',6),(39,'Iron Fist','A Netflix original series','2017-03-17','image-1551195888816.jpg','A young man is bestowed with incredible martial arts skills and a mystical force known as the Iron Fist','A young man is bestowed with incredible martial arts skills and a mystical force known as the Iron Fist',0,'2/26/2019, 5:44:48 PM','3/4/2019, 5:12:59 PM','https://youtu.be/f9OKL5no-S0',7);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
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
