-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: mr_supermarket
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `Customer_id` char(10) NOT NULL,
  `C_contact` char(10) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `Customer_id` (`Customer_id`),
  UNIQUE KEY `C_contact` (`C_contact`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES ('C002','0987654321'),('C003','1122334455'),('C001','1234567890');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Managers`
--

DROP TABLE IF EXISTS `Managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Managers` (
  `Manager_id` char(10) NOT NULL,
  `Manager_name` char(10) NOT NULL,
  `M_contact` char(10) NOT NULL,
  PRIMARY KEY (`Manager_id`),
  UNIQUE KEY `Manager_id` (`Manager_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Managers`
--

LOCK TABLES `Managers` WRITE;
/*!40000 ALTER TABLE `Managers` DISABLE KEYS */;
INSERT INTO `Managers` VALUES ('M001','John Doe','1111111111'),('M002','Jane Smith','2222222222'),('M003','Alice Brown','3333333333');
/*!40000 ALTER TABLE `Managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `Order_id` char(10) NOT NULL,
  `Order_date` date NOT NULL,
  `Product_id` char(10) NOT NULL,
  `Quantity` decimal(10,2) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Customer_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`Order_id`),
  UNIQUE KEY `Order_id` (`Order_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `Customers` (`Customer_id`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `Products` (`Product_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('O001','2024-08-20','P001',10.00,5.00,'C001'),('O002','2024-08-21','P002',2.00,2.00,'C002'),('O003','2024-08-22','P003',1.00,1.50,'C003');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `Payment_id` char(10) NOT NULL,
  `Payment_mode` ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash') NOT NULL,
  `Payment_date` date NOT NULL,
  `Order_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`Payment_id`),
  UNIQUE KEY `Payment_id` (`Payment_id`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Order_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES ('PM001','Credit Card','2024-08-20','O001'),('PM002','Cash','2024-08-21','O002'),('PM003','Debit Card','2024-08-22','O003');
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `Product_id` char(10) NOT NULL,
  `Product_name` varchar(50) NOT NULL,
  `Product_category` varchar(50) DEFAULT NULL,
  `Unit_price` decimal(10,2) NOT NULL,
  `Unit_of_measure` varchar(50) NOT NULL,
  PRIMARY KEY (`Product_id`),
  UNIQUE KEY `Product_id` (`Product_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES ('P001','Apple','Fruits',0.50,'kg'),('P002','Milk','Dairy',1.00,'litre'),('P003','Bread','Bakery',1.50,'loaf');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shelves`
--

DROP TABLE IF EXISTS `Shelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shelves` (
  `Shelf_id` char(10) NOT NULL,
  `Manager_id` char(10) DEFAULT NULL,
  `Product_id` char(10) NOT NULL,
  PRIMARY KEY (`Shelf_id`),
  UNIQUE KEY `Shelf_id` (`Shelf_id`),
  KEY `Product_id` (`Product_id`),
  KEY `Manager_id` (`Manager_id`),
  CONSTRAINT `Shelf_Product_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `Products` (`Product_id`),
  CONSTRAINT `Shelves_ibfk_1` FOREIGN KEY (`Manager_id`) REFERENCES `Managers` (`Manager_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shelves`
--

LOCK TABLES `Shelves` WRITE;
/*!40000 ALTER TABLE `Shelves` DISABLE KEYS */;
INSERT INTO `Shelves` VALUES ('S001','M001','P001'),('S002','M002','P002'),('S003','M003','P003');
/*!40000 ALTER TABLE `Shelves` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20 17:22:44
