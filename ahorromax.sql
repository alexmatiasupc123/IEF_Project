CREATE DATABASE  IF NOT EXISTS `ahorromax` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ahorromax`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: ahorromax
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `costo_x_cuenta`
--

DROP TABLE IF EXISTS `costo_x_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costo_x_cuenta` (
  `costo_x_cuenta_id` int(11) NOT NULL AUTO_INCREMENT,
  `monto_total_costo` decimal(5,2) NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  PRIMARY KEY (`costo_x_cuenta_id`),
  KEY `fk_costo_x_cuenta_cuenta1_idx` (`cuenta_id`),
  CONSTRAINT `fk_costo_x_cuenta_cuenta1` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`cuenta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_x_cuenta`
--

LOCK TABLES `costo_x_cuenta` WRITE;
/*!40000 ALTER TABLE `costo_x_cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_x_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `cuenta_id` int(11) NOT NULL AUTO_INCREMENT,
  `nro_cuenta` varchar(45) NOT NULL,
  `monto_neto` decimal(10,2) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`cuenta_id`),
  KEY `fk_cuenta_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_cuenta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (25,'19410000000033',111108.31,46,'ACT');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos` (
  `fecha_actualizada` date NOT NULL,
  `costo` decimal(5,5) NOT NULL,
  `tasa` decimal(5,5) NOT NULL,
  `datosid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`datosid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
INSERT INTO `datos` VALUES ('2015-11-24',0.50000,0.00030,1),('2015-11-28',0.50000,0.00080,2),('2015-11-28',0.50000,0.00100,3),('2015-11-28',0.50000,0.00005,5);
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `transaccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `costo_banco` decimal(10,2) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_transaccion` datetime NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  `motivo` varchar(150) NOT NULL,
  `saldo_restante` double NOT NULL,
  `actualizado` int(11) NOT NULL,
  PRIMARY KEY (`transaccion_id`),
  KEY `fk_transaccion_cuenta1_idx` (`cuenta_id`),
  CONSTRAINT `fk_transaccion_cuenta1` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`cuenta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,0.00,999.00,'2015-11-27 10:56:15',25,'Apertura',999,0),(2,0.50,-30.00,'2015-11-27 11:14:04',25,'Pagar prestamo',968.5,0),(3,0.00,0.00,'2015-11-28 11:25:34',25,'Actualizado desde estado de cuenta',968.7905499999999,1),(4,0.00,0.29,'2015-11-28 11:25:34',25,'Interes Ganado',968.7905499999999,0),(5,0.00,200.00,'2015-11-28 12:14:48',25,'Deposito de mama',1168.79,0),(6,0.50,-60.00,'2015-11-28 12:15:39',25,'Comprar comida',1108.29,0),(7,0.00,10000.00,'2015-11-28 12:42:21',25,'Tinka',11108.29,0),(8,0.00,100000.00,'2015-11-28 12:43:43',25,'Ganagol',111108.3,0);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `rol` varchar(3) NOT NULL,
  `estado` varchar(3) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `imagen_url` varchar(150) NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin','Alexander Giancarlo','Matias Soto','73257029','ADM','ACT','1995-02-09','992962762','alexmatiasupc123@gmail.com','assets/img/user2.jpg'),(46,'u001','123','Piero Andre','Guevara Soto','78765432','CLI','ACT','1997-11-11','5610792','gpierito@gmail.com','assets/img/user2.jpg');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-28 12:53:55
