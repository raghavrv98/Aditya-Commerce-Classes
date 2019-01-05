-- MySQL dump 10.11
--
-- Host: localhost    Database: aditya
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lecture_id` int(10) unsigned NOT NULL,
  `stu_id` int(10) unsigned NOT NULL,
  `present` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_lecture_id_attendance` (`lecture_id`),
  KEY `fk_stu_id_attendance` (`stu_id`),
  CONSTRAINT `fk_lecture_id_attendance` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`id`),
  CONSTRAINT `fk_stu_id_attendance` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2018-12-31 16:04:51',1,1,0),(2,'2018-12-31 16:04:59',2,1,1),(3,'2019-01-03 08:01:39',3,1,1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `name` varchar(20) NOT NULL,
  `syllabus` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'2019-01-03 08:54:52','Accounting','Financial Statements of Not-for-Profit Organizations, Accounting for Partnership Firms, Accounting for Companies, Analysis of Financial Statements, Cash Flow Statement'),(2,'2019-01-03 09:02:34','Economics','Introduction, Consumer\'s Equilibrium and Demand, Producer Behaviour and Supply, Forms of Market and Price Determination, National Income and Related Aggregates, Money and Banking, Determination of Income and Employment, Government Budget and the Economy, Balance of Payments'),(3,'2019-01-03 09:06:33','Business Studies','Nature and Significance of Management, Principles of Management, Business Environment, Planning, Organizing, Staffing, Directing, Controlling, Financial Management, Financial Markets, Marketing Management,Consumer Protection'),(4,'2019-01-04 09:05:28','English','Reading Comprehension, Writing Skills, Literature & Long Reading Text');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE `enrollment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `course_id` int(10) unsigned NOT NULL,
  `stu_id` int(10) unsigned NOT NULL,
  `batch` char(6) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_course_id_enrollment` (`course_id`),
  KEY `fk_stu_id_enrollment` (`stu_id`),
  CONSTRAINT `fk_course_id_enrollment` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_stu_id_enrollment` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,'2018-12-31 15:56:32',1,1,NULL),(2,'2018-12-31 15:56:41',2,1,NULL),(3,'2018-12-31 15:56:45',3,1,NULL),(4,'2018-12-31 15:56:52',4,1,NULL),(5,'2019-01-04 07:00:11',2,2,NULL),(6,'2019-01-04 07:00:19',3,2,NULL),(7,'2019-01-04 07:11:29',1,4,NULL),(8,'2019-01-04 07:11:29',4,4,NULL),(9,'2019-01-05 11:13:34',1,5,NULL),(10,'2019-01-05 11:13:34',3,5,NULL),(11,'2019-01-05 11:13:34',2,5,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_status`
--

DROP TABLE IF EXISTS `fee_status`;
CREATE TABLE `fee_status` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `enrol_id` int(10) unsigned NOT NULL,
  `jan` tinyint(1) default '0',
  `feb` tinyint(1) default '0',
  `mar` tinyint(1) default '0',
  `apr` tinyint(1) default '0',
  `may` tinyint(1) default '0',
  `jun` tinyint(1) default '0',
  `jul` tinyint(1) default '0',
  `aug` tinyint(1) default '0',
  `sep` tinyint(1) default '0',
  `oct` tinyint(1) default '0',
  `nov` tinyint(1) default '0',
  `decem` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `fk_enrol_id_fee` (`enrol_id`),
  CONSTRAINT `fk_enrol_id_fee` FOREIGN KEY (`enrol_id`) REFERENCES `enrollment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_status`
--

