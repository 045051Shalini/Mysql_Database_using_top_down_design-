--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `Customer_id` char(10) NOT NULL,
  `C_contact` char(10) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `Customer_id` (`Customer_id`),
  UNIQUE KEY `C_contact` (`C_contact`)
);
--
--
INSERT INTO `Customers` VALUES ('C002','0987654321'),('C003','1122334455'),('C001','1234567890');
--
-- Table structure for table `Managers`
--

DROP TABLE IF EXISTS `Managers`;
CREATE TABLE `Managers` (
  `Manager_id` char(10) NOT NULL,
  `Manager_name` char(10) NOT NULL,
  `M_contact` char(10) NOT NULL,
  PRIMARY KEY (`Manager_id`),
  UNIQUE KEY `Manager_id` (`Manager_id`)
);
--
--
INSERT INTO `Managers` VALUES ('M001','John Doe','1111111111'),('M002','Jane Smith','2222222222'),('M003','Alice Brown','3333333333');

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
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
--
--
INSERT INTO `Orders` VALUES ('O001','2024-08-20','P001',10.00,5.00,'C001'),('O002','2024-08-21','P002',2.00,2.00,'C002'),('O003','2024-08-22','P003',1.00,1.50,'C003');

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
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
--
--
INSERT INTO `Payments` VALUES ('PM001','Credit Card','2024-08-20','O001'),('PM002','Cash','2024-08-21','O002'),('PM003','Debit Card','2024-08-22','O003');
--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products` (
  `Product_id` char(10) NOT NULL,
  `Product_name` varchar(50) NOT NULL,
  `Product_category` varchar(50) DEFAULT NULL,
  `Unit_price` decimal(10,2) NOT NULL,
  `Unit_of_measure` varchar(50) NOT NULL,
  PRIMARY KEY (`Product_id`),
  UNIQUE KEY `Product_id` (`Product_id`)
);
--
--
INSERT INTO `Products` VALUES ('P001','Apple','Fruits',0.50,'kg'),('P002','Milk','Dairy',1.00,'litre'),('P003','Bread','Bakery',1.50,'loaf');

--
-- Table structure for table `Shelves`
--

DROP TABLE IF EXISTS `Shelves`;
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

INSERT INTO `Shelves` VALUES ('S001','M001','P001'),('S002','M002','P002'),('S003','M003','P003');
