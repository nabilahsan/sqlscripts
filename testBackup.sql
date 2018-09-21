-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: testDB
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `CourseKey` char(6) NOT NULL,
  `CourseName` char(45) DEFAULT NULL,
  `CourseDescription` char(45) DEFAULT NULL,
  PRIMARY KEY (`CourseKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('ENG211','Technical Writing','Technical Writing for IT'),('ITC110','Beginning Programming','Programming using C#'),('ITC220','Introduction to Databases','Overview of databse design and topics'),('ITC226','Database Adminstration','SQL Server Adminstration'),('ITC255','System Analytics','System Analysis and design'),('MAT107','Applied Math','Applied Math for computers'),('WEB110','Beginning Web Page Design','Basic xhtml');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ethnicity`
--

DROP TABLE IF EXISTS `Ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ethnicity` (
  `EthnicityKey` char(20) NOT NULL,
  `EthnicityDescription` char(200) DEFAULT NULL,
  PRIMARY KEY (`EthnicityKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ethnicity`
--

LOCK TABLES `Ethnicity` WRITE;
/*!40000 ALTER TABLE `Ethnicity` DISABLE KEYS */;
INSERT INTO `Ethnicity` VALUES ('AfrAmer','African American or Arican Origin'),('Asian','Chinese, Japanese, Korean, Southeast Asian'),('Caucasian','White, European Origin'),('Hispanic','Mexican, Central or South American, Caribbean'),('Mideast','Arabic or Persian'),('Other','Other or Not Disclosed'),('Pacific','Pacific Islander');
/*!40000 ALTER TABLE `Ethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestNote`
--

DROP TABLE IF EXISTS `RequestNote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestNote` (
  `RequestNoteKey` datetime NOT NULL,
  `RequestID` int(11) DEFAULT NULL,
  `RequestNoteText` char(100) DEFAULT NULL,
  PRIMARY KEY (`RequestNoteKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestNote`
--

LOCK TABLES `RequestNote` WRITE;
/*!40000 ALTER TABLE `RequestNote` DISABLE KEYS */;
INSERT INTO `RequestNote` VALUES ('2010-01-06 02:00:00',1001,'Only offered once a year and not a lot of requests for this class'),('2010-01-10 10:00:00',1001,'No students available, because a capstone class would have to get someone off campus');
/*!40000 ALTER TABLE `RequestNote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requests`
--

DROP TABLE IF EXISTS `Requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requests` (
  `RequestKey` int(11) NOT NULL,
  `RequestDate` date DEFAULT NULL,
  `CourseKey` char(6) DEFAULT NULL,
  `RequestStatus` char(45) DEFAULT NULL,
  `StudentKey` int(11) DEFAULT NULL,
  PRIMARY KEY (`RequestKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requests`
--

LOCK TABLES `Requests` WRITE;
/*!40000 ALTER TABLE `Requests` DISABLE KEYS */;
INSERT INTO `Requests` VALUES (1001,'2010-01-05','ITC226','Active',990001010);
/*!40000 ALTER TABLE `Requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sessions` (
  `SessionDateKey` date NOT NULL,
  `SessionTimeKey` time NOT NULL,
  `TutorKey` int(11) NOT NULL,
  `CourseKey` char(6) DEFAULT NULL,
  `StudentKey` int(11) DEFAULT NULL,
  `SessionStatus` char(45) DEFAULT NULL,
  `SessionMaterialCovered` char(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessions`
--

LOCK TABLES `Sessions` WRITE;
/*!40000 ALTER TABLE `Sessions` DISABLE KEYS */;
INSERT INTO `Sessions` VALUES ('2009-10-20','14:00:00',980010001,'WEB110',990001000,'C','CSS'),('2009-10-20','13:00:00',980010001,'ITC110',990001000,'C','For next loop'),('2009-11-20','10:30:00',980010001,'ITC220',990001002,'C','Relations'),('2009-11-05','10:00:00',980010001,'ITC220',NULL,'NS',NULL),('2009-11-10','13:00:00',980010001,'MAT107',990001004,'C','Binary Numbers'),('2009-11-10','14:00:00',980010001,'WEB110',990001000,'C','Web Forms'),('2010-01-15','09:30:00',980010001,'ITC255',990001000,'C','Use cases'),('2010-01-20','11:00:00',980010001,'ENG211',990001003,'C','Document structure'),('2010-01-22','14:00:00',980010001,'MAT107',990001005,'NS',NULL),('2010-02-05','10:30:00',980010001,'ITC255',990001000,'C','Feasibility'),('2010-02-10','13:30:00',980010001,'MAT107',NULL,NULL,NULL),('2010-02-10','14:00:00',980010001,'MAT107',NULL,NULL,NULL),('2010-02-13','10:00:00',980010001,'ITC255',NULL,NULL,NULL),('2010-02-14','11:00:00',980010001,'ENG211',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentCourse`
--

DROP TABLE IF EXISTS `StudentCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentCourse` (
  `StudentKey` int(11) NOT NULL,
  `CourseKey` char(6) NOT NULL,
  `StudentCourseQuarter` char(45) DEFAULT NULL,
  PRIMARY KEY (`StudentKey`,`CourseKey`),
  KEY `CourseKey` (`CourseKey`),
  CONSTRAINT `StudentCourse_ibfk_1` FOREIGN KEY (`StudentKey`) REFERENCES `Students` (`StudentKey`),
  CONSTRAINT `StudentCourse_ibfk_2` FOREIGN KEY (`CourseKey`) REFERENCES `Course` (`CourseKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentCourse`
--

LOCK TABLES `StudentCourse` WRITE;
/*!40000 ALTER TABLE `StudentCourse` DISABLE KEYS */;
INSERT INTO `StudentCourse` VALUES (990001000,'ITC110','Fall09'),(990001000,'ITC220','Fall09'),(990001000,'ITC255','Winter10'),(990001000,'MAT107','Winter10'),(990001000,'WEB110','Fall09'),(990001002,'ENG211','Winter10'),(990001002,'ITC110','Fall09'),(990001002,'ITC220','Fall09'),(990001002,'ITC255','Winter10'),(990001003,'ITC255','Winter10'),(990001003,'MAT107','Winter10'),(990001004,'MAT107','Fall09'),(990001004,'WEB110','Fall09'),(990001005,'MAT107','Winter10'),(990001007,'ITC110','Fall09'),(990001009,'ITC110','Fall09'),(990001009,'ITC220','Fall09'),(990001009,'MAT107','Winter10'),(990001010,'ENG211','Winter10'),(990001010,'ITC255','Winter10');
/*!40000 ALTER TABLE `StudentCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `StudentKey` int(11) NOT NULL,
  `StudentFirstName` char(20) DEFAULT NULL,
  `StudentLastName` char(20) DEFAULT NULL,
  `StudentEmail` char(20) DEFAULT NULL,
  `StudentPhone` int(11) DEFAULT NULL,
  `StudentGender` char(5) DEFAULT NULL,
  `StudentAge` int(11) DEFAULT NULL,
  `StudentCitizen` char(5) DEFAULT NULL,
  `StudentWorkerRetraining` char(20) DEFAULT NULL,
  `EthnicityKey` char(20) NOT NULL,
  PRIMARY KEY (`StudentKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (990001000,'Laura','Peterson','NULL',2065559318,'F',23,'True','False','Caucasian'),(990001002,'Shanon','Carter','shanon@carter.org',2065554301,'F',32,'True','True','AfrAmer'),(990001003,'Sandy','Martinez','sandym@gmail.com',2065551158,'F',18,'True','False','Hispanic'),(990001004,'Lu','Nguyen','lstar@yahoo.com',2065552938,'M',19,'False','False','Asian'),(990001005,'Mark','Zulof','NULL',NULL,'NULL',NULL,'NULL','NULL','NULL'),(990001006,'Patty','Taylor','p147@marketplace.com',2065552076,'F',42,'True','True','Caucasian'),(990001007,'Lawrence','Thomas','NULL',NULL,'M',24,'True','False','Caucasian'),(990001008,'Ron','Bradbury','rbradbury@mars.org',2065557296,'M',53,'True','False','Caucasian'),(990001009,'Juan','Carlos','carlos23@hotmail.com',2065559134,'M',25,'False','False','Hispanic'),(990001010,'Ly','Min','lymin@hotmail.com',2065552789,'F',20,'False','False','Asian');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tutor`
--

DROP TABLE IF EXISTS `Tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tutor` (
  `TutorKey` int(11) NOT NULL,
  `TutorLastName` char(45) DEFAULT NULL,
  `TutorFirstName` char(45) DEFAULT NULL,
  `TutorPhone` int(11) DEFAULT NULL,
  `TutorEmail` char(45) DEFAULT NULL,
  `TutorHireDate` date DEFAULT NULL,
  `TutorStatus` char(45) DEFAULT NULL,
  PRIMARY KEY (`TutorKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tutor`
--

LOCK TABLES `Tutor` WRITE;
/*!40000 ALTER TABLE `Tutor` DISABLE KEYS */;
INSERT INTO `Tutor` VALUES (980010000,'Roberts','Martha',2065551467,'mroberts@yahoo.com','2010-01-06','Active'),(980010001,'Brown','Susan',2065553528,'sb4@hotmail.com','2009-02-01','Active'),(980010002,'Foster','Daniel',2065553490,'foster32@aol.com','2009-02-01','Active'),(980010003,'Anderson','Nathan',2065556320,'NULL','2009-03-02','Inactive'),(980010004,'Lewis','Ginger',2065552985,'ginger@hotmail.com','2009-03-15','Active');
/*!40000 ALTER TABLE `Tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TutorCourse`
--

DROP TABLE IF EXISTS `TutorCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TutorCourse` (
  `TutorKey` int(11) NOT NULL,
  `CourseKey` char(6) NOT NULL,
  PRIMARY KEY (`TutorKey`,`CourseKey`),
  KEY `CourseKey` (`CourseKey`),
  CONSTRAINT `TutorCourse_ibfk_1` FOREIGN KEY (`TutorKey`) REFERENCES `Tutor` (`TutorKey`),
  CONSTRAINT `TutorCourse_ibfk_2` FOREIGN KEY (`CourseKey`) REFERENCES `Course` (`CourseKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TutorCourse`
--

LOCK TABLES `TutorCourse` WRITE;
/*!40000 ALTER TABLE `TutorCourse` DISABLE KEYS */;
INSERT INTO `TutorCourse` VALUES (980010002,'ENG211'),(980010003,'ITC110'),(980010001,'ITC220'),(980010002,'ITC255'),(980010003,'MAT107'),(980010000,'WEB110'),(980010001,'WEB110');
/*!40000 ALTER TABLE `TutorCourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-21 13:10:33
