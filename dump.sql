-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: housing
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','d82494f05d6917ba02f7aaa29689ccb444bb73f20380876cb05d1f37537b7892');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `houseid` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `landlordid` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'0401312404','yangledaa@gmail.com','I want to apply.','2017-10-03 15:12:10',1,1,1,'Approved',NULL),(2,'0401312404','yangledaa@gmail.com','I want to apply.','2017-10-05 14:42:10',2,1,1,'Rejected',NULL),(3,'0401312404','yangledaa@gmail.com','I like the house.','2017-10-07 19:37:48',3,1,1,'Pending',NULL);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) NOT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `carparks` int(11) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `description` text,
  `price` int(11) NOT NULL,
  `landlordid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,'418 - 422 Canterbury Road',3,2,1,'/resources/img/house1.jpg','Setting a new benchmark in visionary contemporary design, \'Campsie Central\' is a brave and distinctive lifestyle development intuitively crafted by award winning CDArchitects. The sublime development presents an outstanding opportunity to enjoy a life of vitality, convenience and connection.',700,1),(2,'148-160 King Street, Sydney',3,2,1,'/resources/img/house2.jpg','A tightly held and highly regarded tree lined location within walking distance to schools, parks, playgrounds, restaurants and both bus and train transport.',600,1),(3,'129 Harrington Street, Sydney',2,1,1,'/resources/img/house3.jpg','This site represents an outstanding opportunity to acquire this DA approved residential development site for 14 apartments in the high growth precinct of Campsie.',500,1),(4,'168 Kent Street, Sydney',4,2,2,'/resources/img/house4.jpg','City Living at its finest. Situated in one of Sydney’s most highly sought after residential buildings.',550,1),(5,'343-357 Pitt Street, Sydney',3,2,2,'/resources/img/house5.jpg','You will be hard-pressed to find a better location than this, with everything at your doorstep.',800,1);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(200) NOT NULL,
  `houseid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (1,'/resources/img/house1.jpg',1),(2,'/resources/img/pic1.jpg',1),(3,'/resources/img/pic2.jpg',1),(4,'/resources/img/house2.jpg',2),(5,'/resources/img/pic3.jpg',2),(6,'/resources/img/pic4.jpg',2),(7,'/resources/img/house3.jpg',3),(8,'/resources/img/pic5.jpg',3),(9,'/resources/img/pic6.jpg',3),(10,'/resources/img/house4.jpg',4),(11,'/resources/img/pic7.jpg',4),(12,'/resources/img/pic8.jpg',4),(13,'/resources/img/house5.jpg',5),(14,'/resources/img/pic9.jpg',5),(15,'/resources/img/pic10.jpg',5);
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord`
--

DROP TABLE IF EXISTS `landlord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landlord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord`
--

LOCK TABLES `landlord` WRITE;
/*!40000 ALTER TABLE `landlord` DISABLE KEYS */;
INSERT INTO `landlord` VALUES (1,'landlord','7bbdfb675eaaa3ee22be6d75e6777df26267f202272d2528b76f7c030684b2e8','landlord','yangledaa@gmail.com');
/*!40000 ALTER TABLE `landlord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'student','0a83b75732fb39e74753c47712db5e4e5f33d26b62db7170f9cb2851bde2f1e6');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-18 16:07:41
