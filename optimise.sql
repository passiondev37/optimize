-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: ivogelov.com    Database: solver
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.9-MariaDB

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
-- Current Database: `solver`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `solver` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `solver`;

--
-- Table structure for table `mm_campaign`
--

DROP TABLE IF EXISTS `mm_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_campaign` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `kind` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=ROI, 2=CPA',
  `upload_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Grouping several files from a single upload',
  `created` datetime DEFAULT NULL,
  `unpaid` tinyint(3) unsigned DEFAULT NULL COMMENT '<>0, if over the limit of 10 free campaigns',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `upload_id` (`upload_id`) USING BTREE,
  CONSTRAINT `mm_campaign_fk1` FOREIGN KEY (`user_id`) REFERENCES `mm_user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mm_campaign_fk3` FOREIGN KEY (`upload_id`) REFERENCES `mm_upload` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4168 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_campaign`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`wordpress_user`@`localhost`*/ /*!50003 TRIGGER `mm_campaign_b_ins_tr1` BEFORE INSERT ON `mm_campaign`
  FOR EACH ROW
BEGIN
DECLARE title VARCHAR(255);
	IF EXISTS(SELECT 1 FROM mm_campaign AS cmp WHERE cmp.campaign = NEW.campaign) THEN
  	SELECT CONCAT(NEW.campaign," (",AUTO_INCREMENT,")") INTO title FROM information_schema.tables WHERE table_name = 'mm_campaign' AND table_schema = DATABASE( );
    SET NEW.campaign := title;
  END IF;
  SET NEW.created := current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mm_country`
--

DROP TABLE IF EXISTS `mm_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_country` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `mm_country` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ID` (`id`) USING BTREE,
  UNIQUE KEY `COUNTRY_ID` (`mm_country`) USING BTREE,
  KEY `ID_2` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_country`
--

LOCK TABLES `mm_country` WRITE;
/*!40000 ALTER TABLE `mm_country` DISABLE KEYS */;
INSERT INTO `mm_country` VALUES (1,'AFGHANISTAN'),(2,'ALBANIA'),(3,'ALGERIA'),(4,'AMERICAN SAMOA'),(5,'ANDORRA'),(6,'ANGOLA'),(7,'ANGUILLA'),(8,'ANTARCTICA'),(9,'ANTIGUA AND BARBUDA'),(10,'ARGENTINA'),(11,'ARMENIA'),(12,'ARUBA'),(13,'AUSTRALIA'),(14,'AUSTRIA'),(15,'AZERBAIJAN'),(16,'BAHAMAS'),(17,'BAHRAIN'),(18,'BANGLADESH'),(19,'BARBADOS'),(20,'BELARUS'),(21,'BELGIUM'),(22,'BELIZE'),(23,'BENIN'),(24,'BERMUDA'),(25,'BHUTAN'),(26,'BOLIVIA'),(27,'BOSNIA AND HERZEGOWINA'),(28,'BOTSWANA'),(29,'BOUVET ISLAND'),(30,'BRAZIL'),(31,'BRITISH INDIAN OCEAN TERRITORY'),(32,'BRUNEI DARUSSALAM'),(33,'BULGARIA'),(34,'BURKINA FASO'),(35,'BURUNDI'),(36,'CAMBODIA'),(37,'CAMEROON'),(38,'CANADA'),(39,'CAPE VERDE'),(40,'CAYMAN ISLANDS'),(41,'CENTRAL AFRICAN REPUBLIC'),(42,'CHAD'),(43,'CHILE'),(44,'CHINA'),(45,'CHRISTMAS ISLAND'),(46,'COCOS (KEELING) ISLANDS'),(47,'COLOMBIA'),(48,'COMOROS'),(49,'CONGO'),(50,'CONGO, THE DEMOCRATIC REPUBLIC OF THE'),(51,'COOK ISLANDS'),(52,'COSTA RICA'),(53,'COTE D`IVOIRE'),(54,'CROATIA (local name: Hrvatska)'),(55,'CUBA'),(56,'CYPRUS'),(57,'CZECH REPUBLIC'),(58,'DENMARK'),(59,'DJIBOUTI'),(60,'DOMINICA'),(61,'DOMINICAN REPUBLIC'),(62,'EAST TIMOR'),(63,'ECUADOR'),(64,'EGYPT'),(65,'EL SALVADOR'),(66,'EQUATORIAL GUINEA'),(67,'ERITREA'),(68,'ESTONIA'),(69,'ETHIOPIA'),(70,'FALKLAND ISLANDS (MALVINAS)'),(71,'FAROE ISLANDS'),(72,'FIJI'),(73,'FINLAND'),(74,'FRANCE'),(75,'FRANCE, METROPOLITAN'),(76,'FRENCH GUIANA'),(77,'FRENCH POLYNESIA'),(78,'FRENCH SOUTHERN TERRITORIES'),(79,'GABON'),(80,'GAMBIA'),(81,'GEORGIA'),(82,'GERMANY'),(83,'GHANA'),(84,'GIBRALTAR'),(85,'GREECE'),(86,'GREENLAND'),(87,'GRENADA'),(88,'GUADELOUPE'),(89,'GUAM'),(90,'GUATEMALA'),(91,'GUINEA'),(92,'GUINEA-BISSAU'),(93,'GUYANA'),(94,'HAITI'),(95,'HEARD AND MC DONALD ISLANDS'),(96,'HOLY SEE (VATICAN CITY STATE)'),(97,'HONDURAS'),(98,'HONG KONG'),(99,'HUNGARY'),(100,'ICELAND'),(101,'INDIA'),(102,'INDONESIA'),(103,'IRAN (ISLAMIC REPUBLIC OF)'),(104,'IRAQ'),(105,'IRELAND'),(106,'ISRAEL'),(107,'ITALY'),(108,'JAMAICA'),(109,'JAPAN'),(242,'JERSEY'),(110,'JORDAN'),(111,'KAZAKHSTAN'),(112,'KENYA'),(113,'KIRIBATI'),(114,'KOREA, DEMOCRATIC PEOPLE`S REPUBLIC OF'),(115,'KOREA, REPUBLIC OF'),(116,'KUWAIT'),(117,'KYRGYZSTAN'),(118,'LAO PEOPLE`S DEMOCRATIC REPUBLIC'),(119,'LATVIA'),(120,'LEBANON'),(121,'LESOTHO'),(122,'LIBERIA'),(123,'LIBYAN ARAB JAMAHIRIYA'),(124,'LIECHTENSTEIN'),(125,'LITHUANIA'),(126,'LUXEMBOURG'),(127,'MACAU'),(128,'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF'),(129,'MADAGASCAR'),(130,'MALAWI'),(131,'MALAYSIA'),(132,'MALDIVES'),(133,'MALI'),(134,'MALTA'),(135,'MARSHALL ISLANDS'),(136,'MARTINIQUE'),(137,'MAURITANIA'),(138,'MAURITIUS'),(139,'MAYOTTE'),(140,'MEXICO'),(141,'MICRONESIA, FEDERATED STATES OF'),(142,'MOLDOVA, REPUBLIC OF'),(143,'MONACO'),(144,'MONGOLIA'),(241,'MONTENEGRO'),(145,'MONTSERRAT'),(146,'MOROCCO'),(147,'MOZAMBIQUE'),(148,'MYANMAR'),(149,'NAMIBIA'),(150,'NAURU'),(151,'NEPAL'),(152,'NETHERLANDS'),(153,'NETHERLANDS ANTILLES'),(154,'NEW CALEDONIA'),(155,'NEW ZEALAND'),(156,'NICARAGUA'),(157,'NIGER'),(158,'NIGERIA'),(159,'NIUE'),(160,'NORFOLK ISLAND'),(161,'NORTHERN MARIANA ISLANDS'),(162,'NORWAY'),(163,'OMAN'),(164,'PAKISTAN'),(165,'PALAU'),(166,'PALESTINIAN TERRITORY, OCCUPIED'),(167,'PANAMA'),(168,'PAPUA NEW GUINEA'),(169,'PARAGUAY'),(170,'PERU'),(171,'PHILIPPINES'),(172,'PITCAIRN'),(173,'POLAND'),(174,'PORTUGAL'),(175,'PUERTO RICO'),(176,'QATAR'),(177,'REUNION'),(178,'ROMANIA'),(179,'RUSSIAN FEDERATION'),(180,'RWANDA'),(181,'SAINT KITTS AND NEVIS'),(182,'SAINT LUCIA'),(183,'SAINT VINCENT AND THE GRENADINES'),(184,'SAMOA'),(185,'SAN MARINO'),(186,'SAO TOME AND PRINCIPE'),(187,'SAUDI ARABIA'),(188,'SENEGAL'),(238,'SERBIA'),(189,'SEYCHELLES'),(190,'SIERRA LEONE'),(191,'SINGAPORE'),(192,'SLOVAKIA (Slovak Republic)'),(193,'SLOVENIA'),(194,'SOLOMON ISLANDS'),(195,'SOMALIA'),(196,'SOUTH AFRICA'),(197,'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS'),(198,'SPAIN'),(199,'SRI LANKA'),(200,'ST. HELENA'),(201,'ST. PIERRE AND MIQUELON'),(202,'SUDAN'),(203,'SURINAME'),(204,'SVALBARD AND JAN MAYEN ISLANDS'),(205,'SWAZILAND'),(206,'SWEDEN'),(207,'SWITZERLAND'),(208,'SYRIAN ARAB REPUBLIC'),(209,'TAIWAN, PROVINCE OF CHINA'),(210,'TAJIKISTAN'),(211,'TANZANIA, UNITED REPUBLIC OF'),(212,'THAILAND'),(213,'TOGO'),(214,'TOKELAU'),(215,'TONGA'),(216,'TRINIDAD AND TOBAGO'),(217,'TUNISIA'),(218,'TURKEY'),(219,'TURKMENISTAN'),(220,'TURKS AND CAICOS ISLANDS'),(221,'TUVALU'),(222,'UGANDA'),(223,'UKRAINE'),(224,'UNITED ARAB EMIRATES'),(225,'UNITED KINGDOM'),(226,'UNITED STATES'),(227,'UNITED STATES MINOR OUTLYING ISLANDS'),(228,'URUGUAY'),(229,'UZBEKISTAN'),(230,'VANUATU'),(231,'VENEZUELA'),(232,'VIET NAM'),(233,'VIRGIN ISLANDS (BRITISH)'),(234,'VIRGIN ISLANDS (U.S.)'),(235,'WALLIS AND FUTUNA ISLANDS'),(236,'WESTERN SAHARA'),(237,'YEMEN'),(239,'ZAMBIA'),(240,'ZIMBABWE');
/*!40000 ALTER TABLE `mm_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_data`
--

DROP TABLE IF EXISTS `mm_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_data` (
  `campaign_id` bigint(20) unsigned NOT NULL,
  `datum` date NOT NULL,
  `cost` double unsigned NOT NULL,
  `revenue` double NOT NULL,
  PRIMARY KEY (`campaign_id`,`datum`) USING BTREE,
  KEY `campaign_id` (`campaign_id`) USING BTREE,
  CONSTRAINT `mm_data_fk1` FOREIGN KEY (`campaign_id`) REFERENCES `mm_campaign` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_data`
--

--
-- Table structure for table `mm_event`
--

DROP TABLE IF EXISTS `mm_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_event` (
  `id` tinyint(4) unsigned NOT NULL,
  `mm_event` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_event`
--

LOCK TABLES `mm_event` WRITE;
/*!40000 ALTER TABLE `mm_event` DISABLE KEYS */;
INSERT INTO `mm_event` VALUES (1,'Wrong password'),(2,'Login to disabled account'),(3,'Login to unconfirmed account'),(4,'Normal login'),(5,'Account confirmation'),(6,'Resend confirmation link'),(7,'Sent link for password reset'),(8,'Password was reset'),(9,'Account data changed'),(10,'Delete campaign'),(11,'Replace data for existing campaign'),(12,'Update data for existing campaign'),(13,'Append new data to existing campaign'),(14,'Import data to new campaign');
/*!40000 ALTER TABLE `mm_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_industry`
--

DROP TABLE IF EXISTS `mm_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_industry` (
  `id` smallint(6) unsigned NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_industry`
--

LOCK TABLES `mm_industry` WRITE;
/*!40000 ALTER TABLE `mm_industry` DISABLE KEYS */;
INSERT INTO `mm_industry` VALUES (1,'Defense & Space'),(3,'Computer Hardware'),(4,'Computer Software'),(5,'Computer Networking'),(6,'Internet'),(7,'Semiconductors'),(8,'Telecommunications'),(9,'Law Practice'),(10,'Legal Services'),(11,'Management Consulting'),(12,'Biotechnology'),(13,'Medical Practice'),(14,'Hospital & Health Care'),(15,'Pharmaceuticals'),(16,'Veterinary'),(17,'Medical Devices'),(18,'Cosmetics'),(19,'Apparel & Fashion'),(20,'Sporting Goods'),(21,'Tobacco'),(22,'Supermarkets'),(23,'Food Production'),(24,'Consumer Electronics'),(25,'Consumer Goods'),(26,'Furniture'),(27,'Retail'),(28,'Entertainment'),(29,'Gambling & Casinos'),(30,'Leisure, Travel & Tourism'),(31,'Hospitality'),(32,'Restaurants'),(33,'Sports'),(34,'Food & Beverages'),(35,'Motion Pictures and Film'),(36,'Broadcast Media'),(37,'Museums and Institutions'),(38,'Fine Art'),(39,'Performing Arts'),(40,'Recreational Facilities and Services'),(41,'Banking'),(42,'Insurance'),(43,'Financial Services'),(44,'Real Estate'),(45,'Investment Banking'),(46,'Investment Management'),(47,'Accounting'),(48,'Construction'),(49,'Building Materials'),(50,'Architecture & Planning'),(51,'Civil Engineering'),(52,'Aviation & Aerospace'),(53,'Automotive'),(54,'Chemicals'),(55,'Machinery'),(56,'Mining & Metals'),(57,'Oil & Energy'),(58,'Shipbuilding'),(59,'Utilities'),(60,'Textiles'),(61,'Paper & Forest Products'),(62,'Railroad Manufacture'),(63,'Farming'),(64,'Ranching'),(65,'Dairy'),(66,'Fishery'),(67,'Primary/Secondary Education'),(68,'Higher Education'),(69,'Education Management'),(70,'Research'),(71,'Military'),(72,'Legislative Office'),(73,'Judiciary'),(74,'International Affairs'),(75,'Government Administration'),(76,'Executive Office'),(77,'Law Enforcement'),(78,'Public Safety'),(79,'Public Policy'),(80,'Marketing and Advertising'),(81,'Newspapers'),(82,'Publishing'),(83,'Printing'),(84,'Information Services'),(85,'Libraries'),(86,'Environmental Services'),(87,'Package/Freight Delivery'),(88,'Individual & Family Services'),(89,'Religious Institutions'),(90,'Civic & Social Organization'),(91,'Consumer Services'),(92,'Transportation/Trucking/Railroad'),(93,'Warehousing'),(94,'Airlines/Aviation'),(95,'Maritime'),(96,'Information Technology and Services'),(97,'Market Research'),(98,'Public Relations and Communications'),(99,'Design'),(100,'Non-Profit Organization Management'),(101,'Fund-Raising'),(102,'Program Development'),(103,'Writing and Editing'),(104,'Staffing and Recruiting'),(105,'Professional Training & Coaching'),(106,'Venture Capital & Private Equity'),(107,'Political Organization'),(108,'Translation and Localization'),(109,'Computer Games'),(110,'Events Services'),(111,'Arts and Crafts'),(112,'Electrical/Electronic Manufacturing'),(113,'Online Media'),(114,'Nanotechnology'),(115,'Music'),(116,'Logistics and Supply Chain'),(117,'Plastics'),(118,'Computer & Network Security'),(119,'Wireless'),(120,'Alternative Dispute Resolution'),(121,'Security and Investigations'),(122,'Facilities Services'),(123,'Outsourcing/Offshoring'),(124,'Health, Wellness and Fitness'),(125,'Alternative Medicine'),(126,'Media Production'),(127,'Animation'),(128,'Commercial Real Estate'),(129,'Capital Markets'),(130,'Think Tanks'),(131,'Philanthropy'),(132,'E-Learning'),(133,'Wholesale'),(134,'Import and Export'),(135,'Mechanical or Industrial Engineering'),(136,'Photography'),(137,'Human Resources'),(138,'Business Supplies and Equipment'),(139,'Mental Health Care'),(140,'Graphic Design'),(141,'International Trade and Development'),(142,'Wine and Spirits'),(143,'Luxury Goods & Jewelry'),(144,'Renewables & Environment'),(145,'Glass, Ceramics & Concrete'),(146,'Packaging and Containers'),(147,'Industrial Automation'),(148,'Government Relations');
/*!40000 ALTER TABLE `mm_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_log`
--

DROP TABLE IF EXISTS `mm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_log` (
  `user_id` int(11) unsigned NOT NULL,
  `stamp` datetime NOT NULL,
  `event_id` tinyint(4) unsigned NOT NULL,
  `ip` int(11) unsigned NOT NULL,
  `event_data` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`stamp`,`event_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `mm_log_fk_event` FOREIGN KEY (`event_id`) REFERENCES `mm_event` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mm_login_fk_user` FOREIGN KEY (`user_id`) REFERENCES `mm_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_log`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mm_log_b_ins_tr1` BEFORE INSERT ON `mm_log`
  FOR EACH ROW
BEGIN
	SET NEW.stamp := current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mm_paypal_plan`
--

DROP TABLE IF EXISTS `mm_paypal_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_paypal_plan` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_paypal_plan`
--

--
-- Table structure for table `mm_upload`
--

DROP TABLE IF EXISTS `mm_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_upload` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `upload` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_uniq` (`upload`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_upload`
--


--
-- Table structure for table `mm_user`
--

DROP TABLE IF EXISTS `mm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT 'Can login',
  `confirmed` varchar(100) DEFAULT NULL COMMENT 'Random text used for e-mail confirmation link',
  `reset_hash` varchar(50) DEFAULT NULL COMMENT 'Random text used for expiring the password reset link',
  `created` datetime DEFAULT NULL,
  `industry_id` smallint(5) unsigned DEFAULT NULL,
  `permit_aggregate` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT 'User allows us to use their data in aggregated industry reports',
  `agreement_id` varchar(40) DEFAULT NULL,
  `subscribe_on` datetime DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mm_user_idx` (`user_name`),
  KEY `industry_id` (`industry_id`),
  KEY `mm_user_paypal_idx` (`agreement_id`),
  CONSTRAINT `mm_user_industry_fk` FOREIGN KEY (`industry_id`) REFERENCES `mm_industry` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_user`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mm_user_b_ins_tr1` BEFORE INSERT ON `mm_user`
  FOR EACH ROW
BEGIN
	SET NEW.created := current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'solver'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-31 10:17:26
