-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vision_travels
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `AgencyID` int NOT NULL AUTO_INCREMENT,
  `AgencyName` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `PostalCode` int DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Motto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AgencyID`),
  UNIQUE KEY `AgencyID_UNIQUE` (`AgencyID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'Vision','vision','vision','vision@gmail.com','address','description','logo',123,112288957,'Be brave');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_image`
--

DROP TABLE IF EXISTS `agency_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency_image` (
  `Agency_ID` int NOT NULL,
  `Image` varchar(255) NOT NULL,
  PRIMARY KEY (`Agency_ID`,`Image`),
  CONSTRAINT `AgencyImage` FOREIGN KEY (`Agency_ID`) REFERENCES `agency` (`AgencyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_image`
--

LOCK TABLES `agency_image` WRITE;
/*!40000 ALTER TABLE `agency_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_booked_tour`
--

DROP TABLE IF EXISTS `c_booked_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_booked_tour` (
  `CBTourID` int NOT NULL AUTO_INCREMENT,
  `NoOfAdults` int DEFAULT NULL,
  `NoOfChilds` int DEFAULT NULL,
  `BookedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AccommodationType` varchar(255) DEFAULT NULL,
  `TransportType` varchar(255) DEFAULT NULL,
  `Meal plan` varchar(255) DEFAULT NULL,
  `CTourID` int NOT NULL,
  `TouristID` int NOT NULL,
  `paymentID` int DEFAULT NULL,
  PRIMARY KEY (`CBTourID`),
  UNIQUE KEY `CTourID_UNIQUE` (`CTourID`),
  UNIQUE KEY `TouristID_UNIQUE` (`TouristID`),
  KEY `card owner 2_idx` (`paymentID`),
  CONSTRAINT `card owner 2` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`PaymentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CBTourist` FOREIGN KEY (`TouristID`) REFERENCES `tourist` (`TouristID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CTourB` FOREIGN KEY (`CTourID`) REFERENCES `customized_tour` (`CTourID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_booked_tour`
--

LOCK TABLES `c_booked_tour` WRITE;
/*!40000 ALTER TABLE `c_booked_tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_booked_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customized_tour`
--

DROP TABLE IF EXISTS `customized_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customized_tour` (
  `CTourID` int NOT NULL,
  PRIMARY KEY (`CTourID`),
  CONSTRAINT `CTour` FOREIGN KEY (`CTourID`) REFERENCES `tour` (`TourID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customized_tour`
--

LOCK TABLES `customized_tour` WRITE;
/*!40000 ALTER TABLE `customized_tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `customized_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customized_tour_packages`
--

