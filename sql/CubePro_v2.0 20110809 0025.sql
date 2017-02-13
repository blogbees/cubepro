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
  `desc1` varchar(100) default NULL,
  `reg_book_no` varchar(45) default NULL,
  PRIMARY KEY  (`ass_and_lia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`asset_and_liability`
--

/*!40000 ALTER TABLE `asset_and_liability` DISABLE KEYS */;
INSERT INTO `asset_and_liability` (`ass_and_lia_id`,`type`,`al_date`,`year`,`amount`,`al_desc`,`sub_type`,`desc1`,`reg_book_no`) VALUES 
 (1,'ASSET','01/04/2010','2010','125000','COMPUTERS 5','FIXED ASSET','',NULL),
 (2,'ASSET','01/04/2010','2010','18000','LAPTOP','FIXED ASSET','',NULL),
 (3,'ASSET','01/04/2010','2010','8500','PRINTER MACHINE','FIXED ASSET','',NULL),
 (4,'ASSET','01/04/2010','2010','25000','AIR CONTIDISNAR','FIXED ASSET','',NULL),
 (5,'ASSET','01/04/2010','2010','8000','AIR COOLAR','FIXED ASSET','',NULL),
 (6,'ASSET','01/04/2010','2010','12000','XORAXS MACHINE','FIXED ASSET','',NULL),
 (7,'ASSET','01/04/2010','2010','20000','FANS 30','FIXED ASSET','',NULL),
 (8,'ASSET','01/04/2010','2010','15000','TABLES','FIXED ASSET','',NULL),
 (9,'ASSET','01/04/2010','2010','500000','VAN ','FIXED ASSET','',NULL),
 (10,'LIABILITY','01/04/2010','2010','1000000','CUBICLE INVASMENT','CAPITAL','',NULL),
 (11,'LIABILITY','01/04/2010','2010','500000','ADD INVASMENT','CAPITAL','',NULL),
 (12,'ASSET','01/04/2010','2010','200000','CASH IN HEAD','CURRENT ASSET','',NULL),
 (13,'ASSET','01/04/2010','2010','20000','CASH  AT BANK ','FIXED ASSET','',NULL);
INSERT INTO `asset_and_liability` (`ass_and_lia_id`,`type`,`al_date`,`year`,`amount`,`al_desc`,`sub_type`,`desc1`,`reg_book_no`) VALUES 
 (14,'BUDGET','01/04/2010','2010','60000','STUDENT BOOK','MANAGEMENT A/C','',NULL),
 (15,'BUDGET','11/10/2010','2010','60000','VAN FEE','MANAGEMENT A/C','',NULL),
 (16,'BUDGET','11/10/2010','2011','60000','AIRTEL BILL EXP','FIXED ASSET','',NULL),
 (17,'BUDGET','','2010','60000','AIRTEL BILL EXP','MANAGEMENT A/C','',NULL),
 (18,'BUDGET','25/10/2010','2010','60000','STUDENT FEES','MANAGEMENT A/C','',NULL),
 (19,'BUDGET','25/10/2010','2010','50000','STAFF SALARY','MANAGEMENT A/C','',NULL);
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
 (17,'ICICI BANK','1012345','ACTIVE');
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
 (1,17,'','DEPOSIT','','',''),
 (2,17,'','DEPOSIT','','','');
/*!40000 ALTER TABLE `bank_acc_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(10) unsigned NOT NULL auto_increment,
  `book_name` varchar(75) default NULL,
  `category_id` int(10) unsigned default NULL,
  `author` varchar(75) default NULL,
  `notes` varchar(200) default NULL,
  `company_name` varchar(100) default NULL,
  `rating` varchar(45) default NULL,
  PRIMARY KEY  (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`book`
--

/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`book_id`,`book_name`,`category_id`,`author`,`notes`,`company_name`,`rating`) VALUES 
 (1,'Java 1.5',1,'Satish','Summa','Test1','*'),
 (2,'GOODS COMMERECE',5,'PANDIAN','BOOK COPYS IN 10','KUMARAN','* *');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`building_inf`
--

DROP TABLE IF EXISTS `building_inf`;
CREATE TABLE `building_inf` (
  `building_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(145) default NULL,
  `type` varchar(45) default NULL,
  `staff_id` int(10) unsigned default NULL,
  `addr` varchar(145) default NULL,
  `phone1` varchar(45) default NULL,
  `mail_id` varchar(100) default NULL,
  `phone2` varchar(45) default NULL,
  `no_of_blocks` varchar(45) default NULL,
  `no_of_rooms` varchar(45) default NULL,
  `mess_amt` varchar(45) default NULL,
  `maint_charge` varchar(45) default NULL,
  `repair_amt` varchar(45) default NULL,
  PRIMARY KEY  (`building_id`),
  KEY `FK_building_inf_1` (`staff_id`),
  CONSTRAINT `FK_building_inf_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`building_inf`
--

/*!40000 ALTER TABLE `building_inf` DISABLE KEYS */;
INSERT INTO `building_inf` (`building_id`,`name`,`type`,`staff_id`,`addr`,`phone1`,`mail_id`,`phone2`,`no_of_blocks`,`no_of_rooms`,`mess_amt`,`maint_charge`,`repair_amt`) VALUES 
 (1,'Green Block','Building',50,'20','04445042225','satishraj.j@gmail.com','04445042225','3','25','100','100','100'),
 (2,'Juses Block','BUILDING1',50,'OH GOD','044-2748503','pandiank1405@gmail.com','044-2748502','3 BLOCKS','50','200','100','25');
/*!40000 ALTER TABLE `building_inf` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`card_types`
--

DROP TABLE IF EXISTS `card_types`;
CREATE TABLE `card_types` (
  `card_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`card_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`card_types`
--

/*!40000 ALTER TABLE `card_types` DISABLE KEYS */;
INSERT INTO `card_types` (`card_type_id`,`name`) VALUES 
 (1,'Visa'),
 (2,'American Express');
/*!40000 ALTER TABLE `card_types` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`,`name`,`description`) VALUES 
 (1,'Programming',NULL),
 (2,'Science','Science'),
 (3,'Databases',NULL),
 (4,'History','History'),
 (5,'COMMERCE','COMMERCE DETIALS');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`class_details`
--

DROP TABLE IF EXISTS `class_details`;
CREATE TABLE `class_details` (
  `class_id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key of Class Details table',
  `class_name` varchar(10) NOT NULL COMMENT 'Name of the class',
  `no_of_students` int(10) unsigned NOT NULL COMMENT 'Total no of students in a class',
  `section_name` varchar(10) NOT NULL COMMENT 'Section Name of the class',
  `staff_in_charge_id` varchar(45) default NULL COMMENT 'Staff Id of the staff incharge',
  `status` varchar(45) default NULL,
  `class_type` varchar(45) default NULL,
  PRIMARY KEY  (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This Contains the Class List';

--
-- Dumping data for table `cubepro`.`class_details`
--

/*!40000 ALTER TABLE `class_details` DISABLE KEYS */;
INSERT INTO `class_details` (`class_id`,`class_name`,`no_of_students`,`section_name`,`staff_in_charge_id`,`status`,`class_type`) VALUES 
 (66,'XII',50,'A','KUMAR','ACTIVE',NULL),
 (67,'XI',50,'B','VINOTH','ACTIVE',NULL),
 (68,'X',50,'C','DHINA','ACTIVE',NULL),
 (69,'IX',50,'D','SURESH','ACTIVE',NULL),
 (70,'VIII',50,'A','JOTHI','ACTIVE',NULL),
 (71,'VII',50,'B','MURALI','ACTIVE',NULL),
 (72,'VI',50,'C','SYOIMAN','IN-ACTIVE',NULL),
 (73,'V',50,'D','PRASANNA','IN-ACTIVE',NULL),
 (74,'VIII',22,'A1-BIO','MURALI','ACTIVE',NULL),
 (75,'BATCH',0,'2009','','ACTIVE',NULL);
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
-- Table structure for table `cubepro`.`editorial_categories`
--

DROP TABLE IF EXISTS `editorial_categories`;
CREATE TABLE `editorial_categories` (
  `editorial_cat_id` int(11) NOT NULL auto_increment,
  `editorial_cat_name` varchar(50) default NULL,
  PRIMARY KEY  (`editorial_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`editorial_categories`
--

/*!40000 ALTER TABLE `editorial_categories` DISABLE KEYS */;
INSERT INTO `editorial_categories` (`editorial_cat_id`,`editorial_cat_name`) VALUES 
 (1,'What'),
 (2,'New'),
 (3,'Weekly'),
 (4,'General');
/*!40000 ALTER TABLE `editorial_categories` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`editorials`
--

DROP TABLE IF EXISTS `editorials`;
CREATE TABLE `editorials` (
  `article_id` int(11) NOT NULL auto_increment,
  `editorial_cat_id` int(11) default '0',
  `article_title` varchar(200) default NULL,
  `article_desc` text,
  `item_id` int(11) default '0',
  PRIMARY KEY  (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`editorials`
--

/*!40000 ALTER TABLE `editorials` DISABLE KEYS */;
INSERT INTO `editorials` (`article_id`,`editorial_cat_id`,`article_title`,`article_desc`,`item_id`) VALUES 
 (1,1,'A Sharp Combination','To get inside C#, Microsoft\'s new OO programming language, use A Preview of C# as a guide. It offers a preview of Visual Studio.NET and an overview of the .NET framework, and demonstrates how C# is integrated with ASP+, ADO+, and COM+ in .NET applications. You\'ll get examples of C# in action, too.',22),
 (2,2,'1001 Web Site Construction Tips and Tricks','39.95',21),
 (3,3,'Flash 4 Magic','If you\'re right in the middle of learning (or just jumping into) Flash to create and manipulate animations, music tracks, sound effects, and interface design, try the Flash 4 Magic. Inside are tutorials, graphic presentations, and a CD.',8),
 (4,4,'<b><font color=\"brown\">Free Shipping on orders over $40</font></b>','For limited time only, until next Sunday, you can enjoy free shipping. Simply order more then $40 worth of books and shipping\'s on us.',0);
/*!40000 ALTER TABLE `editorials` ENABLE KEYS */;


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
 (10,66,'ANNUAL EXAM',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE'),
 (11,68,'1ST MITAM',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE'),
 (12,68,'HEAFLY EXAM',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE'),
 (13,66,'HEAFLY EXAM',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE'),
 (14,66,'ANNUAL EXAM',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE'),
 (15,66,'TEST1',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE');
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
  `exam_date` varchar(14) NOT NULL,
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
 (9,10,66,39,'01/03/2010','10:00','01:00','2010-08-22 00:17:44',1,NULL,NULL),
 (10,10,66,40,'02/03/2010','10:00','01:00','2010-08-22 00:17:56',1,NULL,NULL),
 (11,10,66,41,'03/03/2010','10:00','01:00','2010-08-22 00:18:06',1,NULL,NULL),
 (12,10,66,42,'04/03/2010','10:00','01:00','2010-08-22 00:18:23',1,NULL,NULL),
 (13,10,66,43,'05/03/2010','10:00','01:00','2010-08-22 00:18:37',1,NULL,NULL),
 (14,10,66,44,'06/03/2010','10:00','01:00','2010-08-22 00:18:55',1,NULL,NULL);
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
  `transport_fee` varchar(45) default NULL,
  `hostel_fee` varchar(45) default NULL,
  PRIMARY KEY  (`fees_id`),
  KEY `FK_fees_details_class` (`class_id`),
  CONSTRAINT `FK_fees_details_class` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`fees_details`
--

/*!40000 ALTER TABLE `fees_details` DISABLE KEYS */;
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
  `class_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_fees_master_1` (`class_id`),
  CONSTRAINT `FK_fees_master_1` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`fees_master`
--

/*!40000 ALTER TABLE `fees_master` DISABLE KEYS */;
INSERT INTO `fees_master` (`id`,`fees_type`,`fees_name`,`fees_amt`,`status`,`class_id`) VALUES 
 (61,'MGT FEES','ADDMISSION FEE','300','ACTIVE',66),
 (62,'MGT FEES','APPLICATION FEE','100','ACTIVE',66),
 (63,'MGT FEES','BOOK FEE','3000','ACTIVE',66),
 (64,'MGT FEES','DIO PROGAM FEE','250','ACTIVE',66),
 (65,'MGT FEES','CRAFT FEE','400','ACTIVE',66),
 (66,'MGT FEES','LIBRARY FEE','500','ACTIVE',66),
 (67,'MGT FEES','WORK BOOK FEE','450','ACTIVE',66),
 (68,'PTA FEES','PTA FEE','150','ACTIVE',66),
 (69,'SPECIAL FEE','EXAM FEE','1500','ACTIVE',66),
 (70,'SPECIAL FEE','ANNUAL FEE','1000','ACTIVE',66),
 (71,'SPECIAL FEE','JRG FEE','150','ACTIVE',66),
 (72,'SPECIAL FEE','GAMES FEE','350','ACTIVE',66),
 (73,'SPECIAL FEE','TUTION FEE','500','ACTIVE',66),
 (74,'SPECIAL FEE','UNIFORM FEE','1000','ACTIVE',66),
 (75,'MGT FEES','ADDMISSION FEE','1000','ACTIVE',67),
 (76,'MGT FEES','ANNUAL FEE','210','ACTIVE',67),
 (77,'MGT FEES','APPLICATION FEE','210','ACTIVE',67),
 (78,'MGT FEES','DIO PROGAM FEE','210','ACTIVE',67),
 (79,'MGT FEES','EXAM FEE','210','ACTIVE',67);
INSERT INTO `fees_master` (`id`,`fees_type`,`fees_name`,`fees_amt`,`status`,`class_id`) VALUES 
 (80,'MGT FEES','LIBRARY FEE','210','ACTIVE',67),
 (81,'PTA FEES','PTA FEE','100','ACTIVE',67),
 (82,'PTA FEES','PTA FEE','100','ACTIVE',68),
 (83,'SPECIAL FEE','GAMES FEE','300','ACTIVE',68),
 (84,'SPECIAL FEE','IMPROVEMENT FEE','300','ACTIVE',68),
 (85,'SPECIAL FEE','LIBRARY FEE','300','ACTIVE',68),
 (86,'SPECIAL FEE','JRG FEE','300','ACTIVE',68),
 (87,'MGT FEES','ADDMISSION FEE','500','ACTIVE',68),
 (88,'MGT FEES','ANNUAL FEE','500','ACTIVE',68),
 (89,'MGT FEES','BOOK FEE','500','ACTIVE',68),
 (90,'MGT FEES','DIO PROGAM FEE','150','ACTIVE',68),
 (91,'MGT FEES','EXAM FEE','150','ACTIVE',69),
 (92,'SPECIAL FEES','IMPROVEMENT FEE','100','ACTIVE',74),
 (93,'MGT FEES','BOOK FEE','2000','ACTIVE',74),
 (94,'PTA FEES','PTA','150','ACTIVE',74);
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
  `fine` int(10) unsigned default NULL,
  `student_type` varchar(45) default NULL,
  `fees_date` varchar(45) default NULL,
  `conc` varchar(45) default NULL,
  `hostel_fee` varchar(45) default NULL,
  `transport_fee` varchar(45) default NULL,
  `paid_amt` int(10) unsigned NOT NULL,
  `balance_amt` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`invoice_id`),
  KEY `FK_invoice_details_1` (`student_id`),
  KEY `FK_invoice_details_2` (`fees_id`),
  CONSTRAINT `FK_invoice_details_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`invoice_details`
--

/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (213,0,'MGT01',58,'2010-08-22 00:31:42',300,'2010-08-22 00:31:42',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0),
 (214,0,'MGT01',58,'2010-08-22 00:31:43',100,'2010-08-22 00:31:43',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0),
 (215,0,'MGT01',58,'2010-08-22 00:31:43',3000,'2010-08-22 00:31:43',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0),
 (216,0,'MGT01',58,'2010-08-22 00:31:43',250,'2010-08-22 00:31:43',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0),
 (217,0,'MGT01',58,'2010-08-22 00:31:43',400,'2010-08-22 00:31:43',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (218,0,'MGT01',58,'2010-08-22 00:31:43',500,'2010-08-22 00:31:43',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0),
 (219,0,'MGT01',58,'2010-08-22 00:31:43',450,'2010-08-22 00:31:43',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'NA','01/06/2010','300',NULL,NULL,0,0),
 (220,0,'PTA01',58,'2010-08-22 00:32:14',150,'2010-08-22 00:32:14',1,NULL,NULL,'PTA FEES','PTA FEE','Student','CASH','',0,'NA','01/06/2010','',NULL,NULL,0,0),
 (221,0,'SP01',58,'2010-08-22 00:32:51',1500,'2010-08-22 00:32:51',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'NA','01/06/2010','250',NULL,NULL,0,0),
 (222,0,'SP01',58,'2010-08-22 00:32:51',1000,'2010-08-22 00:32:51',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'NA','01/06/2010','250',NULL,NULL,0,0),
 (223,0,'SP01',58,'2010-08-22 00:32:51',150,'2010-08-22 00:32:51',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'NA','01/06/2010','250',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (224,0,'SP01',58,'2010-08-22 00:32:51',350,'2010-08-22 00:32:51',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'NA','01/06/2010','250',NULL,NULL,0,0),
 (225,0,'SP01',58,'2010-08-22 00:32:51',500,'2010-08-22 00:32:51',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'NA','01/06/2010','250',NULL,NULL,0,0),
 (226,0,'SP01',58,'2010-08-22 00:32:51',1000,'2010-08-22 00:32:51',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'NA','01/06/2010','250',NULL,NULL,0,0),
 (227,0,'MGT02',59,'2010-08-22 00:33:44',300,'2010-08-22 00:33:44',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0),
 (228,0,'MGT02',59,'2010-08-22 00:33:44',100,'2010-08-22 00:33:44',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0),
 (229,0,'MGT02',59,'2010-08-22 00:33:45',3000,'2010-08-22 00:33:45',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (230,0,'MGT02',59,'2010-08-22 00:33:45',250,'2010-08-22 00:33:45',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0),
 (231,0,'MGT02',59,'2010-08-22 00:33:45',400,'2010-08-22 00:33:45',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0),
 (232,0,'MGT02',59,'2010-08-22 00:33:45',500,'2010-08-22 00:33:45',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0),
 (233,0,'MGT02',59,'2010-08-22 00:33:45',450,'2010-08-22 00:33:45',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',150,'OLD','01/06/2010','',NULL,NULL,0,0),
 (234,0,'PTA02',59,'2010-08-22 00:34:20',150,'2010-08-22 00:34:20',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (235,0,'SP02',59,'2010-08-22 00:34:53',1500,'2010-08-22 00:34:53',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (236,0,'SP02',59,'2010-08-22 00:34:53',1000,'2010-08-22 00:34:53',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (237,0,'SP02',59,'2010-08-22 00:34:53',150,'2010-08-22 00:34:53',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (238,0,'SP02',59,'2010-08-22 00:34:53',350,'2010-08-22 00:34:53',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (239,0,'SP02',59,'2010-08-22 00:34:53',500,'2010-08-22 00:34:53',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',9,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (240,0,'SP02',59,'2010-08-22 00:34:53',1000,'2010-08-22 00:34:53',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (241,0,'MGT03',60,'2010-08-22 07:09:33',300,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (242,0,'MGT03',60,'2010-08-22 07:09:33',100,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0),
 (243,0,'MGT03',60,'2010-08-22 07:09:33',3000,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0),
 (244,0,'MGT03',60,'2010-08-22 07:09:33',250,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0),
 (245,0,'MGT03',60,'2010-08-22 07:09:33',400,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0),
 (246,0,'MGT03',60,'2010-08-22 07:09:33',500,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0),
 (247,0,'MGT03',60,'2010-08-22 07:09:33',450,'2010-08-22 07:09:33',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',200,'NA','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (248,0,'PTA03',60,'2010-08-22 07:10:20',150,'2010-08-22 07:10:20',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'NA','01/06/2010','',NULL,NULL,0,0),
 (249,0,'SP03',60,'2010-08-22 07:11:11',1500,'2010-08-22 07:11:11',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (250,0,'SP03',60,'2010-08-22 07:11:11',1000,'2010-08-22 07:11:11',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (251,0,'SP03',60,'2010-08-22 07:11:11',150,'2010-08-22 07:11:11',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (252,0,'SP03',60,'2010-08-22 07:11:11',350,'2010-08-22 07:11:11',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (253,0,'SP03',60,'2010-08-22 07:11:11',500,'2010-08-22 07:11:11',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (254,0,'SP03',60,'2010-08-22 07:11:11',1000,'2010-08-22 07:11:11',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (255,0,'MGT04',61,'2010-08-22 07:12:27',300,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (256,0,'MGT04',61,'2010-08-22 07:12:27',100,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (257,0,'MGT04',61,'2010-08-22 07:12:27',3000,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (258,0,'MGT04',61,'2010-08-22 07:12:27',250,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (259,0,'MGT04',61,'2010-08-22 07:12:27',400,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (260,0,'MGT04',61,'2010-08-22 07:12:27',500,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (261,0,'MGT04',61,'2010-08-22 07:12:27',450,'2010-08-22 07:12:27',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (262,0,'PTA04',61,'2010-08-22 07:13:09',150,'2010-08-22 07:13:09',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (263,0,'SP04',61,'2010-08-22 07:13:50',1500,'2010-08-22 07:13:50',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (264,0,'SP04',61,'2010-08-22 07:13:50',1000,'2010-08-22 07:13:50',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (265,0,'SP04',61,'2010-08-22 07:13:50',150,'2010-08-22 07:13:50',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (266,0,'SP04',61,'2010-08-22 07:13:50',350,'2010-08-22 07:13:50',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (267,0,'SP04',61,'2010-08-22 07:13:50',500,'2010-08-22 07:13:50',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (268,0,'SP04',61,'2010-08-22 07:13:50',1000,'2010-08-22 07:13:50',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (269,0,'MGT05',62,'2010-08-22 07:14:54',300,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (270,0,'MGT05',62,'2010-08-22 07:14:54',100,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (271,0,'MGT05',62,'2010-08-22 07:14:54',3000,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (272,0,'MGT05',62,'2010-08-22 07:14:54',250,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (273,0,'MGT05',62,'2010-08-22 07:14:54',400,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (274,0,'MGT05',62,'2010-08-22 07:14:54',500,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (275,0,'MGT05',62,'2010-08-22 07:14:54',450,'2010-08-22 07:14:54',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (276,0,'PTA05',62,'2010-08-22 07:15:27',150,'2010-08-22 07:15:27',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (277,0,'SP05',62,'2010-08-22 07:16:04',1500,'2010-08-22 07:16:04',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (278,0,'SP05',62,'2010-08-22 07:16:04',1000,'2010-08-22 07:16:04',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (279,0,'SP05',62,'2010-08-22 07:16:04',150,'2010-08-22 07:16:04',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (280,0,'SP05',62,'2010-08-22 07:16:04',350,'2010-08-22 07:16:04',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (281,0,'SP05',62,'2010-08-22 07:16:04',500,'2010-08-22 07:16:04',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (282,0,'SP05',62,'2010-08-22 07:16:04',1000,'2010-08-22 07:16:04',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (283,0,'MGT06',63,'2010-08-22 07:17:13',300,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (284,0,'MGT06',63,'2010-08-22 07:17:13',100,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0),
 (285,0,'MGT06',63,'2010-08-22 07:17:13',3000,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0),
 (286,0,'MGT06',63,'2010-08-22 07:17:13',250,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0),
 (287,0,'MGT06',63,'2010-08-22 07:17:13',400,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0),
 (288,0,'MGT06',63,'2010-08-22 07:17:13',500,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0),
 (289,0,'MGT06',63,'2010-08-22 07:17:13',450,'2010-08-22 07:17:13',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','222',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (290,0,'PTA07',63,'2010-08-22 07:17:37',150,'2010-08-22 07:17:37',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (291,0,'SP06',63,'2010-08-22 07:19:23',1500,'2010-08-22 07:19:23',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','111',NULL,NULL,0,0),
 (292,0,'SP06',63,'2010-08-22 07:19:23',1000,'2010-08-22 07:19:23',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','111',NULL,NULL,0,0),
 (293,0,'SP06',63,'2010-08-22 07:19:23',150,'2010-08-22 07:19:23',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','111',NULL,NULL,0,0),
 (294,0,'SP06',63,'2010-08-22 07:19:23',350,'2010-08-22 07:19:23',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','111',NULL,NULL,0,0),
 (295,0,'SP06',63,'2010-08-22 07:19:23',500,'2010-08-22 07:19:23',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','111',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (296,0,'SP06',63,'2010-08-22 07:19:23',1000,'2010-08-22 07:19:23',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','111',NULL,NULL,0,0),
 (297,0,'SP07',64,'2010-08-22 07:20:33',1500,'2010-08-22 07:20:33',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (298,0,'SP07',64,'2010-08-22 07:20:33',1000,'2010-08-22 07:20:33',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (299,0,'SP07',64,'2010-08-22 07:20:33',150,'2010-08-22 07:20:33',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (300,0,'SP07',64,'2010-08-22 07:20:33',350,'2010-08-22 07:20:33',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (301,0,'SP07',64,'2010-08-22 07:20:33',500,'2010-08-22 07:20:33',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (302,0,'SP07',64,'2010-08-22 07:20:33',1000,'2010-08-22 07:20:33',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (303,0,'PTA07',64,'2010-08-22 07:22:11',150,'2010-08-22 07:22:11',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (304,0,'MGT07',64,'2010-08-22 07:22:44',300,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (305,0,'MGT07',64,'2010-08-22 07:22:44',100,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (306,0,'MGT07',64,'2010-08-22 07:22:44',3000,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (307,0,'MGT07',64,'2010-08-22 07:22:44',250,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (308,0,'MGT07',64,'2010-08-22 07:22:44',400,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (309,0,'MGT07',64,'2010-08-22 07:22:44',500,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (310,0,'MGT07',64,'2010-08-22 07:22:44',450,'2010-08-22 07:22:44',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (311,0,'MGT08',65,'2010-08-22 07:23:55',300,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0),
 (312,0,'MGT08',65,'2010-08-22 07:23:55',100,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0),
 (313,0,'MGT08',65,'2010-08-22 07:23:55',3000,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (314,0,'MGT08',65,'2010-08-22 07:23:55',250,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0),
 (315,0,'MGT08',65,'2010-08-22 07:23:55',400,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0),
 (316,0,'MGT08',65,'2010-08-22 07:23:55',500,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0),
 (317,0,'MGT08',65,'2010-08-22 07:23:55',450,'2010-08-22 07:23:55',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',212,'OLD','01/06/2010','',NULL,NULL,0,0),
 (318,0,'PTA08',65,'2010-08-22 07:24:19',150,'2010-08-22 07:24:19',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (319,0,'SP08',65,'2010-08-22 07:24:53',1500,'2010-08-22 07:24:53',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (320,0,'SP08',65,'2010-08-22 07:24:53',1000,'2010-08-22 07:24:53',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (321,0,'SP08',65,'2010-08-22 07:24:53',150,'2010-08-22 07:24:53',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (322,0,'SP08',65,'2010-08-22 07:24:53',350,'2010-08-22 07:24:53',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (323,0,'SP08',65,'2010-08-22 07:24:53',500,'2010-08-22 07:24:53',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (324,0,'SP08',65,'2010-08-22 07:24:53',1000,'2010-08-22 07:24:53',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (325,0,'SP09',66,'2010-08-22 07:26:25',1500,'2010-08-22 07:26:25',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (326,0,'SP09',66,'2010-08-22 07:26:26',1000,'2010-08-22 07:26:26',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (327,0,'SP09',66,'2010-08-22 07:26:26',150,'2010-08-22 07:26:26',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (328,0,'SP09',66,'2010-08-22 07:26:26',350,'2010-08-22 07:26:26',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (329,0,'SP09',66,'2010-08-22 07:26:26',500,'2010-08-22 07:26:26',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (330,0,'SP09',66,'2010-08-22 07:26:26',1000,'2010-08-22 07:26:26',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (331,0,'PTA09',66,'2010-08-22 07:26:55',150,'2010-08-22 07:26:55',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (332,0,'SP09',66,'2010-08-22 07:27:46',1500,'2010-08-22 07:27:46',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','213',NULL,NULL,0,0),
 (333,0,'SP09',66,'2010-08-22 07:27:46',1000,'2010-08-22 07:27:46',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','213',NULL,NULL,0,0),
 (334,0,'SP09',66,'2010-08-22 07:27:46',150,'2010-08-22 07:27:46',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','213',NULL,NULL,0,0),
 (335,0,'SP09',66,'2010-08-22 07:27:46',350,'2010-08-22 07:27:46',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','213',NULL,NULL,0,0),
 (336,0,'SP09',66,'2010-08-22 07:27:46',500,'2010-08-22 07:27:46',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','213',NULL,NULL,0,0),
 (337,0,'SP09',66,'2010-08-22 07:27:46',1000,'2010-08-22 07:27:46',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','213',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (338,0,'SP10',67,'2010-08-22 07:28:54',1500,'2010-08-22 07:28:54',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',101,'OLD','01/06/2010','',NULL,NULL,0,0),
 (339,0,'SP10',67,'2010-08-22 07:28:54',1000,'2010-08-22 07:28:54',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',101,'OLD','01/06/2010','',NULL,NULL,0,0),
 (340,0,'SP10',67,'2010-08-22 07:28:54',150,'2010-08-22 07:28:54',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',101,'OLD','01/06/2010','',NULL,NULL,0,0),
 (341,0,'SP10',67,'2010-08-22 07:28:54',350,'2010-08-22 07:28:54',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',101,'OLD','01/06/2010','',NULL,NULL,0,0),
 (342,0,'SP10',67,'2010-08-22 07:28:54',500,'2010-08-22 07:28:54',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',101,'OLD','01/06/2010','',NULL,NULL,0,0),
 (343,0,'SP10',67,'2010-08-22 07:28:54',1000,'2010-08-22 07:28:54',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',101,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (344,0,'PTA10',67,'2010-08-22 07:29:14',150,'2010-08-22 07:29:14',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (345,0,'MGT10',67,'2010-08-22 07:29:44',300,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0),
 (346,0,'MGT10',67,'2010-08-22 07:29:44',100,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0),
 (347,0,'MGT10',67,'2010-08-22 07:29:44',3000,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0),
 (348,0,'MGT10',67,'2010-08-22 07:29:44',250,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0),
 (349,0,'MGT10',67,'2010-08-22 07:29:44',400,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (350,0,'MGT10',67,'2010-08-22 07:29:44',500,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0),
 (351,0,'MGT10',67,'2010-08-22 07:29:44',450,'2010-08-22 07:29:44',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','122',NULL,NULL,0,0),
 (352,0,'MGT11',68,'2010-08-22 07:30:39',300,'2010-08-22 07:30:39',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (353,0,'MGT11',68,'2010-08-22 07:30:39',100,'2010-08-22 07:30:39',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (354,0,'MGT11',68,'2010-08-22 07:30:40',3000,'2010-08-22 07:30:40',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (355,0,'MGT11',68,'2010-08-22 07:30:40',250,'2010-08-22 07:30:40',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (356,0,'MGT11',68,'2010-08-22 07:30:40',400,'2010-08-22 07:30:40',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (357,0,'MGT11',68,'2010-08-22 07:30:40',500,'2010-08-22 07:30:40',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (358,0,'MGT11',68,'2010-08-22 07:30:40',450,'2010-08-22 07:30:40',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','200',NULL,NULL,0,0),
 (359,0,'PTA11',68,'2010-08-22 07:30:59',150,'2010-08-22 07:30:59',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (360,0,'SP12',68,'2010-08-22 07:31:34',1500,'2010-08-22 07:31:34',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (361,0,'SP12',68,'2010-08-22 07:31:34',1000,'2010-08-22 07:31:34',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (362,0,'SP12',68,'2010-08-22 07:31:34',150,'2010-08-22 07:31:34',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (363,0,'SP12',68,'2010-08-22 07:31:34',350,'2010-08-22 07:31:34',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (364,0,'SP12',68,'2010-08-22 07:31:34',500,'2010-08-22 07:31:34',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (365,0,'SP12',68,'2010-08-22 07:31:34',1000,'2010-08-22 07:31:34',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (366,0,'SP13',69,'2010-08-22 07:32:10',1500,'2010-08-22 07:32:10',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (367,0,'SP13',69,'2010-08-22 07:32:10',1000,'2010-08-22 07:32:10',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (368,0,'SP13',69,'2010-08-22 07:32:10',150,'2010-08-22 07:32:10',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (369,0,'SP13',69,'2010-08-22 07:32:10',350,'2010-08-22 07:32:10',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (370,0,'SP13',69,'2010-08-22 07:32:10',500,'2010-08-22 07:32:10',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (371,0,'SP13',69,'2010-08-22 07:32:10',1000,'2010-08-22 07:32:10',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (372,0,'PTA13',69,'2010-08-22 07:32:27',150,'2010-08-22 07:32:27',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (373,0,'MGT13',69,'2010-08-22 07:33:17',300,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (374,0,'MGT13',69,'2010-08-22 07:33:17',100,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0),
 (375,0,'MGT13',69,'2010-08-22 07:33:17',3000,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0),
 (376,0,'MGT13',69,'2010-08-22 07:33:17',250,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0),
 (377,0,'MGT13',69,'2010-08-22 07:33:17',400,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0),
 (378,0,'MGT13',69,'2010-08-22 07:33:17',500,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0),
 (379,0,'MGT13',69,'2010-08-22 07:33:17',450,'2010-08-22 07:33:17',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','250',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (380,0,'MGT14',70,'2010-08-22 07:34:02',300,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (381,0,'MGT14',70,'2010-08-22 07:34:02',100,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (382,0,'MGT14',70,'2010-08-22 07:34:02',3000,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (383,0,'MGT14',70,'2010-08-22 07:34:02',250,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (384,0,'MGT14',70,'2010-08-22 07:34:02',400,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (385,0,'MGT14',70,'2010-08-22 07:34:02',500,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (386,0,'MGT14',70,'2010-08-22 07:34:02',450,'2010-08-22 07:34:02',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (387,0,'PTA14',70,'2010-08-22 07:34:21',150,'2010-08-22 07:34:21',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (388,0,'SP14',70,'2010-08-22 07:34:39',1500,'2010-08-22 07:34:39',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (389,0,'SP14',70,'2010-08-22 07:34:39',1000,'2010-08-22 07:34:39',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (390,0,'SP14',70,'2010-08-22 07:34:39',150,'2010-08-22 07:34:39',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (391,0,'SP14',70,'2010-08-22 07:34:39',350,'2010-08-22 07:34:39',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (392,0,'SP14',70,'2010-08-22 07:34:39',500,'2010-08-22 07:34:39',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (393,0,'SP14',70,'2010-08-22 07:34:40',1000,'2010-08-22 07:34:40',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (394,0,'SP15',71,'2010-08-22 07:35:37',1500,'2010-08-22 07:35:37',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (395,0,'SP15',71,'2010-08-22 07:35:37',1000,'2010-08-22 07:35:37',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (396,0,'SP15',71,'2010-08-22 07:35:38',150,'2010-08-22 07:35:38',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (397,0,'SP15',71,'2010-08-22 07:35:38',350,'2010-08-22 07:35:38',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (398,0,'SP15',71,'2010-08-22 07:35:38',500,'2010-08-22 07:35:38',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (399,0,'SP15',71,'2010-08-22 07:35:38',1000,'2010-08-22 07:35:38',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (400,0,'MGT15',71,'2010-08-22 07:36:01',300,'2010-08-22 07:36:01',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (401,0,'MGT15',71,'2010-08-22 07:36:01',100,'2010-08-22 07:36:01',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (402,0,'MGT15',71,'2010-08-22 07:36:01',3000,'2010-08-22 07:36:01',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (403,0,'MGT15',71,'2010-08-22 07:36:01',250,'2010-08-22 07:36:01',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (404,0,'MGT15',71,'2010-08-22 07:36:01',400,'2010-08-22 07:36:01',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (405,0,'MGT15',71,'2010-08-22 07:36:01',500,'2010-08-22 07:36:01',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (406,0,'MGT15',71,'2010-08-22 07:36:02',450,'2010-08-22 07:36:02',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (407,0,'PTA15',71,'2010-08-22 07:36:20',150,'2010-08-22 07:36:20',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (408,0,'PTA16',72,'2010-08-22 07:36:53',150,'2010-08-22 07:36:53',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (409,0,'MGT16',72,'2010-08-22 07:37:28',300,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (410,0,'MGT16',72,'2010-08-22 07:37:28',100,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (411,0,'MGT16',72,'2010-08-22 07:37:28',3000,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (412,0,'MGT16',72,'2010-08-22 07:37:28',250,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (413,0,'MGT16',72,'2010-08-22 07:37:28',400,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (414,0,'MGT16',72,'2010-08-22 07:37:28',500,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (415,0,'MGT16',72,'2010-08-22 07:37:28',450,'2010-08-22 07:37:28',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (416,0,'SP16',72,'2010-08-22 07:38:19',1500,'2010-08-22 07:38:19',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (417,0,'SP16',72,'2010-08-22 07:38:19',1000,'2010-08-22 07:38:19',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (418,0,'SP16',72,'2010-08-22 07:38:19',150,'2010-08-22 07:38:19',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (419,0,'SP16',72,'2010-08-22 07:38:19',350,'2010-08-22 07:38:19',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (420,0,'SP16',72,'2010-08-22 07:38:19',500,'2010-08-22 07:38:19',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (421,0,'SP16',72,'2010-08-22 07:38:19',1000,'2010-08-22 07:38:19',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (422,0,'SP17',73,'2010-08-22 07:38:52',1500,'2010-08-22 07:38:52',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (423,0,'SP17',73,'2010-08-22 07:38:52',1000,'2010-08-22 07:38:52',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (424,0,'SP17',73,'2010-08-22 07:38:52',150,'2010-08-22 07:38:52',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (425,0,'SP17',73,'2010-08-22 07:38:52',350,'2010-08-22 07:38:52',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (426,0,'SP17',73,'2010-08-22 07:38:52',500,'2010-08-22 07:38:52',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (427,0,'SP17',73,'2010-08-22 07:38:52',1000,'2010-08-22 07:38:52',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (428,0,'MGT17',73,'2010-08-22 07:39:26',300,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (429,0,'MGT17',73,'2010-08-22 07:39:26',100,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (430,0,'MGT17',73,'2010-08-22 07:39:26',3000,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (431,0,'MGT17',73,'2010-08-22 07:39:26',250,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (432,0,'MGT17',73,'2010-08-22 07:39:26',400,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (433,0,'MGT17',73,'2010-08-22 07:39:26',500,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (434,0,'MGT17',73,'2010-08-22 07:39:26',450,'2010-08-22 07:39:26',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (435,0,'PTA17',73,'2010-08-22 07:39:51',150,'2010-08-22 07:39:51',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (436,0,'PTA18',74,'2010-08-22 07:40:21',150,'2010-08-22 07:40:21',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (437,0,'MGT18',74,'2010-08-22 07:40:52',300,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0),
 (438,0,'MGT18',74,'2010-08-22 07:40:52',100,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0),
 (439,0,'MGT18',74,'2010-08-22 07:40:52',3000,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (440,0,'MGT18',74,'2010-08-22 07:40:52',250,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0),
 (441,0,'MGT18',74,'2010-08-22 07:40:52',400,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0),
 (442,0,'MGT18',74,'2010-08-22 07:40:52',500,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0),
 (443,0,'MGT18',74,'2010-08-22 07:40:52',450,'2010-08-22 07:40:52',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','500',NULL,NULL,0,0),
 (444,0,'SP18',74,'2010-08-22 07:41:14',1500,'2010-08-22 07:41:14',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (445,0,'SP18',74,'2010-08-22 07:41:14',1000,'2010-08-22 07:41:14',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (446,0,'SP18',74,'2010-08-22 07:41:14',150,'2010-08-22 07:41:14',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (447,0,'SP18',74,'2010-08-22 07:41:14',350,'2010-08-22 07:41:14',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (448,0,'SP18',74,'2010-08-22 07:41:14',500,'2010-08-22 07:41:14',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (449,0,'SP18',74,'2010-08-22 07:41:14',1000,'2010-08-22 07:41:14',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (450,0,'SP19',76,'2010-08-22 07:42:20',1500,'2010-08-22 07:42:20',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (451,0,'SP19',76,'2010-08-22 07:42:20',1000,'2010-08-22 07:42:20',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (452,0,'SP19',76,'2010-08-22 07:42:20',150,'2010-08-22 07:42:20',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (453,0,'SP19',76,'2010-08-22 07:42:20',350,'2010-08-22 07:42:20',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (454,0,'SP19',76,'2010-08-22 07:42:20',500,'2010-08-22 07:42:20',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (455,0,'SP19',76,'2010-08-22 07:42:20',1000,'2010-08-22 07:42:20',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','400',NULL,NULL,0,0),
 (456,0,'MGT19',76,'2010-08-22 07:42:50',300,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (457,0,'MGT19',76,'2010-08-22 07:42:50',100,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (458,0,'MGT19',76,'2010-08-22 07:42:50',3000,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (459,0,'MGT19',76,'2010-08-22 07:42:50',250,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (460,0,'MGT19',76,'2010-08-22 07:42:50',400,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (461,0,'MGT19',76,'2010-08-22 07:42:50',500,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (462,0,'MGT19',76,'2010-08-22 07:42:50',450,'2010-08-22 07:42:50',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (463,0,'PTA19',76,'2010-08-22 07:43:23',150,'2010-08-22 07:43:23',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (464,0,'PTA20',75,'2010-08-22 07:44:18',150,'2010-08-22 07:44:18',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (465,0,'MGT20',75,'2010-08-22 07:44:46',300,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0),
 (466,0,'MGT20',75,'2010-08-22 07:44:46',100,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0),
 (467,0,'MGT20',75,'2010-08-22 07:44:46',3000,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0),
 (468,0,'MGT20',75,'2010-08-22 07:44:46',250,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0),
 (469,0,'MGT20',75,'2010-08-22 07:44:46',400,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (470,0,'MGT20',75,'2010-08-22 07:44:46',500,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0),
 (471,0,'MGT20',75,'2010-08-22 07:44:46',450,'2010-08-22 07:44:46',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','600',NULL,NULL,0,0),
 (472,0,'SP20',75,'2010-08-22 07:45:10',1500,'2010-08-22 07:45:10',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (473,0,'SP20',75,'2010-08-22 07:45:10',1000,'2010-08-22 07:45:10',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (474,0,'SP20',75,'2010-08-22 07:45:10',150,'2010-08-22 07:45:10',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (475,0,'SP20',75,'2010-08-22 07:45:10',350,'2010-08-22 07:45:10',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (476,0,'SP20',75,'2010-08-22 07:45:10',500,'2010-08-22 07:45:10',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (477,0,'SP20',75,'2010-08-22 07:45:10',1000,'2010-08-22 07:45:10',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (478,0,'SP09',77,'2010-08-22 07:56:15',1500,'2010-08-22 07:56:15',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (479,0,'SP09',77,'2010-08-22 07:56:15',1000,'2010-08-22 07:56:15',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (480,0,'SP09',77,'2010-08-22 07:56:15',150,'2010-08-22 07:56:15',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (481,0,'SP09',77,'2010-08-22 07:56:15',350,'2010-08-22 07:56:15',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (482,0,'SP09',77,'2010-08-22 07:56:15',500,'2010-08-22 07:56:15',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (483,0,'SP09',77,'2010-08-22 07:56:15',1000,'2010-08-22 07:56:15',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (484,0,'MGT09',77,'2010-08-22 07:56:36',300,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (485,0,'MGT09',77,'2010-08-22 07:56:36',100,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (486,0,'MGT09',77,'2010-08-22 07:56:36',3000,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (487,0,'MGT09',77,'2010-08-22 07:56:36',250,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (488,0,'MGT09',77,'2010-08-22 07:56:36',400,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (489,0,'MGT09',77,'2010-08-22 07:56:36',500,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (490,0,'MGT09',77,'2010-08-22 07:56:36',450,'2010-08-22 07:56:36',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (491,0,'PTA09',77,'2010-08-22 07:57:01',150,'2010-08-22 07:57:01',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (492,0,'PTA12',78,'2010-08-22 07:57:59',150,'2010-08-22 07:57:59',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (493,0,'SP12',78,'2010-08-22 07:58:25',1500,'2010-08-22 07:58:25',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (494,0,'SP12',78,'2010-08-22 07:58:25',1000,'2010-08-22 07:58:25',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (495,0,'SP12',78,'2010-08-22 07:58:25',150,'2010-08-22 07:58:25',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (496,0,'SP12',78,'2010-08-22 07:58:25',350,'2010-08-22 07:58:25',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (497,0,'SP12',78,'2010-08-22 07:58:25',500,'2010-08-22 07:58:25',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (498,0,'SP12',78,'2010-08-22 07:58:25',1000,'2010-08-22 07:58:25',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','01/06/2010','300',NULL,NULL,0,0),
 (499,0,'MGT12',78,'2010-08-22 07:59:14',300,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (500,0,'MGT12',78,'2010-08-22 07:59:14',100,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (501,0,'MGT12',78,'2010-08-22 07:59:14',3000,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (502,0,'MGT12',78,'2010-08-22 07:59:14',250,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (503,0,'MGT12',78,'2010-08-22 07:59:14',400,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (504,0,'MGT12',78,'2010-08-22 07:59:14',500,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0),
 (505,0,'MGT12',78,'2010-08-22 07:59:14',450,'2010-08-22 07:59:14',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',100,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (506,0,'MGT13',79,'2010-08-22 08:00:04',300,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0),
 (507,0,'MGT13',79,'2010-08-22 08:00:04',100,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0),
 (508,0,'MGT13',79,'2010-08-22 08:00:04',3000,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0),
 (509,0,'MGT13',79,'2010-08-22 08:00:04',250,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0),
 (510,0,'MGT13',79,'2010-08-22 08:00:04',400,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0),
 (511,0,'MGT13',79,'2010-08-22 08:00:04',500,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (512,0,'MGT13',79,'2010-08-22 08:00:04',450,'2010-08-22 08:00:04',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','02/06/2010','300',NULL,NULL,0,0),
 (513,0,'PTA13',79,'2010-08-22 08:00:47',150,'2010-08-22 08:00:47',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (514,0,'SP13',79,'2010-08-22 08:01:20',1500,'2010-08-22 08:01:20',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','02/06/2010','',NULL,NULL,0,0),
 (515,0,'SP13',79,'2010-08-22 08:01:20',1000,'2010-08-22 08:01:20',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','02/06/2010','',NULL,NULL,0,0),
 (516,0,'SP13',79,'2010-08-22 08:01:20',150,'2010-08-22 08:01:20',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','02/06/2010','',NULL,NULL,0,0),
 (517,0,'SP13',79,'2010-08-22 08:01:20',350,'2010-08-22 08:01:20',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','02/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (518,0,'SP13',79,'2010-08-22 08:01:20',500,'2010-08-22 08:01:20',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','02/06/2010','',NULL,NULL,0,0),
 (519,0,'SP13',79,'2010-08-22 08:01:20',1000,'2010-08-22 08:01:20',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','02/06/2010','',NULL,NULL,0,0),
 (520,0,'PTA13',79,'2010-08-22 08:02:01',150,'2010-08-22 08:02:01',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (521,0,'PTA21',80,'2010-08-22 08:08:26',150,'2010-08-22 08:08:26',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (522,0,'MGT21',80,'2010-08-22 08:08:45',300,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (523,0,'MGT21',80,'2010-08-22 08:08:45',100,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (524,0,'MGT21',80,'2010-08-22 08:08:45',3000,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (525,0,'MGT21',80,'2010-08-22 08:08:45',250,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (526,0,'MGT21',80,'2010-08-22 08:08:45',400,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (527,0,'MGT21',80,'2010-08-22 08:08:45',500,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (528,0,'MGT21',80,'2010-08-22 08:08:45',450,'2010-08-22 08:08:45',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (529,0,'SP21',80,'2010-08-22 08:09:05',1500,'2010-08-22 08:09:05',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (530,0,'SP21',80,'2010-08-22 08:09:05',1000,'2010-08-22 08:09:05',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (531,0,'SP21',80,'2010-08-22 08:09:05',150,'2010-08-22 08:09:05',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (532,0,'SP21',80,'2010-08-22 08:09:05',350,'2010-08-22 08:09:05',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (533,0,'SP21',80,'2010-08-22 08:09:05',500,'2010-08-22 08:09:05',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (534,0,'SP21',80,'2010-08-22 08:09:05',1000,'2010-08-22 08:09:05',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (535,0,'SP22',81,'2010-08-22 08:09:40',1500,'2010-08-22 08:09:40',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (536,0,'SP22',81,'2010-08-22 08:09:40',1000,'2010-08-22 08:09:40',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (537,0,'SP22',81,'2010-08-22 08:09:40',150,'2010-08-22 08:09:40',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (538,0,'SP22',81,'2010-08-22 08:09:40',350,'2010-08-22 08:09:40',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (539,0,'SP22',81,'2010-08-22 08:09:40',500,'2010-08-22 08:09:40',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (540,0,'SP22',81,'2010-08-22 08:09:40',1000,'2010-08-22 08:09:40',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (541,0,'MGT23',81,'2010-08-22 08:09:58',300,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (542,0,'MGT23',81,'2010-08-22 08:09:58',100,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (543,0,'MGT23',81,'2010-08-22 08:09:58',3000,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (544,0,'MGT23',81,'2010-08-22 08:09:58',250,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (545,0,'MGT23',81,'2010-08-22 08:09:58',400,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (546,0,'MGT23',81,'2010-08-22 08:09:58',500,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0),
 (547,0,'MGT23',81,'2010-08-22 08:09:58',450,'2010-08-22 08:09:58',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','01/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (548,0,'PTA23',81,'2010-08-22 08:10:15',150,'2010-08-22 08:10:15',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','02/06/2010','',NULL,NULL,0,0),
 (549,0,'PTA24',82,'2010-08-22 08:10:53',150,'2010-08-22 08:10:53',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (550,0,'MGT24',82,'2010-08-22 08:11:22',300,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0),
 (551,0,'MGT24',82,'2010-08-22 08:11:22',100,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0),
 (552,0,'MGT24',82,'2010-08-22 08:11:22',3000,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0),
 (553,0,'MGT24',82,'2010-08-22 08:11:22',250,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (554,0,'MGT24',82,'2010-08-22 08:11:22',400,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0),
 (555,0,'MGT24',82,'2010-08-22 08:11:22',500,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0),
 (556,0,'MGT24',82,'2010-08-22 08:11:22',450,'2010-08-22 08:11:22',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','03/06/2010','400',NULL,NULL,0,0),
 (557,0,'PTA24',82,'2010-08-22 08:11:52',150,'2010-08-22 08:11:52',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (558,0,'SP24',82,'2010-08-22 08:12:15',1500,'2010-08-22 08:12:15',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (559,0,'SP24',82,'2010-08-22 08:12:15',1000,'2010-08-22 08:12:15',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (560,0,'SP24',82,'2010-08-22 08:12:15',150,'2010-08-22 08:12:15',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (561,0,'SP24',82,'2010-08-22 08:12:16',350,'2010-08-22 08:12:16',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (562,0,'SP24',82,'2010-08-22 08:12:16',500,'2010-08-22 08:12:16',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (563,0,'SP24',82,'2010-08-22 08:12:16',1000,'2010-08-22 08:12:16',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (564,0,'SP25',83,'2010-08-22 08:12:46',1500,'2010-08-22 08:12:46',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','03/06/2010','',NULL,NULL,0,0),
 (565,0,'SP25',83,'2010-08-22 08:12:46',1000,'2010-08-22 08:12:46',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','03/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (566,0,'SP25',83,'2010-08-22 08:12:46',150,'2010-08-22 08:12:46',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','03/06/2010','',NULL,NULL,0,0),
 (567,0,'SP25',83,'2010-08-22 08:12:46',350,'2010-08-22 08:12:46',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','03/06/2010','',NULL,NULL,0,0),
 (568,0,'SP25',83,'2010-08-22 08:12:46',500,'2010-08-22 08:12:46',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','03/06/2010','',NULL,NULL,0,0),
 (569,0,'SP25',83,'2010-08-22 08:12:46',1000,'2010-08-22 08:12:46',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','03/06/2010','',NULL,NULL,0,0),
 (570,0,'MGT25',83,'2010-08-22 08:13:17',300,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (571,0,'MGT25',83,'2010-08-22 08:13:17',100,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (572,0,'MGT25',83,'2010-08-22 08:13:17',3000,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (573,0,'MGT25',83,'2010-08-22 08:13:17',250,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (574,0,'MGT25',83,'2010-08-22 08:13:17',400,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (575,0,'MGT25',83,'2010-08-22 08:13:17',500,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (576,0,'MGT25',83,'2010-08-22 08:13:17',450,'2010-08-22 08:13:17',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0),
 (577,0,'PTA25',83,'2010-08-22 08:14:14',150,'2010-08-22 08:14:14',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','03/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (578,0,'PTA26',84,'2010-08-22 08:15:22',150,'2010-08-22 08:15:22',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (579,0,'MGT26',84,'2010-08-22 08:15:47',300,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0),
 (580,0,'MGT26',84,'2010-08-22 08:15:47',100,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0),
 (581,0,'MGT26',84,'2010-08-22 08:15:47',3000,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0),
 (582,0,'MGT26',84,'2010-08-22 08:15:47',250,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0),
 (583,0,'MGT26',84,'2010-08-22 08:15:47',400,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (584,0,'MGT26',84,'2010-08-22 08:15:47',500,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0),
 (585,0,'MGT26',84,'2010-08-22 08:15:47',450,'2010-08-22 08:15:47',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','04/06/2010','300',NULL,NULL,0,0),
 (586,0,'SP26',84,'2010-08-22 08:16:12',1500,'2010-08-22 08:16:12',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (587,0,'SP26',84,'2010-08-22 08:16:12',1000,'2010-08-22 08:16:12',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (588,0,'SP26',84,'2010-08-22 08:16:12',150,'2010-08-22 08:16:12',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (589,0,'SP26',84,'2010-08-22 08:16:12',350,'2010-08-22 08:16:12',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (590,0,'SP26',84,'2010-08-22 08:16:12',500,'2010-08-22 08:16:12',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (591,0,'SP26',84,'2010-08-22 08:16:12',1000,'2010-08-22 08:16:12',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (592,0,'SP27',85,'2010-08-22 08:17:05',1500,'2010-08-22 08:17:05',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','04/06/2010','600',NULL,NULL,0,0),
 (593,0,'SP27',85,'2010-08-22 08:17:05',1000,'2010-08-22 08:17:05',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','04/06/2010','600',NULL,NULL,0,0),
 (594,0,'SP27',85,'2010-08-22 08:17:05',150,'2010-08-22 08:17:05',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','04/06/2010','600',NULL,NULL,0,0),
 (595,0,'SP27',85,'2010-08-22 08:17:05',350,'2010-08-22 08:17:05',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','04/06/2010','600',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (596,0,'SP27',85,'2010-08-22 08:17:05',500,'2010-08-22 08:17:05',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','04/06/2010','600',NULL,NULL,0,0),
 (597,0,'SP27',85,'2010-08-22 08:17:05',1000,'2010-08-22 08:17:05',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','04/06/2010','600',NULL,NULL,0,0),
 (598,0,'PTA27',85,'2010-08-22 08:17:24',150,'2010-08-22 08:17:24',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (599,0,'MGT27',85,'2010-08-22 08:17:48',300,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (600,0,'MGT27',85,'2010-08-22 08:17:48',100,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (601,0,'MGT27',85,'2010-08-22 08:17:48',3000,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (602,0,'MGT27',85,'2010-08-22 08:17:48',250,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (603,0,'MGT27',85,'2010-08-22 08:17:48',400,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (604,0,'MGT27',85,'2010-08-22 08:17:48',500,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (605,0,'MGT27',85,'2010-08-22 08:17:48',450,'2010-08-22 08:17:48',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',100,'OLD','04/06/2010','',NULL,NULL,0,0),
 (606,0,'MGT28',86,'2010-08-22 08:18:57',300,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0),
 (607,0,'MGT28',86,'2010-08-22 08:18:57',100,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','APPLICATION FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (608,0,'MGT28',86,'2010-08-22 08:18:57',3000,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','BOOK FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0),
 (609,0,'MGT28',86,'2010-08-22 08:18:57',250,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0),
 (610,0,'MGT28',86,'2010-08-22 08:18:57',400,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','CRAFT FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0),
 (611,0,'MGT28',86,'2010-08-22 08:18:57',500,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','LIBRARY FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0),
 (612,0,'MGT28',86,'2010-08-22 08:18:57',450,'2010-08-22 08:18:57',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','','CASH','',0,'OLD','04/06/2010','500',NULL,NULL,0,0),
 (613,0,'PTA28',86,'2010-08-22 08:19:20',150,'2010-08-22 08:19:20',1,NULL,NULL,'PTA FEES','PTA FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (614,0,'SP28',86,'2010-08-22 08:19:42',1500,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (615,0,'SP28',86,'2010-08-22 08:19:42',1000,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (616,0,'SP28',86,'2010-08-22 08:19:42',150,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','JRG FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (617,0,'SP28',86,'2010-08-22 08:19:42',350,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (618,0,'SP28',86,'2010-08-22 08:19:42',500,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0),
 (619,0,'SP28',86,'2010-08-22 08:19:42',1000,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','','CASH','',0,'OLD','04/06/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (620,0,'SP29',86,'2010-08-22 08:19:42',1500,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','EXAM FEE',' ','CASH',' ',0,'OLD','05/06/2010',' ',NULL,NULL,0,0),
 (621,0,'SP29',86,'2010-08-22 08:19:42',1000,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE',' ','CASH',' ',0,'OLD','05/06/2010',' ',NULL,NULL,0,0),
 (622,0,'SP29',86,'2010-08-22 08:19:42',150,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','JRG FEE',' ','CASH',' ',0,'OLD','05/06/2010',' ',NULL,NULL,0,0),
 (623,0,'SP29',86,'2010-08-22 08:19:42',350,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','GAMES FEE',' ','CASH',' ',0,'OLD','05/06/2010',' ',NULL,NULL,0,0),
 (624,0,'SP29',86,'2010-08-22 08:19:42',500,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','TUTION FEE',' ','CASH',' ',0,'OLD','05/06/2010',' ',NULL,NULL,0,0),
 (625,0,'SP29',86,'2010-08-22 08:19:42',1000,'2010-08-22 08:19:42',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE',' ','CASH',' ',0,'OLD','05/06/2010',' ',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (626,0,'MGT41',106,'2010-09-23 17:59:14',300,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (627,0,'MGT41',106,'2010-09-23 17:59:14',100,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (628,0,'MGT41',106,'2010-09-23 17:59:14',3000,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (629,0,'MGT41',106,'2010-09-23 17:59:14',250,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (630,0,'MGT41',106,'2010-09-23 17:59:14',400,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (631,0,'MGT41',106,'2010-09-23 17:59:14',500,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (632,0,'MGT41',106,'2010-09-23 17:59:14',450,'2010-09-23 17:59:14',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (633,0,'MGT41',106,'2010-09-23 18:00:36',150,'2010-09-23 18:00:36',1,NULL,NULL,'PTA FEES','PTA FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (634,0,'SP41',106,'2010-09-23 18:00:50',1500,'2010-09-23 18:00:50',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (635,0,'SP41',106,'2010-09-23 18:00:50',1000,'2010-09-23 18:00:50',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (636,0,'SP41',106,'2010-09-23 18:00:50',150,'2010-09-23 18:00:50',1,NULL,NULL,'SPECIAL FEE','JRG FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (637,0,'SP41',106,'2010-09-23 18:00:50',350,'2010-09-23 18:00:50',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (638,0,'SP41',106,'2010-09-23 18:00:50',500,'2010-09-23 18:00:50',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (639,0,'PTA41',106,'2010-09-23 18:00:50',1000,'2010-09-23 18:00:50',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (640,0,'SP39',105,'2010-09-23 18:26:04',1500,'2010-09-23 18:26:04',1,NULL,NULL,'SPECIAL FEE','EXAM FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (641,0,'SP39',105,'2010-09-23 18:26:04',1000,'2010-09-23 18:26:04',1,NULL,NULL,'SPECIAL FEE','ANNUAL FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (642,0,'SP39',105,'2010-09-23 18:26:04',150,'2010-09-23 18:26:04',1,NULL,NULL,'SPECIAL FEE','JRG FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (643,0,'SP39',105,'2010-09-23 18:26:04',350,'2010-09-23 18:26:04',1,NULL,NULL,'SPECIAL FEE','GAMES FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (644,0,'SP39',105,'2010-09-23 18:26:04',500,'2010-09-23 18:26:04',1,NULL,NULL,'SPECIAL FEE','TUTION FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (645,0,'SP39',105,'2010-09-23 18:26:04',1000,'2010-09-23 18:26:04',1,NULL,NULL,'SPECIAL FEE','UNIFORM FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (646,0,'PTA39',105,'2010-09-23 18:26:39',150,'2010-09-23 18:26:39',1,NULL,NULL,'PTA FEES','PTA FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (647,0,'MGT39',105,'2010-09-23 18:27:49',300,'2010-09-23 18:27:49',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (648,0,'MGT39',105,'2010-09-23 18:27:49',100,'2010-09-23 18:27:49',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (649,0,'MGT39',105,'2010-09-23 18:27:49',3000,'2010-09-23 18:27:49',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (650,0,'MGT39',105,'2010-09-23 18:27:49',250,'2010-09-23 18:27:49',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (651,0,'MGT39',105,'2010-09-23 18:27:50',400,'2010-09-23 18:27:50',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (652,0,'MGT39',105,'2010-09-23 18:27:50',500,'2010-09-23 18:27:50',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (653,0,'MGT39',105,'2010-09-23 18:27:50',450,'2010-09-23 18:27:50',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'OLD','02/08/2010','',NULL,NULL,0,0),
 (654,0,'MGT41',106,'2010-09-27 14:24:21',300,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0),
 (655,0,'MGT41',106,'2010-09-27 14:24:21',100,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (656,0,'MGT41',106,'2010-09-27 14:24:21',3000,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0),
 (657,0,'MGT41',106,'2010-09-27 14:24:21',250,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0),
 (658,0,'MGT41',106,'2010-09-27 14:24:21',400,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0),
 (659,0,'MGT41',106,'2010-09-27 14:24:21',500,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0),
 (660,0,'MGT41',106,'2010-09-27 14:24:21',450,'2010-09-27 14:24:21',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'NA','02/08/2010','',NULL,NULL,0,0),
 (661,0,'INV000661',106,'2010-10-25 16:26:02',250,'2010-10-25 16:26:02',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NA','01/10/2010','',NULL,NULL,0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (662,0,'INV000662',106,'2010-10-25 16:28:26',250,'2010-10-25 16:28:26',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NA','01/10/2010','',NULL,NULL,0,0),
 (663,0,'INV000663',106,'2010-10-25 16:30:34',250,'2010-10-25 16:30:34',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NA','25/10/2010','',NULL,NULL,0,0),
 (664,0,'INV000664',130,'2011-02-01 00:25:52',100,'2011-02-01 00:25:52',1,NULL,NULL,'SPECIAL FEES','IMPROVEMENT FEE','Student','CASH','',0,'NA','01/02/2011','','250','200',0,0),
 (665,0,'INV000665',130,'2011-02-01 00:26:08',100,'2011-02-01 00:26:08',1,NULL,NULL,'SPECIAL FEES','IMPROVEMENT FEE','Student','CASH','',0,'NA','01/02/2011','','250','200',0,0),
 (666,0,'INV000666',106,'2011-04-04 16:15:03',300,'2011-04-04 16:15:03',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (667,0,'INV000666',106,'2011-04-04 16:15:04',100,'2011-04-04 16:15:04',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (668,0,'INV000666',106,'2011-04-04 16:15:04',3000,'2011-04-04 16:15:04',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (669,0,'INV000666',106,'2011-04-04 16:15:04',250,'2011-04-04 16:15:04',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (670,0,'INV000666',106,'2011-04-04 16:15:04',400,'2011-04-04 16:15:04',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (671,0,'INV000666',106,'2011-04-04 16:15:04',500,'2011-04-04 16:15:04',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (672,0,'INV000666',106,'2011-04-04 16:15:04',450,'2011-04-04 16:15:04',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (673,0,'INV000673',101,'2011-04-15 19:38:26',300,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (674,0,'INV000673',101,'2011-04-15 19:38:26',100,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (675,0,'INV000673',101,'2011-04-15 19:38:26',3000,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (676,0,'INV000673',101,'2011-04-15 19:38:26',250,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (677,0,'INV000673',101,'2011-04-15 19:38:26',400,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (678,0,'INV000673',101,'2011-04-15 19:38:26',500,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (679,0,'INV000673',101,'2011-04-15 19:38:26',450,'2011-04-15 19:38:26',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (680,0,'INV000680',99,'2011-04-15 23:49:05',300,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (681,0,'INV000680',99,'2011-04-15 23:49:05',100,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (682,0,'INV000680',99,'2011-04-15 23:49:05',3000,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (683,0,'INV000680',99,'2011-04-15 23:49:05',250,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (684,0,'INV000680',99,'2011-04-15 23:49:05',400,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (685,0,'INV000680',99,'2011-04-15 23:49:05',500,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0),
 (686,0,'INV000680',99,'2011-04-15 23:49:05',450,'2011-04-15 23:49:05',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',0,'NEW','01/04/2011','','0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (687,0,'INV000687',133,'2011-06-20 07:33:53',3000,'2011-06-20 07:33:53',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','15/06/2011',NULL,'250','200',670,670),
 (688,0,'INV000688',129,'2011-06-20 15:25:39',300,'2011-06-20 15:25:39',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000),
 (689,0,'INV000688',129,'2011-06-20 15:25:39',100,'2011-06-20 15:25:39',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000),
 (690,0,'INV000688',129,'2011-06-20 15:25:39',3000,'2011-06-20 15:25:39',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000),
 (691,0,'INV000688',129,'2011-06-20 15:25:39',250,'2011-06-20 15:25:39',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (692,0,'INV000688',129,'2011-06-20 15:25:39',400,'2011-06-20 15:25:39',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000),
 (693,0,'INV000688',129,'2011-06-20 15:25:40',500,'2011-06-20 15:25:40',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000),
 (694,0,'INV000688',129,'2011-06-20 15:25:40',450,'2011-06-20 15:25:40',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','20/06/2011',NULL,'0.00','0.00',4000,4000),
 (695,0,'INV000695',133,'2011-06-21 18:03:13',150,'2011-06-21 18:03:13',1,NULL,NULL,'PTA FEES','PTA FEE','Student','CASH','',NULL,'NA','21/06/2011',NULL,'250','200',0,0),
 (696,0,'INV000696',133,'2011-06-21 18:05:45',150,'2011-06-21 18:05:45',1,NULL,NULL,'PTA FEES','PTA FEE','Student','CASH','',NULL,'NA','21/06/2011',NULL,'250','200',150,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (697,0,'INV000697',133,'2011-06-23 00:05:48',3000,'2011-06-23 00:05:48',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','23/06/2011',NULL,'250','200',700,700),
 (698,0,'INV000698',133,'2011-06-24 14:59:33',3000,'2011-06-24 14:59:32',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',800,0),
 (699,0,'INV000699',133,'2011-06-24 15:02:46',3000,'2011-06-24 15:02:46',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',800,2200),
 (700,0,'INV000700',132,'2011-06-24 15:05:49',3000,'2011-06-24 15:05:49',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','23/06/2011',NULL,'0.00','0.00',699,2200),
 (701,0,'INV000701',132,'2011-06-24 15:06:17',3000,'2011-06-24 15:06:17',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','23/06/2011',NULL,'0.00','0.00',699,2200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (702,0,'INV000702',132,'2011-06-24 15:08:57',3000,'2011-06-24 15:08:57',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','23/06/2011',NULL,'0.00','0.00',699,2200),
 (703,0,'INV000703',132,'2011-06-24 15:27:40',3000,'2011-06-24 15:27:40',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (704,0,'INV000704',132,'2011-06-24 15:29:31',300,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (705,0,'INV000704',132,'2011-06-24 15:29:31',100,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (706,0,'INV000704',132,'2011-06-24 15:29:31',3000,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (707,0,'INV000704',132,'2011-06-24 15:29:31',250,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (708,0,'INV000704',132,'2011-06-24 15:29:31',400,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (709,0,'INV000704',132,'2011-06-24 15:29:31',500,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (710,0,'INV000704',132,'2011-06-24 15:29:31',450,'2011-06-24 15:29:31',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (711,0,'INV000711',132,'2011-06-24 17:26:15',3000,'2011-06-24 17:26:15',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',600,2400);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (712,0,'INV000711',132,'2011-06-24 17:26:47',3000,'2011-06-24 17:26:47',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',600,2400),
 (713,0,'INV000713',132,'2011-06-24 18:06:16',3000,'2011-06-24 18:06:16',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'0.00','0.00',700,0),
 (714,0,'INV000714',133,'2011-06-24 19:44:59',3000,'2011-06-24 19:44:59',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (715,0,'INV000715',133,'2011-06-24 19:50:26',3000,'2011-06-24 19:50:26',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (716,0,'INV000716',133,'2011-06-24 19:52:25',3000,'2011-06-24 19:52:25',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (717,0,'INV000717',133,'2011-06-24 19:53:28',3000,'2011-06-24 19:53:28',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (718,0,'INV000718',133,'2011-06-24 19:53:58',3000,'2011-06-24 19:53:58',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (719,0,'INV000719',133,'2011-06-24 19:54:57',3000,'2011-06-24 19:54:57',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (720,0,'INV000720',133,'2011-06-24 19:55:17',3000,'2011-06-24 19:55:17',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (721,0,'INV000721',133,'2011-06-24 19:56:25',3000,'2011-06-24 19:56:25',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (722,0,'INV000722',133,'2011-06-24 19:56:50',3000,'2011-06-24 19:56:50',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (723,0,'INV000723',133,'2011-06-24 19:57:24',3000,'2011-06-24 19:57:24',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (724,0,'INV000724',133,'2011-06-24 19:58:08',3000,'2011-06-24 19:58:08',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (725,0,'INV000725',133,'2011-06-24 19:58:33',3000,'2011-06-24 19:58:33',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (726,0,'INV000726',133,'2011-06-24 19:59:06',3000,'2011-06-24 19:59:06',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (727,0,'INV000727',133,'2011-06-24 19:59:32',3000,'2011-06-24 19:59:32',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',150,50),
 (728,0,'INV000728',133,'2011-06-24 20:09:24',3000,'2011-06-24 20:09:24',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',500,0),
 (729,0,'INV000729',133,'2011-06-24 20:10:27',250,'2011-06-24 20:10:27',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',100,0),
 (730,0,'INV000730',133,'2011-06-24 20:16:22',250,'2011-06-24 20:16:22',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',100,0),
 (731,0,'INV000731',133,'2011-06-24 20:18:34',250,'2011-06-24 20:18:34',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',100,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (732,0,'INV000732',133,'2011-06-24 20:20:41',250,'2011-06-24 20:20:41',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',100,0),
 (733,0,'INV000733',133,'2011-06-24 20:20:52',250,'2011-06-24 20:20:52',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',0,0),
 (734,0,'INV000734',133,'2011-06-24 20:24:07',250,'2011-06-24 20:24:07',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',0,0),
 (735,0,'INV000735',133,'2011-06-24 20:24:27',250,'2011-06-24 20:24:27',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',0,0),
 (736,0,'INV000736',133,'2011-06-24 20:24:48',250,'2011-06-24 20:24:48',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','30/06/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (737,0,'INV000737',131,'2011-06-25 11:46:47',3000,'2011-06-25 11:46:47',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'0.00','0.00',0,0),
 (738,0,'INV000738',133,'2011-06-25 12:17:57',300,'2011-06-25 12:17:57',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0),
 (739,0,'INV000738',133,'2011-06-25 12:17:58',100,'2011-06-25 12:17:58',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0),
 (740,0,'INV000738',133,'2011-06-25 12:17:58',3000,'2011-06-25 12:17:58',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0),
 (741,0,'INV000738',133,'2011-06-25 12:17:58',250,'2011-06-25 12:17:58',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (742,0,'INV000738',133,'2011-06-25 12:17:58',400,'2011-06-25 12:17:58',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0),
 (743,0,'INV000738',133,'2011-06-25 12:17:58',500,'2011-06-25 12:17:58',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0),
 (744,0,'INV000738',133,'2011-06-25 12:17:58',450,'2011-06-25 12:17:58',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',4000,0),
 (745,0,'INV000745',133,'2011-06-25 12:30:25',3000,'2011-06-25 12:30:25',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','24/06/2011',NULL,'250','200',1000,2000),
 (746,0,'INV000746',134,'2011-06-25 15:24:26',300,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (747,0,'INV000746',134,'2011-06-25 15:24:26',100,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0),
 (748,0,'INV000746',134,'2011-06-25 15:24:26',3000,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0),
 (749,0,'INV000746',134,'2011-06-25 15:24:26',250,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0),
 (750,0,'INV000746',134,'2011-06-25 15:24:26',400,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0),
 (751,0,'INV000746',134,'2011-06-25 15:24:26',500,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (752,0,'INV000746',134,'2011-06-25 15:24:26',450,'2011-06-25 15:24:26',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','500',0,0),
 (753,0,'INV000753',133,'2011-06-25 16:47:25',300,'2011-06-25 16:47:25',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0),
 (754,0,'INV000753',133,'2011-06-25 16:47:26',100,'2011-06-25 16:47:26',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0),
 (755,0,'INV000753',133,'2011-06-25 16:47:26',3000,'2011-06-25 16:47:26',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0),
 (756,0,'INV000753',133,'2011-06-25 16:47:26',250,'2011-06-25 16:47:26',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (757,0,'INV000753',133,'2011-06-25 16:47:26',400,'2011-06-25 16:47:26',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0),
 (758,0,'INV000753',133,'2011-06-25 16:47:26',500,'2011-06-25 16:47:26',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0),
 (759,0,'INV000753',133,'2011-06-25 16:47:26',450,'2011-06-25 16:47:26',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','25/06/2011',NULL,'250','200',0,0),
 (760,0,'INV000760',132,'2011-07-02 14:16:49',300,'2011-07-02 14:16:49',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (761,0,'INV000760',132,'2011-07-02 14:16:51',100,'2011-07-02 14:16:51',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (762,0,'INV000760',132,'2011-07-02 14:16:51',3000,'2011-07-02 14:16:51',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (763,0,'INV000760',132,'2011-07-02 14:16:51',250,'2011-07-02 14:16:51',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (764,0,'INV000760',132,'2011-07-02 14:16:51',400,'2011-07-02 14:16:51',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (765,0,'INV000760',132,'2011-07-02 14:16:51',500,'2011-07-02 14:16:51',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (766,0,'INV000760',132,'2011-07-02 14:16:51',450,'2011-07-02 14:16:51',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (767,0,'INV000767',133,'2011-07-02 14:46:23',300,'2011-07-02 14:46:23',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (768,0,'INV000767',133,'2011-07-02 14:46:25',300,'2011-07-02 14:46:25',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (769,0,'INV000767',133,'2011-07-02 14:46:26',100,'2011-07-02 14:46:26',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (770,0,'INV000767',133,'2011-07-02 14:46:26',3000,'2011-07-02 14:46:26',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (771,0,'INV000767',133,'2011-07-02 14:46:27',3000,'2011-07-02 14:46:27',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (772,0,'INV000767',133,'2011-07-02 14:46:28',250,'2011-07-02 14:46:28',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (773,0,'INV000767',133,'2011-07-02 14:46:29',250,'2011-07-02 14:46:29',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (774,0,'INV000767',133,'2011-07-02 14:46:29',400,'2011-07-02 14:46:29',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (775,0,'INV000767',133,'2011-07-02 14:46:30',400,'2011-07-02 14:46:30',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (776,0,'INV000767',133,'2011-07-02 14:46:31',500,'2011-07-02 14:46:31',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (777,0,'INV000767',133,'2011-07-02 14:46:32',500,'2011-07-02 14:46:32',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (778,0,'INV000767',133,'2011-07-02 14:46:32',450,'2011-07-02 14:46:32',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (779,0,'INV000767',133,'2011-07-02 14:46:33',450,'2011-07-02 14:46:33',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (780,0,'INV000767',133,'2011-07-02 14:46:33',450,'2011-07-02 14:46:33',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (781,0,'INV000781',133,'2011-07-02 14:48:38',300,'2011-07-02 14:48:38',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (782,0,'INV000781',133,'2011-07-02 14:48:39',100,'2011-07-02 14:48:39',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (783,0,'INV000781',133,'2011-07-02 14:48:40',3000,'2011-07-02 14:48:40',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (784,0,'INV000781',133,'2011-07-02 14:48:40',250,'2011-07-02 14:48:40',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (785,0,'INV000781',133,'2011-07-02 14:48:41',400,'2011-07-02 14:48:41',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (786,0,'INV000781',133,'2011-07-02 14:48:42',500,'2011-07-02 14:48:42',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (787,0,'INV000781',133,'2011-07-02 14:48:42',450,'2011-07-02 14:48:42',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (788,0,'INV000788',133,'2011-07-02 14:52:52',300,'2011-07-02 14:52:52',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (789,0,'INV000788',133,'2011-07-02 14:52:52',100,'2011-07-02 14:52:52',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (790,0,'INV000788',133,'2011-07-02 14:52:59',3000,'2011-07-02 14:52:59',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (791,0,'INV000788',133,'2011-07-02 14:53:00',250,'2011-07-02 14:53:00',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (792,0,'INV000788',133,'2011-07-02 14:53:01',400,'2011-07-02 14:53:01',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (793,0,'INV000788',133,'2011-07-02 14:53:01',500,'2011-07-02 14:53:01',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (794,0,'INV000788',133,'2011-07-02 14:53:02',450,'2011-07-02 14:53:02',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (795,0,'INV000795',133,'2011-07-02 14:54:19',300,'2011-07-02 14:54:19',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (796,0,'INV000795',133,'2011-07-02 14:55:02',100,'2011-07-02 14:55:02',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (797,0,'INV000795',133,'2011-07-02 14:55:04',3000,'2011-07-02 14:55:04',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (798,0,'INV000795',133,'2011-07-02 14:55:05',250,'2011-07-02 14:55:05',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (799,0,'INV000795',133,'2011-07-02 14:55:06',400,'2011-07-02 14:55:06',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (800,0,'INV000795',133,'2011-07-02 14:55:06',500,'2011-07-02 14:55:06',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (801,0,'INV000795',133,'2011-07-02 14:55:07',450,'2011-07-02 14:55:07',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (802,0,'INV000802',133,'2011-07-02 15:36:41',300,'2011-07-02 15:36:41',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (803,0,'INV000802',133,'2011-07-02 15:36:42',100,'2011-07-02 15:36:42',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (804,0,'INV000802',133,'2011-07-02 15:36:44',3000,'2011-07-02 15:36:44',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (805,0,'INV000802',133,'2011-07-02 15:36:47',250,'2011-07-02 15:36:47',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (806,0,'INV000802',133,'2011-07-02 15:36:47',400,'2011-07-02 15:36:47',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (807,0,'INV000802',133,'2011-07-02 15:36:47',500,'2011-07-02 15:36:47',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (808,0,'INV000802',133,'2011-07-02 15:36:47',450,'2011-07-02 15:36:47',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (809,0,'INV000809',133,'2011-07-02 15:38:04',300,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (810,0,'INV000809',133,'2011-07-02 15:38:04',100,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (811,0,'INV000809',133,'2011-07-02 15:38:04',3000,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (812,0,'INV000809',133,'2011-07-02 15:38:04',250,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (813,0,'INV000809',133,'2011-07-02 15:38:04',400,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (814,0,'INV000809',133,'2011-07-02 15:38:04',500,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (815,0,'INV000809',133,'2011-07-02 15:38:04',450,'2011-07-02 15:38:04',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (816,0,'INV000816',133,'2011-07-02 15:40:28',300,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (817,0,'INV000816',133,'2011-07-02 15:40:28',100,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (818,0,'INV000816',133,'2011-07-02 15:40:28',3000,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (819,0,'INV000816',133,'2011-07-02 15:40:28',250,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (820,0,'INV000816',133,'2011-07-02 15:40:28',400,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (821,0,'INV000816',133,'2011-07-02 15:40:28',500,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (822,0,'INV000816',133,'2011-07-02 15:40:28',450,'2011-07-02 15:40:28',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (823,0,'INV000823',133,'2011-07-02 15:41:28',300,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (824,0,'INV000823',133,'2011-07-02 15:41:28',100,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (825,0,'INV000823',133,'2011-07-02 15:41:28',3000,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (826,0,'INV000823',133,'2011-07-02 15:41:28',250,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (827,0,'INV000823',133,'2011-07-02 15:41:28',400,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (828,0,'INV000823',133,'2011-07-02 15:41:28',500,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (829,0,'INV000823',133,'2011-07-02 15:41:28',450,'2011-07-02 15:41:28',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (830,0,'INV000830',133,'2011-07-02 15:41:48',300,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (831,0,'INV000830',133,'2011-07-02 15:41:48',100,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (832,0,'INV000830',133,'2011-07-02 15:41:48',3000,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (833,0,'INV000830',133,'2011-07-02 15:41:48',250,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (834,0,'INV000830',133,'2011-07-02 15:41:48',400,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (835,0,'INV000830',133,'2011-07-02 15:41:48',500,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (836,0,'INV000830',133,'2011-07-02 15:41:48',450,'2011-07-02 15:41:48',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (837,0,'INV000837',133,'2011-07-02 15:43:26',300,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (838,0,'INV000837',133,'2011-07-02 15:43:26',100,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (839,0,'INV000837',133,'2011-07-02 15:43:26',3000,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (840,0,'INV000837',133,'2011-07-02 15:43:26',250,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (841,0,'INV000837',133,'2011-07-02 15:43:26',400,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (842,0,'INV000837',133,'2011-07-02 15:43:26',500,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (843,0,'INV000837',133,'2011-07-02 15:43:26',450,'2011-07-02 15:43:26',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (844,0,'INV000844',133,'2011-07-02 15:43:54',300,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (845,0,'INV000844',133,'2011-07-02 15:43:54',100,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (846,0,'INV000844',133,'2011-07-02 15:43:54',3000,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (847,0,'INV000844',133,'2011-07-02 15:43:54',250,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (848,0,'INV000844',133,'2011-07-02 15:43:54',400,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (849,0,'INV000844',133,'2011-07-02 15:43:54',500,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (850,0,'INV000844',133,'2011-07-02 15:43:54',450,'2011-07-02 15:43:54',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (851,0,'INV000851',133,'2011-07-02 15:48:08',300,'2011-07-02 15:48:08',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (852,0,'INV000851',133,'2011-07-02 15:48:08',100,'2011-07-02 15:48:08',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (853,0,'INV000851',133,'2011-07-02 15:48:08',3000,'2011-07-02 15:48:08',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (854,0,'INV000851',133,'2011-07-02 15:48:08',250,'2011-07-02 15:48:08',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (855,0,'INV000851',133,'2011-07-02 15:48:08',400,'2011-07-02 15:48:08',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (856,0,'INV000851',133,'2011-07-02 15:48:08',500,'2011-07-02 15:48:08',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (857,0,'INV000851',133,'2011-07-02 15:48:09',450,'2011-07-02 15:48:09',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (858,0,'INV000858',133,'2011-07-02 15:50:33',300,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (859,0,'INV000858',133,'2011-07-02 15:50:33',100,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (860,0,'INV000858',133,'2011-07-02 15:50:33',3000,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (861,0,'INV000858',133,'2011-07-02 15:50:33',250,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (862,0,'INV000858',133,'2011-07-02 15:50:33',400,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (863,0,'INV000858',133,'2011-07-02 15:50:33',500,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (864,0,'INV000858',133,'2011-07-02 15:50:33',450,'2011-07-02 15:50:33',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (865,0,'INV000865',133,'2011-07-02 15:54:01',300,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (866,0,'INV000865',133,'2011-07-02 15:54:01',100,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (867,0,'INV000865',133,'2011-07-02 15:54:01',3000,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (868,0,'INV000865',133,'2011-07-02 15:54:01',250,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (869,0,'INV000865',133,'2011-07-02 15:54:01',400,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (870,0,'INV000865',133,'2011-07-02 15:54:01',500,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (871,0,'INV000865',133,'2011-07-02 15:54:01',450,'2011-07-02 15:54:01',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (872,0,'INV000872',133,'2011-07-02 15:55:47',300,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (873,0,'INV000872',133,'2011-07-02 15:55:47',100,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (874,0,'INV000872',133,'2011-07-02 15:55:47',3000,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (875,0,'INV000872',133,'2011-07-02 15:55:47',250,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (876,0,'INV000872',133,'2011-07-02 15:55:47',400,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (877,0,'INV000872',133,'2011-07-02 15:55:47',500,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (878,0,'INV000872',133,'2011-07-02 15:55:47',450,'2011-07-02 15:55:47',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (879,0,'INV000879',133,'2011-07-02 15:57:32',300,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (880,0,'INV000879',133,'2011-07-02 15:57:32',100,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (881,0,'INV000879',133,'2011-07-02 15:57:32',3000,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (882,0,'INV000879',133,'2011-07-02 15:57:32',250,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (883,0,'INV000879',133,'2011-07-02 15:57:32',400,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (884,0,'INV000879',133,'2011-07-02 15:57:32',500,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (885,0,'INV000879',133,'2011-07-02 15:57:32',450,'2011-07-02 15:57:32',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','22/07/2011',NULL,'250','200',0,200),
 (886,0,'INV000886',133,'2011-07-02 17:21:28',300,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (887,0,'INV000886',133,'2011-07-02 17:21:28',100,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (888,0,'INV000886',133,'2011-07-02 17:21:28',3000,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (889,0,'INV000886',133,'2011-07-02 17:21:28',250,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (890,0,'INV000886',133,'2011-07-02 17:21:28',400,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (891,0,'INV000886',133,'2011-07-02 17:21:28',500,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (892,0,'INV000886',133,'2011-07-02 17:21:28',450,'2011-07-02 17:21:28',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (893,0,'INV000893',133,'2011-07-02 17:24:00',300,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (894,0,'INV000893',133,'2011-07-02 17:24:00',100,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (895,0,'INV000893',133,'2011-07-02 17:24:00',3000,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (896,0,'INV000893',133,'2011-07-02 17:24:00',250,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (897,0,'INV000893',133,'2011-07-02 17:24:00',400,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (898,0,'INV000893',133,'2011-07-02 17:24:00',500,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (899,0,'INV000893',133,'2011-07-02 17:24:00',450,'2011-07-02 17:24:00',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (900,0,'INV000900',133,'2011-07-02 17:25:59',300,'2011-07-02 17:25:59',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (901,0,'INV000900',133,'2011-07-02 17:26:00',100,'2011-07-02 17:26:00',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (902,0,'INV000900',133,'2011-07-02 17:26:00',3000,'2011-07-02 17:26:00',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (903,0,'INV000900',133,'2011-07-02 17:26:00',250,'2011-07-02 17:26:00',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (904,0,'INV000900',133,'2011-07-02 17:26:00',400,'2011-07-02 17:26:00',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (905,0,'INV000900',133,'2011-07-02 17:26:00',500,'2011-07-02 17:26:00',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (906,0,'INV000900',133,'2011-07-02 17:26:00',450,'2011-07-02 17:26:00',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (907,0,'INV000907',133,'2011-07-02 17:26:40',300,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (908,0,'INV000907',133,'2011-07-02 17:26:40',100,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (909,0,'INV000907',133,'2011-07-02 17:26:40',3000,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (910,0,'INV000907',133,'2011-07-02 17:26:40',250,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (911,0,'INV000907',133,'2011-07-02 17:26:40',400,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (912,0,'INV000907',133,'2011-07-02 17:26:40',500,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (913,0,'INV000907',133,'2011-07-02 17:26:40',450,'2011-07-02 17:26:40',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (914,0,'INV000914',133,'2011-07-02 17:27:44',300,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (915,0,'INV000914',133,'2011-07-02 17:27:44',100,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (916,0,'INV000914',133,'2011-07-02 17:27:44',3000,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (917,0,'INV000914',133,'2011-07-02 17:27:44',250,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (918,0,'INV000914',133,'2011-07-02 17:27:44',400,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (919,0,'INV000914',133,'2011-07-02 17:27:44',500,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (920,0,'INV000914',133,'2011-07-02 17:27:44',450,'2011-07-02 17:27:44',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (921,0,'INV000921',133,'2011-07-02 17:29:03',300,'2011-07-02 17:29:03',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (922,0,'INV000922',133,'2011-07-02 17:31:06',300,'2011-07-02 17:31:06',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,200),
 (923,0,'INV000923',133,'2011-07-02 17:31:37',250,'2011-07-02 17:31:37',1,NULL,NULL,'MGT FEES','Hostel Fee','Student','CASH','',NULL,'NA','06/07/2011',NULL,'250','200',0,200),
 (924,0,'INV000924',133,'2011-07-02 17:33:21',250,'2011-07-02 17:33:21',1,NULL,NULL,'MGT FEES','Hostel Fee','Student','CASH','',NULL,'NA','06/07/2011',NULL,'250','200',0,200),
 (925,0,'INV000925',134,'2011-07-02 17:35:23',500,'2011-07-02 17:35:23',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','500',0,750),
 (926,0,'INV000925',134,'2011-07-02 17:35:23',250,'2011-07-02 17:35:23',1,NULL,NULL,'MGT FEES','Hostel Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','500',0,750);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (927,0,'INV000927',134,'2011-07-02 17:35:56',300,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (928,0,'INV000927',134,'2011-07-02 17:35:56',100,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (929,0,'INV000927',134,'2011-07-02 17:35:56',3000,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (930,0,'INV000927',134,'2011-07-02 17:35:56',250,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (931,0,'INV000927',134,'2011-07-02 17:35:56',400,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (932,0,'INV000927',134,'2011-07-02 17:35:56',500,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (933,0,'INV000927',134,'2011-07-02 17:35:56',450,'2011-07-02 17:35:56',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (934,0,'INV000934',134,'2011-07-02 17:36:36',300,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (935,0,'INV000934',134,'2011-07-02 17:36:36',100,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (936,0,'INV000934',134,'2011-07-02 17:36:36',3000,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (937,0,'INV000934',134,'2011-07-02 17:36:36',250,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (938,0,'INV000934',134,'2011-07-02 17:36:36',400,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (939,0,'INV000934',134,'2011-07-02 17:36:36',500,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (940,0,'INV000934',134,'2011-07-02 17:36:36',450,'2011-07-02 17:36:36',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','15/07/2011',NULL,'250','500',0,0),
 (941,0,'INV000941',134,'2011-07-02 17:37:06',500,'2011-07-02 17:37:06',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','500',0,500);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (942,0,'INV000942',134,'2011-07-02 17:38:53',400,'2011-07-02 17:38:53',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','500',100,400),
 (943,0,'INV000943',129,'2011-07-02 17:45:02',300,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (944,0,'INV000943',129,'2011-07-02 17:45:02',100,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (945,0,'INV000943',129,'2011-07-02 17:45:02',3000,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (946,0,'INV000943',129,'2011-07-02 17:45:02',250,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (947,0,'INV000943',129,'2011-07-02 17:45:02',400,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (948,0,'INV000943',129,'2011-07-02 17:45:02',500,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (949,0,'INV000943',129,'2011-07-02 17:45:02',450,'2011-07-02 17:45:02',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (950,0,'INV000950',129,'2011-07-02 17:46:06',200,'2011-07-02 17:46:06',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (951,0,'INV000951',128,'2011-07-02 17:47:12',100,'2011-07-02 17:47:12',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,400);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (952,0,'INV000952',127,'2011-07-02 19:06:21',0,'2011-07-02 19:06:21',1,NULL,NULL,'MGT FEES','Hostel Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (953,0,'INV000953',127,'2011-07-02 19:17:12',0,'2011-07-02 19:17:12',1,NULL,NULL,'MGT FEES','Hostel Fee','Student','CASH','',NULL,'NA','02/07/2011',NULL,'0.00','0.00',0,0),
 (954,0,'INV000954',127,'2011-07-02 19:48:29',400,'2011-07-02 19:48:29',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',500,'NA','02/07/2011',NULL,'0.00','0.00',0,400),
 (955,0,'INV000955',133,'2011-07-02 21:07:09',250,'2011-07-02 21:07:09',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',789,'NA','02/07/2011',NULL,'250','200',0,400),
 (956,0,'INV000956',133,'2011-07-02 21:24:21',300,'2011-07-02 21:24:21',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (957,0,'INV000956',133,'2011-07-02 21:24:22',100,'2011-07-02 21:24:22',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (958,0,'INV000956',133,'2011-07-02 21:24:22',3000,'2011-07-02 21:24:22',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (959,0,'INV000956',133,'2011-07-02 21:24:22',250,'2011-07-02 21:24:22',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (960,0,'INV000956',133,'2011-07-02 21:24:22',400,'2011-07-02 21:24:22',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (961,0,'INV000956',133,'2011-07-02 21:24:22',500,'2011-07-02 21:24:22',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (962,0,'INV000956',133,'2011-07-02 21:24:22',450,'2011-07-02 21:24:22',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (963,0,'INV000963',133,'2011-07-02 21:36:51',300,'2011-07-02 21:36:51',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (964,0,'INV000963',133,'2011-07-02 21:36:52',100,'2011-07-02 21:36:52',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (965,0,'INV000963',133,'2011-07-02 21:36:52',3000,'2011-07-02 21:36:52',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (966,0,'INV000963',133,'2011-07-02 21:36:52',250,'2011-07-02 21:36:52',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (967,0,'INV000963',133,'2011-07-02 21:36:52',400,'2011-07-02 21:36:52',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (968,0,'INV000963',133,'2011-07-02 21:36:52',500,'2011-07-02 21:36:52',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (969,0,'INV000963',133,'2011-07-02 21:36:52',450,'2011-07-02 21:36:52',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (970,0,'INV000970',133,'2011-07-02 21:37:36',300,'2011-07-02 21:37:36',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (971,0,'INV000970',133,'2011-07-02 21:37:36',100,'2011-07-02 21:37:36',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (972,0,'INV000970',133,'2011-07-02 21:37:36',3000,'2011-07-02 21:37:36',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (973,0,'INV000970',133,'2011-07-02 21:37:36',250,'2011-07-02 21:37:36',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (974,0,'INV000970',133,'2011-07-02 21:37:37',400,'2011-07-02 21:37:37',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (975,0,'INV000970',133,'2011-07-02 21:37:37',500,'2011-07-02 21:37:37',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (976,0,'INV000970',133,'2011-07-02 21:37:37',450,'2011-07-02 21:37:37',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (977,0,'INV000977',133,'2011-07-02 21:41:33',250,'2011-07-02 21:41:33',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,250),
 (978,0,'INV000978',133,'2011-07-02 21:45:30',300,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (979,0,'INV000978',133,'2011-07-02 21:45:30',100,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (980,0,'INV000978',133,'2011-07-02 21:45:30',3000,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (981,0,'INV000978',133,'2011-07-02 21:45:30',250,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (982,0,'INV000978',133,'2011-07-02 21:45:30',400,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (983,0,'INV000978',133,'2011-07-02 21:45:30',500,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (984,0,'INV000978',133,'2011-07-02 21:45:30',450,'2011-07-02 21:45:30',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','02/07/2011',NULL,'250','200',0,0),
 (985,0,'INV000985',133,'2011-07-04 11:50:14',300,'2011-07-04 11:50:14',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (986,0,'INV000985',133,'2011-07-04 11:50:15',100,'2011-07-04 11:50:15',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (987,0,'INV000985',133,'2011-07-04 11:50:15',3000,'2011-07-04 11:50:15',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (988,0,'INV000985',133,'2011-07-04 11:50:15',250,'2011-07-04 11:50:15',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (989,0,'INV000985',133,'2011-07-04 11:50:15',400,'2011-07-04 11:50:15',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (990,0,'INV000985',133,'2011-07-04 11:50:15',500,'2011-07-04 11:50:15',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (991,0,'INV000985',133,'2011-07-04 11:50:15',450,'2011-07-04 11:50:15',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (992,0,'INV000992',133,'2011-07-04 12:02:00',300,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (993,0,'INV000992',133,'2011-07-04 12:02:00',100,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (994,0,'INV000992',133,'2011-07-04 12:02:00',3000,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (995,0,'INV000992',133,'2011-07-04 12:02:00',250,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (996,0,'INV000992',133,'2011-07-04 12:02:00',400,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (997,0,'INV000992',133,'2011-07-04 12:02:00',500,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (998,0,'INV000992',133,'2011-07-04 12:02:00',450,'2011-07-04 12:02:00',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','04/07/2011',NULL,'250','200',0,0),
 (999,0,'INV000999',134,'2011-07-20 21:43:28',500,'2011-07-20 21:43:28',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',100,'NA','20/07/2011',NULL,'250','500',0,0),
 (1000,0,'INV000999',134,'2011-07-20 21:43:29',250,'2011-07-20 21:43:29',1,NULL,NULL,'MGT FEES','Hostel Fee','Student','CASH','',100,'NA','20/07/2011',NULL,'250','500',0,0),
 (1001,0,'INV0001001',126,'2011-07-28 13:51:34',0,'2011-07-28 13:51:34',1,NULL,NULL,'MGT FEES','Transport Fee','Student','CASH','',NULL,'NA','28/07/2011',NULL,'0.00','0.00',0,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (1002,0,'INV0001002',129,'2011-08-08 21:57:19',300,'2011-08-08 21:57:19',1,NULL,NULL,'MGT FEES','ADDMISSION FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0),
 (1003,0,'INV0001002',129,'2011-08-08 21:57:19',100,'2011-08-08 21:57:19',1,NULL,NULL,'MGT FEES','APPLICATION FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0),
 (1004,0,'INV0001002',129,'2011-08-08 21:57:19',3000,'2011-08-08 21:57:19',1,NULL,NULL,'MGT FEES','BOOK FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0),
 (1005,0,'INV0001002',129,'2011-08-08 21:57:20',250,'2011-08-08 21:57:20',1,NULL,NULL,'MGT FEES','DIO PROGAM FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0),
 (1006,0,'INV0001002',129,'2011-08-08 21:57:20',400,'2011-08-08 21:57:20',1,NULL,NULL,'MGT FEES','CRAFT FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0);
INSERT INTO `invoice_details` (`invoice_id`,`fees_id`,`invoice_no`,`student_id`,`invoice_date`,`total_amt_paid`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`fees_type`,`sub_type`,`paid_by`,`pay_by`,`chq_no`,`fine`,`student_type`,`fees_date`,`conc`,`hostel_fee`,`transport_fee`,`paid_amt`,`balance_amt`) VALUES 
 (1007,0,'INV0001002',129,'2011-08-08 21:57:20',500,'2011-08-08 21:57:20',1,NULL,NULL,'MGT FEES','LIBRARY FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0),
 (1008,0,'INV0001002',129,'2011-08-08 21:57:20',450,'2011-08-08 21:57:20',1,NULL,NULL,'MGT FEES','WORK BOOK FEE','Student','CASH','',NULL,'NA','08/08/2011',NULL,'0.00','0.00',4000,0);
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(100) default NULL,
  `price` float NOT NULL,
  `product_url` varchar(255) default NULL,
  `image_url` varchar(100) default NULL,
  `notes` text,
  `is_recommended` tinyint(4) default '0',
  `rating` int(11) default '0',
  `rating_count` int(11) default '0',
  PRIMARY KEY  (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`,`category_id`,`name`,`author`,`price`,`product_url`,`image_url`,`notes`,`is_recommended`,`rating`,`rating_count`) VALUES 
 (1,2,'pandian software','Jim Buyens',39.99,'http://www.amazon.com/exec/obidos/ASIN/0735609667/yessoftware','images/books/0735609667.jpg','As Web sites continue to grow in complexity and in the volume of data they must present, databases increasingly drive their content. WEB DATABASE DEVELOPMENT FUNDAMENTALS is ideal for the beginning-to-intermediate Web developer, departmental power user, or entrepreneur who wants to step up to a database-driven Web site-without buying several in-depth guides to the different technologies involved. This book uses the clear Microsoft(r) Step by Step tutorial method to familiarize developers with the technologies for building smart Web sites that present data more easily. ',1,0,0),
 (2,1,'Programming Perl (3rd Edition)','Larry Wall, Tom Christiansen, Jon Orwant',39.96,'http://www.amazon.com/exec/obidos/ASIN/0596000278/yessoftware','images/books/0596000278.jpg','Perl is a powerful programming language that has grown in popularity since it first appeared in 1988. The first edition of this book, Programming Perl, hit the shelves in 1990, and was quickly adopted as the undisputed bible of the language. Since then, Perl has grown with the times, and so has this book.\r\nProgramming Perl is not just a book about Perl. It is also a unique introduction to the language and its culture, as you might expect only from its authors. Larry Wall is the inventor of Perl, and provides a unique perspective on the evolution of Perl and its future direction. Tom Christiansen was one of the first champions of the language, and lives and breathes the complexities of Perl internals as few other mortals do. Jon Orwant is the editor of The Perl Journal, which has brought together the Perl community as a common forum for new developments in Perl. ',0,0,0),
 (3,1,'Perl and CGI for the World Wide Web: Visual QuickStart Guide','Elizabeth Castro',15.19,'http://www.amazon.com/exec/obidos/ASIN/020135358X/yessoftware','images/books/020135358X.gif','Taking a visual approach, this guide uses ample screen stills to explain the basic components of Perl, and show how to install and customize existing CGI scripts to build interactivity into Web sites.',0,0,0);
INSERT INTO `items` (`item_id`,`category_id`,`name`,`author`,`price`,`product_url`,`image_url`,`notes`,`is_recommended`,`rating`,`rating_count`) VALUES 
 (4,2,'MySQL (OTHER NEW RIDERS)','Paul DuBois',39.99,'http://www.amazon.com/exec/obidos/ASIN/0735709211/yessoftware','images/books/0735709211.jpg','In MySQL, Paul DuBois provides you with a comprehensive guide to one of the most popular relational database systems. As an important contributor to the online documentation for MySQL, Paul uses his day-to-day experience answering questions users post on the MySQL mailing list to pinpoint the problems most users and administrators encounter.',0,0,0),
 (5,1,'PHP and MySQL Web Development','Luke Welling, Laura Thomson',39.99,'http://www.amazon.com/exec/obidos/ASIN/0672317842/yessoftware','images/books/0672317842.jpg','PHP3 and MySQL Web Development introduces you to the advantages of implementing both MySQL and PHP3. These advantages are detailed through the provision of both statistics and several case studies. A practical web application is developed throughout the book, providing you with the tools necessary to implement a functional online database. Each function is developed separately, allowing you the choice to incorporate only those parts that you would like to implement. Programming concepts of the PHP3 language are highlighted, including functions which tie MySQL support into a PHP3 script and advanced topics regarding table manipulation.',0,0,0),
 (6,1,'MySQL & PHP From Scratch','Wade Maxfield',23.99,'http://www.amazon.com/exec/obidos/ASIN/0789724405/yessoftware','images/books/0789724405.jpg','Apache, MySQL, PHP3, and IMP the pieces exist. Each piece has been described ad nauseam. What does not exist is a guide to the marriage of these software technologies into a useful book, until now. This book puts together information on installing, setting up, and troubleshooting each of these technologies into one complete volume. You also learn how each piece is part of a whole by learning, step-by-step, how to create a web-based e-mail system. Learn to run the Linux equivalent of Active Server Pages (ASP) using PHP3, set up an e-commerce site using a database and the Apache web server, and create a data entry system (such as sales, product quality tracking, customer preferences, etc) that requires no installation in the PC.',1,0,0);
INSERT INTO `items` (`item_id`,`category_id`,`name`,`author`,`price`,`product_url`,`image_url`,`notes`,`is_recommended`,`rating`,`rating_count`) VALUES 
 (7,3,'Flash 4 Magic (WITH CD-ROM)','David J. Emberton, J. Scott Hamlin, David Emberton',36,'http://www.amazon.com/exec/obidos/ASIN/0735709491/yessoftware','images/books/0735709491.jpg','Flash has moved beyond Java and even Shockwave because it\'s inexpensive, accessible, and powerful. If you need a specific Flash solution or you learn best by getting your hands dirty, the project-based Flash 4 Magic will work well for you. The authors have assembled 15 utilities-based projects (a calculator and an online book search animation, for example) and six games (one of which is a memory/match game similar to those found all over the Web these days). Each project is presented step by step and includes text and complementary screen shots. At the end of each lesson, a \"How It Works\" section gives insight into the software mechanisms and serves as a review. A brief discussion of how the project can be modified to fit the readers\' needs follows. All the files, libraries, images, and even finished Flash .\r\nthe accompanying CD-ROM, helping readers follow along and debug their multimedia experiments.',0,0,0),
 (8,1,'Web Application Development with PHP 4.0 (with CD-ROM)','Tobias Ratschiller, Till Gerken',36,'http://www.amazon.com/exec/obidos/ASIN/0735709971/yessoftware','images/books/0735709971.jpg','PHP is an open-source Web scripting language that\'s gaining steam in the development community, especially in the Apache Web server realm. With a syntax that draws heavily on C, PHP appeals to advanced programmers who are moving to the Web from traditional software development.\r\nWeb Application Development with PHP 4.0 isn\'t your run-of-the-mill language tutorial. Authors Ratschiller and Gerken purposely designed its content to appeal to coders who already are proficient in PHP, but in need of advanced programming techniques and high-level application-development skills. Assuming a strong programming foundation, this book can be considered a next-level PHP tutorial.',0,0,0);
INSERT INTO `items` (`item_id`,`category_id`,`name`,`author`,`price`,`product_url`,`image_url`,`notes`,`is_recommended`,`rating`,`rating_count`) VALUES 
 (9,2,'Beginning ASP Databases','John Kaufman, Thearon Willis, David Buser, Kevin Spencer, kauffman, John Kauffman',39.99,'http://www.amazon.com/exec/obidos/ASIN/1861002726/yessoftware','images/books/1861002726.jpg','As a tutorial, Beginning ASP Databases offers an entry point to one of the most crucial aspects of Microsoft-oriented Web development--database integration with Active Server Pages. In Beginning ASP Databases, a trio of authors covers the basics of working with databases from ASP--especially using ActiveX Database Objects (ADO).\r\nThe book is quite substantive in content but is written in a somewhat light-hearted style that makes readers new to the technology comfortable. The authors begin with a discussion of the benefits of ASP and ADO, and then explain how to configure the technology on the various flavors of Windows. From there, they show how to access databases using ADO, demystify how it all works, and focus on several key areas, including debugging, SQL, and stored procedures.',1,0,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`login_details`
--

DROP TABLE IF EXISTS `login_details`;
CREATE TABLE `login_details` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_date` datetime default NULL,
  `create_user_id` int(10) unsigned default NULL,
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
 (1,'admin','21232f297a57a5a743894a0e4a801fc3','2009-10-01 00:00:00',1,NULL,NULL,'ACTIVE'),
 (2,'cubeproadmin','65d013b601d89c20c1714677dfa764e4','2009-10-01 00:00:00',1,NULL,NULL,'ACTIVE'),
 (3,'pandian','2f286fd4656320b75574b8b98237294b','2009-10-01 00:00:00',1,NULL,NULL,'ACTIVE');
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
 (881,10,58,66,39,199,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (882,10,58,66,40,199,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (883,10,58,66,41,199,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (884,10,58,66,42,199,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (885,10,58,66,43,199,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (886,10,58,66,44,199,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (887,10,59,66,39,188,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (888,10,59,66,40,188,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (889,10,59,66,41,188,200,'2011-08-02 20:47:42',1,NULL,NULL),
 (890,10,59,66,42,188,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (891,10,59,66,43,188,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (892,10,59,66,44,187,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (893,10,60,66,39,189,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (894,10,60,66,40,189,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (895,10,60,66,41,189,200,'2011-08-02 20:47:43',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (896,10,60,66,42,189,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (897,10,60,66,43,189,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (898,10,60,66,44,198,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (899,10,61,66,39,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (900,10,61,66,40,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (901,10,61,66,41,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (902,10,61,66,42,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (903,10,61,66,43,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (904,10,61,66,44,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (905,10,62,66,39,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (906,10,62,66,40,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (907,10,62,66,41,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (908,10,62,66,42,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (909,10,62,66,43,200,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (910,10,63,66,39,199,200,'2011-08-02 20:47:43',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (911,10,63,66,40,199,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (912,10,63,66,41,199,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (913,10,63,66,42,199,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (914,10,63,66,43,199,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (915,10,63,66,44,199,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (916,10,65,66,39,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (917,10,65,66,40,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (918,10,65,66,41,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (919,10,65,66,42,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (920,10,65,66,43,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (921,10,66,66,39,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (922,10,66,66,40,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (923,10,66,66,41,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (924,10,66,66,42,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (925,10,66,66,43,99,200,'2011-08-02 20:47:43',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (926,10,66,66,44,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (927,10,67,66,39,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (928,10,67,66,40,99,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (929,10,68,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (930,10,68,66,40,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (931,10,69,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (932,10,69,66,40,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (933,10,69,66,41,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (934,10,69,66,42,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (935,10,69,66,43,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (936,10,69,66,44,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (937,10,70,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (938,10,71,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (939,10,71,66,40,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (940,10,71,66,41,99,200,'2011-08-02 20:47:44',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (941,10,71,66,42,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (942,10,71,66,43,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (943,10,72,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (944,10,72,66,40,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (945,10,72,66,41,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (946,10,72,66,42,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (947,10,72,66,43,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (948,10,72,66,44,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (949,10,74,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (950,10,74,66,40,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (951,10,74,66,41,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (952,10,74,66,42,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (953,10,74,66,43,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (954,10,74,66,44,99,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (955,10,75,66,39,99,200,'2011-08-02 20:47:44',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (956,10,75,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (957,10,75,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (958,10,75,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (959,10,75,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (960,10,75,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (961,10,76,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (962,10,76,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (963,10,76,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (964,10,76,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (965,10,76,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (966,10,76,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (967,10,77,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (968,10,77,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (969,10,77,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (970,10,77,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (971,10,77,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (972,10,77,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (973,10,78,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (974,10,78,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (975,10,78,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (976,10,78,66,42,9,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (977,10,78,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (978,10,78,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (979,10,79,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (980,10,79,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (981,10,79,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (982,10,79,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (983,10,79,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (984,10,79,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (985,10,80,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (986,10,80,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (987,10,80,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (988,10,80,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (989,10,80,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (990,10,80,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (991,10,81,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (992,10,81,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (993,10,81,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (994,10,81,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (995,10,81,66,43,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (996,10,81,66,44,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (997,10,82,66,39,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (998,10,82,66,40,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (999,10,82,66,41,99,200,'2011-08-02 20:47:45',1,NULL,NULL),
 (1000,10,82,66,42,99,200,'2011-08-02 20:47:45',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1001,10,82,66,43,99,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1002,10,82,66,44,99,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1003,10,83,66,39,9,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1004,10,83,66,40,99,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1005,10,83,66,41,99,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1006,10,83,66,42,99,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1007,10,83,66,43,9,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1008,10,83,66,44,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1009,10,84,66,39,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1010,10,84,66,40,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1011,10,84,66,41,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1012,10,84,66,42,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1013,10,84,66,43,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1014,10,84,66,44,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1015,10,85,66,39,88,200,'2011-08-02 20:47:46',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1016,10,85,66,40,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1017,10,85,66,41,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1018,10,85,66,42,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1019,10,85,66,43,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1020,10,85,66,44,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1021,10,86,66,39,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1022,10,86,66,40,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1023,10,86,66,41,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1024,10,86,66,42,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1025,10,86,66,43,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1026,10,86,66,44,88,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1027,10,87,66,39,8,200,'2011-08-02 20:47:46',1,NULL,NULL),
 (1028,10,87,66,40,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1029,10,87,66,41,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1030,10,87,66,42,88,200,'2011-08-02 20:47:47',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1031,10,87,66,43,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1032,10,87,66,44,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1033,10,88,66,39,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1034,10,88,66,40,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1035,10,88,66,41,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1036,10,88,66,42,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1037,10,88,66,43,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1038,10,88,66,44,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1039,10,89,66,39,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1040,10,89,66,40,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1041,10,89,66,41,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1042,10,89,66,42,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1043,10,89,66,43,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1044,10,89,66,44,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1045,10,92,66,39,188,200,'2011-08-02 20:47:47',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1046,10,92,66,40,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1047,10,92,66,41,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1048,10,92,66,42,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1049,10,92,66,43,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1050,10,93,66,39,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1051,10,93,66,40,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1052,10,93,66,41,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1053,10,93,66,42,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1054,10,93,66,43,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1055,10,94,66,39,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1056,10,94,66,40,88,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1057,10,94,66,41,8,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1058,10,95,66,39,88,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1059,10,95,66,40,88,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1060,10,95,66,41,88,200,'2011-08-02 20:47:48',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1061,10,95,66,42,88,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1062,10,95,66,43,88,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1063,10,95,66,44,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1064,10,96,66,39,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1065,10,96,66,40,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1066,10,96,66,41,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1067,10,96,66,42,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1068,10,96,66,43,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1069,10,96,66,44,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1070,10,97,66,39,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1071,10,98,66,39,9,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1072,10,98,66,40,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1073,10,98,66,41,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1074,10,98,66,42,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1075,10,98,66,43,99,200,'2011-08-02 20:47:48',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1076,10,98,66,44,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1077,10,99,66,39,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1078,10,100,66,39,9,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1079,10,100,66,40,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1080,10,100,66,41,9,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1081,10,101,66,39,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1082,10,101,66,40,9,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1083,10,101,66,41,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1084,10,101,66,42,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1085,10,101,66,43,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1086,10,101,66,44,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1087,10,102,66,39,9,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1088,10,102,66,40,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1089,10,102,66,41,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1090,10,102,66,42,9,200,'2011-08-02 20:47:49',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1091,10,102,66,43,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1092,10,102,66,44,9,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1093,10,103,66,39,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1094,10,103,66,40,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1095,10,103,66,41,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1096,10,103,66,42,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1097,10,103,66,43,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1098,10,103,66,44,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1099,10,104,66,39,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1100,10,105,66,39,99,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1101,10,105,66,40,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1102,10,105,66,41,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1103,10,105,66,42,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1104,10,105,66,43,9,200,'2011-08-02 20:47:50',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1105,10,105,66,44,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1106,10,106,66,39,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1107,10,106,66,40,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1108,10,106,66,41,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1109,10,106,66,42,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1110,10,106,66,43,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1111,10,106,66,44,99,200,'2011-08-02 20:47:50',1,NULL,NULL),
 (1112,10,104,66,40,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1113,10,104,66,41,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1114,10,104,66,42,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1115,10,104,66,43,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1116,10,104,66,44,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1117,10,62,66,44,199,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1118,10,64,66,39,199,200,'2011-08-02 20:47:43',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1119,10,64,66,40,111,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1120,10,64,66,41,111,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1121,10,64,66,42,111,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1122,10,64,66,43,111,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1123,10,64,66,44,111,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1124,10,65,66,44,123,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1125,10,67,66,41,123,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1126,10,67,66,42,123,200,'2011-08-02 20:47:43',1,NULL,NULL),
 (1127,10,67,66,43,123,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1128,10,67,66,44,145,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1129,10,68,66,41,123,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1130,10,68,66,42,123,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1131,10,68,66,43,156,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1132,10,68,66,44,189,200,'2011-08-02 20:47:44',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1133,10,70,66,40,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1134,10,70,66,41,157,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1135,10,70,66,42,177,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1136,10,70,66,43,188,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1137,10,70,66,44,188,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1138,10,71,66,44,188,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1139,10,73,66,39,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1140,10,73,66,40,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1141,10,73,66,41,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1142,10,73,66,42,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1143,10,73,66,43,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1144,10,73,66,44,199,200,'2011-08-02 20:47:44',1,NULL,NULL),
 (1145,10,90,66,39,199,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1146,10,90,66,40,199,200,'2011-08-02 20:47:47',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1147,10,90,66,41,199,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1148,10,90,66,42,199,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1149,10,90,66,43,199,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1150,10,90,66,44,199,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1151,10,91,66,39,199,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1152,10,91,66,40,188,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1153,10,91,66,41,188,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1154,10,91,66,42,188,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1155,10,91,66,43,188,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1156,10,91,66,44,188,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1157,10,92,66,44,198,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1158,10,93,66,44,187,200,'2011-08-02 20:47:47',1,NULL,NULL),
 (1159,10,94,66,42,188,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1160,10,94,66,43,188,200,'2011-08-02 20:47:48',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1161,10,94,66,44,188,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1162,10,97,66,40,100,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1163,10,97,66,41,100,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1164,10,97,66,42,199,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1165,10,97,66,43,199,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1166,10,97,66,44,199,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1167,10,99,66,40,199,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1168,10,99,66,41,199,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1169,10,99,66,42,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1170,10,99,66,43,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1171,10,99,66,44,99,200,'2011-08-02 20:47:48',1,NULL,NULL),
 (1172,10,100,66,42,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1173,10,100,66,43,199,200,'2011-08-02 20:47:49',1,NULL,NULL),
 (1174,10,100,66,44,199,200,'2011-08-02 20:47:49',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1175,10,107,68,45,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1176,10,107,68,46,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1177,10,107,68,47,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1178,10,107,68,48,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1179,10,107,68,49,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1180,10,107,68,50,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1181,10,108,68,45,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1182,10,108,68,46,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1183,10,108,68,47,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1184,10,108,68,48,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1185,10,108,68,49,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1186,10,108,68,50,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1187,10,109,68,45,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1188,10,109,68,46,99,100,'2011-08-02 20:47:50',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1189,10,109,68,47,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1190,10,109,68,48,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1191,10,109,68,49,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1192,10,109,68,50,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1193,10,110,68,45,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1194,10,110,68,46,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1195,10,110,68,47,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1196,10,110,68,48,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1197,10,110,68,49,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1198,10,110,68,50,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1199,10,111,68,45,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1200,10,111,68,46,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1201,10,111,68,47,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1202,10,111,68,48,99,100,'2011-08-02 20:47:50',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1203,10,111,68,49,99,100,'2011-08-02 20:47:50',1,NULL,NULL),
 (1204,10,111,68,50,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1205,10,112,68,45,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1206,10,112,68,46,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1207,10,112,68,47,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1208,10,112,68,48,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1209,10,112,68,49,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1210,10,112,68,50,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1211,10,113,68,45,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1212,10,113,68,46,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1213,10,113,68,47,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1214,10,113,68,48,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1215,10,113,68,49,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1216,10,113,68,50,99,100,'2011-08-02 20:47:51',1,NULL,NULL);
INSERT INTO `mark_details` (`mark_id`,`exam_id`,`student_id`,`class_id`,`subject_id`,`mark_obtained`,`max_marks`,`create_date`,`create_user_id`,`change_date`,`change_user_id`) VALUES 
 (1217,10,114,68,45,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1218,10,114,68,46,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1219,10,114,68,47,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1220,10,114,68,48,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1221,10,114,68,49,99,100,'2011-08-02 20:47:51',1,NULL,NULL),
 (1222,10,114,68,50,99,100,'2011-08-02 20:47:51',1,NULL,NULL);
/*!40000 ALTER TABLE `mark_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `member_id` int(11) NOT NULL auto_increment,
  `member_login` varchar(20) NOT NULL,
  `member_password` varchar(20) NOT NULL,
  `member_level` int(11) NOT NULL default '1',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `notes` text,
  `card_type_id` int(11) default NULL,
  `card_number` varchar(50) default NULL,
  PRIMARY KEY  (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`members`
--

/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`member_id`,`member_login`,`member_password`,`member_level`,`first_name`,`last_name`,`email`,`phone`,`address`,`notes`,`card_type_id`,`card_number`) VALUES 
 (1,'admin','admin',2,'Administrator','Account','admin@localhost',NULL,NULL,NULL,NULL,NULL),
 (2,'guest','guest',1,'Guest','Account','guest@localhost',NULL,NULL,NULL,NULL,NULL),
 (3,'satish','satish',1,'Satish','Janakiraman','satishraj.j@gmail.com',NULL,'Test',NULL,1,'23453432132');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`,`member_id`,`item_id`,`quantity`) VALUES 
 (1,2,2,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


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
 (4,'Staff Reports','Reports Related to Staff'),
 (5,'Account Reports','Reports Related to Accounts'),
 (6,'Fees Reports','Reports Related to Fees');
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
 (0,12,'text',15,15,'Admission No','1','',' ',0,'rollno'),
 (1,1,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (2,2,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (3,3,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (4,3,'date',11,11,'Date','2',' ',' ',0,'tdate'),
 (5,5,'date',11,11,'Absent Date','2',' ',' ',0,'date'),
 (6,6,'combo',11,11,'Class With Section','3',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (7,6,'date',11,11,'From Date','1',' ','',0,'Start_Date'),
 (8,6,'date',11,11,'To Date','2',' ','',0,'End_Date');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (9,8,'text',11,50,'Roll No','1',' ',' ',0,'rollno'),
 (10,9,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (11,10,'text',11,50,'Student Name','1','','',0,'student_name'),
 (12,10,'text',11,50,'Roll No','1','','',0,'rollno'),
 (13,11,'combo',11,11,'Class With Section','1','','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (14,8,'combo',11,11,'Class With Section','1','','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (15,13,'text',11,50,'Admission No','1','','',0,'rollno'),
 (16,14,'combo',11,11,'Class With Section','1','','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (17,15,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (18,15,'text',11,11,'Physical Status','2',' ','',0,'phystatus'),
 (19,16,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (20,16,'text',11,11,'Blood Group','1',' ',' ',0,'blood'),
 (21,17,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (22,17,'date',11,11,'Date OF Birth','2',' ',' ',0,'dob'),
 (24,7,'text',11,50,'Staff No','2',' ',' ',0,'empno'),
 (25,4,'text',11,50,'Staff No','2',' ',' ',0,'empno'),
 (26,18,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (27,18,'text',11,11,'Year','2',' ',' ',0,'year'),
 (28,19,'text',20,50,'Staff No','1',' ',' ',0,'sid');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (29,19,'text',11,11,'Year','2',' ',' ',0,'year'),
 (30,20,'date',11,11,'From Date','1',' ',' ',0,'fromdate'),
 (31,21,'date',11,11,'From Date','1','','',0,'fromDate'),
 (32,21,'date',11,11,'To Date','1','','',0,'toDate'),
 (33,22,'text',20,50,'Admission No','1','','',0,'rollNo'),
 (34,23,'text',20,50,'Admission No','1','1','',0,'rollNo'),
 (35,22,'text',20,50,'Acadamic Year','1','1','',0,'acNo'),
 (36,22,'combo',20,20,'Standard(s)','1','1','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'standards'),
 (37,23,'text',20,50,'Academic Year','1','1','',0,'acNo'),
 (38,23,'combo',11,50,'Standard(s)','1','1','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'standards'),
 (39,24,'date',11,11,'From Date','1','','',0,'fromDate'),
 (40,24,'date',11,11,'To Date','1','1','',0,'toDate');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (41,24,'combo',25,20,'Account Budget Type','1','','select 1 id,  \'MANAGEMENT A/C\' union select 2 id,  \'SIC A/C\'  union select 3 id,\'COMPUTER A/C\'  union select 4 id, \'GENERAL FUND A/C\'  union select 5 id, \'AMENITY FUND A/C\'  union select 6 id,\'SPECIAL FEE A/C\'  union select 7 id, \'PTA A/C\'',1,'accBudget'),
 (42,6,'text',20,20,'Examination','3',' ','',0,'exam'),
 (43,25,'text',20,20,'STAFF ID','1',' ',' ',0,'empno'),
 (44,26,'date',11,11,'From Date','1',' ',' ',0,'fdate'),
 (45,26,'date',11,11,'To Date','1',' ',' ',0,'tdate'),
 (46,9,'text',20,20,'Examination Name','1',' ','',1,'exam'),
 (47,27,'date',11,20,'From Date','1','','',0,'fromDate'),
 (48,27,'date',11,20,'To Date','1','','',0,'toDate'),
 (49,27,'combo',11,20,'Class With Section','2','','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (50,28,'date',11,20,'From Date','1','','',0,'fromDate');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (51,28,'date',11,20,'To Date','1','','',0,'toDate'),
 (52,28,'combo',11,20,'Class With Section','2','','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (53,29,'date',11,20,'From Date','1','','',0,'fromDate'),
 (54,29,'date',11,20,'To Date','1','','',0,'toDate'),
 (55,29,'combo',11,20,'Class With Section','2','','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classId'),
 (56,29,'combo',11,20,'Fees Type','2','','SELECT distinct fees_type id, fees_type FROM fees_master',1,'feesType'),
 (57,28,'combo',11,20,'Fees Type','2','','SELECT distinct fees_type id, fees_type FROM fees_master',1,'feesType'),
 (58,30,'date',11,20,'From Date','1','','',0,'fromDate'),
 (59,30,'date',11,20,'To Date','1','','',0,'toDate'),
 (60,30,'combo',11,20,'Fees Type','2','','SELECT distinct fees_type id, fees_type FROM fees_master',1,'feesType');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (61,31,'text',20,20,'Type','1',' ',' ',0,'accType'),
 (62,31,'text',11,20,'Sub Type','1','',' ',0,'subType'),
 (63,31,'date',11,20,'From Date','1',' ',' ',0,'fdate'),
 (64,31,'date',11,20,'To Date','1',' ',' ',0,'tdate'),
 (65,32,'text',11,20,'Transaction Code','1',' ',' ',0,'tcode'),
 (66,32,'date',11,20,'From Date','1',' ',' ',0,'fdate'),
 (67,32,'date',11,20,'To Date','1',' ',' ',0,'tdate'),
 (68,33,'text',11,20,'Fees Type','1','','',0,'ftype'),
 (69,33,'date',11,20,'From date','1',' ',' ',0,'fdate'),
 (70,33,'date',11,20,'To date','1',' ',' ',0,'tdate'),
 (71,34,'combo',11,20,'Class With Section','1 ',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (72,34,'combo',11,20,'Examination Name','1','','SELECT exam_id, exam_type FROM exam_details e',1,'examid'),
 (73,35,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (74,35,'date',20,20,'Date Of Birth','1',' ',' ',0,'dob'),
 (75,6,'text',11,20,'Admission No','2',' ',' ',0,'admino'),
 (76,36,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (77,36,'text',11,20,'Roll No','2',' ',' ',0,'rollno'),
 (78,36,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (79,36,'date',11,20,'Date Of Birth','2',' ',' ',0,'dob'),
 (80,37,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (81,37,'text',11,20,'Roll No','2',' ',' ',0,'rollno'),
 (82,37,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (83,38,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (84,6,'text',11,20,'Roll No','1',' ',' ',0,'rollno');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (85,6,'text',11,20,'Admission No','2',' ',' ',0,'admino'),
 (86,38,'text',11,20,'Blood Group','2',' ',' ',0,'blood'),
 (87,39,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (88,39,'date',11,20,'DATE Of Joining','2',' ',' ',0,'doj'),
 (89,6,'text',11,20,'Roll No','1',' ',' ',0,'rollno'),
 (90,6,'text',11,20,'Admission No','2',' ',' ',0,'admino'),
 (91,6,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (94,40,'text',11,20,'Community','2',' ',' ',0,'cate'),
 (96,41,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (99,41,'text',11,20,'Medium','1',' ',' ',0,'medium');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (100,42,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (101,6,'text',11,20,'Roll No','2',' ',' ',0,'rollno'),
 (102,6,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (103,42,'text',20,20,'Physical Status','2',' ',' ',0,'physt'),
 (104,43,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (105,43,'text',11,20,'Roll No','1',' ',' ',0,'rollno'),
 (106,43,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (107,44,'text',11,20,'Staff Id','1',' ',' ',0,'empno'),
 (109,45,'date',11,20,'Date Of Birth','1',' ',' ',0,'dob'),
 (110,46,'text',11,20,'Gender','1',' ',' ',0,'sex'),
 (111,47,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (112,47,'text',11,20,'Roll No','1',' ',' ',0,'rollno');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (113,47,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (114,48,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (115,48,'date',11,20,'From Date','1',' ',' ',0,'fdate'),
 (116,48,'date',11,20,'To Date','1',' ',' ',0,'tdate'),
 (117,1,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (119,49,'text',11,20,'Gender','1',' ',' ',0,'gender'),
 (121,8,'text',11,20,'Admission No','1',' ',' ',0,'admino'),
 (122,25,'text',20,20,'DepartMent','1',' ',' ',0,'dept'),
 (123,50,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (124,50,'text',11,20,'Gender','1',' ',' ',0,'gender'),
 (125,51,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (126,51,'text',11,20,'Community','1',' ',' ',0,'cate');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (127,52,'text',11,20,'Sub Caste','1',' ',' ',0,'cate'),
 (128,53,'combo',11,20,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (129,53,'text',11,20,'Sub Caste','1',' ',' ',0,'cate'),
 (130,1,'text',11,20,'Roll No','1',' ',' ',0,'rollno'),
 (131,22,'text',20,20,'Undergone Medical Inspection','1','','',0,'medIns'),
 (132,23,'text',20,20,'Undergone Medical Inspection','1','','',0,'medIns'),
 (133,22,'date',20,20,'Date on which the pupil left the school','1','','',0,'leftDate'),
 (134,23,'date',20,20,'Date on which the pupil left the school','1','','',0,'leftDate'),
 (135,22,'date',20,20,'Date of the application for T.C.','1','','',0,'appDate'),
 (136,23,'date',20,20,'Date of the application for T.C.','1','','',0,'appDate'),
 (137,22,'text',20,20,'Is Qualified for promotion','1','','',0,'qualified');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (138,23,'text',20,20,'Is Qualified for promotion','1','','',0,'qualified'),
 (139,23,'text',20,20,'Is pupil paid all fees','1','','',0,'paidFee'),
 (140,23,'text',20,50,'Subjects Offered','4','','',0,'subOff'),
 (141,23,'text',20,50,'Languages Offered under Part I','4','','',0,'langOff'),
 (142,33,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (143,54,'date',20,20,'From Date','1',' ',' ',0,'fromdate'),
 (144,54,'date',20,20,'To Date','1',' ',' ',0,'todate'),
 (145,55,'date',20,20,'From Date','1',' ','',0,'fdate'),
 (146,55,'date',20,20,'To Date','1',' ',' ',0,'tdate'),
 (147,55,'combo',11,11,'Class With Section','1',' ','SELECT CD.CLASS_ID ID, CONCAT(CD.CLASS_NAME,\' - \',CD.SECTION_NAME) FROM CLASS_DETAILS CD',1,'classid'),
 (148,56,'text',20,20,'Medium','1',' ',' ',0,'medium');
INSERT INTO `report_parameters` (`rpt_id`,`report_id`,`param_type`,`param_size`,`param_maxlength`,`param_name`,`param_position`,`param_jsonclick`,`param_query`,`param_isCombo`,`param_value`) VALUES 
 (149,63,'text',20,20,'Department','1',' ',' ',0,'edept'),
 (150,64,'date',20,20,'Date Of Birth','1',' ',' ',0,'edob'),
 (151,65,'date',20,20,'Date Of Joining','1',' ',' ',0,'edoj'),
 (152,66,'text',20,20,'Gender','1',' ',' ',0,'esex'),
 (153,20,'date',20,20,'To Date','1',' ',' ',0,'todate'),
 (154,44,'text',25,25,'Department','1',' ',' ',0,'dept'),
 (155,62,'blank',25,25,'Empty Parameter','1',' ',' ',0,'emptyparam'),
 (156,58,'blank',25,25,'Empty Parameter','1',' ',' ',0,'emptyparam'),
 (157,59,'blank',25,25,'Empty Parameter','1',' ',' ',0,'emptyparam'),
 (158,60,'blank',25,25,'Empty Parameter','1',' ',' ',0,'emptyparam'),
 (159,61,'blank',25,25,'Empty Parameter','1',' ',' ',0,'emptyparam'),
 (160,62,'blank',25,25,'Empty Parameter','1',' ',' ',0,'emptyparam'),
 (161,22,'text',40,40,'Mark Sheet No/Date','1',' ',' ',0,'mark'),
 (162,23,'text',40,40,'Mark Sheet No/Date','1',' ',' ',0,'mark');
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
 (1,'Student Personal Detail Report By Class','List of Students available for the particular class',1,'/reports/cubepro/StudentDetailReportByClass'),
 (2,'Class Wise Subject Detail Report','List of Subjects for a particular class',3,'/reports/cubepro/SubjectDetailReport'),
 (3,'Student Absent Detail Report','List Of Student Absent in a Class',1,'/reports/cubepro/StudentAttDetailReport'),
 (4,'Single Staff Detail Report','Staffs Details Available',4,'/reports/cubepro/SingleStaffDetailReport'),
 (5,'Staff Absent Detail Report','List Of Staff Absent for a particular day',4,'/reports/cubepro/StaffAttDetailReport'),
 (6,'Class Wise Attendance Summary ','Class Wise Attendance Summary',0,'/reports/cubepro/ClassWiseAtt'),
 (7,'Staff Salary Report','Staff Salary Report',4,'/reports/cubepro/StaffSalaryDetailReport'),
 (8,'Student Mark Sheet Report','Print Student Mark based on the student Name',2,'/reports/cubepro/SubjectMarksReport'),
 (9,'Student Mark List Report Via Class','List of Marks obtained by student',1,'/reports/cubepro/StudentMarkDetailReport');
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (11,'Student Academic Detail Report','Student Academics for the particular class',1,'/reports/cubepro/StudentAcademicDetailByClass'),
 (12,'Student ID Card Model 1','Vertical Model of Student ID Card',2,'/reports/cubepro/StudentIDCardModel1'),
 (13,'Student ID Card Model 2','Horizontal Model of Student ID Card',2,'/reports/cubepro/StudentIDCardModel2'),
 (14,'Student Family Detail Report ','List of Students Family Details available for the particular class',1,'/reports/cubepro/StudentFamilyDetailReportByClass'),
 (15,'Student Full Detail Report With Physical Stat','List of Students available With Physical Achievement',1,'/reports/cubepro/StudentDetailReportByClassphy'),
 (16,'Student Full  Detail Report With Blood Group','List of Students in this Blood Group',1,'/reports/cubepro/StudentDetailReportByClassblood'),
 (17,'Student Full Detail Report In This DOB','List of Students in this Date Of Birth',1,'/reports/cubepro/StudentDetailReportByClassdob'),
 (18,'Student Time Table','Student Time Table Class Wise',3,'/reports/cubepro/StudentTimeTableByClass');
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (19,'Staff Time Table','Staff Time Table Staff wise',3,'/reports/cubepro/StaffTimeTableByStaff'),
 (20,'Day Book Statement','Cash IN - OUT of Money',5,'/reports/cubepro/CashBook'),
 (21,'Balance Sheet Report','Balance Sheet Report',5,'BalanceSheet.cp'),
 (22,'Transfer Certificate - SEC','Transfer Certificate 1',2,'TransferCert1.cp'),
 (23,'Transfer Certificate - HSC','Transfer Certificate 2',2,'TransferCert2.cp'),
 (24,'Account Budget Report','Account Budget Report',5,'AccountBudget.cp'),
 (25,'Staff Pay Slip','Pay Slip For A Staff',4,'/reports/cubepro/StaffPaySlip'),
 (26,'Monthly Report','Account Report by month/year with date range',5,'/reports/cubepro/MonthlyDetailReportViaLedger'),
 (27,'Fees Detail By Class','Fees Detail By Class',6,'/reports/cubepro/FeesDetailByClass'),
 (28,'Daily Fees Collection Via Head By Class','Daily Fees Collection Via Head By Class',6,'/reports/cubepro/FeesDetailSummaryByClass'),
 (29,'Fees Pending Detail By Class','Fees Pending Detail By Class',6,'/reports/cubepro/FeesPendingDetailByClass');
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (30,'Daily Fees Collection Via Head','Daily Fees Collection Via Head',6,'/reports/cubepro/FeesDetailSummaryByFeesType'),
 (31,'Ledger Detail Report','Ledger Detail Report for account',5,'/reports/cubepro/LedgerDetailReport'),
 (32,'Income & Expense Statement','Income & Expense Statement Via Date',5,'/reports/cubepro/CashBookViaDate'),
 (33,'Daily Fees Collection Via Sub Head','Daily Fees Collection Via Sub Head',6,'/reports/cubepro/FeesSubHead'),
 (34,'Exam Time Table','Exam Time Table',3,'/reports/cubepro/ExamTimeTable'),
 (35,'Student General Details','Student General Details',1,'/reports/cubepro/StudentGDetails'),
 (36,'Student General Details Via DOB','Student General Details Via DOB',1,'/reports/cubepro/StudentGDetailsDOB'),
 (37,'Students Address Details','Students Address Details',1,'/reports/cubepro/StudentADDDetails'),
 (38,'Student General Details Via Blood','Student General Details Via Blood',1,'/reports/cubepro/StudentGDetailsBlood'),
 (39,'Student General Details Via DOJ','Student General Details Via DOJ',1,'/reports/cubepro/StudentGDetailsDOJ');
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (40,'Student General Details Via Caste By Class','Student General Details Via Caste',1,'/reports/cubepro/StudentGDetailsCaste'),
 (41,'Student General Details Via Medium','Student General Details Via Medium',1,'/reports/cubepro/StudentGDetailsMediumForClass'),
 (42,'Student General Details Via Physical Status','Student General Details Via Physical Status',1,'/reports/cubepro/StudentGDetailsPhySta'),
 (43,'Student General Details For TC','Student General Details For TC',1,'/reports/cubepro/StudentGDetailsTC'),
 (44,'Staff General Details','Staff General Details',4,'/reports/cubepro/StaffGDetails'),
 (45,'Staff General Details Via DOB','Staff General Details Via DOB',4,'/reports/cubepro/StaffGDetailsDOB'),
 (46,'Staff General Details Via Gender','Staff General Details Via Gender',4,'/reports/cubepro/StaffGDetailsSex'),
 (47,'Student Fees Fine & Consuction','Student Fees Fine & Consuction',6,'/reports/cubepro/StudentFeesConFine'),
 (48,'Student Total Fees','Student Total Fees',6,'/reports/cubepro/StudentTotFees');
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (49,'Student Details Report By Gender','Student Details Report By Gender',1,'/reports/cubepro/StudentGDetailsGenderViaSchool'),
 (50,'Student Details Report By Gender From Class','Student Details Report By Gender From Class',1,'/reports/cubepro/StudentGDetailsGender'),
 (51,'Student General Details Via Caste By Class','Student General Details Via Caste By Class',1,'/reports/cubepro/StudentGDetailsCasteViaClass'),
 (52,'Student General Details Via Sub Caste','Student General Details Via Sub Caste',1,'/reports/cubepro/StudentGDetailsSubCaste'),
 (53,'Student General Details Via Sub Caste By Cls','Student General Details Via Sub Caste By Class',1,'/reports/cubepro/StudentGDetailsSubCastebyClass'),
 (54,'Account Report Via Date Range','Account Report Via Date Range',5,'/reports/cubepro/AccountReportViaDateRange'),
 (55,'Student Total Fees Head Wise','Student Total Fees Head Wise',6,'/reports/cubepro/FeesHead'),
 (56,'Student General Details Medium For School','Student General Details Medium For School',1,'/reports/cubepro/StudentGDetailsMediumForSchool');
INSERT INTO `reports` (`report_id`,`report_name`,`report_desc`,`category_id`,`report_action`) VALUES 
 (58,'Student Count Report','Student Count Report',2,'/reports/cubepro/StudentCountReport'),
 (59,'Student Count Report Via Caste','Student Count Report Via Caste',2,'/reports/cubepro/StudentCountReportViaCaste'),
 (60,'Student Count Report Via Medium','Student Count Report Via Medium',2,'/reports/cubepro/StudentCountReportViaMedium'),
 (61,'Staff Count Report','Staff Count Report',2,'/reports/cubepro/StaffCountReport'),
 (62,'Student Total Strength','Student Total Strength',2,'/reports/cubepro/StudentTotalStrenght'),
 (63,'Single Staff Detail Report Via Dept','Single Staff Detail Report Via Dept',4,'/reports/cubepro/SingleStaffDetaildept'),
 (64,'Single Staff Detail Report Via DOB','Single Staff Detail Report Via DOB',4,'/reports/cubepro/SingleStaffDetaildob'),
 (65,'Single Staff Detail Report Via DOJ','Single Staff Detail Report Via DOJ',4,'/reports/cubepro/SingleStaffDetaildoj'),
 (66,'Single Staff Detail Report Via Gender','Single Staff Detail Report Via Gender',4,'/reports/cubepro/SingleStaffDetailsex');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`room_inf`
--

DROP TABLE IF EXISTS `room_inf`;
CREATE TABLE `room_inf` (
  `room_id` int(10) unsigned NOT NULL auto_increment,
  `building_id` int(10) unsigned default NULL,
  `room_no` varchar(45) default NULL,
  `strength` varchar(45) default NULL,
  `assets` varchar(145) default NULL,
  `is_bathroom_att` varchar(45) default NULL,
  `cost` varchar(45) default NULL,
  `room_extn` varchar(45) default NULL,
  PRIMARY KEY  (`room_id`),
  KEY `FK_room_inf_1` (`building_id`),
  CONSTRAINT `FK_room_inf_1` FOREIGN KEY (`building_id`) REFERENCES `building_inf` (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`room_inf`
--

/*!40000 ALTER TABLE `room_inf` DISABLE KEYS */;
INSERT INTO `room_inf` (`room_id`,`building_id`,`room_no`,`strength`,`assets`,`is_bathroom_att`,`cost`,`room_extn`) VALUES 
 (1,1,'1','3','Table, Chair','Yes','250','4521'),
 (2,2,'2','4','FAN / LIGHT','No','200','');
/*!40000 ALTER TABLE `room_inf` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`route_master`
--

DROP TABLE IF EXISTS `route_master`;
CREATE TABLE `route_master` (
  `route_id` int(10) unsigned NOT NULL auto_increment,
  `vehicle_id` int(10) unsigned NOT NULL,
  `route_name` varchar(100) default NULL,
  `start_point` varchar(50) default NULL,
  `end_point` varchar(50) default NULL,
  `total_kms` varchar(45) default NULL,
  PRIMARY KEY  (`route_id`),
  KEY `FK_route_master_1` (`vehicle_id`),
  CONSTRAINT `FK_route_master_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`route_master`
--

/*!40000 ALTER TABLE `route_master` DISABLE KEYS */;
INSERT INTO `route_master` (`route_id`,`vehicle_id`,`route_name`,`start_point`,`end_point`,`total_kms`) VALUES 
 (1,1,'Mandaveli - Tambaram','Mandaveli','Tambaram','55'),
 (2,2,'THOUSAND LIGHT- THAMBRAM','THOUSAND LIGHT','THAMBRAM','70'),
 (3,2,'THOUSAND LIGHT','VELACHERY','THOUSAND ','65'),
 (4,2,'Ennore - Parrys','Ennore','Parrys','18KMS'),
 (5,2,'Ennore - Parrys','Ennore','Parrys','18KMS');
/*!40000 ALTER TABLE `route_master` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`route_stop_master`
--

DROP TABLE IF EXISTS `route_stop_master`;
CREATE TABLE `route_stop_master` (
  `route_stop_master_id` int(10) unsigned NOT NULL auto_increment,
  `route_id` int(10) unsigned NOT NULL,
  `stop_id` int(10) unsigned NOT NULL,
  `stop_fees` varchar(45) default NULL,
  `stop_order` varchar(45) default NULL,
  PRIMARY KEY  (`route_stop_master_id`),
  KEY `FK_route_stop_master_1` (`route_id`),
  CONSTRAINT `FK_route_stop_master_1` FOREIGN KEY (`route_id`) REFERENCES `route_master` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`route_stop_master`
--

/*!40000 ALTER TABLE `route_stop_master` DISABLE KEYS */;
INSERT INTO `route_stop_master` (`route_stop_master_id`,`route_id`,`stop_id`,`stop_fees`,`stop_order`) VALUES 
 (1,1,1,'200','1'),
 (2,1,2,'200','2'),
 (3,1,3,'200','3'),
 (4,1,4,'200','4'),
 (5,4,1,'500','5');
/*!40000 ALTER TABLE `route_stop_master` ENABLE KEYS */;


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
  `logo` varchar(100) default NULL,
  `rev_dis` varchar(100) default NULL,
  `edu_dis` varchar(100) default NULL,
  `student_max_leave` varchar(45) default NULL,
  `staff_max_leave` varchar(45) default NULL,
  PRIMARY KEY  (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`school_details`
--

/*!40000 ALTER TABLE `school_details` DISABLE KEYS */;
INSERT INTO `school_details` (`school_id`,`school_name`,`address1`,`address2`,`city`,`state`,`country`,`zipCode`,`phoneNo1`,`phoneNo2`,`mobileNo`,`faxNo`,`email`,`website`,`classes`,`division`,`category`,`sub_category`,`govt_reg_no`,`validity_date`,`corres_name`,`principal`,`headmaster_name`,`mgmt_name`,`logo`,`rev_dis`,`edu_dis`,`student_max_leave`,`staff_max_leave`) VALUES 
 (1,'CUBICLE HR.SEC.SCHOOL','THOUSAND LIGHT \r\nCHENNAI','','CHENNAI','TAMIL NADU','INDIA','+91','044 2748503','23423423','9840109314','234234234','CONTACT.CUBICLETECH.COM','CUBICLETECH.COM','+2','HSC','StateBoard','Management','SK123','2010','PANDIAN','KUMARAN','SATISH RAJ','CSI MADARAS','/CubePro/photos/1.jpg','CHENNAI','CHENNAI','60','50');
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
  `attendance_date` varchar(20) NOT NULL default '',
  `staff_id` int(10) unsigned NOT NULL,
  `attendance_status` varchar(15) default NULL,
  `attendance_reason` varchar(45) default NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(10) unsigned NOT NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `is_approved` varchar(45) default NULL,
  PRIMARY KEY  (`attendance_id`,`attendance_date`),
  KEY `FK_staff_attendance_details_1` (`staff_id`),
  CONSTRAINT `FK_staff_attendance_details_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`staff_attendance_details`
--

/*!40000 ALTER TABLE `staff_attendance_details` DISABLE KEYS */;
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (1,'23/08/2010',44,'P','','2010-08-22 12:13:40',1,NULL,NULL,NULL),
 (2,'23/08/2010',45,'A','hean pian','2010-08-22 12:14:13',1,NULL,NULL,NULL),
 (3,'23/08/2010',46,'A','hean pian','2010-08-22 12:13:40',1,NULL,NULL,NULL),
 (4,'23/08/2010',47,'A','hean pian','2010-08-22 12:13:40',1,NULL,NULL,NULL),
 (5,'23/08/2010',48,'P','','2010-08-22 12:13:40',1,NULL,NULL,NULL),
 (6,'23/08/2010',49,'P','','2010-08-22 12:13:40',1,NULL,NULL,NULL),
 (7,'2010-10-08 00:00:00',44,'A','','2010-09-16 20:26:59',1,NULL,NULL,NULL),
 (8,'2010-10-08 00:00:00',45,'P','','2010-09-16 20:26:59',1,NULL,NULL,NULL),
 (9,'2010-10-08 00:00:00',46,'P','','2010-09-16 20:26:59',1,NULL,NULL,NULL),
 (10,'2010-10-08 00:00:00',47,'P','','2010-09-16 20:27:00',1,NULL,NULL,NULL),
 (11,'2010-10-08 00:00:00',48,'P','','2010-09-16 20:27:00',1,NULL,NULL,NULL),
 (12,'2010-10-08 00:00:00',49,'P','','2010-09-16 20:27:00',1,NULL,NULL,NULL);
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (27,'15/09/2010',44,'Absent','test','2010-09-16 22:03:46',1,NULL,NULL,NULL),
 (28,'01/06/2010',44,'Absent','','2010-09-23 15:39:40',1,NULL,NULL,NULL),
 (29,'01/06/2010',45,'Absent','','2010-09-23 20:08:56',1,NULL,NULL,NULL),
 (30,'01/06/2010',46,'Present','','2010-09-23 15:39:40',1,NULL,NULL,NULL),
 (31,'01/06/2010',47,'Present','','2010-09-23 15:39:40',1,NULL,NULL,NULL),
 (32,'01/06/2010',48,'Present','','2010-09-23 15:39:40',1,NULL,NULL,NULL),
 (33,'01/06/2010',49,'Present','','2010-09-23 15:39:40',1,NULL,NULL,NULL),
 (34,'01/06/2010',50,'Absent','','2010-09-23 20:08:56',1,NULL,NULL,NULL),
 (35,'03/06/2010',44,'Half-Day','','2010-09-23 20:13:14',1,NULL,NULL,NULL),
 (36,'03/06/2010',45,'Absent','','2010-09-23 20:13:14',1,NULL,NULL,NULL),
 (37,'03/06/2010',46,'Present','','2010-09-23 20:13:14',1,NULL,NULL,NULL),
 (38,'03/06/2010',47,'Absent','','2010-09-23 20:13:14',1,NULL,NULL,NULL);
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (39,'03/06/2010',48,'Absent','','2010-09-23 20:13:15',1,NULL,NULL,NULL),
 (40,'03/06/2010',49,'Present','','2010-09-23 20:13:15',1,NULL,NULL,NULL),
 (41,'03/06/2010',50,'Absent','','2010-09-23 20:13:15',1,NULL,NULL,NULL),
 (42,'02/06/2010',44,'Absent','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (43,'02/06/2010',45,'Absent','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (44,'02/06/2010',46,'Absent','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (45,'02/06/2010',47,'Absent','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (46,'02/06/2010',48,'Absent','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (47,'02/06/2010',49,'Present','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (48,'02/06/2010',50,'Present','','2010-09-23 20:13:34',1,NULL,NULL,NULL),
 (49,'02/06/2010',44,'Absent','','2010-09-23 20:13:54',1,NULL,NULL,NULL),
 (50,'02/06/2010',45,'Absent','','2010-09-23 20:13:54',1,NULL,NULL,NULL);
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (51,'02/06/2010',46,'Absent','','2010-09-23 20:13:54',1,NULL,NULL,NULL),
 (52,'02/06/2010',47,'Absent','','2010-09-23 20:13:54',1,NULL,NULL,NULL),
 (53,'02/06/2010',48,'Present','','2010-09-23 20:13:54',1,NULL,NULL,NULL),
 (54,'02/06/2010',49,'Present','','2010-09-23 20:13:54',1,NULL,NULL,NULL),
 (55,'02/06/2010',50,'Present','','2010-09-23 20:13:54',1,NULL,NULL,NULL),
 (56,'01/06/2010',44,'Absent','','2010-09-24 12:50:20',1,NULL,NULL,NULL),
 (57,'01/06/2010',45,'Present','','2010-09-24 12:50:20',1,NULL,NULL,NULL),
 (58,'01/06/2010',46,'Present','','2010-09-24 12:50:20',1,NULL,NULL,NULL),
 (59,'01/06/2010',47,'Present','','2010-09-24 12:50:20',1,NULL,NULL,NULL),
 (60,'01/06/2010',48,'Present','','2010-09-24 12:50:20',1,NULL,NULL,NULL),
 (61,'01/06/2010',49,'Present','','2010-09-24 12:50:20',1,NULL,NULL,NULL),
 (62,'01/06/2010',50,'Present','','2010-09-24 12:50:20',1,NULL,NULL,NULL);
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (63,'19/06/2011',44,'Absent','','2011-06-19 14:33:21',1,NULL,NULL,'No'),
 (64,'19/06/2011',45,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (65,'19/06/2011',46,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (66,'19/06/2011',47,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (67,'19/06/2011',48,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (68,'19/06/2011',49,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (69,'19/06/2011',50,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (70,'19/06/2011',51,'Present','','2011-06-19 14:33:22',1,NULL,NULL,'No'),
 (71,'18/06/2011',44,'Absent','','2011-06-19 14:34:03',1,NULL,NULL,'No'),
 (72,'18/06/2011',45,'Absent','','2011-06-19 14:34:03',1,NULL,NULL,'No'),
 (73,'18/06/2011',46,'Present','','2011-06-19 14:34:04',1,NULL,NULL,'No'),
 (74,'18/06/2011',47,'Present','','2011-06-19 14:34:04',1,NULL,NULL,'No');
INSERT INTO `staff_attendance_details` (`attendance_id`,`attendance_date`,`staff_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (75,'18/06/2011',48,'Present','','2011-06-19 14:34:04',1,NULL,NULL,'No'),
 (76,'18/06/2011',49,'Present','','2011-06-19 14:34:04',1,NULL,NULL,'No'),
 (77,'18/06/2011',50,'Present','','2011-06-19 14:34:04',1,NULL,NULL,'No'),
 (78,'18/06/2011',51,'Present','','2011-06-19 14:34:04',1,NULL,NULL,'No'),
 (79,'25/06/2011',44,'Absent','','2011-06-25 11:40:02',1,NULL,NULL,'No'),
 (80,'25/06/2011',45,'Present','','2011-06-25 11:40:02',1,NULL,NULL,'No'),
 (81,'25/06/2011',46,'Present','','2011-06-25 11:40:02',1,NULL,NULL,'No'),
 (82,'25/06/2011',47,'Present','','2011-06-25 11:40:02',1,NULL,NULL,'No'),
 (83,'25/06/2011',48,'Present','','2011-06-25 11:40:03',1,NULL,NULL,'No'),
 (84,'25/06/2011',49,'Present','','2011-06-25 11:40:03',1,NULL,NULL,'No'),
 (85,'25/06/2011',50,'Present','','2011-06-25 11:40:03',1,NULL,NULL,'No'),
 (86,'25/06/2011',51,'Present','','2011-06-25 11:40:03',1,NULL,NULL,'No');
/*!40000 ALTER TABLE `staff_attendance_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`staff_details`
--

DROP TABLE IF EXISTS `staff_details`;
CREATE TABLE `staff_details` (
  `staff_id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(45) default NULL,
  `staff_no` varchar(45) default NULL,
  `dob` varchar(15) default NULL,
  `doj` varchar(15) default NULL,
  `father_name` varchar(45) default NULL,
  `mother_name` varchar(45) default NULL,
  `guardian_name` varchar(45) default NULL,
  `address_1` varchar(45) default NULL,
  `address_2` varchar(45) default NULL,
  `city` varchar(45) default NULL,
  `state` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `zipCode` varchar(45) default NULL,
  `phone` varchar(45) default NULL,
  `mobile` varchar(45) default NULL,
  `salary_amount` double default NULL,
  `sex` varchar(6) default NULL,
  `qualification` varchar(100) default NULL,
  `designation` varchar(50) default NULL,
  `subject_handled_1` varchar(30) default NULL,
  `subject_handled_2` varchar(30) default NULL,
  `subject_handled_3` varchar(30) default NULL,
  `subject_handled_4` varchar(30) default NULL,
  `create_date` datetime default NULL,
  `create_user_id` int(10) unsigned default NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `status_id` int(10) unsigned default NULL,
  `second_name` varchar(45) default NULL,
  `dept` varchar(45) default NULL,
  `prev_emp_det` varchar(45) default NULL,
  `house_no` varchar(45) default NULL,
  `house_name` varchar(45) default NULL,
  `street` varchar(45) default NULL,
  `pin` varchar(45) default NULL,
  `dist` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `basic_pay` varchar(45) default '0',
  `hra` varchar(45) default '0',
  `da` varchar(45) default '0',
  `allow1` varchar(45) default '0',
  `allow2` varchar(45) default '0',
  `others` varchar(45) default '0',
  `pf_amt` varchar(45) default '0',
  `pf_acc` varchar(45) default NULL,
  `loan_amt` varchar(45) default '0',
  `esi_amt` varchar(45) default '0',
  `esi_acc` varchar(45) default NULL,
  `esi_others` varchar(45) default NULL,
  `tds_amt` varchar(45) default '0',
  `tds_acc` varchar(45) default NULL,
  `bank_name` varchar(45) default NULL,
  `bank_acc` varchar(45) default NULL,
  `type` varchar(45) default NULL,
  `d_p` varchar(45) default '0',
  `p_p` varchar(45) default '0',
  `m_a` varchar(45) default '0',
  `o_a` varchar(45) default '0',
  `sa` varchar(45) default '0',
  `fbf` varchar(45) default '0',
  `hf` varchar(45) default '0',
  `pf_cont` varchar(45) default '0',
  `pf_rec` varchar(45) default '0',
  `fa` varchar(45) default '0',
  `spf_1` varchar(45) default '0',
  `ntc` varchar(45) default '0',
  `t_a` varchar(45) default '0',
  `cma` varchar(45) default '0',
  `diocesan` varchar(45) default '0',
  `lic` varchar(45) default '0',
  `rd` varchar(45) default '0',
  `pli` varchar(45) default '0',
  `guild` varchar(45) default '0',
  `staff_ex` varchar(45) default '0',
  `p_tax` varchar(45) default '0',
  `co_optex` varchar(45) default '0',
  `misc` varchar(45) default '0',
  `stamp` varchar(45) default '0',
  `route_stop_id` int(10) unsigned default NULL,
  `room_id` int(10) unsigned default NULL,
  `is_using_transport` varchar(4) default NULL,
  `is_using_hostel` varchar(4) default NULL,
  `is_using_library` varchar(4) default NULL,
  `is_using_lab` varchar(4) default NULL,
  `photo` varchar(145) default NULL,
  `scholar` varchar(45) default NULL,
  PRIMARY KEY  (`staff_id`),
  KEY `FK_staff_details_class` (`first_name`,`staff_no`,`dob`,`dept`),
  KEY `FK_staff_details_1` (`room_id`),
  CONSTRAINT `FK_staff_details_1` FOREIGN KEY (`room_id`) REFERENCES `room_inf` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB; (`class_id`) REFER `cubepro/class_det';

--
-- Dumping data for table `cubepro`.`staff_details`
--

/*!40000 ALTER TABLE `staff_details` DISABLE KEYS */;
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`,`d_p`,`p_p`,`m_a`,`o_a`,`sa`,`fbf`,`hf`,`pf_cont`,`pf_rec`,`fa`,`spf_1`,`ntc`,`t_a`,`cma`,`diocesan`,`lic`,`rd`,`pli`,`guild`,`staff_ex`,`p_tax`,`co_optex`,`misc`,`stamp`,`route_stop_id`,`room_id`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`photo`,`scholar`) VALUES 
 (44,'RAJINIKANTH',NULL,'28/08/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,'TESTING','TESTING','TESTING',NULL,'TESTING','TESTING',0,'Male','TESTING','TESTING','TAMIL','','','','2010-08-21 23:53:22',1,NULL,NULL,1,'R','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','30000','7500.00','100','3000.00','3000.00','101','3600.00','212','211','1425.00','220','110','222','111','ICICI BANK','1012345','CHEQUE','123','123','123','123','123','123','123','123','123','110','100','100','100','100','100','100','100','100','100','100','100','100','100','100',NULL,NULL,NULL,NULL,NULL,NULL,'#',NULL),
 (45,'KAMALHASAN',NULL,'23/09/2010','21/08/2010','MANIKANDAN','KAYATHIRI','TESTING',NULL,NULL,'','','',NULL,'','',0,'Male','BE','TEACHER','ENGHLISH','MATHS','','','2010-09-23 20:11:03',1,NULL,NULL,1,'H','PG TEACHER','','','','','','','','30000','7500.00','','3000.00','3000.00','','3600.00','','','1425.00','','','','','','','CASH','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'#',NULL);
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`,`d_p`,`p_p`,`m_a`,`o_a`,`sa`,`fbf`,`hf`,`pf_cont`,`pf_rec`,`fa`,`spf_1`,`ntc`,`t_a`,`cma`,`diocesan`,`lic`,`rd`,`pli`,`guild`,`staff_ex`,`p_tax`,`co_optex`,`misc`,`stamp`,`route_stop_id`,`room_id`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`photo`,`scholar`) VALUES 
 (46,'DHANUSH',NULL,'18/08/2010','18/08/2010','TESTING','TESTING','TESTING',NULL,NULL,'CHENNAI','TESTING','INDIA',NULL,'2345678','9840113356',30000,'Male','M.COM','TESTING','MATHS','','','','2010-08-21 23:59:49',1,NULL,NULL,1,'G','TESTING','TESTING','TESTING','AJITH','3RD','600001','CHENNAI','TESTING','30000','7500.00','600','3000.00','3000.00','700','3600.00','200','120','1425.00','120','110','210','123','ICICI BANK','987612345','CREDIT','123','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100',NULL,NULL,NULL,NULL,NULL,NULL,'#',NULL),
 (47,'VIJAYKANTH',NULL,'18/08/2010','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,'TESTING','TESTING','INDIA',NULL,'2345678','9840113356',30000,'Male','M.COM','TESTING','ACCOUNTANCY','','','','2010-08-22 00:02:16',1,NULL,NULL,1,'V','TESTING','TESTING','TESTING','TESTING','TESTING','600001','CHENNAI','TESTING','30000','7500.00','100','3000.00','3000.00','101','3600.00','200','120','1425.00','120','100','210','111','ICICI BANK','12345672','CREDIT','123','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100',NULL,NULL,NULL,NULL,NULL,NULL,'#',NULL);
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`,`d_p`,`p_p`,`m_a`,`o_a`,`sa`,`fbf`,`hf`,`pf_cont`,`pf_rec`,`fa`,`spf_1`,`ntc`,`t_a`,`cma`,`diocesan`,`lic`,`rd`,`pli`,`guild`,`staff_ex`,`p_tax`,`co_optex`,`misc`,`stamp`,`route_stop_id`,`room_id`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`photo`,`scholar`) VALUES 
 (48,'MURALI',NULL,'26/08/1976','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,'CHENNAI','TESTING','INDIA',NULL,'2345678','9840113356',30000,'Male','TESTING','TESTING','HISTORY','','','','2010-09-17 01:40:38',1,NULL,NULL,1,'M','TESTING','TESTING','TESTING','AJITH','3RD','600001','CHENNAI','TESTING','25000','6250.00','100','2500.00','2500.00','101','3000.00','100','120','1187.50','120','100','210','111','ICICI BANK','1012345','CREDIT','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100','100',NULL,NULL,NULL,NULL,NULL,NULL,'#',NULL),
 (49,'SIMBU',NULL,'26/08/1976','18/08/2010','TESTING','TESTING','TESTING',NULL,NULL,'CHENNAI','TESTING','INDIA',NULL,'2345678','9840113356',30000,'Male','TESTING','TESTING','COMMRECE','','','','2010-08-22 00:06:05',1,NULL,NULL,1,'S','TESTING','TESTING','34/31','AJITH','3RD','600001','CHENNAI','TESTING','25000','6250.00','100','2500.00','2500.00','101','3000.00','100','120','1187.50','120','100','210','111','ICICI BANK','123456723','CASH','100','100','100','100','100','100','100','100','100','100','','100','100','100','100','100','100','100','100','100','100','100','100','100',NULL,NULL,NULL,NULL,NULL,NULL,'#',NULL);
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`,`d_p`,`p_p`,`m_a`,`o_a`,`sa`,`fbf`,`hf`,`pf_cont`,`pf_rec`,`fa`,`spf_1`,`ntc`,`t_a`,`cma`,`diocesan`,`lic`,`rd`,`pli`,`guild`,`staff_ex`,`p_tax`,`co_optex`,`misc`,`stamp`,`route_stop_id`,`room_id`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`photo`,`scholar`) VALUES 
 (50,'MURALI',NULL,'17/09/2010','17/09/2010','SENTHIL','JOTHI','',NULL,NULL,'','','',NULL,'','',25000,'Male','BE','warden','ENGLISH','SICNCES','','','2011-08-02 16:44:47',1,NULL,NULL,1,'R','PG TEACHER','','','','','','','','','','','','','','','','','','','','','','','','CASH','','','','','','','','','','','','','','','','','','','','','','','','',0,NULL,'No','No',NULL,NULL,'/CubePro/photos/STAFF-0050.jpg',NULL),
 (51,'',NULL,'','','','','',NULL,NULL,'','','',NULL,'','',0,'Male','','','','','','','2011-06-18 19:58:51',1,NULL,NULL,1,'','','','','','','','','','','','','','','','','','','','','','','','','','CASH','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,'No','No',NULL,NULL,'/CubePro/photos/.jpg',NULL);
INSERT INTO `staff_details` (`staff_id`,`first_name`,`staff_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile`,`salary_amount`,`sex`,`qualification`,`designation`,`subject_handled_1`,`subject_handled_2`,`subject_handled_3`,`subject_handled_4`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`status_id`,`second_name`,`dept`,`prev_emp_det`,`house_no`,`house_name`,`street`,`pin`,`dist`,`email`,`basic_pay`,`hra`,`da`,`allow1`,`allow2`,`others`,`pf_amt`,`pf_acc`,`loan_amt`,`esi_amt`,`esi_acc`,`esi_others`,`tds_amt`,`tds_acc`,`bank_name`,`bank_acc`,`type`,`d_p`,`p_p`,`m_a`,`o_a`,`sa`,`fbf`,`hf`,`pf_cont`,`pf_rec`,`fa`,`spf_1`,`ntc`,`t_a`,`cma`,`diocesan`,`lic`,`rd`,`pli`,`guild`,`staff_ex`,`p_tax`,`co_optex`,`misc`,`stamp`,`route_stop_id`,`room_id`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`photo`,`scholar`) VALUES 
 (52,'KUMARAN',NULL,'02/08/2011','02/08/2011','SENTHIL','KAMAL','',NULL,NULL,'','','',NULL,'','',30000,'Male','M.COM','TECH','TAMIL','ENGLISH','','','2011-08-02 19:25:45',1,NULL,NULL,1,'K','COMPUTER','NO','','','','','','','','','','','','','','','','','','','','','','','CASH','','','','','','','','','','','','','','','','','','','','','','','','',3,2,'Yes','Yes',NULL,NULL,'/CubePro/photos/.jpg',NULL);
/*!40000 ALTER TABLE `staff_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`staff_lend_details`
--

DROP TABLE IF EXISTS `staff_lend_details`;
CREATE TABLE `staff_lend_details` (
  `staff_lend_id` int(10) unsigned NOT NULL auto_increment,
  `staff_id` int(10) unsigned default NULL,
  `status` varchar(45) default NULL,
  `lend_dt` varchar(45) default NULL,
  `return_dt` varchar(45) default NULL,
  `book_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`staff_lend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`staff_lend_details`
--

/*!40000 ALTER TABLE `staff_lend_details` DISABLE KEYS */;
INSERT INTO `staff_lend_details` (`staff_lend_id`,`staff_id`,`status`,`lend_dt`,`return_dt`,`book_id`) VALUES 
 (1,52,'ISSUED',NULL,NULL,1),
 (2,52,'ISSUED',NULL,'08/08/2011',1);
/*!40000 ALTER TABLE `staff_lend_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`stop_master`
--

DROP TABLE IF EXISTS `stop_master`;
CREATE TABLE `stop_master` (
  `stop_id` int(10) unsigned NOT NULL auto_increment,
  `stop_name` varchar(100) NOT NULL,
  `stop_desc` varchar(100) NOT NULL,
  PRIMARY KEY  (`stop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`stop_master`
--

/*!40000 ALTER TABLE `stop_master` DISABLE KEYS */;
INSERT INTO `stop_master` (`stop_id`,`stop_name`,`stop_desc`) VALUES 
 (1,'Mandaveli','Mandaveli Bus Stop'),
 (2,'Guindy','Guindy'),
 (3,'Saidapet','Saidapet'),
 (4,'Tambaram','Tambaram'),
 (5,'ARAMBAKKAM','TAMBARAM'),
 (6,'THAMBRAM','CHENNAI');
/*!40000 ALTER TABLE `stop_master` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`student_attendance_details`
--

DROP TABLE IF EXISTS `student_attendance_details`;
CREATE TABLE `student_attendance_details` (
  `attendance_id` int(10) unsigned NOT NULL auto_increment,
  `absent_date` varchar(20) default NULL,
  `student_id` int(10) unsigned NOT NULL,
  `attendance_status` varchar(15) default 'ABSENT',
  `attendance_reason` varchar(45) default NULL,
  `create_date` datetime default NULL,
  `create_user_id` int(10) unsigned default NULL,
  `change_date` datetime default NULL,
  `change_user_id` int(10) unsigned default NULL,
  `is_approved` varchar(45) default NULL,
  PRIMARY KEY  (`attendance_id`),
  KEY `FK_stu_att_dtils_1` (`student_id`),
  CONSTRAINT `FK_stu_att_dtils_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`student_attendance_details`
--

/*!40000 ALTER TABLE `student_attendance_details` DISABLE KEYS */;
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (1,'01/06/2010',58,'Absent','hean pian','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (2,'01/06/2010',59,'Absent','hean pian','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (3,'01/06/2010',60,'Absent','hean pian','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (4,'01/06/2010',61,'Absent','hean pian','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (5,'01/06/2010',62,'Absent','hean pian','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (6,'01/06/2010',63,'Absent','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (7,'01/06/2010',64,'Absent','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (8,'01/06/2010',65,'Present','hean pian','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (9,'01/06/2010',66,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (10,'01/06/2010',67,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (11,'01/06/2010',68,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (12,'01/06/2010',69,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (13,'01/06/2010',70,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (14,'01/06/2010',71,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (15,'01/06/2010',72,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (16,'01/06/2010',73,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (17,'01/06/2010',74,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (18,'01/06/2010',75,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (19,'01/06/2010',76,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (20,'01/06/2010',77,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (21,'01/06/2010',78,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (22,'01/06/2010',79,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (23,'01/06/2010',80,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (24,'01/06/2010',81,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (25,'01/06/2010',82,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (26,'01/06/2010',83,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (27,'01/06/2010',84,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (28,'01/06/2010',85,'Present','','2010-09-23 20:17:55',1,NULL,NULL,NULL),
 (29,'01/06/2010',86,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (30,'01/06/2010',87,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (31,'01/06/2010',88,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (32,'01/06/2010',89,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (33,'01/06/2010',90,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (34,'01/06/2010',91,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (35,'01/06/2010',92,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (36,'01/06/2010',93,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (37,'01/06/2010',94,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (38,'01/06/2010',95,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (39,'01/06/2010',96,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (40,'01/06/2010',97,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (41,'01/06/2010',98,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (42,'01/06/2010',99,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (43,'01/06/2010',100,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (44,'01/06/2010',101,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (45,'01/06/2010',102,'Present','','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (46,'01/06/2010',103,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (47,'01/06/2010',104,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (48,'01/06/2010',105,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (49,'01/06/2010',106,'Present','hean pian','2010-09-23 20:17:56',1,NULL,NULL,NULL),
 (50,'23/08/2010',58,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (51,'23/08/2010',59,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (52,'23/08/2010',60,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (53,'23/08/2010',61,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (54,'23/08/2010',62,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (55,'23/08/2010',63,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (56,'23/08/2010',64,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (57,'23/08/2010',65,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (58,'23/08/2010',66,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (59,'23/08/2010',67,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (60,'23/08/2010',68,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (61,'23/08/2010',69,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (62,'23/08/2010',70,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (63,'23/08/2010',71,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (64,'23/08/2010',72,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (65,'23/08/2010',73,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (66,'23/08/2010',74,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (67,'23/08/2010',75,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (68,'23/08/2010',76,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (69,'23/08/2010',77,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (70,'23/08/2010',78,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (71,'23/08/2010',79,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (72,'23/08/2010',80,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (73,'23/08/2010',81,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (74,'23/08/2010',82,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (75,'23/08/2010',83,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (76,'23/08/2010',84,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (77,'23/08/2010',85,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (78,'23/08/2010',86,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (79,'23/08/2010',87,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (80,'23/08/2010',88,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (81,'23/08/2010',89,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (82,'23/08/2010',90,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (83,'23/08/2010',91,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (84,'23/08/2010',92,'P','','2010-08-25 17:59:11',1,NULL,NULL,NULL),
 (85,'23/08/2010',93,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (86,'23/08/2010',94,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (87,'23/08/2010',95,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (88,'23/08/2010',96,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (89,'23/08/2010',97,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (90,'23/08/2010',98,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (91,'23/08/2010',99,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (92,'23/08/2010',100,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (93,'23/08/2010',101,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (94,'23/08/2010',102,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (95,'23/08/2010',103,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (96,'23/08/2010',104,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (97,'23/08/2010',105,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (98,'23/08/2010',106,'P','','2010-08-25 17:59:12',1,NULL,NULL,NULL),
 (99,'15/09/2010',60,'Absent','test','2010-09-16 22:04:38',1,NULL,NULL,NULL),
 (100,'02/06/2010',58,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (101,'02/06/2010',59,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (102,'02/06/2010',60,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (103,'02/06/2010',61,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (104,'02/06/2010',62,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (105,'02/06/2010',63,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (106,'02/06/2010',64,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (107,'02/06/2010',65,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (108,'02/06/2010',66,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (109,'02/06/2010',67,'Absent','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (110,'02/06/2010',68,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (111,'02/06/2010',69,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (112,'02/06/2010',70,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (113,'02/06/2010',71,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (114,'02/06/2010',72,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (115,'02/06/2010',73,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (116,'02/06/2010',74,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (117,'02/06/2010',75,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (118,'02/06/2010',76,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (119,'02/06/2010',77,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (120,'02/06/2010',78,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (121,'02/06/2010',79,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (122,'02/06/2010',80,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (123,'02/06/2010',81,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (124,'02/06/2010',82,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (125,'02/06/2010',83,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (126,'02/06/2010',84,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (127,'02/06/2010',85,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (128,'02/06/2010',86,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (129,'02/06/2010',87,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (130,'02/06/2010',88,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (131,'02/06/2010',89,'Present','','2010-09-23 20:19:15',1,NULL,NULL,NULL),
 (132,'02/06/2010',90,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (133,'02/06/2010',91,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (134,'02/06/2010',92,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (135,'02/06/2010',93,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (136,'02/06/2010',94,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (137,'02/06/2010',95,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (138,'02/06/2010',96,'Present','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (139,'02/06/2010',97,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (140,'02/06/2010',98,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (141,'02/06/2010',99,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (142,'02/06/2010',100,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (143,'02/06/2010',101,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (144,'02/06/2010',102,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (145,'02/06/2010',103,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (146,'02/06/2010',104,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (147,'02/06/2010',105,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL),
 (148,'02/06/2010',106,'Absent','','2010-09-23 20:19:16',1,NULL,NULL,NULL);
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (149,'01/02/2011',130,'Absent','','2011-02-01 00:01:22',1,NULL,NULL,'Yes'),
 (150,'08/01/2011',58,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'Yes'),
 (151,'08/01/2011',59,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (152,'08/01/2011',60,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (153,'08/01/2011',61,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (154,'08/01/2011',62,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (155,'08/01/2011',63,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (156,'08/01/2011',64,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (157,'08/01/2011',65,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (158,'08/01/2011',66,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (159,'08/01/2011',67,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (160,'08/01/2011',68,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No');
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (161,'08/01/2011',69,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (162,'08/01/2011',70,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (163,'08/01/2011',71,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (164,'08/01/2011',72,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (165,'08/01/2011',73,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (166,'08/01/2011',74,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (167,'08/01/2011',75,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (168,'08/01/2011',76,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (169,'08/01/2011',77,'Present','','2011-02-01 16:17:48',1,NULL,NULL,'No'),
 (170,'08/01/2011',78,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (171,'08/01/2011',79,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (172,'08/01/2011',80,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No');
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (173,'08/01/2011',81,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (174,'08/01/2011',82,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (175,'08/01/2011',83,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (176,'08/01/2011',84,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (177,'08/01/2011',85,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (178,'08/01/2011',86,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (179,'08/01/2011',87,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (180,'08/01/2011',88,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (181,'08/01/2011',89,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (182,'08/01/2011',90,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (183,'08/01/2011',91,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (184,'08/01/2011',92,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No');
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (185,'08/01/2011',93,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (186,'08/01/2011',94,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (187,'08/01/2011',95,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (188,'08/01/2011',96,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (189,'08/01/2011',97,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (190,'08/01/2011',98,'Present','','2011-02-01 16:17:49',1,NULL,NULL,'No'),
 (191,'08/01/2011',99,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No'),
 (192,'08/01/2011',100,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No'),
 (193,'08/01/2011',101,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No'),
 (194,'08/01/2011',102,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No'),
 (195,'08/01/2011',103,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No'),
 (196,'08/01/2011',104,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No');
INSERT INTO `student_attendance_details` (`attendance_id`,`absent_date`,`student_id`,`attendance_status`,`attendance_reason`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`is_approved`) VALUES 
 (197,'08/01/2011',105,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No'),
 (198,'08/01/2011',106,'Present','','2011-02-01 16:17:50',1,NULL,NULL,'No');
/*!40000 ALTER TABLE `student_attendance_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`student_details`
--

DROP TABLE IF EXISTS `student_details`;
CREATE TABLE `student_details` (
  `student_id` int(10) unsigned NOT NULL auto_increment,
  `student_name` varchar(45) NOT NULL,
  `roll_no` varchar(45) default NULL,
  `dob` varchar(19) NOT NULL default '',
  `doj` varchar(19) NOT NULL default '',
  `father_name` varchar(45) default NULL,
  `mother_name` varchar(45) default NULL,
  `guardian_name` varchar(45) default NULL,
  `address_1` varchar(250) default NULL,
  `address_2` varchar(250) default NULL,
  `city` varchar(45) default NULL,
  `state` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `zipCode` varchar(45) default NULL,
  `phone` varchar(45) default NULL,
  `mobile1` varchar(45) default NULL,
  `class_id` int(10) unsigned NOT NULL,
  `course_ids` varchar(45) default NULL,
  `gender` varchar(8) default NULL,
  `status` int(10) unsigned default NULL,
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
  `remarks` varchar(100) default NULL,
  `landline1` varchar(45) default NULL,
  `mobile2` varchar(45) default NULL,
  `landline2` varchar(45) default NULL,
  `office2` varchar(45) default NULL,
  `altemail` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `last_name` varchar(45) default NULL,
  `medium` varchar(45) default NULL,
  `category` varchar(45) default NULL,
  `sub_category` varchar(45) default NULL,
  `reg_ser_no` varchar(100) default NULL,
  `is_using_transport` varchar(45) default NULL,
  `is_using_hostel` varchar(45) default NULL,
  `is_using_library` varchar(45) default NULL,
  `is_using_lab` varchar(45) default NULL,
  `route_stop_id` int(10) unsigned default NULL,
  `room_id` int(10) unsigned default NULL,
  `is_using_scholar` varchar(45) default NULL,
  `scholar1` varchar(45) default NULL,
  PRIMARY KEY  (`student_id`,`dob`,`doj`),
  KEY `FK_student_details_1` (`room_id`),
  CONSTRAINT `FK_student_details_1` FOREIGN KEY (`room_id`) REFERENCES `room_inf` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`class_id`) REFER `cubepro/class_deta';

--
-- Dumping data for table `cubepro`.`student_details`
--

/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (58,'CHIRANJIVEE',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/picturelv9.png',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'A +ve','0001','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','C','TESTING','OBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (59,'DHINAKARAN',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/picturelv9.png',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB -ve','0002','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','C','TESTING','BC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (60,'JOTHI',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Female',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB -ve','0003','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','D','TESTING','OBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (61,'KUMARESAN',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0004','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','27948503','TESTING','TESTING','TESTING','TESTING','TESTING','K','TESTING','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (62,'PANDIAN',NULL,'14/05/1985','21/08/2010','KUMAR','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0005','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','','TESTING','TESTING','TESTING','K','TESTING','SC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (63,'PRASD',NULL,'14/05/1985','21/08/2010','NANDHAN','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'A1 +ve','0006','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','N','TESTING','ST','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (64,'RAMU',NULL,'14/05/1985','21/08/2010','CHITHARA','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'A2B -ve','0008','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','C','TESTING','ST','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (65,'THIRUPATHI',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'B -ve','0010','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','V','TAMIL','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (66,'VANI',NULL,'14/05/1985','21/08/2010','DURAI','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Female',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'O +ve','0012','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','K','TESTING','OC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (67,'KALAI',NULL,'14/05/1985','21/08/2010','DURAI','SUSILA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'A1 +ve','0013','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','D','TESTING','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (68,'VAMALA',NULL,'14/05/1985','21/08/2010','ELUMALAI','MARRY','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Female',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'O -ve','0014','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','N','TESTING','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (69,'SENTHIL',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'O -ve','0015','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','E','TESTING','ST','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (70,'SASI',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0016','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','R','TESTING','OTHERS','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (71,'KUMARESAN',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0017','TESTING','TESTING','','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','D','TESTING','OBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (72,'KUMAR',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0018','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','E','TESTING','SC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (73,'SATISH',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0019','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','J','TAMIL','SC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (74,'PRASANNA',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0020','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','G','TESTING','SC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (75,'RAM',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'A1 -ve','0021','TESTING','YES','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','B','TESTING','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (76,'MEENA',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Female',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'AB +ve','0022','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','S','TESTING','ST','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (77,'GEETHA',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Female',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TESTING','TESTING','TESTING',NULL,'A1 -ve','0023','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','J','TESTING','ST','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (78,'LAXMAN',NULL,'14/05/1985','21/08/2010','BALAN','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','TAMIL','TAMIL','TESTING',NULL,'AB +ve','0024','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','B','TAMIL','SC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (79,'AJITH',NULL,'14/05/1985','21/08/2010','TESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TESTING',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'TESTING','INDIAN','','TESTING','TESTING',NULL,'A1B +ve','0025','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING',NULL,'TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','TESTING','K','TESTING','OC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (80,'KAMACHI',NULL,'14/05/1985','18/08/2010','ATESTING','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'AB -ve','0026','NO','NO','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','K','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (81,'VALLI',NULL,'10/08/1986','18/08/2010','ARUL','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Female',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0027','NO','NO','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','A','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (82,'SANGEETHA',NULL,'10/08/1986','21/08/2010','ATESTING','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Female',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0028','TESTING','NO','NO','TESTING','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','RAJA.GMAIL.COM','D','ENGLISH','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (83,'GANESH',NULL,'14/05/1985','21/08/2010','ATESTING','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A -ve','0029','TESTING','NO','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','TESTING','PANDIANK1405GMAIL.COM','P','ENGLISH','BC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (84,'PALANI',NULL,'14/05/1985','18/08/2010','BALAN','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0030','NO','TESTING','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','TESTING','9941577434','27948503','27948503','TESTING','RAJA.GMAIL.COM','E','ENGLISH','MBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (85,'VIJAY',NULL,'10/08/1986','21/08/2010','ATESTING','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','','ENGLISH','',NULL,'AB -ve','0031','TESTING','NO','','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','','9840213301','','TESTING','27948503','','C','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (86,'ANBU',NULL,'10/08/1986','18/08/2010','ATESTING','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','TAMIL','ENGLISH','',NULL,'A -ve','0032','YES','NO','TESTING','NO','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'TESTING','','9840213301','27948503','27948503','27948503','','K','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (87,'PEROMAL',NULL,'10/08/1986','21/08/2010','DURAI','MALLI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','ENGLISH','TAMIL','TESTING',NULL,'AB -ve','0033','TESTING','TESTING','TESTING','NO','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT FIGUER',NULL,'TESTING','TESTING','9941577434','TESTING','TESTING','TESTING','RAJA.GMAIL.COM','P','TESTING','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (88,'MURALI',NULL,'14/08/1975','21/08/2010','ARUL','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','TAMIL','TESTING','TAMIL',NULL,'A -ve','0034','TESTING','TESTING','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'','27948503','9840213301','27948503','27948503','27948503','RAJA.GMAIL.COM','J','TESTING','MBC','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (89,'VINOTH',NULL,'14/05/1985','21/08/2010','KUMAR','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'AB -ve','0035','NO','NO','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'GOOD STUDENT','TESTING','9941577434','TESTING','','TESTING','RAJA.GMAIL.COM','K','ENGLISH','MBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (90,'LATHA',NULL,'14/05/1985','21/08/2010','BALAN','JOTHI','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'AB -ve','0036','NO','NO','NO','TESTING','A MOLE ON RIGHT SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'TESTING','TESTING','9941577434','TESTING','TESTING','TESTING','RAJA.GMAIL.COM','H','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (91,'SURESH',NULL,'14/05/1985','21/08/2010','CHITHARA','MALLI','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'TESTING','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TAMIL','TAMIL','TESTING',NULL,'A +ve','0037','TESTING','TESTING','NO','TESTING','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'TESTING','TESTING','9840213301','27948503','TESTING','TESTING','PANDIANK1405GMAIL.COM','S','TAMIL','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (92,'REMONA',NULL,'14/05/1985','18/08/2010','ATESTING','KANTHA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Female',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0038','NO','NO','TESTING','TESTING','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','TESTING','9941577434','TESTING','TESTING','TESTING','RAJA.GMAIL.COM','E','TAMIL','OBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (93,'MAGI',NULL,'10/08/1986','21/08/2010','BALAN','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A -ve','0039','YES','TESTING','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'TESTING','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','H','ENGLISH','OBC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (94,'SUMAN',NULL,'10/08/1986','18/08/2010','ATESTING','KANTHA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','ENGLISH','TAMIL','TESTING',NULL,'A -ve','0040','NO','','TESTING','TESTING','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','T','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (95,'RAMANI',NULL,'14/08/1975','21/08/2010','ELUMALAI','MALLI','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Female',1,'/CubePro/photos/STU-XII-A-0095.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TESTING',NULL,'A -ve','0041','NO','','NO','NO','','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','TESTING','9840213301','TESTING','TESTING','27948503','PANDIANK1405GMAIL.COM','R','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (96,'PRABHA',NULL,'14/05/1985','21/08/2010','CHITHARA','KANTHA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TAMIL','','TAMIL',NULL,'A -ve','0042','TESTING','NO','TESTING','TESTING','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','TESTING','9840213301','27948503','TESTING','TESTING','RAJA.GMAIL.COM','R','ENGLISH','MBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (97,'DENISH',NULL,'10/08/1986','18/08/2010','ATESTING','KANTHA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','TAMIL','TESTING',NULL,'A -ve','0043','NO','NO','NO','NO','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'GOOD STUDENT','TESTING','9941577434','TESTING','TESTING','TESTING','RAJA.GMAIL.COM','R','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (98,'SANTHOSH',NULL,'14/05/1985','18/08/2010','DURAI','KANTHA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'AB -ve','0044','NO','NO','TESTING','NO','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','TESTING','9840213301','27948503','TESTING','27948503','RAJA.GMAIL.COM','T','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (99,'RAJESH',NULL,'10/08/1986','21/08/2010','CHITHARA','KANTHA','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A -ve','0045','NO','NO','NO','NO','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','RAJA.GMAIL.COM','M','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (100,'ARUN',NULL,'10/08/1986','21/08/2010','DURAI','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A -ve','0046','TESTING','NO','NO','TESTING','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT UPPER SIDE',NULL,'TESTING','27948503','9840213301','27948503','27948503','27948503','','B','ENGLISH','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (101,'MANIMOLI',NULL,'14/05/1985','21/08/2010','DURAI','MARRY','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Female',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A -ve','0047','NO','NO','','NO','','A MOLE ON LEFT UPPER SIDE',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','TESTING','PANDIANK1405GMAIL.COM','K','ENGLISH','MBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (102,'TAMILARASU',NULL,'14/08/1975','21/08/2010','RAJENDRAN','TESTING','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0048','NO','NO','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','TESTING','RAJA.GMAIL.COM','T','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (103,'GOPI',NULL,'14/05/1985','21/08/2010','CHITHARA','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'AB -ve','0049','NO','NO','NO','TESTING','A MOLE ON RIGHT UPPER SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9941577434','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','D','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (104,'GANDHI',NULL,'14/05/1985','21/08/2010','ARUL','MARRY','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'CHRISTEN','INDIAN','TESTING','TAMIL','TAMIL',NULL,'A -ve','0050','TESTING','TESTING','TESTING','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','A','TAMIL','SC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (105,'LAXSHMI',NULL,'10/08/1986','18/08/2010','CHITHARA','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9840213301',66,'DANCE','Male',1,'/CubePro/photos/STU-XII-A-00105.jpg',NULL,'HINDU','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0051','NO','NO','NO','NO','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'TESTING','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','S','ENGLISH','OBC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (106,'DEVAN',NULL,'14/05/1985','21/08/2010','ARULDOSS','MARRY','TESTING','','',NULL,NULL,NULL,NULL,NULL,'9840109314',66,'DANCE','Male',1,'/CubePro/photos/STU-XII-A-00106.jpg',NULL,'CHRISTEN','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A -ve','0052','TESTING','TESTING','NO','TESTING','A MOLE ON RIGHT SIDE','A MOLE ON LEFT FIGUER',NULL,'GOOD STUDENT','27948503','9840213301','27948503','27948503','27948503','PANDIANK1405GMAIL.COM','A','TAMIL','BC','SEITTEYAR','','Yes','Yes','No','No',1,2,NULL,NULL),
 (107,'AJITH',NULL,'09/09/2010','09/09/2010','CHITHARA','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'Nil','12101','TESTING','NO','','','','',NULL,'','','','','','','','A','TAMIL','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (108,'LATHA',NULL,'09/09/2010','09/09/2010','BALAN','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'Nil','12102','YES','NO','','','','',NULL,'','','','','','','','A','TESTING','OBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (109,'MARAN',NULL,'09/09/2010','09/09/2010','ARULDOSS','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TESTING',NULL,'Nil','12103','NO','NO','','','','',NULL,'','','','','','','','V','ENGLISH','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (110,'CHIRANJIVEE',NULL,'09/09/2010','09/09/2010','ATESTING','MALLI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/STU-X-C-00110.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'Nil','12108','NO','YES','','','','',NULL,'','','','','','','','C','ENGLISH','BC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (111,'VIMALA',NULL,'09/09/2010','09/09/2010','ATESTING','KANTHA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'Nil','12104','YES','YES','','','','',NULL,'','','','','','','','A','ENGLISH','SC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (112,'CUBICLE',NULL,'09/09/2010','09/09/2010','BALAN','SUSILA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'Nil','12105','NO','NO','','','','',NULL,'','','','','','','','C','ENGLISH','OBC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (113,'PANDI',NULL,'09/09/2010','09/09/2010','MARAN','CASH','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'Nil','12106','YES','NO','','','','',NULL,'','','','','','','','C','ENGLISH','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (114,'SELVI',NULL,'09/09/2010','09/09/2010','DURAI','MALLI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'Nil','12107','NO','NO','','','','',NULL,'','','','','','','','C','ENGLISH','SC','ADI DRAVIDER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (115,'MURALI',NULL,'09/09/2010','09/09/2010','BALAN','MARRY','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'Nil','121011','NO','NO','','','','',NULL,'','','','','','','','M','ENGLISH','BC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (116,'MAGI',NULL,'09/09/2010','09/09/2010','KUMAR','MALLI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'Nil','12112','NO','NO','','','','',NULL,'','','','','','','','M','ENGLISH','OBC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (117,'KAMARAJ',NULL,'09/09/2010','09/09/2010','BALAN','MARRY','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'Nil','12113','TESTING','NO','','','','',NULL,'','','','','','','','K','ENGLISH','MBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (118,'NAYANTHARA',NULL,'09/09/2010','09/09/2010','ATESTING','MALLI','TESTING','','',NULL,NULL,NULL,NULL,NULL,'9876543210',66,'','Male',1,'/CubePro/photos/STU-XII-A-00118.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'Nil','12114','NO','NO','','','','',NULL,'','','','','','','','D','ENGLISH','OBC','TESTING','','No','No','No',NULL,NULL,NULL,'No',NULL),
 (119,'DEVA',NULL,'09/09/2010','09/09/2010','DURAI','SUSILA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','',NULL,'Nil','12115','TESTING','NO','','','','',NULL,'','','','','','','','G','ENGLISH','BC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (120,'KAPIL DEVE',NULL,'09/09/2010','09/09/2010','BALAN','MARRY','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'Nil','12116','TESTING','NO','','','','',NULL,'','','','','','','','D','ENGLISH','OBC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (121,'SHEELA',NULL,'09/09/2010','09/09/2010','CHITHARA','MARRY','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'Nil','12151','TESTING','NO','','','','',NULL,'','','','','','','','D','ENGLISH','BC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (122,'RAMYA',NULL,'09/09/2010','09/09/2010','CHITHARA','THANAM','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'A1B +ve','12152','TESTING','TESTING','','','','',NULL,'','','','','','','','E','ENGLISH','MBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (123,'VIJAYA',NULL,'09/09/2010','09/09/2010','KUMAR','THANAM','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TESTING','ENGLISH','TAMIL',NULL,'A2B +ve','12153','TESTING','NO','','','','',NULL,'','','','','','','','W','ENGLISH','MBC','VANNIYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (124,'HARI',NULL,'09/09/2010','09/09/2010','JOTHI','KUMAR','TESTING','','',NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/STU-IX-D-00124.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A2 +ve','12155','YES','NO','','','','',NULL,'','','','','','','','A','ENGLISH','OBC','ADI DRAVIDER','','Yes','No','No',NULL,4,NULL,NULL,NULL),
 (125,'TIRESHA',NULL,'09/09/2010','09/09/2010','ATESTING','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'Nil','121101','NO','NO','','','','',NULL,'','','','','','','','S','ENGLISH','OBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (126,'ASIN',NULL,'09/09/2010','09/09/2010','BALAN','JOTHI','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','','TAMIL',NULL,'Nil','121102','YES','NO','','','','',NULL,'','','','','','','','P','ENGLISH','OBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (127,'TAMMNA',NULL,'09/09/2010','09/09/2010','ARUL','CASH','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'Nil','121103','TESTING','NO','','','','',NULL,'','','','','','','','P','ENGLISH','MBC','KAMMAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (128,'KUSHBHU',NULL,'09/09/2010','09/09/2010','CHITHARA','THANAM','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','ENGLISH','ENGLISH','TAMIL',NULL,'Nil','121104','NO','NO','','','','',NULL,'','','','','','','','S','ENGLISH','OBC','SEITTEYAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (129,'JOTHIKA',NULL,'09/09/2010','09/09/2010','ARULDOSS','SUSILA','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',66,'','Female',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'Nil','121105','TESTING','NO','','','','',NULL,'','','','','','','','S','ENGLISH','MBC','TESTING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (130,'THIRUPATHI',NULL,'23/09/2010','23/09/2010','VACHIRAMJHG','','','','',NULL,NULL,NULL,NULL,NULL,'9840213301',74,'','Male',1,'/CubePro/photos/STU-VIII-A1-BIO-00130.jpg',NULL,'','INDIAN','TAMIL','ENGLISH','TAMIL',NULL,'A +ve','9876','NO','YES','','','','',NULL,'','','','','','','','V','ENGLISH','ST','ADI DRAVIDER','','Yes','Yes','No',NULL,1,1,NULL,NULL),
 (131,'ARUN',NULL,'14/05/2011','01/01/2011','ELUMALAI','JOTHI','','','',NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/STU-XII-A-00131.jpg',NULL,'','INDIAN','TAMIL','','',NULL,'Nil','87655','','','','','','',NULL,'','','','',NULL,'','','B','','OC','','338','No','No','No',NULL,NULL,NULL,'Yes','');
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (132,'ARUN',NULL,'14/05/2011','01/01/2011','ELUMALAI','JOTHI','','','',NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/null.jpg',NULL,'','INDIAN','TAMIL','','',NULL,'Nil','87655','','','','','','',NULL,'','','','',NULL,'','','B','','OC','','338','No','No','No',NULL,NULL,NULL,NULL,NULL),
 (133,'fdd',NULL,'18/06/2011','18/06/2011','fgd','','','','',NULL,NULL,NULL,NULL,NULL,'',66,'','Male',1,'/CubePro/photos/STU-XII-A-00133.jpg',NULL,'','INDIAN','','','',NULL,'Nil','dcvc','',NULL,'','','','',NULL,'','','','',NULL,'','','bgf','','OC','','','Yes','Yes','No',NULL,2,1,'Yes','400');
INSERT INTO `student_details` (`student_id`,`student_name`,`roll_no`,`dob`,`doj`,`father_name`,`mother_name`,`guardian_name`,`address_1`,`address_2`,`city`,`state`,`country`,`zipCode`,`phone`,`mobile1`,`class_id`,`course_ids`,`gender`,`status`,`photo`,`caste`,`religion`,`nationality`,`mother_tongue`,`first_language`,`second_language`,`third_language`,`blood_group`,`admission_no`,`physical_status`,`scholarship`,`prev_inst`,`prev_inst_reason`,`iden_mark1`,`iden_mark2`,`iden_mark3`,`remarks`,`landline1`,`mobile2`,`landline2`,`office2`,`altemail`,`email`,`last_name`,`medium`,`category`,`sub_category`,`reg_ser_no`,`is_using_transport`,`is_using_hostel`,`is_using_library`,`is_using_lab`,`route_stop_id`,`room_id`,`is_using_scholar`,`scholar1`) VALUES 
 (134,'pandian',NULL,'25/06/2011','25/06/2011','kumar','jothi','','','',NULL,NULL,NULL,NULL,NULL,'',66,'dance','Male',1,'/CubePro/photos/STU-XII-A-00134.jpg',NULL,'hindu','INDIAN','','tamil','',NULL,'Nil','12134','',NULL,'govt hr sec school','','','',NULL,'','','','',NULL,'','','k','english','SC','adi dravider','1234','Yes','Yes','No',NULL,5,1,'Yes','4000'),
 (135,'PANDIAN K',NULL,'02/08/2011','02/08/2011','KUMAR','JOTHI','',';KSADHFO[KN\r\nDSKLJFHKSDAHN\r\nSDAKJFH[\'HDSADKNF\r\nASDHFO[IHJ',';KSADHFO[KN\r\nDSKLJFHKSDAHN\r\nSDAKJFH[\'HDSADKNF\r\nASDHFO[IHJ',NULL,NULL,NULL,NULL,NULL,'3487594830',73,'DANCE','Male',1,'/CubePro/photos/null.jpg',NULL,'HINDU','INDIAN','TAMIL','ENGLISH','ENGLISH',NULL,'B +ve','1012','NO',NULL,'GOVT HR SEC SCHOOL','NO','A MOLE ON LIGHT SIDE','A MOLE ON LEGHT',NULL,'GOOD ','3940256847','23094723957','',NULL,'','pandiank1405Gmail.com','K','ENGLISH','MBC','ADI DRAVIDER','12334','Yes','Yes','No',NULL,1,2,'Yes','4000');
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`student_lend_details`
--

DROP TABLE IF EXISTS `student_lend_details`;
CREATE TABLE `student_lend_details` (
  `student_lend_id` int(10) unsigned NOT NULL auto_increment,
  `student_id` int(10) unsigned default NULL,
  `book_id` int(10) unsigned default NULL,
  `status` varchar(45) default NULL,
  `lend_dt` varchar(45) default NULL,
  `return_dt` varchar(45) default NULL,
  PRIMARY KEY  (`student_lend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`student_lend_details`
--

/*!40000 ALTER TABLE `student_lend_details` DISABLE KEYS */;
INSERT INTO `student_lend_details` (`student_lend_id`,`student_id`,`book_id`,`status`,`lend_dt`,`return_dt`) VALUES 
 (1,134,1,'ISSUED',NULL,'08/08/2011');
/*!40000 ALTER TABLE `student_lend_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`student_mark_summary`
--

DROP TABLE IF EXISTS `student_mark_summary`;
CREATE TABLE `student_mark_summary` (
  `student_mark_summary_id` int(10) unsigned NOT NULL auto_increment,
  `student_id` int(10) unsigned default NULL,
  `exam_id` int(10) unsigned default NULL,
  `class_id` int(10) unsigned default NULL,
  `total` varchar(45) default NULL,
  `percentage` varchar(45) default NULL,
  `grade` varchar(45) default NULL,
  PRIMARY KEY  (`student_mark_summary_id`),
  KEY `FK_student_mark_summary_1` (`class_id`),
  KEY `FK_student_exam` (`exam_id`),
  CONSTRAINT `FK_student_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam_details` (`exam_id`),
  CONSTRAINT `FK_student_mark_summary_1` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`student_mark_summary`
--

/*!40000 ALTER TABLE `student_mark_summary` DISABLE KEYS */;
INSERT INTO `student_mark_summary` (`student_mark_summary_id`,`student_id`,`exam_id`,`class_id`,`total`,`percentage`,`grade`) VALUES 
 (5,58,10,66,'1194','99.50','A+'),
 (6,59,10,66,'1127','93.91','A+'),
 (7,60,10,66,'1143','95.25','A+'),
 (8,61,10,66,'1200','100.00','A+'),
 (9,62,10,66,'1199','99.91','A+'),
 (10,63,10,66,'1194','99.50','A+'),
 (11,64,10,66,'754','62.83','A'),
 (12,65,10,66,'618','51.50','C'),
 (13,66,10,66,'594','49.50','C'),
 (14,67,10,66,'712','59.33','C'),
 (15,68,10,66,'789','65.75','A'),
 (16,69,10,66,'594','49.50','C'),
 (17,70,10,66,'1008','84.00','A+'),
 (18,71,10,66,'683','56.91','C'),
 (19,72,10,66,'594','49.50','C'),
 (20,73,10,66,'1194','99.50','A+'),
 (21,74,10,66,'594','49.50','C'),
 (22,75,10,66,'594','49.50','C'),
 (23,76,10,66,'594','49.50','C'),
 (24,77,10,66,'594','49.50','C'),
 (25,78,10,66,'504','42.00','C'),
 (26,79,10,66,'594','49.50','C'),
 (27,80,10,66,'594','49.50','C'),
 (28,81,10,66,'594','49.50','C'),
 (29,82,10,66,'594','49.50','C'),
 (30,83,10,66,'403','33.58','F'),
 (31,84,10,66,'528','44.00','C');
INSERT INTO `student_mark_summary` (`student_mark_summary_id`,`student_id`,`exam_id`,`class_id`,`total`,`percentage`,`grade`) VALUES 
 (32,85,10,66,'528','44.00','C'),
 (33,86,10,66,'528','44.00','C'),
 (34,87,10,66,'288','24.00','F'),
 (35,88,10,66,'288','24.00','F'),
 (36,89,10,66,'448','37.33','F'),
 (37,90,10,66,'1194','99.50','A+'),
 (38,91,10,66,'1139','94.91','A+'),
 (39,92,10,66,'658','54.83','C'),
 (40,93,10,66,'627','52.25','C'),
 (41,94,10,66,'748','62.33','A'),
 (42,95,10,66,'539','44.91','C'),
 (43,96,10,66,'594','49.50','C'),
 (44,97,10,66,'896','74.66','A'),
 (45,98,10,66,'504','42.00','C'),
 (46,99,10,66,'794','66.16','A'),
 (47,100,10,66,'714','59.50','C'),
 (48,101,10,66,'504','42.00','C'),
 (49,102,10,66,'324','27.00','F'),
 (50,103,10,66,'594','49.50','C'),
 (51,104,10,66,'1094','91.16','A+'),
 (52,105,10,66,'504','42.00','C'),
 (53,106,10,66,'594','49.50','C'),
 (54,107,10,66,'594','99.00','A+'),
 (55,108,10,66,'594','99.00','A+'),
 (56,109,10,66,'594','99.00','A+'),
 (57,110,10,66,'594','99.00','A+');
INSERT INTO `student_mark_summary` (`student_mark_summary_id`,`student_id`,`exam_id`,`class_id`,`total`,`percentage`,`grade`) VALUES 
 (58,111,10,66,'594','99.00','A+'),
 (59,112,10,66,'594','99.00','A+'),
 (60,113,10,66,'594','99.00','A+'),
 (61,114,10,66,'594','99.00','A+'),
 (62,115,10,66,NULL,NULL,''),
 (63,116,10,66,NULL,NULL,''),
 (64,117,10,66,NULL,NULL,''),
 (65,118,10,66,NULL,NULL,''),
 (66,119,10,66,NULL,NULL,''),
 (67,120,10,66,NULL,NULL,''),
 (68,121,10,66,NULL,NULL,''),
 (69,122,10,66,NULL,NULL,''),
 (70,123,10,66,NULL,NULL,''),
 (71,124,10,66,NULL,NULL,''),
 (72,125,10,66,NULL,NULL,''),
 (73,126,10,66,NULL,NULL,''),
 (74,127,10,66,NULL,NULL,''),
 (75,128,10,66,NULL,NULL,''),
 (76,129,10,66,NULL,NULL,''),
 (77,131,10,66,NULL,NULL,''),
 (78,132,10,66,NULL,NULL,''),
 (79,133,10,66,NULL,NULL,''),
 (80,134,10,66,NULL,NULL,'');
/*!40000 ALTER TABLE `student_mark_summary` ENABLE KEYS */;


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
 (11,'TAMIL','ACTIVE'),
 (12,'ENGLISH','ACTIVE'),
 (13,'ACCOUNTANCY','ACTIVE'),
 (14,'COMMERCE','ACTIVE'),
 (15,'ECONAMICS','ACTIVE'),
 (16,'HISTORY','ACTIVE'),
 (17,'MATHS','ACTIVE'),
 (18,'SICNCE','ACTIVE'),
 (19,'SOCIAL SCINCE','ACTIVE'),
 (20,'EVS','ACTIVE');
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
 (39,'TAMIL',66,200,'ACTIVE'),
 (40,'ENGLISH',66,200,'ACTIVE'),
 (41,'ACCOUNTANCY',66,200,'ACTIVE'),
 (42,'COMMERCE',66,200,'ACTIVE'),
 (43,'ECONAMICS',66,200,'ACTIVE'),
 (44,'HISTORY',66,200,'ACTIVE'),
 (45,'TAMIL',68,100,'ACTIVE'),
 (46,'ENGLISH',68,100,'ACTIVE'),
 (47,'MATHS',68,100,'ACTIVE'),
 (48,'SICNCE',68,100,'ACTIVE'),
 (49,'SOCIAL SCINCE',68,100,'ACTIVE'),
 (50,'EVS',68,100,'ACTIVE');
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
 (7,'ANNUAL EXAM','ACTIVE'),
 (8,'HEAFLY EXAM','ACTIVE'),
 (9,'1ST MITAM','ACTIVE'),
 (10,'TEST111','ACTIVE'),
 (11,'TEST1','ACTIVE'),
 (12,'TEST2','ACTIVE');
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
 (337,66,44,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 1'),
 (338,66,45,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 2'),
 (339,66,46,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 3'),
 (340,66,47,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 4'),
 (341,66,48,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,43,'Period 5'),
 (342,66,49,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 6'),
 (343,66,49,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 7'),
 (344,66,44,NULL,1,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 8'),
 (345,66,44,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 1'),
 (346,66,45,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 2'),
 (347,66,46,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 3'),
 (348,66,47,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 4');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (349,66,48,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,43,'Period 5'),
 (350,66,49,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 6'),
 (351,66,48,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,44,'Period 7'),
 (352,66,45,NULL,2,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 8'),
 (353,66,44,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 1'),
 (354,66,45,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 2'),
 (355,66,46,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 3'),
 (356,66,47,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 4'),
 (357,66,48,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,43,'Period 5'),
 (358,66,49,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 6'),
 (359,66,45,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 7'),
 (360,66,46,NULL,3,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 8');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (361,66,44,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 1'),
 (362,66,45,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 2'),
 (363,66,46,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 3'),
 (364,66,47,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 4'),
 (365,66,48,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,43,'Period 5'),
 (366,66,49,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 6'),
 (367,66,46,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,43,'Period 7'),
 (368,66,47,NULL,4,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 8'),
 (369,66,44,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 1'),
 (370,66,45,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 2'),
 (371,66,46,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 3'),
 (372,66,47,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 4');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (373,66,48,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,43,'Period 5'),
 (374,66,49,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 6'),
 (375,66,44,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 7'),
 (376,66,48,NULL,5,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 8'),
 (377,66,44,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 1'),
 (378,66,45,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 2'),
 (379,66,46,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 3'),
 (380,66,47,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,42,'Period 4'),
 (381,66,48,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,44,'Period 5'),
 (382,66,49,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,39,'Period 6'),
 (383,66,48,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,41,'Period 7'),
 (384,66,49,NULL,6,2010,'2010-08-22 00:09:36',1,NULL,NULL,40,'Period 8');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (385,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 1'),
 (386,66,47,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 2'),
 (387,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 3'),
 (388,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 4'),
 (389,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 5'),
 (390,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 6'),
 (391,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 7'),
 (392,66,44,NULL,1,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 8'),
 (393,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 1'),
 (394,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 2'),
 (395,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 3'),
 (396,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 4');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (397,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 5'),
 (398,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 6'),
 (399,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 7'),
 (400,66,44,NULL,2,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 8'),
 (401,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 1'),
 (402,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 2'),
 (403,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 3'),
 (404,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 4'),
 (405,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 5'),
 (406,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 6'),
 (407,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 7'),
 (408,66,44,NULL,3,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 8');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (409,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 1'),
 (410,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 2'),
 (411,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 3'),
 (412,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 4'),
 (413,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 5'),
 (414,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 6'),
 (415,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 7'),
 (416,66,44,NULL,4,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 8'),
 (417,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 1'),
 (418,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 2'),
 (419,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 3'),
 (420,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 4');
INSERT INTO `time_table_details` (`time_table_detail_id`,`class_id`,`staff_id`,`replacement_staff_id`,`day`,`year`,`create_date`,`create_user_id`,`change_date`,`change_user_id`,`subject_id`,`periods`) VALUES 
 (421,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 5'),
 (422,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 6'),
 (423,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 7'),
 (424,66,44,NULL,5,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 8'),
 (425,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 1'),
 (426,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 2'),
 (427,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 3'),
 (428,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 4'),
 (429,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 5'),
 (430,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 6'),
 (431,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 7'),
 (432,66,44,NULL,6,2009,'2011-01-22 20:20:11',1,NULL,NULL,39,'Period 8');
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
 (1,'CASH INCOME','MANAGEMENT A/C','STUDENT FEES','ACTIVE'),
 (2,'CASH INCOME','MANAGEMENT A/C','SHOP RENT','ACTIVE'),
 (3,'CASH INCOME','MANAGEMENT A/C','VAN FEE','ACTIVE'),
 (4,'CASH INCOME','MANAGEMENT A/C','CANTEEN FEE','ACTIVE'),
 (5,'CASH INCOME','MANAGEMENT A/C','HOSTEL FEE','ACTIVE'),
 (6,'CASH EXPENSE','MANAGEMENT A/C','WAGES','ACTIVE'),
 (7,'CASH EXPENSE','MANAGEMENT A/C','VAN PETROL EXP','ACTIVE'),
 (8,'CASH EXPENSE','MANAGEMENT A/C','MIECLLOUS EXP','ACTIVE'),
 (9,'CASH EXPENSE','MANAGEMENT A/C','VAN SERVICE EXP','ACTIVE'),
 (10,'CASH EXPENSE','MANAGEMENT A/C','MONTHLY MEETING EXP','ACTIVE'),
 (11,'CASH EXPENSE','MANAGEMENT A/C','GIFT ARTICAL','ACTIVE'),
 (12,'BANK INCOME','MANAGEMENT A/C','BANK INTEREST','ACTIVE'),
 (13,'BANK INCOME','MANAGEMENT A/C','STUDENT FEES','ACTIVE'),
 (14,'BANK INCOME','MANAGEMENT A/C','GOVT SALARY','ACTIVE'),
 (15,'BANK INCOME','MANAGEMENT A/C','MANAGEMENT SALARY','ACTIVE'),
 (16,'BANK EXPENSE','MANAGEMENT A/C','AIRTEL BILL EXP','ACTIVE');
INSERT INTO `trans_master` (`id`,`type`,`sub_type`,`trans_desc`,`status`) VALUES 
 (17,'BANK EXPENSE','MANAGEMENT A/C','EB BILL EXP','ACTIVE'),
 (18,'BANK EXPENSE','MANAGEMENT A/C','STAFF SALARY','ACTIVE'),
 (19,'BANK EXPENSE','MANAGEMENT A/C','TELEPHONE EXP','ACTIVE'),
 (20,'BANK EXPENSE','MANAGEMENT A/C','LOAN INTEREST','ACTIVE'),
 (21,'BANK EXPENSE','MANAGEMENT A/C','BORAD BAND BILL','ACTIVE'),
 (22,'BANK EXPENSE','MANAGEMENT A/C','BORAD BAND BILL','ACTIVE'),
 (23,'CASH INCOME','MANAGEMENT A/C','OPENING BALANCE','ACTIVE'),
 (24,'BANK INCOME','MANAGEMENT A/C','OPENING BALANCE','ACTIVE');
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
  `remarks` varchar(100) default NULL,
  `status` varchar(45) default 'N',
  `reg_book_no` varchar(45) default NULL,
  PRIMARY KEY  (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`transaction_details`
--

/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (159,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 00:31:43',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (160,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 00:32:14',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (161,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 00:32:51',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (162,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 00:33:45',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (163,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 00:34:20',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (164,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 00:34:53',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (165,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:09:33',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (166,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:10:20',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (167,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:11:11',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (168,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:12:27',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (169,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:13:09',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (170,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:13:50',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (171,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:14:54',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (172,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:15:27',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (173,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:16:04',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (174,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:17:13',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (175,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:17:37',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (176,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:19:23',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (177,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:20:33',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (178,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:22:11',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (179,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:22:44',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (180,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:23:55',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (181,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:24:19',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (182,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:24:53',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (183,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:26:26',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (184,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:26:55',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (185,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:27:47',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (186,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:28:54',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (187,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:29:14',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (188,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:29:44',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (189,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:30:40',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (190,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:30:59',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (191,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:31:34',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (192,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:32:10',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (193,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:32:27',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (194,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:33:17',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (195,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:34:02',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (196,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:34:21',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (197,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:34:40',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (198,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:35:38',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (199,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:36:02',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (200,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:36:20',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (201,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:36:53',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (202,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:37:28',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (203,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:38:19',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (204,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:38:52',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (205,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:39:26',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (206,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:39:51',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (207,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:40:21',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (208,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:40:52',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (209,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:41:14',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (210,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:42:20',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (211,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:42:50',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (212,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:43:23',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (213,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:44:18',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (214,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:44:46',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (215,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:45:10',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (216,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:56:15',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (217,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:56:36',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (218,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:57:01',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (219,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 07:57:59',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (220,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 07:58:25',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (221,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 07:59:14',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (222,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:00:04',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (223,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:00:47',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (224,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:01:20',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (225,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:02:01',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (226,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:08:26',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (227,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:08:45',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (228,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:09:05',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (229,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:09:40',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (230,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:09:58',NULL,NULL,'01/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (231,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:10:15',NULL,NULL,'02/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (232,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:10:53',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (233,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:11:22',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (234,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:11:52',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (235,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:12:16',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (236,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:12:46',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (237,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:13:17',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (238,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:14:14',NULL,NULL,'03/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (239,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:15:22',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (240,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:15:47',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (241,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:16:12',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (242,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:17:05',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (243,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:17:24',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (244,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:17:48',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (245,'CASH INCOME','STUDENT FEES',450,0,1,'2010-08-22 08:18:57',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (246,'CASH INCOME','STUDENT FEES',150,0,1,'2010-08-22 08:19:20',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (247,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-08-22 08:19:42',NULL,NULL,'04/06/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (248,'CASH INCOME','STUDENT FEES',150000,0,1,'2010-08-22 17:11:00',NULL,NULL,'01/04/2010','MANAGEMENT A/C','','CASH','TOTAL FEES COLLCATIONS ','N',NULL),
 (249,'CASH INCOME','SHOP RENT',10000,0,1,'2010-08-22 17:12:10',NULL,NULL,'01/04/2010','MANAGEMENT A/C','','CASH','SCHOOL BUILLDING CUPAMS','N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (250,'CASH INCOME',' VAN FEE',50000,0,1,'2010-08-22 17:13:17',NULL,NULL,'01/04/2010','MANAGEMENT A/C','','CASH','COLLCTION','N',NULL),
 (251,'CASH INCOME','CANTEEN FEE',30000,0,1,'2010-08-22 17:13:52',NULL,NULL,'01/04/2010','MANAGEMENT A/C','','CASH','CANTEEN FEES COLLCTION','N',NULL),
 (252,'CASH INCOME','HOSTEL FEE',50000,0,1,'2010-08-22 17:14:20',NULL,NULL,'01/04/2010','MANAGEMENT A/C','','CASH','HOSTEL FEES COLLCTION','N',NULL),
 (253,'BANK INCOME','BANK INTEREST',1500,0,1,'2010-08-22 17:17:35',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CASH','DOPSITE INTEREST','N',NULL),
 (254,'BANK INCOME','GOVT SALARY',300000,0,1,'2010-08-22 17:19:53',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CHEQUE','GOVT SALARY','N',NULL),
 (255,'BANK INCOME','MANAGEMENT SALARY',150000,0,1,'2010-08-22 17:20:20',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CHEQUE','MGT SALARY','N',NULL),
 (256,'BANK INCOME','SUTDENT FEES',50000,0,1,'2010-08-22 17:23:25',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','','TOTAL FEES COLLCATIONS ','N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (257,'BANK EXPENSE','AIRTEL BILL EXP',3000,0,1,'2010-08-22 17:24:19',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CHEQUE','AIRTEL BILL','N',NULL),
 (258,'BANK EXPENSE','EB BILL EXP',3000,0,1,'2010-08-22 17:24:31',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CHEQUE','EB BILL','N',NULL),
 (259,'BANK EXPENSE','STAFF SALARY',100000,0,1,'2010-08-22 17:25:19',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CASH','MONTHLY SALARY','N',NULL),
 (260,'BANK EXPENSE','TELEPHONE EXP',4000,0,1,'2010-08-22 17:25:59',NULL,NULL,'02/04/2010','MANAGEMENT A/C','','CHEQUE','PHONE BILL','N',NULL),
 (261,'BANK INCOME','OPENING BALANCE',20000,0,1,'2010-08-22 17:31:04',NULL,NULL,'31/03/2010','MANAGEMENT A/C','','CASH','APRAL  OPENING BALANCE','N',NULL),
 (262,'CASH INCOME','OPENING  BALANCE ',50000,0,1,'2010-08-22 17:31:04',NULL,NULL,'31/03/2010','MANAGEMENT A/C',NULL,'CASH','MARCH CLOSING BALANCE ','N',NULL),
 (263,'CASH INCOME','STUDENT FEES',450,0,1,'2010-09-23 17:59:14',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
INSERT INTO `transaction_details` (`transaction_id`,`transaction_code`,`trans_desc`,`amount`,`balance`,`create_user_id`,`create_date`,`change_user_id`,`change_date`,`trans_date`,`trans_type`,`trans_sub_type`,`payment_type`,`remarks`,`status`,`reg_book_no`) VALUES 
 (264,'CASH INCOME','STUDENT FEES',150,0,1,'2010-09-23 18:00:36',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (265,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-09-23 18:00:50',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (266,'CASH INCOME','STUDENT FEES',1000,0,1,'2010-09-23 18:26:04',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (267,'CASH INCOME','STUDENT FEES',150,0,1,'2010-09-23 18:26:39',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (268,'CASH INCOME','STUDENT FEES',450,0,1,'2010-09-23 18:27:50',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL),
 (269,'CASH INCOME','STUDENT FEES',0,0,1,'2010-09-23 18:31:08',NULL,NULL,'','MANAGEMENT A/C','','','','N',NULL),
 (270,'CASH INCOME','STUDENT FEES',450,0,1,'2010-09-27 14:24:21',NULL,NULL,'02/08/2010','GENERAL FUND A/C',NULL,'CASH',NULL,'N',NULL);
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`vehicle_fuel`
--

DROP TABLE IF EXISTS `vehicle_fuel`;
CREATE TABLE `vehicle_fuel` (
  `vehicle_fuel_id` int(10) unsigned NOT NULL auto_increment,
  `dof` varchar(45) default NULL,
  `litres` varchar(45) default NULL,
  `total_kms` varchar(45) default NULL,
  `amount` varchar(45) default NULL,
  `vehicle_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`vehicle_fuel_id`),
  KEY `FK_vehicle_fuel_1` (`vehicle_id`),
  CONSTRAINT `FK_vehicle_fuel_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`vehicle_fuel`
--

/*!40000 ALTER TABLE `vehicle_fuel` DISABLE KEYS */;
INSERT INTO `vehicle_fuel` (`vehicle_fuel_id`,`dof`,`litres`,`total_kms`,`amount`,`vehicle_id`) VALUES 
 (1,'22/01/2011','100','150','200',1);
/*!40000 ALTER TABLE `vehicle_fuel` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`vehicle_maint`
--

DROP TABLE IF EXISTS `vehicle_maint`;
CREATE TABLE `vehicle_maint` (
  `vehicle_maint_id` int(10) unsigned NOT NULL auto_increment,
  `dos` varchar(45) default NULL,
  `descr` varchar(150) default NULL,
  `amount` varchar(45) default NULL,
  `vehicle_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`vehicle_maint_id`),
  KEY `FK_vehicle_maint_1` (`vehicle_id`),
  CONSTRAINT `FK_vehicle_maint_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`vehicle_maint`
--

/*!40000 ALTER TABLE `vehicle_maint` DISABLE KEYS */;
INSERT INTO `vehicle_maint` (`vehicle_maint_id`,`dos`,`descr`,`amount`,`vehicle_id`) VALUES 
 (1,'22/01/2011','Tyre Change','2345',1),
 (2,'15/04/2011','FULL MAINDANACE EXPANCE ','5000',1),
 (3,'15/04/2011','FULL MAINDANACE EXPANCE ','5500',1);
/*!40000 ALTER TABLE `vehicle_maint` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`vehicle_master`
--

DROP TABLE IF EXISTS `vehicle_master`;
CREATE TABLE `vehicle_master` (
  `vehicle_id` int(10) unsigned NOT NULL auto_increment,
  `reg_no` varchar(100) NOT NULL,
  `reg_name` varchar(145) NOT NULL,
  `reg_date` varchar(45) default NULL,
  `make` varchar(100) default NULL,
  `model` varchar(45) default NULL,
  `color` varchar(45) default NULL,
  `engine_type` varchar(100) default NULL,
  `engine_no` varchar(45) default NULL,
  `insured_date` varchar(45) default NULL,
  `renewal_date` varchar(45) default NULL,
  `total_seats` varchar(45) default NULL,
  PRIMARY KEY  (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`vehicle_master`
--

/*!40000 ALTER TABLE `vehicle_master` DISABLE KEYS */;
INSERT INTO `vehicle_master` (`vehicle_id`,`reg_no`,`reg_name`,`reg_date`,`make`,`model`,`color`,`engine_type`,`engine_no`,`insured_date`,`renewal_date`,`total_seats`) VALUES 
 (1,'SNO123342344','BUS1','01/01/2000','Test','Test','Black','Test','2342342','01/01/2000','01/01/2000','55'),
 (2,'973799','FDALJH','09/02/1986','Indian','2011','BlACK','sMOTH','24244','01/06/2011','01/05/2012','75'),
 (3,'7575','hfdjg','09/02/1986','Indian','2011','BlACK','sMOTH','86446','01/06/2011','01/05/2012','80'),
 (4,'012093','dasjlhgvhadg','09/09/2011','Indian','2010','RED','Good','02893','04/06/2011','09/05/2012','80');
/*!40000 ALTER TABLE `vehicle_master` ENABLE KEYS */;


--
-- Table structure for table `cubepro`.`visitor`
--

DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `visitor_id` int(10) unsigned NOT NULL auto_increment,
  `visitor_name` varchar(45) default NULL,
  `relation` varchar(45) default NULL,
  `in_date` varchar(45) default NULL,
  `in_time` varchar(45) default NULL,
  `whotosee` varchar(45) default NULL,
  `out_time` varchar(45) default NULL,
  `seetype` varchar(45) default NULL,
  `room_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cubepro`.`visitor`
--

/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` (`visitor_id`,`visitor_name`,`relation`,`in_date`,`in_time`,`whotosee`,`out_time`,`seetype`,`room_id`) VALUES 
 (1,'test','test','01012000','11:00','KUMAR','11:30','Staff',1),
 (2,'PANDIAN','BROTHER','06//202011','10:00','VINOTH','11:00','Student',2);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
