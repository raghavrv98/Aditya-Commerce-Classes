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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2018-12-31 16:04:51',1,1,0),(2,'2018-12-31 16:04:59',2,1,1);
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
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'2018-12-31 15:55:06','Accounting'),(2,'2018-12-31 15:55:15','Economics'),(3,'2018-12-31 15:55:25','Business Studies'),(4,'2018-12-31 15:55:31','English');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,'2018-12-31 15:56:32',1,1,NULL),(2,'2018-12-31 15:56:41',2,1,NULL),(3,'2018-12-31 15:56:45',3,1,NULL),(4,'2018-12-31 15:56:52',4,1,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_status`
--

DROP TABLE IF EXISTS `fee_status`;
CREATE TABLE `fee_status` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `stu_id` int(10) unsigned NOT NULL,
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
  KEY `fk_stu_id_fee` (`stu_id`),
  CONSTRAINT `fk_stu_id_fee` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_status`
--

LOCK TABLES `fee_status` WRITE;
/*!40000 ALTER TABLE `fee_status` DISABLE KEYS */;
INSERT INTO `fee_status` VALUES (1,'2018-12-31 16:00:32',1,1,1,1,0,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'2018-12-31 16:03:13','2019-01-01',NULL,1),(2,'2018-12-31 16:03:35','2019-01-01',NULL,2);
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
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creation_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `name` varchar(127) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'2018-12-31 15:46:58','Delhi Public School');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
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
  `school_id` int(10) unsigned default NULL,
  `address` varchar(255) default NULL,
  `dob` date default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_mobile` (`mobile`),
  KEY `fk_school_id_student` (`school_id`),
  CONSTRAINT `fk_school_id_student` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2018-12-31 15:51:15','Mashoor Gulati','8620422423','gulati','student.png',1,NULL,1,'Radha Valley','1998-12-12');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2018-12-31 16:07:50','2018-12-31',2,NULL,100);
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
  CONSTRAINT `fk_test_id_test_result` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`),
  CONSTRAINT `fk_stu_id_test_result` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
INSERT INTO `test_result` VALUES (1,'2018-12-31 16:08:57',1,1,95);
/*!40000 ALTER TABLE `test_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-31 16:13:24
