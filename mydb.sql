-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Current Database: `mydb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydb`;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Language` (
  `id_language` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Language`
--

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
INSERT INTO `Language` VALUES (1,'none'),(2,'php'),(3,'angular'),(4,'ruby'),(5,'java');
/*!40000 ALTER TABLE `Language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `User_id_user` int(11) NOT NULL,
  `User_Language_id_language` int(11) NOT NULL,
  `Salle_id_Salle` int(11) NOT NULL,
  PRIMARY KEY (`id_reservation`,`User_id_user`,`User_Language_id_language`,`Salle_id_Salle`),
  KEY `fk_Reservation_User1_idx` (`User_id_user`,`User_Language_id_language`),
  KEY `fk_Reservation_Salle1_idx` (`Salle_id_Salle`),
  CONSTRAINT `fk_Reservation_Salle1` FOREIGN KEY (`Salle_id_Salle`) REFERENCES `Salle` (`id_Salle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_User1` FOREIGN KEY (`User_id_user`, `User_Language_id_language`) REFERENCES `User` (`id_user`, `Language_id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (2,'2017-10-20',10,2,2,1),(3,'2017-10-20',10,1,1,1),(4,'2017-10-20',10,3,1,1),(5,'2017-10-12',5,10,1,5),(6,'2017-10-12',5,9,1,5),(7,'2017-10-18',7,8,1,3),(8,'2017-10-10',3,4,1,6),(9,'2017-10-10',3,4,1,6),(10,'2017-10-10',3,4,1,6),(11,'2017-10-10',3,4,1,6);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salle`
--

DROP TABLE IF EXISTS `Salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salle` (
  `id_Salle` int(11) NOT NULL AUTO_INCREMENT,
  `Salle_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Salle`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salle`
--

LOCK TABLES `Salle` WRITE;
/*!40000 ALTER TABLE `Salle` DISABLE KEYS */;
INSERT INTO `Salle` VALUES (1,'Salle de dojo'),(2,'Salle de reunion'),(3,'Salle de repos'),(4,'Cuisine'),(5,'Bureau'),(6,'OpenSpace');
/*!40000 ALTER TABLE `Salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `id_dossier` varchar(45) DEFAULT NULL,
  `Language_id_language` int(11) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`Language_id_language`),
  KEY `fk_User_Language_idx` (`Language_id_language`),
  CONSTRAINT `fk_User_Language` FOREIGN KEY (`Language_id_language`) REFERENCES `Language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Goudjo','Maxence','1',1,'Wilder'),(2,'Vincent','Nicolas','2',2,'Formateur'),(3,'Plasson','Vincent','3',1,'Wilder'),(4,'Seban','Dorian','4',1,'Wilder'),(5,'Lambert','Pierre','5',1,'Wilder'),(6,'Google','Bigbrother','6',1,'Dieu'),(7,'Lorie','Tameilleuramie','7',1,'Chanteuse'),(8,'Devos','John','8',1,'Campus Manager'),(9,'Dos Santos','Paul','9',1,'Wilder'),(10,'Gillardin','Arnaud','10',1,'Wilder');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-04 15:08:15