DROP TABLE IF EXISTS `customized_tour_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customized_tour_packages` (
  `Package ID` int NOT NULL AUTO_INCREMENT,
  `Package name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `CTourID` int DEFAULT NULL,
  PRIMARY KEY (`Package ID`),
  KEY `Turssss_idx` (`CTourID`),
  CONSTRAINT `Turssss` FOREIGN KEY (`CTourID`) REFERENCES `customized_tour` (`CTourID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customized_tour_packages`
--

LOCK TABLES `customized_tour_packages` WRITE;
/*!40000 ALTER TABLE `customized_tour_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `customized_tour_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `CardNo` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Month` int NOT NULL,
  `Year` int NOT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `TouristID` int DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  UNIQUE KEY `PaymentId_UNIQUE` (`PaymentId`),
  UNIQUE KEY `CardNo_UNIQUE` (`CardNo`),
  KEY `CardOwner_idx` (`TouristID`),
  CONSTRAINT `CardOwner` FOREIGN KEY (`TouristID`) REFERENCES `tourist` (`TouristID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pp_booked_tour`
--

DROP TABLE IF EXISTS `pp_booked_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pp_booked_tour` (
  `PBTourID` int NOT NULL AUTO_INCREMENT,
  `NoOfAdult` int DEFAULT NULL,
  `NoOfChildren` int DEFAULT NULL,
  `BookedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PTourID` int DEFAULT NULL,
  `TouristID` int DEFAULT NULL,
  `paymentID` int DEFAULT NULL,
  PRIMARY KEY (`PBTourID`),
  UNIQUE KEY `TouristID_UNIQUE` (`TouristID`),
  KEY `PBTourist_idx` (`TouristID`),
  KEY `rerer_idx` (`PTourID`),
  KEY `card owner_idx` (`paymentID`),
  CONSTRAINT `card owner` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`PaymentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PBTourist` FOREIGN KEY (`TouristID`) REFERENCES `tourist` (`TouristID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rerer` FOREIGN KEY (`PTourID`) REFERENCES `pre_planned_tour` (`PPTourID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pp_booked_tour`
--

LOCK TABLES `pp_booked_tour` WRITE;
/*!40000 ALTER TABLE `pp_booked_tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_booked_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_planned_tour`
--

DROP TABLE IF EXISTS `pre_planned_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_planned_tour` (
  `PPTourID` int NOT NULL,
  `Package Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PPTourID`),
  CONSTRAINT `PPTour` FOREIGN KEY (`PPTourID`) REFERENCES `tour` (`TourID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_planned_tour`
--

LOCK TABLES `pre_planned_tour` WRITE;
/*!40000 ALTER TABLE `pre_planned_tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_planned_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `TourID` int NOT NULL AUTO_INCREMENT,
  `TourName` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `PerPersonPrice` double DEFAULT NULL,
  `MaxTravellers` int DEFAULT NULL,
  `NoOfDays` int DEFAULT NULL,
  `AvailableMonth` varchar(45) DEFAULT NULL,
  `DepartureDate` int DEFAULT NULL,
  `AgencyID` int NOT NULL,
  `TourGuideID` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TourID`),
  UNIQUE KEY `TourID_UNIQUE` (`TourID`),
  UNIQUE KEY `TourName_UNIQUE` (`TourName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Italy from north to the south','Italy','Witness the beauty of paris',200000,20,10,'July',28,1,1,'braden-collum-75XHJzEIeUc-unsplash.jpg'),(4,'Sailing Greece','Greece','Chance to meet greece gods',150000,15,6,'March',23,1,1,'ryan-spencer-XGKaRnWjv1c-unsplash.jpg'),(5,'Europian Wonder','England','Chance to meet the conquroers',225000,18,4,'November',21,1,1,'benjamin-davies-Oja2ty_9ZLM-unsplash.jpg'),(6,'Europe Jewel','Netherlands','English wilderness',250000,12,3,'August',12,1,1,'moritz-kindler-11W1Wo9iNsk-unsplash.jpg'),(7,'Britain Delight','Englnd','Time to meet the queen',250000,16,5,'Jnuary',24,1,1,'austin-tiffany-4NpFUcYMGpo-unsplash.jpg'),(8,'Irelnd Highlights','Ireland','Right through canals',180000,12,6,'March',22,1,1,'mark-lawson-iSlnuEXE7ag-unsplash.jpg');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_image`
--

DROP TABLE IF EXISTS `tour_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_image` (
  `TourID` int NOT NULL,
  `Image` varchar(255) NOT NULL,
  PRIMARY KEY (`TourID`,`Image`),
  CONSTRAINT `Tour` FOREIGN KEY (`TourID`) REFERENCES `tour` (`TourID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_image`
--

LOCK TABLES `tour_image` WRITE;
/*!40000 ALTER TABLE `tour_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourguide`
--

DROP TABLE IF EXISTS `tourguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourguide` (
  `TourGuideID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `AgencyID` int NOT NULL,
  PRIMARY KEY (`TourGuideID`),
  UNIQUE KEY `AgencyID_UNIQUE` (`AgencyID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  CONSTRAINT `EmployeedAgency` FOREIGN KEY (`AgencyID`) REFERENCES `agency` (`AgencyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourguide`
--

LOCK TABLES `tourguide` WRITE;
/*!40000 ALTER TABLE `tourguide` DISABLE KEYS */;
INSERT INTO `tourguide` VALUES (1,'Kamal',112299876,'kamal@gmail.com','male','2011-04-20','asd','dsa',1);
/*!40000 ALTER TABLE `tourguide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist`
--

DROP TABLE IF EXISTS `tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist` (
  `TouristID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `MobileNo` int DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PostalCode` int DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TouristID`),
  UNIQUE KEY `TouristID_UNIQUE` (`TouristID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist`
--

LOCK TABLES `tourist` WRITE;
/*!40000 ALTER TABLE `tourist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tourist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30  4:38:16
