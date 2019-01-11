-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: aditya2
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lecture_id` int(10) unsigned NOT NULL,
  `stu_id` int(10) unsigned NOT NULL,
  `present` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lecture_id_attendance` (`lecture_id`),
  KEY `fk_stu_id_attendance` (`stu_id`),
  CONSTRAINT `fk_lecture_id_attendance` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`id`),
  CONSTRAINT `fk_stu_id_attendance` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2018-12-31 16:04:51',1,1,0),(2,'2018-12-31 16:04:59',2,1,1),(3,'2019-01-03 08:01:39',3,1,1),(4,'2019-01-05 17:09:59',4,4,1),(5,'2019-01-05 17:09:59',4,5,1),(6,'2019-01-05 17:13:37',5,5,1),(7,'2019-01-05 17:20:48',6,2,1),(8,'2019-01-05 17:20:48',6,1,1),(9,'2019-01-05 17:20:48',6,5,1),(10,'2019-01-05 17:21:31',7,2,1),(11,'2019-01-05 17:21:31',7,1,1),(12,'2019-01-05 17:21:31',7,5,1),(13,'2019-01-05 17:21:41',8,4,1),(14,'2019-01-05 17:21:41',8,1,1),(15,'2019-01-06 07:39:31',9,1,1),(16,'2019-01-06 07:39:31',9,6,1),(17,'2019-01-07 11:56:29',10,1,1),(18,'2019-01-07 12:22:35',11,1,1),(19,'2019-01-07 12:22:35',11,4,1),(20,'2019-01-07 12:37:41',12,1,1),(21,'2019-01-07 12:37:41',12,4,1),(22,'2019-01-07 12:44:24',14,14,1),(23,'2019-01-07 12:44:49',15,14,1),(24,'2019-01-07 12:44:49',15,1,1),(25,'2019-01-07 16:31:14',16,15,1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(20) NOT NULL,
  `syllabus` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'2019-01-07 16:44:47','Accounting','qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'),(2,'2019-01-03 09:02:34','Economics','Introduction, Consumer\'s Equilibrium and Demand, Producer Behaviour and Supply, Forms of Market and Price Determination, National Income and Related Aggregates, Money and Banking, Determination of Income and Employment, Government Budget and the Economy, Balance of Payments'),(3,'2019-01-03 09:06:33','Business Studies','Nature and Significance of Management, Principles of Management, Business Environment, Planning, Organizing, Staffing, Directing, Controlling, Financial Management, Financial Markets, Marketing Management,Consumer Protection'),(4,'2019-01-07 12:34:43','English','yyyyyyyyyyyyy');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `enrollment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` int(10) unsigned NOT NULL,
  `stu_id` int(10) unsigned NOT NULL,
  `batch` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_id_enrollment` (`course_id`),
  KEY `fk_stu_id_enrollment` (`stu_id`),
  CONSTRAINT `fk_course_id_enrollment` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_stu_id_enrollment` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (3,'2018-12-31 15:56:45',3,1,NULL),(9,'2019-01-05 11:13:34',1,5,NULL),(10,'2019-01-05 11:13:34',3,5,NULL),(12,'2019-01-06 02:12:15',1,6,NULL),(13,'2019-01-06 02:12:15',3,6,NULL),(14,'2019-01-06 02:12:15',2,6,NULL),(23,'2019-01-06 10:47:42',1,13,NULL),(24,'2019-01-07 12:21:58',3,14,NULL),(26,'2019-01-07 12:21:58',2,14,NULL),(27,'2019-01-07 12:21:58',4,14,NULL),(28,'2019-01-07 16:28:52',3,15,NULL),(29,'2019-01-07 16:28:52',1,15,NULL),(30,'2019-01-10 14:32:59',3,16,NULL),(31,'2019-01-10 14:32:59',1,16,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_status`
--

DROP TABLE IF EXISTS `fee_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fee_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enrol_id` int(10) unsigned NOT NULL,
  `jan` tinyint(1) DEFAULT '0',
  `feb` tinyint(1) DEFAULT '0',
  `mar` tinyint(1) DEFAULT '0',
  `apr` tinyint(1) DEFAULT '0',
  `may` tinyint(1) DEFAULT '0',
  `jun` tinyint(1) DEFAULT '0',
  `jul` tinyint(1) DEFAULT '0',
  `aug` tinyint(1) DEFAULT '0',
  `sep` tinyint(1) DEFAULT '0',
  `oct` tinyint(1) DEFAULT '0',
  `nov` tinyint(1) DEFAULT '0',
  `decem` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_enrol_id_fee` (`enrol_id`),
  CONSTRAINT `fk_enrol_id_fee` FOREIGN KEY (`enrol_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_status`
--

LOCK TABLES `fee_status` WRITE;
/*!40000 ALTER TABLE `fee_status` DISABLE KEYS */;
INSERT INTO `fee_status` VALUES (3,'2019-01-06 11:03:24',3,1,1,0,0,0,0,0,0,0,0,0,0),(9,'2019-01-05 12:10:35',9,1,1,1,1,1,1,0,0,0,0,0,0),(10,'2019-01-05 11:13:34',10,0,0,0,0,0,0,0,0,0,0,0,0),(12,'2019-01-06 02:12:15',12,0,0,0,0,0,0,0,0,0,0,0,0),(13,'2019-01-06 02:12:15',13,0,0,0,0,0,0,0,0,0,0,0,0),(14,'2019-01-06 02:12:15',14,0,0,0,0,0,0,0,0,0,0,0,0),(23,'2019-01-06 10:47:42',23,0,0,0,0,0,0,0,0,0,0,0,0),(24,'2019-01-07 12:23:48',24,0,1,1,0,0,0,0,0,0,0,0,0),(26,'2019-01-07 12:23:54',26,0,0,0,0,1,0,0,0,0,0,0,0),(27,'2019-01-07 12:23:59',27,0,0,0,0,0,0,0,0,0,0,1,0),(28,'2019-01-07 16:28:52',28,0,0,0,0,0,0,0,0,0,0,0,0),(29,'2019-01-07 16:42:05',29,1,0,0,0,0,0,0,0,0,0,0,0),(30,'2019-01-10 14:32:59',30,0,0,0,0,0,0,0,0,0,0,0,0),(31,'2019-01-10 14:32:59',31,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `fee_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lecture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lecture_date` date NOT NULL,
  `batch` char(6) DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_id_lecture` (`course_id`),
  CONSTRAINT `fk_course_id_lecture` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'2018-12-31 16:03:13','2019-01-01',NULL,1),(2,'2018-12-31 16:03:35','2019-01-01',NULL,2),(3,'2019-01-03 08:01:01','2019-01-02',NULL,2),(4,'2019-01-05 17:09:59','2019-01-05',NULL,1),(5,'2019-01-05 17:13:37','2019-01-04',NULL,1),(6,'2019-01-05 17:20:48','2019-01-04',NULL,3),(7,'2019-01-05 17:21:31','2019-01-05',NULL,2),(8,'2019-01-05 17:21:41','2019-01-04',NULL,4),(9,'2019-01-06 07:39:31','2019-01-06',NULL,3),(10,'2019-01-07 11:56:29','2019-01-09',NULL,3),(11,'2019-01-07 12:22:35','2019-01-10',NULL,1),(12,'2019-01-07 12:37:40','2019-01-08',NULL,1),(13,'2019-01-07 12:40:11','2019-01-08',NULL,1),(14,'2019-01-07 12:44:24','2019-01-08',NULL,1),(15,'2019-01-07 12:44:48','2019-01-10',NULL,3),(16,'2019-01-07 16:31:14','2019-01-10',NULL,1);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stu_id` int(10) unsigned NOT NULL,
  `mobile` char(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stu_id_parent` (`stu_id`),
  CONSTRAINT `fk_stu_id_parent` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (1,'2018-12-31 15:53:37',1,'8620422423','gulati','Rajesh Gulati');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(31) NOT NULL,
  `mobile` char(10) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT 'student.png',
  `active` tinyint(1) DEFAULT '0',
  `batch` char(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `school` varchar(127) DEFAULT NULL,
  `parent` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2019-01-06 09:20:31','Mashoor Gulati','8620422423',NULL,'67890','student.png',1,NULL,'Radha Valley','2018-09-02','Amar Nath','Rajesh Gulati'),(2,'2019-01-06 11:00:05','Gaurang Sharma','1234567890',NULL,'gaurang','student.png',0,NULL,'asdfghjk','2019-01-05','1234567890','Gauri Sharma'),(4,'2019-01-06 02:01:19','Himanshu Goyal','2345678901',NULL,'himanshu','student.png',0,NULL,'kosi','2019-01-07','2345678901','HK Goyal'),(5,'2019-01-06 10:58:33','Rahul Dixit','9638527410',NULL,'rahul','student.png',0,NULL,'Shahjahanpur','2019-01-07','9638527410','RDX'),(6,'2019-01-06 10:58:42','Shailesh Vashishth','7894561230',NULL,'shailesh','student.png',0,NULL,'aligarh','2019-01-07','7894561230','SV Vashishth'),(10,'2019-01-06 02:53:23','iron man','12345',NULL,'ironman','student.png',0,NULL,'fdffdfd','2019-01-06','12345','robert downey sr'),(12,'2019-01-06 02:53:23','captain america','7536',NULL,'7536','student.png',0,NULL,'dff','2019-01-07','7536','steve rogers'),(13,'2019-01-06 10:57:09','Rahul Yadav','1111122222',NULL,'rahul','student.png',0,NULL,'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq','2019-01-07','1111122222','qwerty'),(14,'2019-01-07 12:21:58','baby','2222255555',NULL,'12345','student.png',1,NULL,'kosi','2019-01-10','2222255555','baba'),(15,'2019-01-07 16:28:52','ankit','9999999999',NULL,'12345','student.png',1,NULL,'xc5nhunbbrttyu','2019-01-07','9999999999','akash'),(16,'2019-01-10 14:32:59','rrr','7676767676','raghav.agrawal_cs16@gla.ac.in','12345','student.png',1,NULL,'sadad\r\n','2019-01-18','7676767676','ttt');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_user`
--

DROP TABLE IF EXISTS `super_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `super_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(31) NOT NULL,
  `mobile` char(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_user`
--

LOCK TABLES `super_user` WRITE;
/*!40000 ALTER TABLE `super_user` DISABLE KEYS */;
INSERT INTO `super_user` VALUES (1,'2019-01-07 16:47:45','piyush','8273301369','12345');
/*!40000 ALTER TABLE `super_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_date` date NOT NULL,
  `batch_time` varchar(15) DEFAULT NULL,
  `test_time` varchar(15) DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `batch` char(6) DEFAULT NULL,
  `max_marks` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_id_test` (`course_id`),
  CONSTRAINT `fk_course_id_test` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2018-12-31 16:07:50','2018-12-31',NULL,NULL,2,NULL,100),(2,'2019-01-04 08:27:39','2019-01-06',NULL,NULL,2,NULL,100),(3,'2019-01-04 08:28:46','2019-01-05',NULL,NULL,4,NULL,70),(4,'2019-01-06 07:40:12','2019-01-08',NULL,NULL,3,NULL,80),(5,'2019-01-06 09:01:39','2019-01-09',NULL,'03:00',1,NULL,150),(6,'2019-01-07 12:23:11','2019-01-11',NULL,NULL,3,NULL,80),(7,'2019-01-07 16:40:40','2019-01-09',NULL,NULL,4,NULL,100),(8,'2019-01-09 11:22:32','2019-01-26','04:00','03:00',3,NULL,50);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_id` int(10) unsigned NOT NULL,
  `stu_id` int(10) unsigned NOT NULL,
  `marks_obtained` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_id_test_result` (`test_id`),
  KEY `fk_stu_id_test_result` (`stu_id`),
  CONSTRAINT `fk_stu_id_test_result` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_test_id_test_result` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
INSERT INTO `test_result` VALUES (1,'2018-12-31 16:08:57',1,1,95),(2,'2019-01-05 10:03:05',3,1,60),(3,'2019-01-05 10:03:05',3,4,25),(4,'2019-01-05 10:03:44',2,1,85),(5,'2019-01-05 10:03:44',2,2,11),(6,'2019-01-06 07:40:59',4,1,69),(7,'2019-01-06 07:40:59',4,5,59),(8,'2019-01-06 07:40:59',4,6,49),(9,'2019-01-06 11:05:41',4,1,0),(10,'2019-01-07 12:33:44',6,1,0),(11,'2019-01-07 12:33:44',6,14,69),(12,'2019-01-07 16:43:59',7,1,5),(13,'2019-01-07 16:44:00',7,4,0);
/*!40000 ALTER TABLE `test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `timetable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` int(10) unsigned NOT NULL,
  `img` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_id_timetable` (`course_id`),
  CONSTRAINT `fk_course_id_timetable` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'2019-01-07 16:45:45',1,'upload_7013239f819cc0633cb059e1b0dd1c0f'),(2,'2019-01-06 11:07:04',2,'upload_873b621714e00d3b134c9d4c641b8545'),(3,'2019-01-06 11:06:47',3,'upload_8eb6dafef473cadbf9fd9dd98b9358c6'),(4,'2019-01-06 11:07:42',4,'upload_0b81a0fc10f626383aada64db40295f6');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-11 12:59:34
