-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: aditya
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_status`
--

LOCK TABLES `fee_status` WRITE;
/*!40000 ALTER TABLE `fee_status` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_user`
--

LOCK TABLES `super_user` WRITE;
/*!40000 ALTER TABLE `super_user` DISABLE KEYS */;
INSERT INTO `super_user` VALUES (2,'2019-01-29 11:53:28','Aditya Jain','9897165055','adityaayushijiya');
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
  `course_id` int(10) unsigned NOT NULL,
  `batch` char(6) DEFAULT NULL,
  `max_marks` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_id_test` (`course_id`),
  CONSTRAINT `fk_course_id_test` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
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

-- Dump completed on 2019-01-29 17:28:28
