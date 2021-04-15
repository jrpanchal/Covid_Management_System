-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Covid_Management_Vaccination_System
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Administrations`
--

DROP TABLE IF EXISTS `Administrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrations` (
  `recipient_id` varchar(45) NOT NULL,
  `admin_id` varchar(45) NOT NULL,
  `location_name` varchar(45) DEFAULT NULL,
  `administrator` varchar(45) DEFAULT NULL,
  `first_dose_date` date DEFAULT NULL,
  `second_dose_date` date DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  `health_report` enum('Heart Problem','Allergies','Severe Allergies','Fever','Soreness','COVID','Other','Nothing') DEFAULT NULL,
  `seq_no` int NOT NULL,
  `batch_id` varchar(45) NOT NULL,
  PRIMARY KEY (`recipient_id`,`admin_id`),
  KEY `fk_Administrations_Recipients1_idx` (`recipient_id`),
  KEY `fk_Administrations_Vaccine NCD1_idx` (`seq_no`,`batch_id`),
  CONSTRAINT `fk_Administrations_Vaccine NCD1` FOREIGN KEY (`seq_no`, `batch_id`) REFERENCES `Vaccine NCD` (`seq_no`, `batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrations`
--

LOCK TABLES `Administrations` WRITE;
/*!40000 ALTER TABLE `Administrations` DISABLE KEYS */;
INSERT INTO `Administrations` VALUES ('121A','AJ099','Tuft Medical Center','Sall','2020-12-18',NULL,NULL,'Nothing',1,'480'),('121A','LJ118','Tuft Medical Center','Julie',NULL,'2021-01-19',NULL,'Soreness',10,'190'),('123B','FJ111','Tuft Medical Center','Sall',NULL,'2020-12-18',NULL,'Nothing',5,'220'),('123B','ZJ100','Tuft Medical Center','Julie','2020-12-18',NULL,NULL,'Other',1,'220'),('310L','QJ110','Tuft Medical Center','Sall','2021-01-27',NULL,NULL,'Nothing',4,'220'),('310L','WJ120','Tuft Medical Center','Sall',NULL,'2021-01-21',NULL,'Nothing',12,'190'),('323C','BJ102','Tuft Medical Center','Julie','2020-12-18',NULL,NULL,'Nothing',2,'220'),('323C','OJ112','Tuft Medical Center','Sall',NULL,'2020-12-18',NULL,'Nothing',6,'220'),('384D','GJ113','Tuft Medical Center','Sall',NULL,'2020-12-18',NULL,'Severe Allergies',7,'220'),('384D','TJ103','Tuft Medical Center','Sall','2020-12-18',NULL,NULL,'Nothing',3,'220'),('395E','CJ104','Tuft Medical Center','Bob','2020-12-24',NULL,NULL,'Nothing',1,'190'),('395E','NJ114','Tuft Medical Center','Julie',NULL,'2020-12-24',NULL,'Soreness',6,'190'),('399I','EJ108','Tuft Medical Center','Bob','2021-01-26',NULL,NULL,'Nothing',5,'190'),('399I','XJ119','Tuft Medical Center','Sall',NULL,'2021-01-20',NULL,'Nothing',11,'190'),('572G','DJ106','Tuft Medical Center','Julie','2021-01-18',NULL,NULL,'Allergies',3,'190'),('572G','MJ116','Tuft Medical Center','Julie',NULL,'2021-01-18',NULL,'Nothing',8,'190'),('603F','HJ115','Tuft Medical Center','Julie',NULL,'2020-12-24',NULL,'Nothing',7,'190'),('603F','SJ105','Tuft Medical Center','Julie','2020-12-24',NULL,NULL,'Nothing',2,'190'),('839H','IJ117','Tuft Medical Center','Julie',NULL,'2021-01-18',NULL,'Fever',9,'190'),('839H','RJ107','Tuft Medical Center','Julie','2021-01-18',NULL,NULL,'Severe Allergies',4,'190');
/*!40000 ALTER TABLE `Administrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Batch`
--

DROP TABLE IF EXISTS `Batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Batch` (
  `batch_id` varchar(45) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `provider_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Batch`
--

LOCK TABLES `Batch` WRITE;
/*!40000 ALTER TABLE `Batch` DISABLE KEYS */;
INSERT INTO `Batch` VALUES ('190','2021-06-02','Moderna'),('220','2021-04-05','Pfizer- BioNTech'),('480','2021-08-02','AstraZeneca');
/*!40000 ALTER TABLE `Batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insurance`
--

DROP TABLE IF EXISTS `Insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insurance` (
  `recipient_id` varchar(45) NOT NULL,
  `card_number` varchar(45) NOT NULL,
  `insurance_provider` varchar(45) DEFAULT NULL,
  `accepted` enum('Yes','No') DEFAULT NULL,
  `group_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recipient_id`,`card_number`),
  KEY `fk_Insurance_Recipients_idx` (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insurance`