LOCK TABLES `fee_status` WRITE;
/*!40000 ALTER TABLE `fee_status` DISABLE KEYS */;
INSERT INTO `fee_status` VALUES (1,'2019-01-05 11:02:42',1,0,0,0,0,0,0,0,0,0,0,0,0),(2,'2019-01-05 11:02:45',2,0,0,0,0,0,0,0,0,0,0,0,0),(3,'2019-01-05 11:02:47',3,0,0,0,0,0,0,0,0,0,0,0,0),(4,'2019-01-05 11:02:51',4,0,0,0,0,0,0,0,0,0,0,0,0),(5,'2019-01-05 11:02:53',5,0,0,0,0,0,0,0,0,0,0,0,0),(6,'2019-01-05 11:02:56',6,0,0,0,0,0,0,0,0,0,0,0,0),(7,'2019-01-05 11:02:58',7,0,0,0,0,0,0,0,0,0,0,0,0),(8,'2019-01-05 11:03:02',8,0,0,0,0,0,0,0,0,0,0,0,0),(9,'2019-01-05 12:10:35',9,1,1,1,1,1,1,0,0,0,0,0,0),(10,'2019-01-05 11:13:34',10,0,0,0,0,0,0,0,0,0,0,0,0),(11,'2019-01-05 11:13:34',11,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `fee_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lecture_date` date NOT NULL,
  `batch` char(6) default NULL,
  `course_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_course_id_lecture` (`course_id`),
  CONSTRAINT `fk_course_id_lecture` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'2018-12-31 16:03:13','2019-01-01',NULL,1),(2,'2018-12-31 16:03:35','2019-01-01',NULL,2),(3,'2019-01-03 08:01:01','2019-01-02',NULL,2);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `stu_id` int(10) unsigned NOT NULL,
  `mobile` char(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(31) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_stu_id_parent` (`stu_id`),
  CONSTRAINT `fk_stu_id_parent` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `name` varchar(31) NOT NULL,
  `mobile` char(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) default 'student.png',
  `active` tinyint(1) default '0',
  `batch` char(6) default NULL,
  `address` varchar(255) default NULL,
  `joining_date` date default NULL,
  `school` varchar(127) default NULL,
  `parent` varchar(31) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2019-01-04 06:31:49','Mashoor Gulati','8620422423','gulati','student.png',1,NULL,'Radha Valley','2018-09-02','Amar Nath','Rajesh Gulati'),(2,'2019-01-04 06:55:07','Gaurang Sharma','1234567890','gaurang','student.png',1,NULL,'asdfghjk','2019-01-05','1234567890','Gauri Sharma'),(4,'2019-01-04 07:11:29','Himanshu Goyal','2345678901','himanshu','student.png',1,NULL,'kosi','2019-01-07','2345678901','HK Goyal'),(5,'2019-01-05 11:13:33','Rahul Dixit','9638527410','rahul','student.png',1,NULL,'Shahjahanpur','2019-01-07','9638527410','RDX');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_user`
--

DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `name` varchar(31) NOT NULL,
  `mobile` char(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `super_user`
--

LOCK TABLES `super_user` WRITE;
/*!40000 ALTER TABLE `super_user` DISABLE KEYS */;
INSERT INTO `super_user` VALUES (1,'2018-12-31 11:05:22','piyush','8273301369','piyushisgreat');
/*!40000 ALTER TABLE `super_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `test_date` date NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `batch` char(6) default NULL,
  `max_marks` int(4) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_course_id_test` (`course_id`),
  CONSTRAINT `fk_course_id_test` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2018-12-31 16:07:50','2018-12-31',2,NULL,100),(2,'2019-01-04 08:27:39','2019-01-06',2,NULL,100),(3,'2019-01-04 08:28:46','2019-01-05',4,NULL,70);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
CREATE TABLE `test_result` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `test_id` int(10) unsigned NOT NULL,
  `stu_id` int(10) unsigned NOT NULL,
  `marks_obtained` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_test_id_test_result` (`test_id`),
  KEY `fk_stu_id_test_result` (`stu_id`),
  CONSTRAINT `fk_stu_id_test_result` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_test_id_test_result` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
INSERT INTO `test_result` VALUES (1,'2018-12-31 16:08:57',1,1,95),(2,'2019-01-05 10:03:05',3,1,60),(3,'2019-01-05 10:03:05',3,4,25),(4,'2019-01-05 10:03:44',2,1,85),(5,'2019-01-05 10:03:44',2,2,11);
/*!40000 ALTER TABLE `test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `course_id` int(10) unsigned NOT NULL,
  `img` varchar(63) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_course_id_timetable` (`course_id`),
  CONSTRAINT `fk_course_id_timetable` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'2019-01-05 07:13:03',1,'upload_1d9cad1a092559d12d71c5e63560b36f'),(2,'2019-01-05 07:13:35',2,'upload_a4ba2215eafc9b26b94230a15bce40a6'),(3,'2019-01-05 07:13:24',3,'upload_e502ef976b3a556c8ae2bdc697dda55e'),(4,'2019-01-05 07:14:13',4,'upload_833fca44443a0f6daed81af73659e79f');
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

-- Dump completed on 2019-01-05 12:44:13
