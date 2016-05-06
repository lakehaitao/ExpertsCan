-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: expertscan
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `entinfo`
--

DROP TABLE IF EXISTS `entinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entinfo` (
  `entid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT '未知公司名',
  `address` varchar(45) DEFAULT NULL,
  `email1` varchar(45) DEFAULT NULL,
  `phone0` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`entid`),
  UNIQUE KEY `entid_UNIQUE` (`entid`),
  UNIQUE KEY `entEmail_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entinfo`
--

LOCK TABLES `entinfo` WRITE;
/*!40000 ALTER TABLE `entinfo` DISABLE KEYS */;
INSERT INTO `entinfo` VALUES (1,'enterpriseA@xx.com','123','测试用公司名enterpriseA','测试用公司地址','ent@test.com','3333333333','测试用公司描述',NULL,1),(2,'ent1@xx.com','123','测试用公司名ent1',NULL,NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `entinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field`
--

DROP TABLE IF EXISTS `exp_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field` (
  `expid` int(10) unsigned DEFAULT NULL,
  `fieldid` int(10) unsigned DEFAULT NULL,
  KEY `FK_exp&field_expid_idx` (`expid`),
  KEY `FK_exp&field_fieldid_idx` (`fieldid`),
  CONSTRAINT `FK_exp_field_expid` FOREIGN KEY (`expid`) REFERENCES `expinfo` (`expid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_exp_field_fieldid` FOREIGN KEY (`fieldid`) REFERENCES `fields` (`fieldid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field`
--

LOCK TABLES `exp_field` WRITE;
/*!40000 ALTER TABLE `exp_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expinfo`
--

DROP TABLE IF EXISTS `expinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expinfo` (
  `expid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT '佚名',
  `description` varchar(45) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `portrait` varchar(45) DEFAULT NULL,
  `phone0` varchar(45) DEFAULT NULL,
  `email1` varchar(45) DEFAULT NULL,
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`expid`),
  UNIQUE KEY `expid_UNIQUE` (`expid`),
  UNIQUE KEY `expSigninEmail_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expinfo`
--

