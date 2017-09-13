CREATE DATABASE  IF NOT EXISTS `cultuurhuis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cultuurhuis`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cultuurhuis
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naam` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (10,'Circustheater'),(6,'Dans'),(5,'Familievoorstelling'),(1,'Humor'),(8,'Modern klassiek'),(7,'Multimedia'),(3,'Muziek'),(9,'Muziektheater'),(2,'Theater'),(4,'Wereldmuziek');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `performers` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `genreid` int(11) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `freeseats` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_voorstellingen_genres` (`genreid`),
  CONSTRAINT `FK_voorstellingen_genres` FOREIGN KEY (`genreid`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,'Rechtstreeks & integraal/Ka-Boom!','Neveneffecten / Alex Agnew','2017-08-12 20:00:00',1,5.00,0),(2,'De leeuw van Vlaanderen','Union Suspecte / Publiekstheater','2017-10-13 20:00:00',2,7.00,141),(3,'Ano Neko','Dobet Gnahoré','2017-10-14 20:00:00',4,6.00,200),(4,'Professor Bernhardi','de Roovers','2017-10-15 20:00:00',2,7.50,180),(5,'Ich bin wie du','het Toneelhuis','2017-10-16 20:00:00',2,7.00,150),(6,'Randschade','fABULEUS','2017-10-17 20:00:00',5,6.00,200),(7,'Koning Lear','Tonic','2017-10-18 20:00:00',2,7.00,170),(8,'Van alle landen thuis','Els Helewaut,D.Van Esbroeck & co','2017-10-19 20:00:00',3,5.00,200),(9,'Ma - Earth','Akram Khan','2017-10-20 20:00:00',6,8.00,110),(10,'Jerusalem','Berlin','2017-10-21 20:00:00',7,7.50,198),(11,'De fijnste dagen van het jaar','Het Paleis/Jenny','2017-10-22 20:00:00',5,4.00,140),(12,'Cancion de un amorio','Bodicxhel','2017-10-23 20:00:00',4,6.00,200),(13,'Moest ik van u zijn','Wouter Deprez  ','2017-10-24 20:00:00',1,6.00,198),(14,'Poézique cabaret','La compagnie du chien qui tousse','2017-10-25 20:00:00',1,6.50,200),(15,'Eekhoornbrood','Lampe','2017-10-26 20:00:00',2,5.50,180),(16,'Liederen v. Baert, Debussy, Chausson, Weill','Bernard Baert & Anna Pardon','2017-10-27 20:00:00',8,8.00,198),(17,'L\"Hafa','Union Suspecte','2017-10-28 20:00:00',2,7.00,200),(18,'Achter \'t eten','Ceremonia/Het muziek Lod/Theater Zuidpool','2017-10-29 20:00:00',3,6.00,180),(19,'Poulenc / Stravinsky','Prometheus Ensemble','2017-10-30 20:00:00',8,8.00,200),(20,'Lied der rusteloosheid','Eva De Roovere, Pedro Moutinho & G. de Mol','2017-10-31 20:00:00',4,7.00,190),(21,'Wilde dingen','Kopergietery    ','2017-11-01 20:00:00',5,5.00,196),(22,'Licht','Bos','2017-11-02 20:00:00',7,6.00,94),(23,'Een hond in de nacht','Speeltheater Holland','2017-11-03 20:00:00',5,6.00,0),(24,'Gloed','theater Malpertuis','2017-11-04 20:00:00',2,7.00,196),(25,'To speak or not to speak','Spectra Ensemble','2017-11-05 20:00:00',8,8.00,200),(26,'Tres cultures por la paz','Rosa Zaragoza','2017-11-06 20:00:00',4,7.25,190),(27,'Zouff!','Les Argonautes','2017-11-07 20:00:00',10,5.00,0),(28,'La cucina dell\"arte ','David & Danny Ronaldo','2017-11-08 20:00:00',10,6.00,10),(29,'Speelt Rzewski','Frederic Rzewski','2017-11-09 20:00:00',8,8.00,160),(30,'Tv-tunes K.N.T.','Wim Opbrouck & Maandacht','2017-11-10 20:00:00',3,7.00,200),(31,'Schone woorden klinken zo...','Warre Borgmans & Jokke Schreurs','2017-11-11 20:00:00',3,6.00,180),(32,'White Light White Heat - The Velvet Undergr.','Bea Van der Maat & Dr Kloot Per W','2017-11-12 20:00:00',3,5.50,200),(33,'Het gaat toch rap','Raf Coppens','2017-11-13 20:00:00',1,6.00,170),(34,'Emilia Galotti','Tijd','2017-11-14 20:00:00',2,7.00,198),(35,'Iets over de liefde','theater Malpertuis','2017-11-16 20:00:00',2,6.00,160),(36,'Hendrickx, Xenakis & Tan Dun','Spiegel Strijkkwartet','2017-11-17 20:00:00',8,7.00,180),(37,'Cry like a man, part 2','J. Blaute, Paul Michiels & Roland','2017-11-18 20:00:00',3,6.00,8),(38,'De Kreutzersonates','Het Net','2017-11-19 20:00:00',2,7.00,100);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `performanceid` int(11) unsigned NOT NULL,
  `seats` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reservaties_klanten` (`userid`),
  KEY `FK_reservaties_voorstellingen` (`performanceid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,3,27,10),(2,3,27,50),(3,3,9,10),(4,3,27,130),(5,3,27,140),(6,3,27,140),(7,3,27,140),(8,3,27,20),(9,3,27,20),(10,3,28,170),(11,3,28,180),(12,3,28,180),(13,3,11,23),(14,3,28,10),(15,3,28,20),(16,6,9,50),(17,6,9,10),(18,3,11,5);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `streetnr` varchar(50) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gebruikersnaam` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Mike','Dhoore','Gavermolenstraat','71','9111','Belsele','admin','b17abf9621c5f04bd5bf8eb0b1a7d732e328dd3f','mike@mikedhoore.be');
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
