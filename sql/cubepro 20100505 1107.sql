-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.12-beta-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cubepro
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ cubepro;
USE cubepro;

--
-- Table structure for table `cubepro`.`asset_and_liability`
--

DROP TABLE IF EXISTS `asset_and_liability`;
CREATE TABLE `asset_and_liability` (
  `ass_and_lia_id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(100) default NULL,
  `al_date` varchar(12) default NULL,
  `year` varchar(4) default NULL,
  `amount` varchar(45) default NULL,
  `al_desc` varchar(100) default NULL,
  `sub_type` varchar(100) default NULL,
  PRIMARY KEY  (`ass_and_lia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`asset_and_liability`
--

/*!40000 ALTER TABLE `asset_and_liability` DISABLE KEYS */;
INSERT INTO `asset_and_liability` (`ass_and_lia_id`,`type`,`al_date`,`year`,`amount`,`al_desc`,`sub_type`) VALUES 
 (4,'ASSET','01/01/2010','2009','100000.00','Table Cost','FIXED ASSET'),
 (5,'LIABILITY','01/01/2010','2009','20000','Excess in Capital','CAPITAL'),
 (6,'BUDGET','01/01/2010','2009','200000','Excess in Capital','MANAGEMENT A/C'),
 (7,'ASSET','01/01/2010','','230.1','Monthly Fees',''),
 (8,'LIABILITY','01/01/2010','','230.1','Monthly Fees',''),
 (9,'BUDGET','01/01/2010','2010','1524150','Computer Cost','MANAGEMENT A/C'),
 (10,'ASSET','03/05/2010','','10000.0','fan','');
/*!40000 ALTER TABLE `asset_and_liability` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `bank_name` varchar(300) default NULL,
  `acc_no` varchar(45) default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`bank`
--

/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` (`id`,`bank_name`,`acc_no`,`status`) VALUES 
 (1,'ICICI BANK ','2141654TC','ACTIVE'),
 (2,'INDIAN BANK','63215TC','ACTIVE'),
 (3,'IOB ','1245688','ACTIVE');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`bank_acc_details`
--

DROP TABLE IF EXISTS `bank_acc_details`;
CREATE TABLE `bank_acc_details` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `bank_id` int(10) unsigned default NULL,
  `payment_type` varchar(45) default NULL,
  `type` varchar(45) default NULL,
  `amt` varchar(45) default NULL,
  `remarks` varchar(300) default NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`bank_acc_details`
--

/*!40000 ALTER TABLE `bank_acc_details` DISABLE KEYS */;
INSERT INTO `bank_acc_details` (`id`,`bank_id`,`payment_type`,`type`,`amt`,`remarks`,`date`) VALUES 
 (1,1,'CASH','DEPOSIT','2500','','01/01/2009'),
 (2,1,'CASH','DEPOSIT','2500','','01/01/2009'),
 (3,1,'CHEQUE','DEPOSIT','1000','after 4day ','2.5.2010');
/*!40000 ALTER TABLE `bank_acc_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`class_details`
--

DROP TABLE IF EXISTS `class_details`;
CREATE TABLE `class_details` (
  `class_id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key of Class Details table',
  `class_name` varchar(10) NOT NULL COMMENT 'Name of the class',
  `no_of_students` int(10) unsigned NOT NULL COMMENT 'Total no of students in a class',
  `section_name` varchar(2) NOT NULL COMMENT 'Section Name of the class',
  `staff_in_charge_id` varchar(45) default NULL COMMENT 'Staff Id of the staff incharge',
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This Contains the Class List';

--
-- Dumping data for table `cubepro`.`class_details`
--

/*!40000 ALTER TABLE `class_details` DISABLE KEYS */;
INSERT INTO `class_details` (`class_id`,`class_name`,`no_of_students`,`section_name`,`staff_in_charge_id`,`status`) VALUES 
 (1,'X',50,'A','MS. PRIYA','ACTIVE'),
 (3,'X',50,'B','MS. DEVI','ACTIVE'),
 (4,'X',51,'C','MR. TAGOORE','ACTIVE'),
 (5,'X',26,'D','SATISH','ACTIVE');
/*!40000 ALTER TABLE `class_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`course_details`
--

DROP TABLE IF EXISTS `course_details`;
CREATE TABLE `course_details` (
  `course_id` int(10) unsigned NOT NULL auto_increment,
  `course_name` varchar(45) NOT NULL,
  `course_fee` double NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`course_details`
--

/*!40000 ALTER TABLE `course_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`exam_details`
--

DROP TABLE IF EXISTS `exam_details`;
CREATE TABLE `exam_details` (
  `exam_id` int(10) unsigned NOT NULL auto_increment,
  `class_id` int(10) unsigned NOT NULL,
  `exam_type` varchar(45) NOT NULL,
  `subject_name` varchar(45) default NULL,
  `date_of_exam` datetime default NULL,
  `create_date` datetime default NULL,
  `create_user_id` int(10) unsigned default NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`exam_id`),
  KEY `FK_exam_details_class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`exam_details`
--

/*!40000 ALTER TABLE `exam_details` DISABLE KEYS */;
INSERT INTO `exam_details` (`exam_id`,`class_id`,`exam_type`,`subject_name`,`date_of_exam`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status`) VALUES 
 (1,4,'QUARTELY','Maths','2000-01-01 00:00:00','2000-01-01 00:00:00',1,'2000-01-01 00:00:00',1,'IN-ACTIVE'),
 (2,3,'QUARTELY',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE'),
 (3,4,'QUARTELY',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE');
/*!40000 ALTER TABLE `exam_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`exam_time_table`
--

DROP TABLE IF EXISTS `exam_time_table`;
CREATE TABLE `exam_time_table` (
  `exam_time_table_id` int(10) unsigned NOT NULL auto_increment,
  `exam_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `exam_date` datetime default NULL,
  `time_from` varchar(10) default NULL,
  `time_to` varchar(10) default NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`exam_time_table_id`),
  KEY `FK_exam_time_table_1` (`class_id`),
  KEY `FK_extime_table_2` (`exam_id`),
  KEY `FK_exime_table_3` (`subject_id`),
  CONSTRAINT `FK_exam_time_table_1` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`),
  CONSTRAINT `FK_exime_table_3` FOREIGN KEY (`subject_id`) REFERENCES `subject_details` (`subject_id`),
  CONSTRAINT `FK_extime_table_2` FOREIGN KEY (`exam_id`) REFERENCES `exam_details` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`exam_time_table`
--

/*!40000 ALTER TABLE `exam_time_table` DISABLE KEYS */;
INSERT INTO `exam_time_table` (`exam_time_table_id`,`exam_id`,`class_id`,`subject_id`,`exam_date`,`time_from`,`time_to`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1,1,1,1,'2009-01-01 00:00:00','1100','1200','2009-11-28 23:36:03',1,NULL,NULL),
 (2,1,1,1,'2009-01-01 00:00:00','1200','1300','2009-11-28 23:22:24',1,NULL,NULL),
 (3,1,1,2,'2009-01-01 00:00:00','09:30','12:30','2009-12-14 15:55:11',1,NULL,NULL),
 (4,1,1,3,'2009-01-12 00:00:00','09:30','12:30','2009-12-14 15:55:29',1,NULL,NULL);
/*!40000 ALTER TABLE `exam_time_table` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`fees_details`
--

DROP TABLE IF EXISTS `fees_details`;
CREATE TABLE `fees_details` (
  `fees_id` int(10) unsigned NOT NULL auto_increment,
  `class_id` int(10) unsigned NOT NULL,
  `fees_amount` double NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `fees_type` varchar(45) default NULL,
  `sub_type` varchar(45) default NULL,
  `paid_by` varchar(45) default NULL,
  `pay_by` varchar(45) default NULL,
  `cheq_no` varchar(45) default NULL,
  `fine` varchar(45) default NULL,
  `student_type` varchar(45) default NULL,
  PRIMARY KEY  (`fees_id`),
  KEY `FK_fees_details_class` (`class_id`),
  CONSTRAINT `FK_fees_details_class` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`fees_details`
--

/*!40000 ALTER TABLE `fees_details` DISABLE KEYS */;
INSERT INTO `fees_details` (`fees_id`,`class_id`,`fees_amount`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`cheq_no`,`fine`,`student_type`) VALUES 
 (1,1,675.25,'2010-01-01 00:00:00',1,NULL,NULL,'Class Fee','',NULL,NULL,NULL,NULL,NULL),
 (2,1,250.25,'2010-01-01 00:00:00',1,NULL,NULL,'Tution Fee','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fees_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`fees_master`
--

DROP TABLE IF EXISTS `fees_master`;
CREATE TABLE `fees_master` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fees_type` varchar(45) default NULL,
  `fees_name` varchar(45) default NULL,
  `fees_amt` varchar(45) default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`fees_master`
--

/*!40000 ALTER TABLE `fees_master` DISABLE KEYS */;
INSERT INTO `fees_master` (`id`,`fees_type`,`fees_name`,`fees_amt`,`status`) VALUES 
 (1,'TERM FEES','HALF YEARLY','250.14','ACTIVE'),
 (2,'TERM FEES','QUAR','250.14','ACTIVE'),
 (3,'TERM FEES','ANNUALY','250.14','ACTIVE'),
 (4,'EXAM FEES','1ST MITT','500','ACTIVE');
/*!40000 ALTER TABLE `fees_master` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
CREATE TABLE `invoice_details` (
  `invoice_id` int(10) unsigned NOT NULL auto_increment,
  `fees_id` int(10) unsigned default NULL,
  `invoice_no` varchar(10) NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `invoice_date` datetime NOT NULL,
  `total_amt_paid` double NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `fees_type` varchar(45) default NULL,
  `sub_type` varchar(45) default NULL,
  `paid_by` varchar(45) default NULL,
  `pay_by` varchar(45) default NULL,
  `chq_no` varchar(45) default NULL,
  `fine` varchar(45) default NULL,
  `student_type` varchar(45) default NULL,
  `fees_date` varchar(45) default NULL,
  PRIMARY KEY  (`invoice_id`),
  KEY `FK_invoice_details_1` (`student_id`),
  KEY `FK_invoice_details_2` (`fees_id`),
  CONSTRAINT `FK_invoice_details_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`invoice_details`
--

/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`) VALUES 
 (1,1,'300012345',1,'2009-11-29 14:10:31',200.5,'2009-11-29 14:10:31',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (2,1,'30012542',3,'2009-11-29 14:21:10',200,'2009-11-29 14:21:10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (3,2,'30012542',3,'2009-11-29 14:23:18',100,'2009-11-29 14:23:18',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (4,2,'30012542',3,'2009-11-29 14:24:26',100,'2009-11-29 14:24:26',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (5,2,'30012542',3,'2009-11-29 14:25:09',100,'2009-11-29 14:25:09',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (6,2,'30012542',3,'2009-11-29 14:25:31',100,'2009-11-29 14:25:31',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (7,2,'30012542',2,'2009-11-29 14:25:47',100,'2009-11-29 14:25:47',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (8,2,'30012542',2,'2009-11-29 14:25:56',200,'2009-11-29 14:25:56',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`) VALUES 
 (9,1,'30012542',2,'2009-11-29 14:26:06',100,'2009-11-29 14:26:06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,1,'30015245',3,'2009-11-29 14:32:34',110,'2009-11-29 14:32:34',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (11,2,'30015245',3,'2009-11-29 14:33:09',220,'2009-11-29 14:33:09',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (12,2,'30015245',3,'2009-11-29 14:33:41',220,'2009-11-29 14:33:41',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (13,2,'30015245',3,'2009-11-29 14:33:43',220,'2009-11-29 14:33:43',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (14,2,'30015245',3,'2009-11-29 14:38:02',100,'2009-11-29 14:38:02',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (15,1,'30012543',2,'2009-12-14 15:57:50',100,'2009-12-14 15:57:50',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (16,0,'WA2yGc',1,'2010-04-18 13:34:18',250.1,'2010-04-18 13:34:18',1,NULL,NULL,'TERM FEES','HALF YEARLY','','CASH','','','NEW',NULL);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`) VALUES 
 (17,0,'WA2yGc',1,'2010-04-18 13:34:18',250.1,'2010-04-18 13:34:18',1,NULL,NULL,'TERM FEES','HALF YEARLY','','CASH','','','NEW',NULL),
 (18,0,'fxiGqW',7,'2010-04-18 13:35:52',250.1,'2010-04-18 13:35:52',1,NULL,NULL,'TERM FEES','HALF YEARLY','','CASH','','','NEW',NULL),
 (19,0,'fxiGqW',6,'2010-04-18 13:38:21',250.1,'2010-04-18 13:38:21',1,NULL,NULL,'TERM FEES','HALF YEARLY','SATISH','CASH','2512541254','12','NEW',NULL),
 (20,0,'mQ0wyy',6,'2010-04-18 13:38:35',100.1,'2010-04-18 13:38:35',1,NULL,NULL,'TERM FEES','QUARTELY','SATISH','CASH','2512541254','','NEW',NULL),
 (21,0,'30012542',6,'2010-04-18 13:38:54',100.1,'2010-04-18 13:38:54',1,NULL,NULL,'TERM FEES','QUARTELY','SATISH','CASH','2512541254','','NEW',NULL),
 (22,0,'YS8UdW',10,'2010-04-18 13:43:06',100.1,'2010-04-18 13:43:06',1,NULL,NULL,'TERM FEES','HALF YEARLY','satish','CASH','251214523','20','NA',NULL),
 (23,0,'S47vM5B5',10,'2010-04-18 13:50:43',250.01,'2010-04-18 13:50:43',1,NULL,NULL,'TERM FEES','HALF YEARLY','satish','CASH','','','NEW','02/02/2009');
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`) VALUES 
 (24,0,'1YNvyqSj',1,'2010-05-03 11:29:54',200,'2010-05-03 11:29:54',1,NULL,NULL,'TERM FEES','HALF YEARLY','guru','CASH','','','NA','10122010'),
 (25,0,'1YNvyqSj',1,'2010-05-03 11:31:02',200,'2010-05-03 11:31:02',1,NULL,NULL,'TERM FEES','HALF YEARLY','guru','CASH','','','NA','10122010'),
 (26,0,'1YNvyqSj',1,'2010-05-03 11:33:55',200,'2010-05-03 11:33:55',1,NULL,NULL,'TERM FEES','HALF YEARLY','guru','CASH','10020','100','NEW','10122010'),
 (27,0,'1YNvyqSj',1,'2010-05-03 11:34:17',200,'2010-05-03 11:34:17',1,NULL,NULL,'TERM FEES','HALF YEARLY','guru','CASH','10020','100','NEW','10122010'),
 (28,0,'30021542',1,'2010-05-05 08:32:20',250,'2010-05-05 08:32:20',1,NULL,NULL,'TERM FEES','HALF YEARLY','','CASH','','','NA','01/01/2009');
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`login_details`
--

DROP TABLE IF EXISTS `login_details`;
CREATE TABLE `login_details` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`login_details`
--

/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` (`user_id`,`user_name`,`password`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status`) VALUES 
 (1,'cubepro','4f8cbf55073c0c9f7e595fd44c38ba42','2009-10-01 00:00:00',1,NULL,NULL,'ACTIVE');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`mark_details`
--

DROP TABLE IF EXISTS `mark_details`;
CREATE TABLE `mark_details` (
  `mark_id` int(10) unsigned NOT NULL auto_increment,
  `exam_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `mark_obtained` double default NULL,
  `max_marks` double NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`mark_id`),
  KEY `FK_mark_details_class` (`class_id`),
  KEY `FK_mark_details_student` (`student_id`),
  KEY `FK_mark_details_exam` (`exam_id`),
  CONSTRAINT `FK_mark_details_class` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`),
  CONSTRAINT `FK_mark_details_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam_details` (`exam_id`),
  CONSTRAINT `FK_mark_details_student` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`mark_details`
--

/*!40000 ALTER TABLE `mark_details` DISABLE KEYS */;
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (33,1,1,1,1,71,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (34,1,1,1,2,72,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (35,1,1,1,3,85,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (36,1,1,1,4,55,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (37,1,2,1,1,42,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (38,1,2,1,2,48,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (39,1,2,1,3,15,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (40,1,2,1,4,88,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (41,1,3,1,1,90,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (42,1,3,1,2,90,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (43,1,3,1,3,90,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (44,1,3,1,4,90,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (45,1,4,1,1,45,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (46,1,4,1,2,24,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (47,1,4,1,3,14,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (48,1,4,1,4,15,100,'2010-05-05 10:51:08',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (49,1,5,1,1,50,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (50,1,5,1,2,50,100,'2010-05-05 10:51:08',1,NULL,NULL),
 (51,1,5,1,3,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (52,1,5,1,4,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (53,1,6,1,1,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (54,1,6,1,2,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (55,1,6,1,3,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (56,1,6,1,4,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (57,1,7,1,1,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (58,1,7,1,2,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (59,1,7,1,3,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (60,1,7,1,4,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (61,1,8,1,1,50,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (62,1,8,1,2,25,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (63,1,8,1,3,15,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (64,1,8,1,4,15,100,'2010-05-05 10:51:09',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (65,1,9,1,1,75,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (66,1,9,1,2,52,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (67,1,9,1,3,15,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (68,1,9,1,4,15,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (69,1,10,1,1,95,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (70,1,10,1,2,59,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (71,1,10,1,3,95,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (72,1,10,1,4,95,100,'2010-05-05 10:51:09',1,NULL,NULL),
 (73,1,11,1,1,95,100,'2010-05-05 10:51:10',1,NULL,NULL),
 (74,1,11,1,2,59,100,'2010-05-05 10:51:10',1,NULL,NULL),
 (75,1,11,1,3,59,100,'2010-05-05 10:51:10',1,NULL,NULL),
 (76,1,11,1,4,59,100,'2010-05-05 10:51:10',1,NULL,NULL);
/*!40000 ALTER TABLE `mark_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`report_category`
--

DROP TABLE IF EXISTS `report_category`;
CREATE TABLE `report_category` (
  `category_id` int(10) unsigned NOT NULL auto_increment,
  `category_name` varchar(45) default NULL,
  `category_desc` varchar(45) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`report_category`
--

/*!40000 ALTER TABLE `report_category` DISABLE KEYS */;
INSERT INTO `report_category` (`category_id`,`category_name`,`category_desc`) VALUES 
 (1,'Student Reports','Reports Related to Students'),
 (2,'Printable Reports','Reports to Print'),
 (3,'General Reports','General Reports'),
 (4,'Staff Reports','Reports Related to Staff');
/*!40000 ALTER TABLE `report_category` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`report_parameters`
--

DROP TABLE IF EXISTS `report_parameters`;
CREATE TABLE `report_parameters` (
  `rpt_id` int(10) unsigned NOT NULL,
  `report_id` int(10) unsigned NOT NULL,
  `param_type` varchar(45) NOT NULL,
  `param_size` int(10) unsigned NOT NULL,
  `param_maxlength` int(10) unsigned NOT NULL,
  `param_name` varchar(45) NOT NULL,
  `param_position` varchar(45) NOT NULL,
  `param_jsonclick` varchar(45) NOT NULL,
  `param_query` varchar(500) NOT NULL,
  `param_isCombo` int(10) unsigned NOT NULL,
  `param_value` varchar(45) NOT NULL,
  PRIMARY KEY  (`rpt_id`,`param_query`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`report_parameters`
--

/*!40000 ALTER TABLE `report_parameters` DISABLE KEYS */;
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (1,1,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (2,2,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'ClassId'),
 (3,3,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (4,3,'date',11,11,'Absent Date','2','','',0,'date'),
 (5,5,'date',11,11,'Absent Date','1',' ',' ',0,'date'),
 (6,4,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (7,6,'combo',11,11,'Class With Section','3',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (8,6,'date',11,11,'From Date','1',' ','',0,'Start_Date');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (9,6,'date',11,11,'To Date','2',' ','',0,'End_Date'),
 (10,7,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (11,8,'text',11,11,'Student Name','1',' ',' ',0,'Student_Name'),
 (12,9,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId');
/*!40000 ALTER TABLE `report_parameters` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `report_id` int(10) unsigned NOT NULL auto_increment,
  `report_name` varchar(45) NOT NULL,
  `report_desc` varchar(150) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `report_action` varchar(100) NOT NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`reports`
--

/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (1,'Student Detail Report','List of Students available for the particular class',1,'/reports/cubepro/StudentDetailReport'),
 (2,'Class Wise Subject Detail Report','List of Subjects for a particular class',3,'/reports/cubepro/SubjectDetailReport'),
 (3,'Student Absent Detail Report','List Of Student Absent in a Class',1,'/reports/cubepro/StudentAttDetailReport'),
 (4,'Staff Detail Report','List of Staffs available',4,'/reports/cubepro/StaffDetailReport'),
 (5,'Staff Absent Detail Report','List Of Staff Absent for a particular day',4,'/reports/cubepro/StaffAttDetailReport'),
 (6,'Class Wise Attendance Summary ','Class Wise Attendance Summary',3,'/reports/cubepro/ClassWiseAtt'),
 (7,'Staff Salary Report','Staff Salary Report',4,'/reports/cubepro/StaffSalaryReport'),
 (8,'Student Mark Sheet Report','Print Student Mark based on the student Name',2,'/reports/cubepro/SubjectMarksReport'),
 (9,'Student Mark List Report','List of Marks obtained by student',1,'/reports/cubepro/StudentMarkDetailReport');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`school_details`
--

DROP TABLE IF EXISTS `school_details`;
CREATE TABLE `school_details` (
  `school_id` int(10) unsigned NOT NULL auto_increment,
  `school_name` varchar(45) NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) default NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `phoneNo1` varchar(45) default NULL,
  `phoneNo2` varchar(45) default NULL,
  `mobileNo` varchar(45) default NULL,
  `faxNo` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `website` varchar(45) default NULL,
  `classes` varchar(45) default NULL,
  `division` varchar(45) default NULL,
  `category` varchar(45) default NULL,
  `sub_category` varchar(45) default NULL,
  `govt_reg_no` varchar(45) default NULL,
  `validity_date` varchar(45) default NULL,
  `corres_name` varchar(45) default NULL,
  `principal` varchar(45) default NULL,
  `headmaster_name` varchar(45) default NULL,
  `mgmt_name` varchar(45) default NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY  (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`school_details`
--

/*!40000 ALTER TABLE `school_details` DISABLE KEYS */;
INSERT INTO `school_details` (`school_id`,`school_name`,`address1`,`address2`,`city`,`state`,`country`,`zipCode`,`phoneNo1`,`phoneNo2`,`mobileNo`,`faxNo`,`email`,`website`,`classes`,`division`,`category`,`sub_category`,`govt_reg_no`,`validity_date`,`corres_name`,`principal`,`headmaster_name`,`mgmt_name`,`logo`) VALUES 
 (1,'St. Joseph Matric. Hr. Sec. School','22, Aziz Mulk Lane,','Thousand Lights,','CHENNAI','TAMILNADU','INDIA','600 006','044 45042225','9841152904','9841152904','044 45042225','contact@cubicletech.com','www.cubicletech.com','i-x','HSC','StateBoard','Trust','15245-V244','01/01/2009','kumaran','satish','pandian','truth','C:\\Documents and Settings\\All Users\\Documents\\My Pictures\\Sample Pictures\\Sunset.jpg');
/*!40000 ALTER TABLE `school_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`smsserver_calls`
--

DROP TABLE IF EXISTS `smsserver_calls`;
CREATE TABLE `smsserver_calls` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `call_date` datetime NOT NULL,
  `gateway_id` varchar(64) NOT NULL,
  `caller_id` varchar(16) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`smsserver_calls`
--

/*!40000 ALTER TABLE `smsserver_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsserver_calls` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`smsserver_in`
--

DROP TABLE IF EXISTS `smsserver_in`;
CREATE TABLE `smsserver_in` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `process` int(11) NOT NULL,
  `originator` varchar(16) NOT NULL,
  `type` varchar(1) NOT NULL,
  `encoding` char(1) NOT NULL,
  `message_date` datetime NOT NULL,
  `receive_date` datetime NOT NULL,
  `text` varchar(1000) NOT NULL,
  `original_ref_no` varchar(64) default NULL,
  `original_receive_date` datetime default NULL,
  `gateway_id` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`smsserver_in`
--

/*!40000 ALTER TABLE `smsserver_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsserver_in` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`smsserver_out`
--

DROP TABLE IF EXISTS `smsserver_out`;
CREATE TABLE `smsserver_out` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(1) NOT NULL default 'O',
  `recipient` varchar(16) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `wap_url` varchar(100) default NULL,
  `wap_expiry_date` datetime default NULL,
  `wap_signal` varchar(1) default NULL,
  `create_date` datetime NOT NULL,
  `originator` varchar(16) NOT NULL default ' ',
  `encoding` varchar(1) NOT NULL default '7',
  `status_report` int(1) NOT NULL default '0',
  `flash_sms` int(1) NOT NULL default '0',
  `src_port` int(6) NOT NULL default '-1',
  `dst_port` int(6) NOT NULL default '-1',
  `sent_date` datetime default NULL,
  `ref_no` varchar(64) default NULL,
  `priority` int(5) NOT NULL default '0',
  `status` varchar(1) NOT NULL default 'U',
  `errors` int(2) NOT NULL default '0',
  `gateway_id` varchar(64) NOT NULL default '*',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`smsserver_out`
--

/*!40000 ALTER TABLE `smsserver_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsserver_out` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`staff_attendance_details`
--

DROP TABLE IF EXISTS `staff_attendance_details`;
CREATE TABLE `staff_attendance_details` (
  `attendance_id` int(10) unsigned NOT NULL auto_increment,
  `attendance_date` datetime NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `attendance_status` varchar(15) NOT NULL,
  `attendance_reason` varchar(45) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`attendance_id`),
  KEY `FK_staff_attendance_details_1` (`staff_id`),
  CONSTRAINT `FK_staff_attendance_details_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`staff_attendance_details`
--

/*!40000 ALTER TABLE `staff_attendance_details` DISABLE KEYS */;
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1,'2009-01-01 00:00:00',1,'A','dfd','2009-12-14 19:35:01',1,NULL,NULL),
 (2,'2009-01-01 00:00:00',2,'A','summa','2009-12-14 19:35:02',1,NULL,NULL),
 (3,'2009-01-01 00:00:00',3,'A','dfd','2009-12-14 19:35:02',1,NULL,NULL),
 (4,'2010-01-01 00:00:00',1,'P','','2010-05-02 18:19:39',1,NULL,NULL),
 (5,'2010-01-01 00:00:00',2,'P','','2010-05-02 18:19:39',1,NULL,NULL),
 (6,'2010-01-01 00:00:00',3,'P','','2010-05-02 18:19:39',1,NULL,NULL),
 (7,'2010-02-01 00:00:00',1,'P','','2010-05-02 18:19:44',1,NULL,NULL),
 (8,'2010-02-01 00:00:00',2,'P','','2010-05-02 18:19:44',1,NULL,NULL),
 (9,'2010-02-01 00:00:00',3,'P','','2010-05-02 18:19:44',1,NULL,NULL),
 (10,'2010-03-01 00:00:00',1,'A','fever','2010-05-02 18:19:57',1,NULL,NULL),
 (11,'2010-03-01 00:00:00',2,'P','','2010-05-02 18:19:57',1,NULL,NULL),
 (12,'2010-03-01 00:00:00',3,'P','','2010-05-02 18:19:57',1,NULL,NULL),
 (13,'2010-04-01 00:00:00',1,'P','','2010-05-02 18:20:21',1,NULL,NULL);
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (14,'2010-04-01 00:00:00',2,'A','Fever','2010-05-02 18:20:21',1,NULL,NULL),
 (15,'2010-04-01 00:00:00',3,'P','','2010-05-02 18:20:22',1,NULL,NULL);
/*!40000 ALTER TABLE `staff_attendance_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`staff_details`
--

DROP TABLE IF EXISTS `staff_details`;
CREATE TABLE `staff_details` (
  `staff_id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(45) NOT NULL,
  `staff_no` varchar(45) default NULL,
  `class_id` int(10) unsigned NOT NULL,
  `dob` datetime NOT NULL,
  `doj` datetime NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `mother_name` varchar(45) default NULL,
  `guardian_name` varchar(45) default NULL,
  `address_1` varchar(45) NOT NULL,
  `address_2` varchar(45) default NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `phone` varchar(45) default NULL,
  `mobile` varchar(45) default NULL,
  `salary_amount` double NOT NULL,
  `sex` varchar(1) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `subject_handled_1` varchar(30) NOT NULL,
  `subject_handled_2` varchar(30) NOT NULL,
  `subject_handled_3` varchar(30) NOT NULL,
  `subject_handled_4` varchar(30) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `status_id` int(10) unsigned NOT NULL,
  `second_name` varchar(45) default NULL,
  `dept` varchar(45) default NULL,
  `prev_emp_det` varchar(45) default NULL,
  `house_no` varchar(45) default NULL,
  `house_name` varchar(45) default NULL,
  `street` varchar(45) default NULL,
  `pin` varchar(45) default NULL,
  `dist` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `basic_pay` varchar(45) default NULL,
  `hra` varchar(45) default NULL,
  `da` varchar(45) default NULL,
  `allow1` varchar(45) default NULL,
  `allow2` varchar(45) default NULL,
  `others` varchar(45) default NULL,
  `pf_amt` varchar(45) default NULL,
  `pf_acc` varchar(45) default NULL,
  `loan_amt` varchar(45) default NULL,
  `esi_amt` varchar(45) default NULL,
  `esi_acc` varchar(45) default NULL,
  `esi_others` varchar(45) default NULL,
  `tds_amt` varchar(45) default NULL,
  `tds_acc` varchar(45) default NULL,
  `bank_name` varchar(45) default NULL,
  `bank_acc` varchar(45) default NULL,
  `type` varchar(45) default NULL,
  PRIMARY KEY  (`staff_id`),
  KEY `FK_staff_details_class` (`class_id`),
  CONSTRAINT `FK_staff_details_class` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`staff_details`
--

/*!40000 ALTER TABLE `staff_details` DISABLE KEYS */;
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`class_id`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`) VALUES 
 (1,'JOHN','STAFF00001',1,'2000-01-01 00:00:00','2000-01-01 00:00:00','Satish','BAILEY','','test','tset','Chennai','Tamil Nadu','India','600011','04445042225','9789089437',20000,'M','BE CSE','Special Edu COORDINATOR','8','2','5','8','2010-05-02 18:12:50',1,NULL,NULL,1,'BAILEY','PHY/CHEM','NA','27','INIA','AZIZ MULK LANE','600011','CHENNAI','SATISHRAJ.J@GMAIL.COM','15000','4000','152.15','152.14','0','0','995.21','15241254001','0','0','0','0','0','0','ICICIBANK','00015412254125','CASH'),
 (2,'KRISTY','STAFF0002',1,'1977-01-01 00:00:00','2000-01-01 00:00:00','ROBERTS','KRISTY','','test','tset','test','test','INDIA','600011','9940415241','9940415241',20000,'F','BSC PHYSICS','Deputy Headteacher','2','2','2','2','2010-05-02 18:16:18',1,NULL,NULL,1,'ROBERTS','','','','','','','','','20000','','','','','','','','','','','','','','','','CASH');
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`class_id`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`) VALUES 
 (3,'HELEN','STAFF0003',1,'2000-01-01 00:00:00','2000-01-01 00:00:00','OWENS','HELEN','','test','tset','','','tset','600011','','',20000,'M','BSC MATHS','Art/Design','1','1','1','1','2010-05-02 18:16:01',1,NULL,NULL,1,'OWENS','','','','27','','','','','','','','','','','','','','','','','','','','','CASH'),
 (4,'test',NULL,3,'2009-12-17 00:00:00','2009-12-17 00:00:00','test','test','test','rwer','gtds','chennai','tamilnadu','india','600011','000','000000000',230,'M','be','teaches','2','2','4','4','2009-12-17 15:20:49',1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `staff_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`student_attendance_details`
--

DROP TABLE IF EXISTS `student_attendance_details`;
CREATE TABLE `student_attendance_details` (
  `attendance_id` int(10) unsigned NOT NULL auto_increment,
  `absent_date` datetime NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `attendance_status` varchar(15) NOT NULL default 'ABSENT',
  `attendance_reason` varchar(45) default NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`attendance_id`),
  KEY `FK_stu_att_dtils_1` (`student_id`),
  CONSTRAINT `FK_stu_att_dtils_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`student_attendance_details`
--

/*!40000 ALTER TABLE `student_attendance_details` DISABLE KEYS */;
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1,'2009-12-08 00:00:00',1,'A','fever','2009-12-14 19:39:14',1,NULL,NULL),
 (2,'2009-12-08 00:00:00',2,'P','','2009-12-14 19:39:14',1,NULL,NULL),
 (3,'2009-12-08 00:00:00',3,'P','','2009-12-14 19:39:14',1,NULL,NULL),
 (4,'2009-12-08 00:00:00',4,'H','head ache','2009-12-14 19:39:14',1,NULL,NULL),
 (5,'2009-12-17 00:00:00',1,'P','','2009-12-17 16:01:40',1,NULL,NULL),
 (6,'2009-12-17 00:00:00',2,'P','','2009-12-17 16:01:40',1,NULL,NULL),
 (7,'2009-12-17 00:00:00',3,'P','','2009-12-17 16:01:40',1,NULL,NULL),
 (8,'2009-12-17 00:00:00',4,'A','','2009-12-17 16:01:41',1,NULL,NULL),
 (9,'2009-12-17 00:00:00',5,'P','','2009-12-17 16:01:41',1,NULL,NULL),
 (10,'2009-12-17 00:00:00',6,'P','','2009-12-17 16:01:41',1,NULL,NULL),
 (11,'2009-12-17 00:00:00',7,'A','','2009-12-17 16:01:41',1,NULL,NULL),
 (12,'2009-12-17 00:00:00',8,'P','','2009-12-17 16:01:41',1,NULL,NULL),
 (13,'2009-12-17 00:00:00',9,'A','','2009-12-17 16:01:41',1,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (14,'2009-12-17 00:00:00',10,'P','','2009-12-17 16:01:41',1,NULL,NULL),
 (15,'2009-12-17 00:00:00',11,'P','','2009-12-17 16:01:41',1,NULL,NULL);
/*!40000 ALTER TABLE `student_attendance_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`student_details`
--

DROP TABLE IF EXISTS `student_details`;
CREATE TABLE `student_details` (
  `student_id` int(10) unsigned NOT NULL,
  `student_name` varchar(45) NOT NULL,
  `roll_no` varchar(45) default NULL,
  `dob` varchar(19) NOT NULL,
  `doj` varchar(19) NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `mother_name` varchar(45) default NULL,
  `guardian_name` varchar(45) default NULL,
  `address_1` varchar(45) NOT NULL,
  `address_2` varchar(45) default NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `phone` varchar(45) default NULL,
  `mobile1` varchar(45) default NULL,
  `class_id` int(10) unsigned NOT NULL,
  `course_ids` varchar(45) default NULL,
  `gender` varchar(8) default NULL,
  `status` int(10) unsigned NOT NULL,
  `photo` varchar(250) default NULL,
  `caste` varchar(80) default NULL,
  `religion` varchar(60) default NULL,
  `nationality` varchar(45) default NULL,
  `mother_tongue` varchar(45) default NULL,
  `first_language` varchar(20) default NULL,
  `second_language` varchar(20) default NULL,
  `third_language` varchar(20) default NULL,
  `blood_group` varchar(20) default NULL,
  `admission_no` varchar(45) default NULL,
  `physical_status` varchar(45) default NULL,
  `scholarship` varchar(45) default NULL,
  `prev_inst` varchar(45) default NULL,
  `prev_inst_reason` varchar(45) default NULL,
  `iden_mark1` varchar(45) default NULL,
  `iden_mark2` varchar(45) default NULL,
  `iden_mark3` varchar(45) default NULL,
  `remarks` varchar(45) default NULL,
  `res_housename` varchar(45) default NULL,
  `res_houseno` varchar(45) default NULL,
  `res_street` varchar(45) default NULL,
  `res_city` varchar(45) default NULL,
  `res_pincode` varchar(45) default NULL,
  `office_name` varchar(45) default NULL,
  `office_compname` varchar(45) default NULL,
  `office_no` varchar(45) default NULL,
  `office_street` varchar(45) default NULL,
  `office_city` varchar(45) default NULL,
  `office_dist` varchar(45) default NULL,
  `office_state` varchar(45) default NULL,
  `office_pincode` varchar(45) default NULL,
  `landline` varchar(45) default NULL,
  `mobile2` varchar(45) default NULL,
  `office1` varchar(45) default NULL,
  `office2` varchar(45) default NULL,
  `extn` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `emer_name` varchar(45) default NULL,
  `emer_mobileno` varchar(45) default NULL,
  `emer_landlineno` varchar(45) default NULL,
  `emer_doc` varchar(45) default NULL,
  `sms_contname` varchar(45) default NULL,
  `sms_recno` varchar(45) default NULL,
  `sms_gateway` varchar(45) default NULL,
  `last_name` varchar(45) default NULL,
  `medium` varchar(45) default NULL,
  `category` varchar(45) default NULL,
  `sub_category` varchar(45) default NULL,
  `res_district` varchar(45) default NULL,
  `res_state` varchar(45) default NULL,
  PRIMARY KEY  (`student_id`,`dob`,`doj`),
  KEY `FK_student_details_class1` (`class_id`),
  CONSTRAINT `FK_student_details_class1` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`student_details`
--

/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`res_housename`,`res_houseno`,`res_street`,`res_city`,`res_pincode`,`office_name`,`office_compname`,`office_no`,`office_street`,`office_city`,`office_dist`,`office_state`,`office_pincode`,`landline`,`mobile2`,`office1`,`office2`,`extn`,`email`,`emer_name`,`emer_mobileno`,`emer_landlineno`,`emer_doc`,`sms_contname`,`sms_recno`,`sms_gateway`,`last_name`,`medium`,`category`,`sub_category`,`res_district`,`res_state`) VALUES 
 (1,'Sengani','stu00003','01/01/2009','01','Rayappan','muthulakshmi','cubicle','cubicle','cubicle','Chennai','tamil nadu','india','600011','9884228228','9841152904',1,'test','M',1,'/CubePro/photos/STU-X-A-001.jpg','TEST','TEST','TEST','TELEGU','TEST','TEST',NULL,'O Potive','','TEST','TEST','TEST','TEST','TEST','TEST',NULL,'TEST','TEST','27','TEST','TEST','600011','TEST','TEST','25','TEST','TEST','TEST','TEST','600011','5421151254','9841152904','9841152904','9841152904','4567','test@gmail.com','TEST','04445042225','9841152904','9841152904','TEST','9841152904','test','Rayappan','TEST','BC','NAIDU','TEST','TEST'),
 (2,'Kumaran','stu000002','2010-04-30 19:43:45','0000-00-00 00:00:00','test','tset','test','test','test','dfs','sdf','sddfd','sdf','9789089437','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-002.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A Postive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`res_housename`,`res_houseno`,`res_street`,`res_city`,`res_pincode`,`office_name`,`office_compname`,`office_no`,`office_street`,`office_city`,`office_dist`,`office_state`,`office_pincode`,`landline`,`mobile2`,`office1`,`office2`,`extn`,`email`,`emer_name`,`emer_mobileno`,`emer_landlineno`,`emer_doc`,`sms_contname`,`sms_recno`,`sms_gateway`,`last_name`,`medium`,`category`,`sub_category`,`res_district`,`res_state`) VALUES 
 (3,'Sengani R','stu00001','2010-04-30 19:43:45','0000-00-00 00:00:00','Rayappan','muthulakshmi','cubicle','cubicle','cubicle','Chennai','tamil nadu','india','600011','9884228228','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-003.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B Postive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL),
 (4,'Sengani','stu00004','2010-04-30 19:43:45','0000-00-00 00:00:00','Rayappan','muthulakshmi','cubicle','cubicle','cubicle','Chennai','tamil nadu','india','600011','9884228228','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-004.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B Postive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`res_housename`,`res_houseno`,`res_street`,`res_city`,`res_pincode`,`office_name`,`office_compname`,`office_no`,`office_street`,`office_city`,`office_dist`,`office_state`,`office_pincode`,`landline`,`mobile2`,`office1`,`office2`,`extn`,`email`,`emer_name`,`emer_mobileno`,`emer_landlineno`,`emer_doc`,`sms_contname`,`sms_recno`,`sms_gateway`,`last_name`,`medium`,`category`,`sub_category`,`res_district`,`res_state`) VALUES 
 (5,'VIGNESH',NULL,'2010-04-30 19:43:45','0000-00-00 00:00:00','VIGNESH','VIGNESH','VIGNESH','VIGNESH','VIGNESH','Chennai','tamil nadu','india','600011','','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-005.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B Postive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL),
 (6,'student_b4_iu','0','2010-04-30 19:43:45','0000-00-00 00:00:00','student_b4_iu','student_b4_iu','student_b4_iu','student_b4_iu','student_b4_iu','Chennai','tamil nadu','india','600011','','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-006.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AB Postive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`res_housename`,`res_houseno`,`res_street`,`res_city`,`res_pincode`,`office_name`,`office_compname`,`office_no`,`office_street`,`office_city`,`office_dist`,`office_state`,`office_pincode`,`landline`,`mobile2`,`office1`,`office2`,`extn`,`email`,`emer_name`,`emer_mobileno`,`emer_landlineno`,`emer_doc`,`sms_contname`,`sms_recno`,`sms_gateway`,`last_name`,`medium`,`category`,`sub_category`,`res_district`,`res_state`) VALUES 
 (7,'cubepro','0','2010-04-30 19:43:45','0000-00-00 00:00:00','cubepro','cubepro','cubepro','cubepro','cubepro','Chennai','tamil nadu','india','600011','','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-007.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O Negative','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL),
 (8,'mahendran','0','2010-04-30 19:43:45','0000-00-00 00:00:00','balakrishnan','vijayalakshmi','','no :88 Gandhi road\r\nchoolaimedu\r\n','88 gandhi road\r\nchoolaimedu\r\nchennai','Chennai','6000094','','','00000000','000000000',1,'','M',1,'/CubePro/photos/null.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AB Negative','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`res_housename`,`res_houseno`,`res_street`,`res_city`,`res_pincode`,`office_name`,`office_compname`,`office_no`,`office_street`,`office_city`,`office_dist`,`office_state`,`office_pincode`,`landline`,`mobile2`,`office1`,`office2`,`extn`,`email`,`emer_name`,`emer_mobileno`,`emer_landlineno`,`emer_doc`,`sms_contname`,`sms_recno`,`sms_gateway`,`last_name`,`medium`,`category`,`sub_category`,`res_district`,`res_state`) VALUES 
 (9,'mahendran','0','2010-04-30 19:43:45','0000-00-00 00:00:00','balakrishnan','vijayalakshmi','','no :88 Gandhi road\r\nchoolaimedu\r\n','88 gandhi road\r\nchoolaimedu\r\nchennai','Chennai','Tamilnadu','India','600094','00000000','000000000',1,'','M',1,'/CubePro/photos/null.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O Poistive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL),
 (10,'satish','0','2010-04-30 19:43:45','0000-00-00 00:00:00','cubepro','cubepro','cubepro','sdfs','sdfsf','Chennai','tamil nadu','india','600011','000000000','00000000',1,'','M',1,'/CubePro/photos/null.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A Negative','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`res_housename`,`res_houseno`,`res_street`,`res_city`,`res_pincode`,`office_name`,`office_compname`,`office_no`,`office_street`,`office_city`,`office_dist`,`office_state`,`office_pincode`,`landline`,`mobile2`,`office1`,`office2`,`extn`,`email`,`emer_name`,`emer_mobileno`,`emer_landlineno`,`emer_doc`,`sms_contname`,`sms_recno`,`sms_gateway`,`last_name`,`medium`,`category`,`sub_category`,`res_district`,`res_state`) VALUES 
 (11,'cubepro','0','2010-04-30 19:43:45','0000-00-00 00:00:00','cubepro','cubepro','cubepro','test','test','Chennai','tamil nadu','india','600011','000000000','+919841152904',1,NULL,'M',1,'/CubePro/photos/STU-X-A-0011.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A1 Postive','','','0',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `subject_name` varchar(45) NOT NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`subject`
--

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id`,`subject_name`,`status`) VALUES 
 (1,'MATHS','IN-ACTIVE'),
 (2,'PHYSICS','IN-ACTIVE'),
 (3,'CHEMISTRY','ACTIVE'),
 (4,'ENGLISH I','ACTIVE'),
 (5,'ENGLISH II','ACTIVE'),
 (6,'TAMIL I','ACTIVE'),
 (7,'TAMIL III','ACTIVE'),
 (8,'BIOLOGY','ACTIVE'),
 (9,'COMPUTER SCIENCE','ACTIVE');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`subject_details`
--

DROP TABLE IF EXISTS `subject_details`;
CREATE TABLE `subject_details` (
  `subject_id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key',
  `subject_name` varchar(45) NOT NULL COMMENT 'Name of the Subject',
  `class_id` int(10) unsigned NOT NULL COMMENT 'Foreign key of class_details table',
  `max_marks` double NOT NULL COMMENT 'Max marks for a subject',
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`subject_id`),
  KEY `FK_subject_details_class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Subject Details; InnoDB free: 6144 kB; (`class_id`) REFER `c';

--
-- Dumping data for table `cubepro`.`subject_details`
--

/*!40000 ALTER TABLE `subject_details` DISABLE KEYS */;
INSERT INTO `subject_details` (`subject_id`,`subject_name`,`class_id`,`max_marks`,`status`) VALUES 
 (1,'MATHS',1,100,'ACTIVE'),
 (2,'PHYSICS',1,100,'ACTIVE'),
 (3,'TAMIL I',3,100,'ACTIVE'),
 (4,'TAMIL II',1,100,'ACTIVE'),
 (5,'CHEMISTRY',1,100.1,'ACTIVE'),
 (6,'ENGLISH I',1,100,'ACTIVE'),
 (7,'ENGLISH II',1,100,'ACTIVE'),
 (8,'BIOLOGY',1,100,'ACTIVE');
/*!40000 ALTER TABLE `subject_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`term`
--

DROP TABLE IF EXISTS `term`;
CREATE TABLE `term` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `term_name` varchar(45) NOT NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`term`
--

/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` (`id`,`term_name`,`status`) VALUES 
 (1,'QUARTE','ACTIVE'),
 (2,'EXAM FEES','ACTIVE'),
 (3,'EXAM FEES','IN-ACTIVE'),
 (4,'EXAM FEES','IN-ACTIVE');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`time_table_details`
--

DROP TABLE IF EXISTS `time_table_details`;
CREATE TABLE `time_table_details` (
  `time_table_detail_id` int(10) unsigned NOT NULL auto_increment,
  `class_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `replacement_staff_id` int(10) unsigned default NULL,
  `day` int(10) unsigned NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `periods` varchar(20) default NULL,
  PRIMARY KEY  (`time_table_detail_id`),
  KEY `FK_time_table_details_class` (`class_id`),
  KEY `FK_time_table_details_2` (`staff_id`),
  KEY `FK_time_table_details_3` (`replacement_staff_id`),
  KEY `FK_ttls_4` (`subject_id`),
  CONSTRAINT `FK_time_table_details_2` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`),
  CONSTRAINT `FK_time_table_details_3` FOREIGN KEY (`replacement_staff_id`) REFERENCES `staff_details` (`staff_id`),
  CONSTRAINT `FK_time_table_details_class` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`),
  CONSTRAINT `FK_ttls_4` FOREIGN KEY (`subject_id`) REFERENCES `subject_details` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`time_table_details`
--

/*!40000 ALTER TABLE `time_table_details` DISABLE KEYS */;
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (1,1,1,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 1'),
 (2,1,1,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 2'),
 (3,1,1,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 3'),
 (4,1,2,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,5,'Period 4'),
 (5,1,2,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 5'),
 (6,1,3,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 6'),
 (7,1,3,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,7,'Period 7'),
 (8,1,3,NULL,1,2010,'2010-05-02 17:46:15',1,NULL,NULL,8,'Period 8'),
 (9,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 1'),
 (10,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 2'),
 (11,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 3'),
 (12,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 4'),
 (13,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 5');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (14,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,7,'Period 6'),
 (15,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,8,'Period 7'),
 (16,1,1,NULL,2,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 8'),
 (17,1,1,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 1'),
 (18,1,1,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 2'),
 (19,1,2,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 3'),
 (20,1,2,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,5,'Period 4'),
 (21,1,3,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 5'),
 (22,1,3,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,7,'Period 6'),
 (23,1,1,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,8,'Period 7'),
 (24,1,1,NULL,3,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 8'),
 (25,1,1,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 1'),
 (26,1,2,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 2');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (27,1,1,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 3'),
 (28,1,1,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 4'),
 (29,1,1,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,5,'Period 5'),
 (30,1,3,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 6'),
 (31,1,1,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,7,'Period 7'),
 (32,1,1,NULL,4,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 8'),
 (33,1,1,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 1'),
 (34,1,1,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 2'),
 (35,1,1,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 3'),
 (36,1,1,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 4'),
 (37,1,1,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 5'),
 (38,1,3,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 6'),
 (39,1,2,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 7');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (40,1,3,NULL,5,2010,'2010-05-02 17:46:15',1,NULL,NULL,5,'Period 8'),
 (41,1,2,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,5,'Period 1'),
 (42,1,3,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,2,'Period 2'),
 (43,1,3,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 3'),
 (44,1,3,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,4,'Period 4'),
 (45,1,2,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 5'),
 (46,1,2,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,7,'Period 6'),
 (47,1,3,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,8,'Period 7'),
 (48,1,1,NULL,6,2010,'2010-05-02 17:46:15',1,NULL,NULL,1,'Period 8'),
 (49,1,1,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,2,'Period 1'),
 (50,1,1,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 2'),
 (51,1,1,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,2,'Period 3'),
 (52,1,2,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,7,'Period 4');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (53,1,2,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,4,'Period 5'),
 (54,1,3,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 6'),
 (55,1,3,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,7,'Period 7'),
 (56,1,1,NULL,1,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 8'),
 (57,1,3,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 1'),
 (58,1,3,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,8,'Period 2'),
 (59,1,1,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,2,'Period 3'),
 (60,1,1,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,4,'Period 4'),
 (61,1,1,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,5,'Period 5'),
 (62,1,2,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,5,'Period 6'),
 (63,1,1,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,2,'Period 7'),
 (64,1,1,NULL,2,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 8'),
 (65,1,1,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 1');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (66,1,2,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,2,'Period 2'),
 (67,1,3,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,4,'Period 3'),
 (68,1,2,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 4'),
 (69,1,2,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,7,'Period 5'),
 (70,1,2,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 6'),
 (71,1,1,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 7'),
 (72,1,2,NULL,3,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 8'),
 (73,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 1'),
 (74,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 2'),
 (75,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,4,'Period 3'),
 (76,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,4,'Period 4'),
 (77,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 5'),
 (78,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 6');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (79,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 7'),
 (80,1,1,NULL,4,2009,'2010-05-02 18:17:05',1,NULL,NULL,7,'Period 8'),
 (81,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 1'),
 (82,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 2'),
 (83,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 3'),
 (84,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 4'),
 (85,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,7,'Period 5'),
 (86,1,2,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,2,'Period 6'),
 (87,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 7'),
 (88,1,1,NULL,5,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 8'),
 (89,1,2,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 1'),
 (90,1,1,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 2'),
 (91,1,1,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 3');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (92,1,3,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 4'),
 (93,1,2,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,1,'Period 5'),
 (94,1,1,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,6,'Period 6'),
 (95,1,1,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,7,'Period 7'),
 (96,1,1,NULL,6,2009,'2010-05-02 18:17:05',1,NULL,NULL,8,'Period 8');
/*!40000 ALTER TABLE `time_table_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`trans_master`
--

DROP TABLE IF EXISTS `trans_master`;
CREATE TABLE `trans_master` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(45) default NULL,
  `sub_type` varchar(75) default NULL,
  `trans_desc` varchar(500) default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`trans_master`
--

/*!40000 ALTER TABLE `trans_master` DISABLE KEYS */;
INSERT INTO `trans_master` (`id`,`type`,`sub_type`,`trans_desc`,`status`) VALUES 
 (1,'INCOME','MANAGEMENT A/C','House Rent','ACTIVE'),
 (2,'INCOME','COMPUTER A/C','Cell Bill ','ACTIVE'),
 (3,'INCOME','MANAGEMENT A/C','Home bill account','ACTIVE'),
 (4,'INCOME','MANAGEMENT A/C','Current Bill','ACTIVE'),
 (5,'EXPENSE','MANAGEMENT A/C','Rent','ACTIVE');
/*!40000 ALTER TABLE `trans_master` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE `transaction_details` (
  `transaction_id` int(10) unsigned NOT NULL auto_increment,
  `transaction_code` varchar(45) NOT NULL,
  `trans_desc` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `balance` double NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `change_user_id` int(10) unsigned default NULL,
  `change_date` datetime default NULL,
  `trans_date` varchar(45) default NULL,
  `trans_type` varchar(100) default NULL,
  `trans_sub_type` varchar(45) default NULL,
  `payment_type` varchar(45) default NULL,
  `remarks` varchar(100) NOT NULL,
  PRIMARY KEY  (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`transaction_details`
--

/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`) VALUES 
 (6,'INCOME','Monthly Fees',230.1,0,1,'2010-05-01 04:57:49',NULL,NULL,'01/01/2010','MANAGEMENT A/C','ASSET',NULL,''),
 (7,'INCOME','Monthly Fees',230.1,0,1,'2010-05-01 04:58:48',NULL,NULL,'01/01/2010','SIC A/C','LIABILITY',NULL,''),
 (8,'EXPENSE','fan',10000,0,1,'2010-05-03 11:56:44',NULL,NULL,'03/05/2010','MANAGEMENT A/C','ASSET',NULL,''),
 (9,'EXPENSE','Rent',5000,0,1,'2010-05-04 16:23:46',NULL,NULL,'04/05/2010','MANAGEMENT A/C','',NULL,''),
 (10,'INCOME','House Rent',0,0,1,'2010-05-05 01:38:34',NULL,NULL,'','MANAGEMENT A/C','',NULL,''),
 (11,'INCOME','House Rent',100000,0,1,'2010-05-05 02:22:35',NULL,NULL,'01/01/2009','MANAGEMENT A/C','','CASH',''),
 (12,'CREDIT','STUDENT-FEES',250,250,1,'2010-05-05 08:32:33',NULL,NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
