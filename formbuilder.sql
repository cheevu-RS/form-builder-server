-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: formbuilder
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `formId` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  `field6` varchar(100) DEFAULT NULL,
  `field7` varchar(100) DEFAULT NULL,
  `field8` varchar(100) DEFAULT NULL,
  `field9` varchar(100) DEFAULT NULL,
  `field10` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`formId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES ('2wlng1gh4hy','TextBox','TextArea','TextBox','TextBox','TextArea','CheckBox',NULL,NULL,NULL,NULL,NULL,NULL),('6x8prh6hlc','TextBox','TextArea','TextBox',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('atebovqcvw','TextBox','TextArea','TextBox','TextArea','CheckBox',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('o10c2w64j7h','TextBox','TextArea','TextBox','TextArea','CheckBox',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('rnahcltsnh','TextBox','TextArea','CheckBox',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `formId` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  `field6` varchar(100) DEFAULT NULL,
  `field7` varchar(100) DEFAULT NULL,
  `field8` varchar(100) DEFAULT NULL,
  `field9` varchar(100) DEFAULT NULL,
  `field10` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`formId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES ('2wlng1gh4hy','Biodata','Let us know you.','Name','City','Describe yourself','[\"Languages you know\", [\"English\", \"Hindi\", \"Tamil\"]]',NULL,NULL,NULL,NULL,NULL,NULL),('6x8prh6hlc','Test CORS','testing Cors bn flask and npm','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('atebovqcvw','Form tester','test all fields','text ele','text area ele','[\"check ele\", [\"check1\", \"check2\"]]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('o10c2w64j7h','tester','test all form elements','Box','Area','[\"Check\", [\"op1\", \"op2\"]]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('rnahcltsnh','Gender Bender','hOw do You IdenTiFy','[\"Gender\", [\"Male\", \"Female\", \"Prefer not to say\", \"Unsure\"]]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `formId` varchar(100) NOT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  `field6` varchar(100) DEFAULT NULL,
  `field7` varchar(100) DEFAULT NULL,
  `field8` varchar(100) DEFAULT NULL,
  `field9` varchar(100) DEFAULT NULL,
  `field10` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (1,'o10c2w64j7h','dasdas','dasdasd','[True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'o10c2w64j7h','dasdas','dasdasd','[True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'o10c2w64j7h','dasdas','','[True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'o10c2w64j7h','','snkd','[True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'o10c2w64j7h','','snkd','[False, False]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'atebovqcvw','input','larger meaningful input','[False, True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'rnahcltsnh','[True, False, True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'rnahcltsnh','[False, True, False, True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'2wlng1gh4hy','Ram','Madurai','I like dank memes!','[True, False, True]',NULL,NULL,NULL,NULL,NULL,NULL),(10,'o10c2w64j7h','whooo','ald.dsnfsdnf','[True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'o10c2w64j7h','','','[True, True]',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'6x8prh6hlc','cbsmbcm,zs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'6x8prh6hlc','lolll',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-20  9:03:09
