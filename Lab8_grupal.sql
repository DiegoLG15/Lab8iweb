-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: lab8
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clase_enemigos`
--

DROP TABLE IF EXISTS `clase_enemigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase_enemigos` (
  `idclase_enemigos` int NOT NULL,
  `clase_enemigos` varchar(45) NOT NULL,
  PRIMARY KEY (`idclase_enemigos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase_enemigos`
--

LOCK TABLES `clase_enemigos` WRITE;
/*!40000 ALTER TABLE `clase_enemigos` DISABLE KEYS */;
INSERT INTO `clase_enemigos` VALUES (1,'Dragon'),(2,'Fantasma'),(3,'Demonio'),(4,'Pez'),(5,'Bestia'),(6,'Ave');
/*!40000 ALTER TABLE `clase_enemigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase_enemigos_has_elemento`
--

DROP TABLE IF EXISTS `clase_enemigos_has_elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase_enemigos_has_elemento` (
  `clase_enemigos_idclase_enemigos` int NOT NULL,
  `elemento_idelemento` int NOT NULL,
  `probabilidad` decimal(10,0) NOT NULL,
  PRIMARY KEY (`clase_enemigos_idclase_enemigos`,`elemento_idelemento`),
  KEY `fk_clase_enemigos_has_elemento_elemento1_idx` (`elemento_idelemento`),
  KEY `fk_clase_enemigos_has_elemento_clase_enemigos1_idx` (`clase_enemigos_idclase_enemigos`),
  CONSTRAINT `fk_clase_enemigos_has_elemento_clase_enemigos1` FOREIGN KEY (`clase_enemigos_idclase_enemigos`) REFERENCES `clase_enemigos` (`idclase_enemigos`),
  CONSTRAINT `fk_clase_enemigos_has_elemento_elemento1` FOREIGN KEY (`elemento_idelemento`) REFERENCES `elemento` (`idelemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase_enemigos_has_elemento`
--

LOCK TABLES `clase_enemigos_has_elemento` WRITE;
/*!40000 ALTER TABLE `clase_enemigos_has_elemento` DISABLE KEYS */;
INSERT INTO `clase_enemigos_has_elemento` VALUES (1,1,1),(2,2,40),(3,3,110);
/*!40000 ALTER TABLE `clase_enemigos_has_elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claseheroe`
--

DROP TABLE IF EXISTS `claseheroe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claseheroe` (
  `idclase` int NOT NULL,
  `clase` varchar(50) NOT NULL,
  PRIMARY KEY (`idclase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claseheroe`
--

LOCK TABLES `claseheroe` WRITE;
/*!40000 ALTER TABLE `claseheroe` DISABLE KEYS */;
INSERT INTO `claseheroe` VALUES (1,'Normal'),(2,'Sayayin'),(3,'Hechicero'),(4,'Androide'),(5,'Namekusein'),(6,'Guerrero'),(7,'Zombie'),(8,'Ninja'),(9,'Fantasma'),(10,'Robot');
/*!40000 ALTER TABLE `claseheroe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elemento`
--

DROP TABLE IF EXISTS `elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elemento` (
  `idelemento` int NOT NULL AUTO_INCREMENT,
  `elemento` varchar(45) NOT NULL,
  PRIMARY KEY (`idelemento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento`
--

LOCK TABLES `elemento` WRITE;
/*!40000 ALTER TABLE `elemento` DISABLE KEYS */;
INSERT INTO `elemento` VALUES (1,'Fuego'),(2,'Tierra'),(3,'Agua'),(4,'Viento'),(5,'Void');
/*!40000 ALTER TABLE `elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemigos`
--

DROP TABLE IF EXISTS `enemigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemigos` (
  `idenemigos` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ataque` int NOT NULL,
  `exp_x_derrota` int NOT NULL,
  `objeto_x_derrota` varchar(45) NOT NULL,
  `genero_idgenero` int DEFAULT NULL,
  `probabilidad_x_objeto` int NOT NULL,
  `objeto_idobjeto` int DEFAULT NULL,
  `clase_enemigos_idclase_enemigos` int DEFAULT NULL,
  PRIMARY KEY (`idenemigos`),
  KEY `fk_enemigos_genero1_idx` (`genero_idgenero`),
  KEY `fk_enemigos_objeto1_idx` (`objeto_idobjeto`),
  KEY `fk_enemigos_clase_enemigos1_idx` (`clase_enemigos_idclase_enemigos`),
  CONSTRAINT `fk_enemigos_clase_enemigos1` FOREIGN KEY (`clase_enemigos_idclase_enemigos`) REFERENCES `clase_enemigos` (`idclase_enemigos`),
  CONSTRAINT `fk_enemigos_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`),
  CONSTRAINT `fk_enemigos_objeto1` FOREIGN KEY (`objeto_idobjeto`) REFERENCES `objeto` (`idobjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemigos`
--

LOCK TABLES `enemigos` WRITE;
/*!40000 ALTER TABLE `enemigos` DISABLE KEYS */;
INSERT INTO `enemigos` VALUES (1,'Voldemor',1,1,'UAV',1,1,1,1),(2,'nappa',20,20,'Espada',2,40,2,2),(3,'raditz',60,30,'Escudo',3,60,3,3);
/*!40000 ALTER TABLE `enemigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int NOT NULL,
  `genero` varchar(1) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'H'),(2,'M'),(3,'O'),(4,'-');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hechizos`
--

DROP TABLE IF EXISTS `hechizos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hechizos` (
  `idhechizos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `potencia` int NOT NULL,
  `precisión` int NOT NULL,
  `nivel_aprendizaje` int DEFAULT NULL,
  `hechizos_idhechizos` int DEFAULT NULL,
  `elemento_idelemento` int NOT NULL,
  PRIMARY KEY (`idhechizos`),
  KEY `fk_hechizos_hechizos1_idx` (`hechizos_idhechizos`),
  KEY `fk_hechizos_elemento1_idx` (`elemento_idelemento`),
  CONSTRAINT `fk_hechizos_elemento1` FOREIGN KEY (`elemento_idelemento`) REFERENCES `elemento` (`idelemento`),
  CONSTRAINT `fk_hechizos_hechizos1` FOREIGN KEY (`hechizos_idhechizos`) REFERENCES `hechizos` (`idhechizos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hechizos`
--

LOCK TABLES `hechizos` WRITE;
/*!40000 ALTER TABLE `hechizos` DISABLE KEYS */;
INSERT INTO `hechizos` VALUES (1,'Lava',1,1,1,NULL,1),(2,'wingardium',22,2,2,2,2),(3,'pOTTER',23,43,2,3,1);
/*!40000 ALTER TABLE `hechizos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroes` (
  `idHeroes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `edad` int NOT NULL,
  `nivel` int NOT NULL,
  `puntosDeExperiencia` double NOT NULL,
  `pareja` int DEFAULT NULL,
  `genero_idgenero` int NOT NULL,
  `claseHeroe_idclase` int NOT NULL,
  `ataque` int NOT NULL,
  PRIMARY KEY (`idHeroes`),
  KEY `fk_Heroes_Heroes1_idx` (`pareja`),
  KEY `fk_Heroes_genero1_idx` (`genero_idgenero`),
  KEY `fk_Heroes_claseHeroe1_idx` (`claseHeroe_idclase`),
  CONSTRAINT `fk_Heroes_claseHeroe1` FOREIGN KEY (`claseHeroe_idclase`) REFERENCES `claseheroe` (`idclase`),
  CONSTRAINT `fk_Heroes_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`),
  CONSTRAINT `fk_Heroes_Heroes1` FOREIGN KEY (`pareja`) REFERENCES `heroes` (`idHeroes`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES (1,'Trunks',40,7,0,NULL,1,2,10),(2,'vegeta',60,77,0,NULL,1,2,23),(56,'messi',12,100,0,NULL,1,1,1),(76,'cr7',9,1,0,NULL,1,1,1),(77,'max10',1,1,0.49,NULL,1,5,1),(80,'Dark',45,1,0.49,NULL,1,9,1),(82,'Kakashi',40,50,0,NULL,2,1,1),(83,'neji',20,99,1571884.38,NULL,1,8,10000),(84,'Bardock',50,50,142500,NULL,1,2,1),(88,'gf',12,1,0.49,NULL,1,1,1),(89,'1',9,1,0.49,NULL,1,2,1),(90,'aaaaa',34,1,0,NULL,1,3,5),(91,'asd',32,32,30146.56,NULL,1,3,2),(94,'neymar',45,5,65,NULL,1,2,1),(95,'luz',12,99,1571884.38,NULL,1,3,1),(96,'bale',12,40,66560,NULL,1,2,5),(97,'bale',12,40,66560,NULL,1,2,5),(98,'guy',12,5,65,NULL,1,3,1),(99,'max11',12,99,1571884.38,NULL,1,3,5),(100,'digi',12,5,65,NULL,2,4,1),(101,'neymar',11,40,66560,NULL,2,2,1),(102,'Bardock',8,99,1571884.38,NULL,1,4,1),(103,'digimooooo',12,40,66560,NULL,1,2,1),(104,'digimooooo',12,40,66560,NULL,1,2,1),(105,'digimooooo',12,99,1571884.38,NULL,1,2,5),(106,'neymar',8,40,66560,NULL,1,2,5),(107,'GAA',12,5,65,NULL,3,3,5),(108,'neymar',12,5,65,NULL,1,2,1),(109,'KAKAROTO',8,40,0,NULL,2,3,5),(114,'eeeeee',12,12,979.2,NULL,1,3,12),(115,'sol',12,12,979.2,NULL,1,7,12),(116,'id',34,12,979.2,94,1,7,1),(117,'id2',21,12,979.2,NULL,1,8,12),(118,'id44',12,40,66560,NULL,1,5,12),(119,'aaaaa',11,11,745.36,NULL,2,3,1),(121,'aaaaaaa',12,12,979.2,NULL,1,4,12),(122,'aaa',12,12,979.2,NULL,1,5,12);
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idinventario` int NOT NULL,
  `objeto_idobjeto` int DEFAULT NULL,
  `heroes_idHeroes` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`idinventario`),
  KEY `fk_inventario_objeto1_idx` (`objeto_idobjeto`),
  KEY `fk_inventario_heroes1_idx` (`heroes_idHeroes`),
  CONSTRAINT `fk_inventario_heroes1` FOREIGN KEY (`heroes_idHeroes`) REFERENCES `heroes` (`idHeroes`),
  CONSTRAINT `fk_inventario_objeto1` FOREIGN KEY (`objeto_idobjeto`) REFERENCES `objeto` (`idobjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (121,3,1,2),(122,4,2,3);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objeto`
--

DROP TABLE IF EXISTS `objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objeto` (
  `idobjeto` int NOT NULL AUTO_INCREMENT,
  `objeto` varchar(45) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `peso` double NOT NULL,
  PRIMARY KEY (`idobjeto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objeto`
--

LOCK TABLES `objeto` WRITE;
/*!40000 ALTER TABLE `objeto` DISABLE KEYS */;
INSERT INTO `objeto` VALUES (1,'Espada','Permite cortar a tus enemigos',5),(2,'Hacha','Puedes cortar arboles',1),(3,'Semilla','Permite recuperar gran parte de la salud',0.3),(4,'Escudo','Te protege de ataques enemigos ',2),(5,'Pistola','Arma a distancia que dispara balas',0.5),(6,'Lanzacohetes','Arma muy potente que aniquila enemigos',4),(7,'Comida','Recupera energias',1),(8,'UAV','Revela la ubicacion de los enemigos',1),(9,'Celular','Permite llamar a aliados',0.5),(10,'Trophy','Permite protegerte de elementos explosivos',1.5);
/*!40000 ALTER TABLE `objeto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 18:46:48
