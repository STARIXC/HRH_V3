-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: hrh
-- ------------------------------------------------------
-- Server version	5.7.38-log

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_description` varchar(45) DEFAULT NULL,
  `activity_cadre_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_carder_type` int(11) DEFAULT NULL,
  `activity_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cadre_category`
--

DROP TABLE IF EXISTS `cadre_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadre_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cadre_category_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cadre_positions`
--

DROP TABLE IF EXISTS `cadre_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadre_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carder_category_id` int(11) DEFAULT NULL,
  `standardized_cadre_id` int(11) DEFAULT NULL,
  `position_title` text,
  `cadre_type_id` int(11) DEFAULT NULL,
  `basic_pay` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cadre_category_id_idx` (`carder_category_id`),
  KEY `standardized_cadre_id_idx` (`standardized_cadre_id`),
  KEY `cadre_type_id_idx` (`cadre_type_id`),
  CONSTRAINT `cadre_category_id` FOREIGN KEY (`carder_category_id`) REFERENCES `cadre_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cadre_type_id` FOREIGN KEY (`cadre_type_id`) REFERENCES `cadre_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `standardized_cadre_id` FOREIGN KEY (`standardized_cadre_id`) REFERENCES `standardized_cadre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cadre_type`
--

DROP TABLE IF EXISTS `cadre_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadre_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cadre_type_name` varchar(45) DEFAULT NULL,
  `hrs_per_week` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_table`
--