LOCK TABLES `expinfo` WRITE;
/*!40000 ALTER TABLE `expinfo` DISABLE KEYS */;
INSERT INTO `expinfo` VALUES (1,'expertA@xx.com','123','测试用专家','测试用描述','测试用经历',NULL,'33333333','eee@xx.com',1,2),(2,'exp1@xx.com','123','exp1',NULL,NULL,NULL,NULL,NULL,1,5),(3,'exp2@xx.com','123','eeeee','12312','222',NULL,'null','22@xx.com',1,5),(4,'exp3@xx.com','123','测试用专家3','测试用描述','测试用经历',NULL,'11111',NULL,1,5),(5,'exp4@xx.com','123','测试用专家4','测试用描述',NULL,NULL,'22222',NULL,0,5);
/*!40000 ALTER TABLE `expinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `fieldid` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_exp_completed`
--

DROP TABLE IF EXISTS `proj_exp_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_exp_completed` (
  `projid` int(10) unsigned DEFAULT NULL,
  `expid` int(10) unsigned DEFAULT NULL,
  `comments_from_exp` varchar(200) DEFAULT NULL,
  `comments_from_ent` varchar(200) DEFAULT NULL,
  `rate_from_exp` tinyint(1) DEFAULT NULL,
  `rate_from_ent` tinyint(1) DEFAULT NULL,
  KEY `FK_establishedproj_projid_idx` (`projid`),
  KEY `FK_establishedproj_expid_idx` (`expid`),
  CONSTRAINT `FK_proj_exp_completed_expid` FOREIGN KEY (`expid`) REFERENCES `expinfo` (`expid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proj_exp_completed_projid` FOREIGN KEY (`projid`) REFERENCES `projinfo` (`projid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_exp_completed`
--

LOCK TABLES `proj_exp_completed` WRITE;
/*!40000 ALTER TABLE `proj_exp_completed` DISABLE KEYS */;
INSERT INTO `proj_exp_completed` VALUES (7,1,'尚未评论','尚未评论',-1,-1),(8,1,'你也不错！','干得不错！',1,2),(1,3,'尚未评论','尚未评论',-1,-1),(1,2,'尚未评论','尚未评论',-1,-1),(1,1,'尚未评论','尚未评论',-1,-1);
/*!40000 ALTER TABLE `proj_exp_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_exp_ongoing`
--

DROP TABLE IF EXISTS `proj_exp_ongoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_exp_ongoing` (
  `projid` int(10) unsigned DEFAULT NULL,
  `expid` int(10) unsigned DEFAULT NULL,
  KEY `FK_proj_exp_ongoing_projid_idx` (`projid`),
  KEY `FK_proj_exp_ongoing_expid_idx` (`expid`),
  CONSTRAINT `FK_proj_exp_ongoing_expid` FOREIGN KEY (`expid`) REFERENCES `expinfo` (`expid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proj_exp_ongoing_projid` FOREIGN KEY (`projid`) REFERENCES `projinfo` (`projid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_exp_ongoing`
--

LOCK TABLES `proj_exp_ongoing` WRITE;
/*!40000 ALTER TABLE `proj_exp_ongoing` DISABLE KEYS */;
INSERT INTO `proj_exp_ongoing` VALUES (5,1),(6,1),(1,2),(1,3),(1,1);
/*!40000 ALTER TABLE `proj_exp_ongoing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_exp_tendering`
--

DROP TABLE IF EXISTS `proj_exp_tendering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_exp_tendering` (
  `projid` int(10) unsigned DEFAULT NULL,
  `expid` int(10) unsigned DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0  pending\n1  accepted\n2  denied\n3  application canceled',
  KEY `FK_proposal&state_projid_idx` (`projid`),
  KEY `FK_proposal&state_expid_idx` (`expid`),
  CONSTRAINT `FK_proj_exp_tendering_expid` FOREIGN KEY (`expid`) REFERENCES `expinfo` (`expid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proj_exp_tendering_projid` FOREIGN KEY (`projid`) REFERENCES `projinfo` (`projid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_exp_tendering`
--

LOCK TABLES `proj_exp_tendering` WRITE;
/*!40000 ALTER TABLE `proj_exp_tendering` DISABLE KEYS */;
INSERT INTO `proj_exp_tendering` VALUES (1,1,1),(2,1,0),(3,2,0),(4,2,1),(1,2,1),(1,3,1),(1,4,3);
/*!40000 ALTER TABLE `proj_exp_tendering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_field`
--

DROP TABLE IF EXISTS `proj_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_field` (
  `projid` int(10) unsigned DEFAULT NULL,
  `fieldid` int(10) unsigned DEFAULT NULL,
  KEY `FK_proj&field_projid_idx` (`projid`),
  KEY `FK_proj&field_fieldid_idx` (`fieldid`),
  CONSTRAINT `FK_proj_field_fieldid` FOREIGN KEY (`fieldid`) REFERENCES `fields` (`fieldid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proj_field_projid` FOREIGN KEY (`projid`) REFERENCES `projinfo` (`projid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_field`
--

LOCK TABLES `proj_field` WRITE;
/*!40000 ALTER TABLE `proj_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projinfo`
--

DROP TABLE IF EXISTS `projinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projinfo` (
  `projid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `releasedate` datetime DEFAULT NULL,
  `expense` varchar(45) DEFAULT NULL,
  `entid` int(10) unsigned DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0  ---  招标中\n1  ---  进行中\n2  ---  已完成',
  PRIMARY KEY (`projid`),
  UNIQUE KEY `projid_UNIQUE` (`projid`),
  KEY `FK_projinfo_entid_idx` (`entid`),
  CONSTRAINT `FK_projinfo_entid` FOREIGN KEY (`entid`) REFERENCES `entinfo` (`entid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projinfo`
--

LOCK TABLES `projinfo` WRITE;
/*!40000 ALTER TABLE `projinfo` DISABLE KEYS */;
INSERT INTO `projinfo` VALUES (1,'测试项目1','描述','2016-01-01 00:00:00','100000',1,2),(2,'测试项目2','描述','2016-02-02 00:00:00','10000',2,0),(3,'测试项目3','描述','2016-03-03 00:00:00','12222',1,0),(4,'测试项目4','描述','2016-01-01 00:00:00','222222',1,0),(5,'测试项目5','描述','2016-01-01 00:00:00','12312',1,1),(6,'测试项目6','描述','2016-01-01 00:00:00','12312',1,1),(7,'测试项目7','描述','2016-01-01 00:00:00','12312',1,2),(8,'测试项目8','描述','2016-01-01 00:00:00','12312',1,2),(9,'测试项目9','描述','2016-03-22 17:30:33','20',1,0),(10,'测试项目10','描述','2016-03-22 19:03:50','200',1,0),(11,'测试项目11','描述','2016-03-22 19:06:15','30',1,0);
/*!40000 ALTER TABLE `projinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-06 16:49:13
