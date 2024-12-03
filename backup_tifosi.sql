-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (arm64)
--
-- Host: localhost    Database: Tifosi
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `achete`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achete` (
  `id_achete` int NOT NULL AUTO_INCREMENT,
  `fk_id_client` int NOT NULL,
  `fk_id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_achete`),
  KEY `fk_id_client` (`fk_id_client`),
  KEY `fk_id_focaccia` (`fk_id_focaccia`),
  CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`fk_id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`fk_id_focaccia`) REFERENCES `focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boisson`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(45) NOT NULL,
  `fk_id_marque` int NOT NULL,
  PRIMARY KEY (`id_boisson`),
  KEY `fk_id_marque` (`fk_id_marque`),
  CONSTRAINT `boisson_ibfk_1` FOREIGN KEY (`fk_id_marque`) REFERENCES `marque` (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boisson`
--

LOCK TABLES `boisson` WRITE;
/*!40000 ALTER TABLE `boisson` DISABLE KEYS */;
INSERT INTO `boisson` VALUES (1,'Coca-cola zÃ©ro',1);
INSERT INTO `boisson` VALUES (2,'Coca-cola original',1);
INSERT INTO `boisson` VALUES (3,'Fanta citron',1);
INSERT INTO `boisson` VALUES (4,'Fanta orange',1);
INSERT INTO `boisson` VALUES (5,'Capri-sun',1);
INSERT INTO `boisson` VALUES (6,'Pepsi',4);
INSERT INTO `boisson` VALUES (7,'Pepsi Max ZÃ©ro',4);
INSERT INTO `boisson` VALUES (8,'Lipton zÃ©ro citron',4);
INSERT INTO `boisson` VALUES (9,'Lipton Peach',4);
INSERT INTO `boisson` VALUES (10,'Monster energy ultra gold',3);
INSERT INTO `boisson` VALUES (11,'Monster energy ultra blue',3);
INSERT INTO `boisson` VALUES (12,'Eau de source',2);
/*!40000 ALTER TABLE `boisson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `cp_client` int DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprend`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprend` (
  `id_comprend` int NOT NULL AUTO_INCREMENT,
  `fk_id_focaccia` int NOT NULL,
  `fk_id_ingredient` int NOT NULL,
  PRIMARY KEY (`id_comprend`),
  KEY `fk_id_focaccia` (`fk_id_focaccia`),
  KEY `fk_id_ingredient` (`fk_id_ingredient`),
  CONSTRAINT `comprend_ibfk_1` FOREIGN KEY (`fk_id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  CONSTRAINT `comprend_ibfk_2` FOREIGN KEY (`fk_id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprend`
--

LOCK TABLES `comprend` WRITE;
/*!40000 ALTER TABLE `comprend` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contient` (
  `id_contient` int NOT NULL AUTO_INCREMENT,
  `fk_id_menu` int NOT NULL,
  `fk_id_boisson` int NOT NULL,
  PRIMARY KEY (`id_contient`),
  KEY `fk_id_menu` (`fk_id_menu`),
  KEY `fk_id_boisson` (`fk_id_boisson`),
  CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`fk_id_menu`) REFERENCES `menu` (`id_menu`),
  CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`fk_id_boisson`) REFERENCES `boisson` (`id_boisson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contient`
--

LOCK TABLES `contient` WRITE;
/*!40000 ALTER TABLE `contient` DISABLE KEYS */;
/*!40000 ALTER TABLE `contient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focaccia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) NOT NULL,
  `prix_focaccia` float NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focaccia`
--

LOCK TABLES `focaccia` WRITE;
/*!40000 ALTER TABLE `focaccia` DISABLE KEYS */;
INSERT INTO `focaccia` VALUES (1,'Mozaccia',9.8);
INSERT INTO `focaccia` VALUES (2,'Gorgonzollaccia',10.8);
INSERT INTO `focaccia` VALUES (3,'Raclaccia',8.9);
INSERT INTO `focaccia` VALUES (4,'Emmentalaccia',9.8);
INSERT INTO `focaccia` VALUES (5,'Tradizione',8.9);
INSERT INTO `focaccia` VALUES (6,'Hawaienne',11.2);
INSERT INTO `focaccia` VALUES (7,'AmÃ©ricaine',10.8);
INSERT INTO `focaccia` VALUES (8,'Paysanne',12.8);
/*!40000 ALTER TABLE `focaccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Ail');
INSERT INTO `ingredient` VALUES (2,'Ananas');
INSERT INTO `ingredient` VALUES (3,'Artichaut');
INSERT INTO `ingredient` VALUES (4,'Bacon');
INSERT INTO `ingredient` VALUES (5,'Base Tomate');
INSERT INTO `ingredient` VALUES (6,'Base crÃ¨me');
INSERT INTO `ingredient` VALUES (7,'Champignon');
INSERT INTO `ingredient` VALUES (8,'Chevre');
INSERT INTO `ingredient` VALUES (9,'Cresson');
INSERT INTO `ingredient` VALUES (10,'Emmental');
INSERT INTO `ingredient` VALUES (11,'Gorgonzola');
INSERT INTO `ingredient` VALUES (12,'Jambon cuit');
INSERT INTO `ingredient` VALUES (13,'Jambon fumÃ©');
INSERT INTO `ingredient` VALUES (14,'Oeuf');
INSERT INTO `ingredient` VALUES (15,'Oignon');
INSERT INTO `ingredient` VALUES (16,'Olive noire');
INSERT INTO `ingredient` VALUES (17,'Olive verte');
INSERT INTO `ingredient` VALUES (18,'Parmesan');
INSERT INTO `ingredient` VALUES (19,'Piment');
INSERT INTO `ingredient` VALUES (20,'Poivre');
INSERT INTO `ingredient` VALUES (21,'Pomme de terre');
INSERT INTO `ingredient` VALUES (22,'Raclette');
INSERT INTO `ingredient` VALUES (23,'Salami');
INSERT INTO `ingredient` VALUES (24,'Tomate cerise');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'Coca-cola');
INSERT INTO `marque` VALUES (2,'Cristalline');
INSERT INTO `marque` VALUES (3,'Monster');
INSERT INTO `marque` VALUES (4,'Pepsico');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) NOT NULL,
  `prix_menu` float NOT NULL,
  `fk_id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `fk_id_focaccia` (`fk_id_focaccia`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`fk_id_focaccia`) REFERENCES `focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paye`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paye` (
  `id_paye` int NOT NULL AUTO_INCREMENT,
  `fk_id_client` int NOT NULL,
  `fk_id_menu` int NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`id_paye`),
  KEY `fk_id_client` (`fk_id_client`),
  KEY `fk_id_menu` (`fk_id_menu`),
  CONSTRAINT `paye_ibfk_1` FOREIGN KEY (`fk_id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `paye_ibfk_2` FOREIGN KEY (`fk_id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paye`
--

LOCK TABLES `paye` WRITE;
/*!40000 ALTER TABLE `paye` DISABLE KEYS */;
/*!40000 ALTER TABLE `paye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Tifosi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 18:45:34