--

LOCK TABLES `Insurance` WRITE;
/*!40000 ALTER TABLE `Insurance` DISABLE KEYS */;
INSERT INTO `Insurance` VALUES ('123B','XXA8800100164','Health Partners','Yes','1'),('310L','NPH0000473847','My Care Family','Yes','PPO'),('323C','MTN1238792234','Mass Blue Cross','Yes','MASA'),('384D','MTN0983234560','Mass Blue Cross','Yes','MASA'),('395E','XYZ12435098234','Mass Blue Cross','Yes','MASA'),('399I','NPH0058499485','My Care Family','Yes','PPO'),('572G','MTN0000672643','Mass Blue Cross','Yes','Medicare'),('603F','NPH0000032455','My Care Family','Yes','ADV'),('839H','XXA8800628264','Health Partners','Yes','Medicare');
/*!40000 ALTER TABLE `Insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_no` varchar(45) NOT NULL,
  `quantity_approved` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `batch_id` varchar(45) NOT NULL,
  PRIMARY KEY (`order_no`,`batch_id`),
  KEY `fk_Orders_Batch1_idx` (`batch_id`),
  CONSTRAINT `fk_Orders_Batch1` FOREIGN KEY (`batch_id`) REFERENCES `Batch` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('1M',10,'2020-11-15','190'),('2P',15,'2020-12-01','220'),('3M',20,'2020-12-18','190'),('4A',50,'2020-12-30','480');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipients`
--

DROP TABLE IF EXISTS `Recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipients` (
  `recipient_id` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `ethnicity` varchar(45) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `status` enum('Vaccinated','Fully Vaccinated') DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `county` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `scheduled_appt` date DEFAULT NULL,
  `medical_history` enum('Heart Problems','Allergies','Severe Allergies','Cancer','Diabetes','None','Others') DEFAULT NULL,
  `covid_history` enum('Yes','No','NA') DEFAULT NULL,
  `deceased` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipients`
--

LOCK TABLES `Recipients` WRITE;
/*!40000 ALTER TABLE `Recipients` DISABLE KEYS */;
INSERT INTO `Recipients` VALUES ('121A','Jack','Alonso','M','1949-03-14',72,'White','6175801210','Fully Vaccinated','555 Fulton St.',NULL,'Medford','Middlesex','MA','2155',NULL,'None','No','No'),('123B','William','Hughes','M','1994-05-28',27,'White','8572349876','Fully Vaccinated','601 W Main St.',NULL,'Boston','Suffolk','MA','2472',NULL,'None','No','No'),('310L','Mary','Lane','F','1947-08-07',73,'Native American','6173890292','Vaccinated','22 Water St.',NULL,'Cambridge','Middlesex','MA','2141','2021-02-17','Diabetes','NA','No'),('323C','Sophia','Long','F','1970-06-02',51,'Black','6172344567','Fully Vaccinated','420 Pacific Ave.',NULL,'Everrett','Middlesex','MA','98201',NULL,'Others','NA','No'),('384D','Xabi','Perry','M','1979-04-03',42,'Asian','6172340987','Fully Vaccinated','1075 W. Branch',NULL,'Boston','Suffolk','MA','2129',NULL,'Heart Problems','Yes','Yes'),('395E','Madison','Carter','F','1984-01-01',37,'Native American','8575807483','Fully Vaccinated','11 Willie Ave.',NULL,'Cambridge','Middlesex','MA','2155',NULL,'Allergies','Yes','No'),('399I','Alexander','Miller','M','1945-06-19',75,'Native American','8575262637','Vaccinated','16 Everett St.',NULL,'Boston','Suffolk','MA','2128','2021-02-18','Others','Yes','No'),('572G','Mark','Black','M','1936-03-24',84,'Black','6170320248','Vaccinated','85 Whitford St.',NULL,'Cambridge','Middlesex','MA','2131','2021-02-18','Severe Allergies','Yes','No'),('603F','Jenny','Doe','F','1984-03-02',37,'Asian','6179908475','Fully Vaccinated','234 Musuem Way',NULL,'Cambridge','Middlesex','MA','2141',NULL,'Allergies','NA','No'),('839H','Josephine','Shane','F','1931-01-05',90,'White','6179375620','Vaccinated','54 Winter St.',NULL,'Quincy','Norfolk','MA','2169','2021-02-18','Heart Problems','Yes','No');
/*!40000 ALTER TABLE `Recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recipients_details_group`
--

DROP TABLE IF EXISTS `recipients_details_group`;
/*!50001 DROP VIEW IF EXISTS `recipients_details_group`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recipients_details_group` AS SELECT 
 1 AS `Recipients Count`,
 1 AS `Gender`,
 1 AS `Ethnicity`,
 1 AS `Age`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Shipments`
--

DROP TABLE IF EXISTS `Shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipments` (
  `shipment_tracking` varchar(45) NOT NULL,
  `shipping_date` date DEFAULT NULL,
  `batch_id` varchar(45) NOT NULL,
  `order_no` varchar(45) NOT NULL,
  PRIMARY KEY (`shipment_tracking`,`order_no`),
  KEY `fk_Shipments_Orders1_idx` (`order_no`,`batch_id`),
  CONSTRAINT `fk_Shipments_Orders1` FOREIGN KEY (`order_no`, `batch_id`) REFERENCES `Orders` (`order_no`, `batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipments`
--

LOCK TABLES `Shipments` WRITE;
/*!40000 ALTER TABLE `Shipments` DISABLE KEYS */;
INSERT INTO `Shipments` VALUES ('19012301US-MA','2020-11-25','190','1M'),('19015602US-MA','2020-12-28','190','3M'),('19025301US-MA','2020-01-11','480','4A'),('22001903US-MA','2020-12-11','220','2P');
/*!40000 ALTER TABLE `Shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storage`
--

DROP TABLE IF EXISTS `Storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Storage` (
  `storage_id` varchar(45) NOT NULL,
  `temperature` int NOT NULL,
  `inventory` int DEFAULT NULL,
  `doses_used` varchar(45) DEFAULT NULL,
  `shipment_tracking` varchar(45) NOT NULL,
  `order_no` varchar(45) NOT NULL,
  PRIMARY KEY (`storage_id`,`temperature`,`order_no`),
  KEY `fk_Storage_Shipments1_idx` (`shipment_tracking`,`order_no`),
  CONSTRAINT `fk_Storage_Shipments1` FOREIGN KEY (`shipment_tracking`, `order_no`) REFERENCES `Shipments` (`shipment_tracking`, `order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storage`
--

LOCK TABLES `Storage` WRITE;
/*!40000 ALTER TABLE `Storage` DISABLE KEYS */;
INSERT INTO `Storage` VALUES ('STG1',-20,1,'9','19012301US-MA','1M'),('STG1',-20,3,'17','19015602US-MA','3M'),('STG2',-70,8,'7','22001903US-MA','2P'),('STG3',4,49,'1','19025301US-MA','4A');
/*!40000 ALTER TABLE `Storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `storage_overview`
--

DROP TABLE IF EXISTS `storage_overview`;
/*!50001 DROP VIEW IF EXISTS `storage_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `storage_overview` AS SELECT 
 1 AS `Vaccine Provider Name`,
 1 AS `Doses Administrated`,
 1 AS `Doses Left`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Vaccine NCD`
--

DROP TABLE IF EXISTS `Vaccine NCD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vaccine NCD` (
  `seq_no` int NOT NULL,
  `batch_id` varchar(45) NOT NULL,
  PRIMARY KEY (`seq_no`,`batch_id`),
  KEY `fk_Vaccine NCD_Batch1_idx` (`batch_id`),
  CONSTRAINT `fk_Vaccine NCD_Batch1` FOREIGN KEY (`batch_id`) REFERENCES `Batch` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vaccine NCD`
--

LOCK TABLES `Vaccine NCD` WRITE;
/*!40000 ALTER TABLE `Vaccine NCD` DISABLE KEYS */;
INSERT INTO `Vaccine NCD` VALUES (1,'190'),(2,'190'),(3,'190'),(4,'190'),(5,'190'),(6,'190'),(7,'190'),(8,'190'),(9,'190'),(10,'190'),(11,'190'),(12,'190'),(1,'220'),(2,'220'),(3,'220'),(4,'220'),(5,'220'),(6,'220'),(7,'220'),(1,'480');
/*!40000 ALTER TABLE `Vaccine NCD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `recipients_details_group`
--

/*!50001 DROP VIEW IF EXISTS `recipients_details_group`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recipients_details_group` AS select count(1) AS `Recipients Count`,`recipients`.`sex` AS `Gender`,`recipients`.`ethnicity` AS `Ethnicity`,`recipients`.`age` AS `Age` from `recipients` where (`recipients`.`status` = 'Fully Vaccinated') group by `recipients`.`sex`,`recipients`.`ethnicity`,`recipients`.`age` order by `recipients`.`sex`,`recipients`.`ethnicity`,`recipients`.`age` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `storage_overview`
--

/*!50001 DROP VIEW IF EXISTS `storage_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `storage_overview` AS select `batch`.`provider_name` AS `Vaccine Provider Name`,`storage`.`doses_used` AS `Doses Administrated`,`storage`.`inventory` AS `Doses Left` from ((`batch` join `orders`) join `storage`) where ((`batch`.`batch_id` = `orders`.`batch_id`) and (`orders`.`order_no` = `storage`.`order_no`)) order by `storage`.`doses_used` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-31 17:43:41
