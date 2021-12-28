-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: carrinho_compras_bd
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `order_buy`
--

DROP TABLE IF EXISTS `order_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `payment_form` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_buy`
--

LOCK TABLES `order_buy` WRITE;
/*!40000 ALTER TABLE `order_buy` DISABLE KEYS */;
INSERT INTO `order_buy` VALUES (2,1,'dinheiro','2021-12-27 15:47:34'),(3,2,'cartão','2021-12-27 15:47:59'),(4,2,'cartão','2021-12-27 15:48:52'),(5,1,'dinheiro','2021-12-27 15:50:10'),(6,1,'dinheiro','2021-12-27 15:51:22'),(7,1,'dinheiro','2021-12-27 15:51:38'),(8,1,'dinheiro','2021-12-27 15:51:59'),(9,1,'dinheiro','2021-12-27 15:52:59'),(10,1,'dinheiro','2021-12-27 15:53:11'),(11,1,'dinheiro','2021-12-27 15:53:36'),(12,1,'dinheiro','2021-12-27 15:53:54'),(13,1,'dinheiro','2021-12-27 16:46:20'),(14,1,'dinheiro','2021-12-27 16:47:16'),(15,1,'dinheiro','2021-12-27 16:47:50'),(16,1,'dinheiro','2021-12-27 16:50:07'),(17,1,'dinheiro','2021-12-27 16:50:25'),(18,1,'dinheiro','2021-12-27 16:50:49'),(19,1,'dinheiro','2021-12-27 16:51:26'),(20,1,'dinheiro','2021-12-27 16:53:03'),(21,1,'dinheiro','2021-12-27 16:53:12'),(22,NULL,'','2021-12-27 21:14:10'),(23,NULL,'dinheiro','2021-12-27 21:15:38'),(24,NULL,'dinheiro','2021-12-27 21:15:48'),(25,NULL,'dinheiro','2021-12-27 21:16:37'),(26,NULL,'','2021-12-27 21:17:36'),(27,NULL,'','2021-12-27 21:17:54'),(28,NULL,'','2021-12-27 21:17:59'),(29,NULL,'','2021-12-27 21:21:37'),(30,NULL,'','2021-12-27 21:21:50'),(31,NULL,'','2021-12-27 21:22:22'),(32,NULL,'','2021-12-27 21:23:09'),(33,NULL,'dinheiro','2021-12-27 21:24:14'),(34,NULL,'dinheiro','2021-12-27 21:24:32'),(35,NULL,'','2021-12-27 21:24:43'),(36,NULL,'','2021-12-27 21:26:55'),(37,NULL,'','2021-12-27 21:27:16'),(38,NULL,'','2021-12-27 21:27:16'),(39,NULL,'','2021-12-27 21:27:54'),(40,NULL,'','2021-12-27 21:29:46'),(41,NULL,'dinheiro','2021-12-27 21:30:44'),(42,NULL,'','2021-12-28 00:27:17'),(43,NULL,'','2021-12-28 00:29:13'),(44,NULL,'','2021-12-28 00:51:25');
/*!40000 ALTER TABLE `order_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product`,`id_order`),
  KEY `order_products_FK_1` (`id_order`),
  CONSTRAINT `order_products_FK` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  CONSTRAINT `order_products_FK_1` FOREIGN KEY (`id_order`) REFERENCES `order_buy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,20,2),(1,21,2),(1,34,2),(1,41,2),(2,20,1),(2,21,1),(2,34,1),(2,41,1),(4,20,1),(4,21,1),(4,34,1),(4,41,1);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` float DEFAULT '0',
  `image` varchar(250) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Tênis de Caminhada Leve Confortável',179.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis1.jpg','2021-12-27 15:20:32'),(2,'Tênis VR Caminhada Confortável Borracha',139.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis2.jpg','2021-12-27 15:20:32'),(3,'Tênis Adidas Duramo Lite 2.0',219.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis3.jpg','2021-12-27 15:20:32'),(4,'Tênis VR Caminhada Confortável Detalhes Couro Masculino',149.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis2.jpg','2021-12-27 15:20:32'),(5,'Tênis Adidas Duramo Lite 3.0',159.9,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis3.jpg','2021-12-27 15:20:32'),(6,'Tênis de Caminhada Profissional',329,'https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/modulo-redux/tenis2.jpg','2021-12-27 15:20:32');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `stock_FK` FOREIGN KEY (`id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,2),(2,3),(3,5),(4,4),(5,10),(6,1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 15:42:39
