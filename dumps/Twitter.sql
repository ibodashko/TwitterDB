-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: twitter
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `text` text NOT NULL,
  `tweet` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `tweet` (`tweet`),
  KEY `user` (`user`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`tweet`) REFERENCES `tweets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,3,'comment 1',1,'2017-02-06 21:50:00'),(2,3,'comment 2',1,'2017-02-06 21:50:00'),(3,3,'comment 3',2,'2017-02-07 11:15:32'),(4,3,'comment 4',2,'2017-02-08 10:10:32'),(5,4,'Are you serious?',3,'2017-02-09 17:10:32'),(6,7,'Looks good',4,'2017-02-10 15:05:44'),(7,7,'Actually, i am prepared',6,'2017-02-10 16:06:15');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`followed_id`),
  KEY `id_idx1` (`follower_id`),
  CONSTRAINT `id` FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (1,3,4),(2,3,5),(3,3,6),(4,3,7),(5,3,8),(6,3,11),(7,3,12),(8,4,3),(9,4,5),(10,4,6),(11,4,7),(12,4,9),(13,5,8),(14,5,9),(15,6,7),(16,6,13);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `user` int(11) NOT NULL,
  `date` date NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `user` (`user`),
  CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,'My first tweet!',3,'2017-02-06'),(2,'My second tweet!',3,'2017-02-06'),(3,'test 1',4,'2017-02-07'),(4,'test 1',4,'2017-02-08'),(5,'Lorem ipsum',5,'2017-02-08'),(6,'You are not prepared',6,'2017-02-08'),(7,'The Witcher:Wild Hunt',8,'2017-02-09'),(8,'Lord commander',13,'2017-02-10'),(9,'This is my black album',11,'2017-02-10'),(10,'Denmark is my country',12,'2017-02-10');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `age` int(11) NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Test Testovich',12),(4,'Ivan Ivanovich',30),(5,'Vernon Roche',25),(6,'Illidan Stormrage',50),(7,'Arthas Menetil',42),(8,'Geralt of Rivia',73),(9,'Triss Merigold',73),(10,'John Doe',15),(11,'James Hetfield',53),(12,'Lars Ulrich',54),(13,'John Snow',23);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-06 22:57:21
