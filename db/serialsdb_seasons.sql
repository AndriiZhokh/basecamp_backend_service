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
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(100) NOT NULL,
  `season_number` int(11) NOT NULL,
  `related_show` int(11) NOT NULL,
  `long_description` text,
  `short_description` text,
  `featured_image` varchar(100) NOT NULL,
  `date_of_publish` varchar(100) DEFAULT NULL,
  `last_modified_date` varchar(100) DEFAULT NULL,
  `video_fragment_url` varchar(100) NOT NULL,
  `users_rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_show` (`related_show`),
  CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`related_show`) REFERENCES `shows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'Season One',1,8,'The%20first%20season%20of%20the%20American%20web%20television%20series%20Daredevil%2C%20which%20is%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name%2C%20follows%20the%20early%20days%20of%20Matt%20Murdock%20/%20Daredevil%2C%20a%20lawyer-by-day%20who%20fights%20crime%20at%20night%2C%20juxtaposed%20with%20the%20rise%20of%20crime%20lord%20Wilson%20Fisk.%20It%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20and%20other%20television%20series%20of%20the%20franchise.%20The%20season%20was%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20DeKnight%20Prods.%20and%20Goddard%20Textiles%2C%20with%20Steven%20S.%20DeKnight%20serving%20as%20showrunner%2C%20and%20series%20creator%20Drew%20Goddard%20acting%20as%20consultant.%0A%0ACharlie%20Cox%20stars%20as%20Murdock%2C%20while%20Vincent%20D%27Onofrio%20plays%20Fisk.%20They%20are%20joined%20by%20principal%20cast%20members%20Deborah%20Ann%20Woll%2C%20Elden%20Henson%2C%20Toby%20Leonard%20Moore%2C%20Vondie%20Curtis-Hall%2C%20Bob%20Gunton%2C%20Ayelet%20Zurer%2C%20and%20Rosario%20Dawson.%20Daredevil%20entered%20development%20in%20late%202013%2C%20with%20Goddard%20hired%20in%20December.%20DeKnight%20replaced%20him%20as%20showrunner%20and%20Cox%20was%20hired%20to%20star%20in%20May%202014.%20Filmed%20in%20New%20York%20City%20from%20July%20to%20December%202014%2C%20the%20season%20focuses%20on%20the%20darker%2C%20more%20mature%20elements%20of%20the%20source%20material.%20Stephanie%20Maslansky%20designed%20the%20costumes%20for%20the%20season%2C%20with%20the%20final%20red%20suit%20for%20Daredevil%20designed%20by%20Ryan%20Meinerding%20and%20the%20costume%20artists%20at%20Marvel%20Studios.%20The%20season%20features%20links%20and%20references%20to%20other%20MCU%20projects%2C%20including%20future%20Netflix%20series.','The%20first%20season%20of%20the%20American%20web%20television%20series%20Daredevil%2C%20which%20is%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name%2C%20follows%20the%20early%20days%20of%20Matt%20Murdock%20/%20Daredevil%2C%20a%20lawyer-by-day%20who%20fights%20crime%20at%20night%2C%20juxtaposed%20with%20the%20rise%20of%20crime%20lord%20Wilson%20Fisk.%20It%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20and%20other%20television%20series%20of%20the%20franchise.%20The%20season%20was%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20DeKnight%20Prods.%20and%20Goddard%20Textiles%2C%20with%20Steven%20S.%20DeKnight%20serving%20as%20showrunner%2C%20and%20series%20creator%20Drew%20Goddard%20acting%20as%20consultant.','image-1551174974287.jpg','2/21/2019, 4:12:58 PM','3/7/2019, 6:41:25 PM','https://youtu.be/E0Y8PxNdvng',8),(7,'drgegre',1,9,'trhrtgg','rgerge','image-1551441090580.jpg','2/21/2019, 6:29:11 PM','3/1/2019, 1:51:30 PM','https://youtu.be/6Vptpkawdmc',7),(8,'Season Two',2,8,'The%20first%20season%20of%20the%20American%20web%20television%20series%20Daredevil%2C%20which%20is%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name%2C%20follows%20the%20early%20days%20of%20Matt%20Murdock%20/%20Daredevil%2C%20a%20lawyer-by-day%20who%20fights%20crime%20at%20night%2C%20juxtaposed%20with%20the%20rise%20of%20crime%20lord%20Wilson%20Fisk.%20It%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20and%20other%20television%20series%20of%20the%20franchise.%20The%20season%20was%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20DeKnight%20Prods.%20and%20Goddard%20Textiles%2C%20with%20Steven%20S.%20DeKnight%20serving%20as%20showrunner%2C%20and%20series%20creator%20Drew%20Goddard%20acting%20as%20consultant.%0A%0ACharlie%20Cox%20stars%20as%20Murdock%2C%20while%20Vincent%20D%27Onofrio%20plays%20Fisk.%20They%20are%20joined%20by%20principal%20cast%20members%20Deborah%20Ann%20Woll%2C%20Elden%20Henson%2C%20Toby%20Leonard%20Moore%2C%20Vondie%20Curtis-Hall%2C%20Bob%20Gunton%2C%20Ayelet%20Zurer%2C%20and%20Rosario%20Dawson.%20Daredevil%20entered%20development%20in%20late%202013%2C%20with%20Goddard%20hired%20in%20December.%20DeKnight%20replaced%20him%20as%20showrunner%20and%20Cox%20was%20hired%20to%20star%20in%20May%202014.%20Filmed%20in%20New%20York%20City%20from%20July%20to%20December%202014%2C%20the%20season%20focuses%20on%20the%20darker%2C%20more%20mature%20elements%20of%20the%20source%20material.%20Stephanie%20Maslansky%20designed%20the%20costumes%20for%20the%20season%2C%20with%20the%20final%20red%20suit%20for%20Daredevil%20designed%20by%20Ryan%20Meinerding%20and%20the%20costume%20artists%20at%20Marvel%20Studios.%20The%20season%20features%20links%20and%20references%20to%20other%20MCU%20projects%2C%20including%20future%20Netflix%20series.','The%20first%20season%20of%20the%20American%20web%20television%20series%20Daredevil%2C%20which%20is%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name%2C%20follows%20the%20early%20days%20of%20Matt%20Murdock%20/%20Daredevil%2C%20a%20lawyer-by-day%20who%20fights%20crime%20at%20night%2C%20juxtaposed%20with%20the%20rise%20of%20crime%20lord%20Wilson%20Fisk.%20It%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20and%20other%20television%20series%20of%20the%20franchise.%20The%20season%20was%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20DeKnight%20Prods.%20and%20Goddard%20Textiles%2C%20with%20Steven%20S.%20DeKnight%20serving%20as%20showrunner%2C%20and%20series%20creator%20Drew%20Goddard%20acting%20as%20consultant.','image-1551175426021.jpg','2/26/2019, 12:03:46 PM','3/7/2019, 6:46:09 PM','https://youtu.be/E0Y8PxNdvng',10),(9,'Season Three',3,8,'The%20third%20season%20of%20the%20American%20web%20television%20series%20Daredevil%2C%20which%20is%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name%2C%20follows%20Matt%20Murdock%20/%20Daredevil%2C%20a%20blind%20lawyer-by-day%20who%20fights%20crime%20at%20night.%20When%20Wilson%20Fisk%20is%20released%20from%20prison%2C%20Murdock%20must%20decide%20between%20hiding%20from%20the%20world%20or%20embracing%20his%20life%20as%20a%20hero%20vigilante.%20The%20season%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20and%20other%20television%20series%20of%20the%20franchise.%20It%20is%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20with%20Erik%20Oleson%20serving%20as%20showrunner%2C%20and%20series%20creator%20Drew%20Goddard%20acting%20as%20consultant.%0A%0ACharlie%20Cox%20stars%20as%20Murdock%20and%20Vincent%20D%27Onofrio%20portrays%20Fisk%2C%20with%20Deborah%20Ann%20Woll%2C%20Elden%20Henson%2C%20and%20Stephen%20Rider%20also%20returning%20from%20previous%20seasons%3B%20Joanne%20Whalley%2C%20Jay%20Ali%2C%20and%20Wilson%20Bethel%20join%20them.%20Former%20series%20regular%20Ayelet%20Zurer%20also%20returns%20in%20a%20guest%20role.%20The%20season%20was%20ordered%20in%20July%202016%2C%20with%20Oleson%20announced%20as%20new%20showrunner%20for%20the%20season%20in%20October%202017.%20Filming%20began%20the%20following%20month%20and%20ended%20by%20June%202018%2C%20with%20the%20season%20adapting%20elements%20from%20the%20%22Born%20Again%22%20comic%20storyline.%0A%0AThe%2013-episode%20season%20was%20released%20on%20October%2019%2C%202018.%20Netflix%20canceled%20the%20series%20on%20November%2029%2C%202018.%5B1%5D','The%20third%20season%20of%20the%20American%20web%20television%20series%20Daredevil%2C%20which%20is%20based%20on%20the%20Marvel%20Comics%20character%20of%20the%20same%20name%2C%20follows%20Matt%20Murdock%20/%20Daredevil%2C%20a%20blind%20lawyer-by-day%20who%20fights%20crime%20at%20night.%20When%20Wilson%20Fisk%20is%20released%20from%20prison%2C%20Murdock%20must%20decide%20between%20hiding%20from%20the%20world%20or%20embracing%20his%20life%20as%20a%20hero%20vigilante.%20The%20season%20is%20set%20in%20the%20Marvel%20Cinematic%20Universe%20%28MCU%29%2C%20sharing%20continuity%20with%20the%20films%20and%20other%20television%20series%20of%20the%20franchise.%20It%20is%20produced%20by%20Marvel%20Television%20in%20association%20with%20ABC%20Studios%2C%20with%20Erik%20Oleson%20serving%20as%20showrunner%2C%20and%20series%20creator%20Drew%20Goddard%20acting%20as%20consultant.','image-1551977246636.jpg','3/7/2019, 6:47:26 PM','3/7/2019, 6:47:26 PM','https://youtu.be/E0Y8PxNdvng',6);
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-10 15:27:52