DROP TABLE IF EXISTS `calendar_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_table` (
  `dt` date NOT NULL,
  `y` smallint(6) DEFAULT NULL,
  `q` tinyint(4) DEFAULT NULL,
  `m` tinyint(4) DEFAULT NULL,
  `d` tinyint(4) DEFAULT NULL,
  `dw` tinyint(4) DEFAULT NULL,
  `monthName` varchar(9) DEFAULT NULL,
  `dayName` varchar(9) DEFAULT NULL,
  `w` tinyint(4) DEFAULT NULL,
  `isWeekday` binary(1) DEFAULT NULL,
  `isHoliday` binary(1) DEFAULT NULL,
  `holidayDescr` varchar(32) DEFAULT NULL,
  `isPayday` binary(1) DEFAULT NULL,
  `workingHours` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carder_category`
--

DROP TABLE IF EXISTS `carder_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carder_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carder_type`
--

DROP TABLE IF EXISTS `carder_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carder_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `county` (
  `countyID` int(1) DEFAULT NULL,
  `county` varchar(8) DEFAULT NULL,
  `regionID` int(1) DEFAULT NULL,
  `burden_cartegory` varchar(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) DEFAULT NULL,
  `dept_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `districtID` int(3) NOT NULL,
  `countyID` int(1) DEFAULT NULL,
  `districtNom` varchar(16) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`districtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `earn_leave_tbl`
--

DROP TABLE IF EXISTS `earn_leave_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earn_leave_tbl` (
  `earn_leave_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `for_month` int(11) DEFAULT NULL,
  `day_of_earn_leave` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`earn_leave_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_bio`
--

DROP TABLE IF EXISTS `emp_bio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_bio` (
  `id` varchar(100) NOT NULL,
  `emp_no` varchar(45) DEFAULT '0000',
  `first_name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `other_name` varchar(45) DEFAULT NULL,
  `national_id` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `disability` int(1) DEFAULT '0',
  `disability_explain` varchar(1000) DEFAULT NULL,
  `kra_pin` varchar(45) DEFAULT NULL,
  `nssf_no` varchar(45) DEFAULT NULL,
  `nhif_no` varchar(45) DEFAULT NULL,
  `cert_good_conduct_no` varchar(45) DEFAULT NULL,
  `helb_clearance_no` varchar(45) DEFAULT NULL,
  `helb_benefitiary` varchar(45) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `account_name` varchar(45) DEFAULT NULL,
  `acount_number` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `national_id_UNIQUE` (`national_id`),
  UNIQUE KEY `emp_no_UNIQUE` (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `acount_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `cert_good_conduct_no` varchar(255) DEFAULT NULL,
  `disability` int(11) NOT NULL,
  `disability_explain` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emp_no` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `helb_benefitiary` varchar(255) DEFAULT NULL,
  `helb_clearance_no` varchar(255) DEFAULT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `kra_pin` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `national_id` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `nhif_no` varchar(255) DEFAULT NULL,
  `nssf_no` varchar(255) DEFAULT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_hist`
--

DROP TABLE IF EXISTS `employee_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_hist` (
  `emprecordid` varchar(50) NOT NULL,
  `emp_no` varchar(10) DEFAULT '0000',
  `nationalid` varchar(20) DEFAULT NULL,
  `mfl` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL,
  `financial_year` varchar(45) DEFAULT NULL,
  `months_worked` int(11) DEFAULT NULL,
  `current_contract` date DEFAULT NULL,
  `contract_period` int(11) DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `expected_months` int(11) DEFAULT NULL,
  `active` enum('1','0') DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`emprecordid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_history`
--

DROP TABLE IF EXISTS `employee_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL,
  `contract_end_date` date DEFAULT NULL,
  `contract_period` int(11) NOT NULL,
  `current_contract` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `expected_months` int(11) NOT NULL,
  `financial_year` varchar(255) DEFAULT NULL,
  `months_worked` int(11) NOT NULL,
  `positionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKst72w3f8jt465a1tvcglqjrlh` (`positionid`),
  CONSTRAINT `FKst72w3f8jt465a1tvcglqjrlh` FOREIGN KEY (`positionid`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_year`
--

DROP TABLE IF EXISTS `financial_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_no_months` varchar(255) DEFAULT NULL,
  `contract_period` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `no_of_days` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `no_of_days` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ints`
--

DROP TABLE IF EXISTS `ints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ints` (
  `i` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_earn_rule`
--

DROP TABLE IF EXISTS `leave_earn_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_earn_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_earn_leave` varchar(255) DEFAULT NULL,
  `for_month` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_planner`
--

DROP TABLE IF EXISTS `leave_planner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_planner` (
  `planner_id` int(11) DEFAULT NULL,
  `emp_no` int(11) DEFAULT NULL,
  `financial_year` int(11) DEFAULT NULL,
  `annual_leave_available` int(11) DEFAULT NULL,
  `mat_leave_available` int(11) DEFAULT NULL,
  `sick_leave_available` int(11) DEFAULT NULL,
  `taken_annual_leave_days` int(11) DEFAULT NULL,
  `taken_mat_days` int(11) DEFAULT NULL,
  `taken_sick_days` int(11) DEFAULT NULL,
  `balance_annual_leave_days` int(11) DEFAULT NULL,
  `balance_mat_days` int(11) DEFAULT NULL,
  `balance_sick_leave_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `is_admin` int(1) DEFAULT '0',
  `profile_path` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_pay` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `position_title` varchar(255) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsfppir0rxoelwa7hswubs8ehw` (`category_id`),
  KEY `FK9qacqbeva1b6j3aunkqug4sju` (`type_id`),
  KEY `FKjm5f9d45mxf0ynoouho83e21d` (`standard_id`),
  CONSTRAINT `FK9qacqbeva1b6j3aunkqug4sju` FOREIGN KEY (`type_id`) REFERENCES `carder_type` (`id`),
  CONSTRAINT `FKjm5f9d45mxf0ynoouho83e21d` FOREIGN KEY (`standard_id`) REFERENCES `standard_carder` (`id`),
  CONSTRAINT `FKsfppir0rxoelwa7hswubs8ehw` FOREIGN KEY (`category_id`) REFERENCES `carder_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `standard_carder`
--

DROP TABLE IF EXISTS `standard_carder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standard_carder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `standard_name` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4molclvqiend0rffhnb7hl8nj` (`category_id`),
  KEY `FKbv702230s5lhf2yqgh12swc6y` (`type_id`),
  CONSTRAINT `FK4molclvqiend0rffhnb7hl8nj` FOREIGN KEY (`category_id`) REFERENCES `carder_category` (`id`),
  CONSTRAINT `FKbv702230s5lhf2yqgh12swc6y` FOREIGN KEY (`type_id`) REFERENCES `carder_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `standardized_cadre`
--

DROP TABLE IF EXISTS `standardized_cadre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standardized_cadre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carder_category_id` int(11) DEFAULT NULL,
  `standardized_cadre_name` text,
  `emp_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `standardized_category_cadre_idx` (`carder_category_id`),
  CONSTRAINT `carder_category_id` FOREIGN KEY (`carder_category_id`) REFERENCES `cadre_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  `staus_description` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statutory_details`
--

DROP TABLE IF EXISTS `statutory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statutory_details` (
  `employee_no` varchar(45) NOT NULL,
  `kra_pin` varchar(45) DEFAULT NULL,
  `nssf_no` varchar(45) DEFAULT NULL,
  `nhif_no` varchar(45) DEFAULT NULL,
  `cert_good_conduct_no` varchar(45) DEFAULT NULL,
  `helb_clearance_no` varchar(45) DEFAULT NULL,
  `helb_benefitiary` int(1) DEFAULT '0',
  PRIMARY KEY (`employee_no`),
  CONSTRAINT `employee_no` FOREIGN KEY (`employee_no`) REFERENCES `emp_bio` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subpartnera`
--

DROP TABLE IF EXISTS `subpartnera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subpartnera` (
  `SubPartnerID` int(11) NOT NULL,
  `SubPartnerNom` varchar(255) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `CentreSanteId` int(11) DEFAULT NULL,
  `SP_ID` int(11) DEFAULT NULL,
  `HTC` int(11) DEFAULT NULL,
  `FP` int(11) DEFAULT NULL,
  `PMTCT` int(11) DEFAULT NULL,
  `EID` int(11) DEFAULT NULL,
  `ART` int(11) DEFAULT NULL,
  `VMMC` int(11) DEFAULT NULL,
  `Nutrition` int(11) DEFAULT NULL,
  `GSN` int(11) DEFAULT NULL,
  `Lab` int(11) DEFAULT NULL,
  `FP_Integration` int(11) DEFAULT NULL,
  `Care_DSD` int(11) DEFAULT NULL,
  `ART_DSD` int(11) DEFAULT NULL,
  `Maternity` int(11) DEFAULT NULL,
  `ART_Support` varchar(255) DEFAULT NULL,
  `PMTCT_Support` varchar(255) DEFAULT NULL,
  `HTC_Support1` varchar(255) DEFAULT NULL,
  `KMMP` int(11) DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `PEP` int(11) DEFAULT NULL,
  `prep` int(11) DEFAULT NULL,
  `Blood_Safety` int(11) DEFAULT NULL,
  `TB` int(11) DEFAULT NULL,
  `Burdencat` text,
  `Owner` text,
  `Type` text,
  `tibu_name` text,
  `ART_highvolume` int(11) DEFAULT NULL,
  `HTC_highvolume` int(11) DEFAULT NULL,
  `PMTCT_highvolume` int(11) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `constituency` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `ART_Outreach` varchar(45) DEFAULT '0',
  `IPD` int(11) DEFAULT NULL,
  `all_highvolume` int(11) DEFAULT NULL,
  `PNS` int(11) DEFAULT NULL,
  `Link_desks` int(11) DEFAULT NULL,
  `Male_clinics` int(11) DEFAULT NULL,
  `Adolescent_clinics` int(11) DEFAULT NULL,
  `Viremia_clinics` int(11) DEFAULT NULL,
  `EMR_Sites` int(11) DEFAULT NULL,
  `Supportlevel_HTS` varchar(45) DEFAULT NULL,
  `Supportlevel_ART` varchar(45) DEFAULT NULL,
  `SurgeSite` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `updatetimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sto` varchar(45) DEFAULT NULL,
  `datimward` varchar(255) DEFAULT NULL,
  `datimid` varchar(255) DEFAULT NULL,
  `datimname` varchar(255) DEFAULT NULL,
  `vl_report_source` varchar(45) DEFAULT 'vl_website',
  `khisid` varchar(255) DEFAULT NULL,
  `khisname` varchar(255) DEFAULT NULL,
  `ART_Categorization` varchar(45) DEFAULT NULL,
  `old_SurgeSite` varchar(45) DEFAULT NULL,
  `FPT` int(11) DEFAULT '0',
  `datim_userid` varchar(255) DEFAULT NULL,
  `JMW` varchar(45) DEFAULT '0',
  `stockv` varchar(45) DEFAULT '0',
  `id` int(11) NOT NULL,
  PRIMARY KEY (`SubPartnerID`),
  KEY `mflcode` (`CentreSanteId`),
  KEY `district` (`DistrictID`),
  KEY `htc` (`HTC`),
  KEY `pmtct` (`PMTCT`),
  KEY `art` (`ART`),
  KEY `pmtctsupport` (`PMTCT_Support`),
  KEY `htcsupport` (`HTC_Support1`),
  KEY `arthv` (`ART_Support`),
  KEY `pmtcthv` (`PMTCT_highvolume`),
  KEY `htcthv` (`HTC_Support1`),
  KEY `vmmc` (`VMMC`),
  KEY `gender` (`Gender`),
  KEY `activityhv` (`all_highvolume`),
  KEY `maleclinics` (`Male_clinics`),
  KEY `linkdesks` (`Link_desks`),
  KEY `adolescentclinics` (`Adolescent_clinics`),
  KEY `viremiaclinics` (`Viremia_clinics`),
  KEY `emrsites` (`EMR_Sites`),
  KEY `active` (`active`),
  KEY `facility` (`SubPartnerNom`),
  KEY `artsupport` (`ART_Support`),
  KEY `ward` (`ward`),
  KEY `constituency` (`constituency`),
  KEY `pns` (`PNS`),
  KEY `ipd` (`IPD`),
  KEY `surgesite` (`SurgeSite`),
  KEY `datimward` (`datimward`),
  KEY `datimid` (`datimid`),
  KEY `datimname` (`datimname`),
  KEY `oss` (`old_SurgeSite`),
  KEY `datimuserid` (`datim_userid`),
  KEY `jmw` (`JMW`),
  KEY `fpt` (`FPT`),
  KEY `fp` (`FP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_feature_access`
--

DROP TABLE IF EXISTS `tbl_feature_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_feature_access` (
  `access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_department` int(1) NOT NULL,
  `access_designation` int(1) NOT NULL,
  `access_employee` int(1) NOT NULL,
  `access_leave_type` int(1) NOT NULL,
  `access_leave_application` int(1) NOT NULL,
  `access_sms` int(1) NOT NULL,
  `access_users` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_financial_year`
--

DROP TABLE IF EXISTS `tbl_financial_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_financial_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `start_date` varchar(10) DEFAULT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `contract_period` varchar(45) DEFAULT '365',
  `contract_no_months` varchar(45) DEFAULT '12',
  `status` binary(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_leave_application`
--

DROP TABLE IF EXISTS `tbl_leave_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_application` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `number_days` float NOT NULL,
  `date_of_application` varchar(10) NOT NULL,
  `leave_status` varchar(1) NOT NULL COMMENT '0 for pending, 1 for approve, and 2 for rejected',
  `remarks` varchar(100) DEFAULT NULL,
  `date_of_approval` varchar(10) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `start_date` varchar(10) NOT NULL,
  `end_date` varchar(10) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_leave_days_available`
--

DROP TABLE IF EXISTS `tbl_leave_days_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_days_available` (
  `available_id` varchar(9) NOT NULL DEFAULT '',
  `employee_id` varchar(6) NOT NULL,
  `fy_id` varchar(4) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `no_days` decimal(5,2) NOT NULL,
  PRIMARY KEY (`available_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_leave_days_balance`
--

DROP TABLE IF EXISTS `tbl_leave_days_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_days_balance` (
  `balance_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(45) DEFAULT NULL,
  `leave_type_id` varchar(45) DEFAULT NULL,
  `fy_id` varchar(45) DEFAULT NULL,
  `no_days` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`balance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_leave_taken`
--

DROP TABLE IF EXISTS `tbl_leave_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_taken` (
  `taken_id` varchar(9) NOT NULL,
  `employee_id` varchar(5) DEFAULT NULL,
  `leave_type_id` int(1) DEFAULT NULL,
  `fy_id` varchar(4) DEFAULT NULL,
  `no_days` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`taken_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_leave_type`
--

DROP TABLE IF EXISTS `tbl_leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_type` (
  `leave_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_name` varchar(30) NOT NULL,
  `leave_description` varchar(100) DEFAULT NULL,
  `number_days_allowed` varchar(3) NOT NULL,
  `designation` int(3) DEFAULT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_month_hrs`
--

DROP TABLE IF EXISTS `tbl_month_hrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_month_hrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(45) DEFAULT NULL,
  `financial_year` varchar(45) DEFAULT NULL,
  `no_hrs` varchar(45) DEFAULT NULL,
  `create_at` varchar(45) DEFAULT NULL,
  `update_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_role_category`
--

DROP TABLE IF EXISTS `tbl_role_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role_category` (
  `role_cat_id` varchar(45) NOT NULL,
  `role_cat_name` varchar(45) DEFAULT NULL,
  `role_cat_desc` varchar(45) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `has_sub` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`role_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_role_permission`
--

DROP TABLE IF EXISTS `tbl_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role_permission` (
  `role_permision_id` varchar(9) NOT NULL,
  `role_category` varchar(9) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `link_name` varchar(28) NOT NULL,
  `form_link` varchar(32) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`role_permision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_termination`
--

DROP TABLE IF EXISTS `tbl_termination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_termination` (
  `t_id` varchar(50) NOT NULL DEFAULT '',
  `emp_no` varchar(50) NOT NULL DEFAULT '',
  `termination_date` varchar(50) NOT NULL DEFAULT '',
  `notice_date` varchar(50) DEFAULT '',
  `voluntary_termination` enum('1','0') NOT NULL DEFAULT '0',
  `termination_reason` text NOT NULL,
  `termination_by` varchar(45) DEFAULT NULL,
  `confirmed_by` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`t_id`),
  KEY `EMP_FK` (`emp_no`),
  CONSTRAINT `EMP_FK` FOREIGN KEY (`emp_no`) REFERENCES `emp_bio` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `userid` varchar(100) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `mname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `facility` varchar(45) DEFAULT NULL,
  `scounty` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`,`password`),
  KEY `level` (`level`),
  KEY `fname` (`fname`),
  KEY `mname` (`mname`),
  KEY `lname` (`lname`),
  KEY `mail` (`email`),
  KEY `pwd` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_user_group`
--

DROP TABLE IF EXISTS `tbl_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_group` (
  `user_group_id` int(11) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `allow_add` int(1) NOT NULL COMMENT '0=can''t access 1=can access',
  `allow_edit` int(1) NOT NULL COMMENT '0=can''t access 1=can access',
  `allow_delete` int(1) NOT NULL COMMENT '0=can''t access 1=can access',
  `allow_print` int(1) NOT NULL COMMENT '0=can''t access 1=can access',
  `allow_import` int(1) NOT NULL COMMENT '0=can''t access 1=can access',
  `allow_export` int(1) NOT NULL COMMENT '0=can''t access 1=can access'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timesheet_log_activities`
--

DROP TABLE IF EXISTS `timesheet_log_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet_log_activities` (
  `activity_log_id` varchar(50) NOT NULL DEFAULT '',
  `activity_code` int(11) DEFAULT NULL,
  `hours_worked` varchar(45) DEFAULT NULL,
  `leave_hours` varchar(45) DEFAULT NULL,
  `public_holiday` varchar(45) DEFAULT NULL,
  `extra` varchar(45) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `emp_no` varchar(11) DEFAULT NULL,
  `log_no` varchar(251) DEFAULT NULL,
  `activity_desc` text,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`activity_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timesheet_logs`
--

DROP TABLE IF EXISTS `timesheet_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet_logs` (
  `log_id` varchar(45) NOT NULL,
  `log_no` varchar(45) NOT NULL,
  `emp_no` varchar(45) DEFAULT NULL,
  `log_date` varchar(12) NOT NULL,
  `month` tinyint(4) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `hours_worked` varchar(45) DEFAULT NULL,
  `leave_hours` varchar(45) DEFAULT NULL,
  `holiday_hours` varchar(45) DEFAULT NULL,
  `extra_hours` varchar(45) DEFAULT NULL,
  `total_hours` varchar(45) DEFAULT NULL,
  `expected_hours` varchar(45) DEFAULT NULL,
  `tested` varchar(45) DEFAULT NULL,
  `pos` varchar(45) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_no_UNIQUE` (`log_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-20 12:11:56
