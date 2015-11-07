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
  `monto_neto` decimal(8,2) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`cuenta_id`),
  KEY `fk_cuenta_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_cuenta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'00001',99999.99,1);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `transaccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `costo_banco` decimal(5,2) NOT NULL,
  `monto` decimal(5,2) NOT NULL,
  `fecha_transaccion` datetime NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  `motivo` varchar(150) NOT NULL,
  PRIMARY KEY (`transaccion_id`),
  KEY `fk_transaccion_cuenta1_idx` (`cuenta_id`),
  CONSTRAINT `fk_transaccion_cuenta1` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`cuenta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
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
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin','Alex','Matias','73257029','ADM','ACT','1995-02-09','992962762','alexmatiasupc123@gmail.com'),(2,'u001','123','Miguel','Aybar','92075237','CLI','ACT','1995-09-09','999999999','miguel_aybar@gmail.com'),(3,'u002','123','Mary','Soto','12345678','CLI','ACT','1880-01-01','111111111','msoto@mef.gob.pe'),(4,'u003','123','Lucas','Matias','86421357','CLI','ACT','1998-01-01','777777777','lucas@gmail.com'),(5,'u004','123','Brenda','Haro','87654321','CLI','ACT','1993-02-22','888888888','xime@gmail.com'),(6,'u005','123','Gaby','Shimabukuro','98989898','CLI','ACT','1980-02-03','333333333','gaby@gmail.com'),(7,'u006','123','Yuriko','Vega','89898989','CLI','ACT','1990-03-03','444444444','yuri@gmail.com'),(8,'u007','123','Nancy','Soto','10101010','CLI','ACT','1970-05-01','555555555','nancy@yahoo.es'),(9,'u008','123','Piero','Guevara','78787878','CLI','ACT','2000-11-11','909090900','piero@gmail.com'),(10,'u009','123','Pedro','Soto','12312312','CLI','ACT','1960-12-01','123890678','pedro@gmail.com'),(11,'u010','123','Noelia','Ramirez','13489019','CLI','ACT','1992-10-01','897564123','noelia@gmail.com'),(12,'u011','123','Sofia','Arteaga','08612421','CLI','ACT','1990-02-05','129148674','sofi@hotmail.com'),(13,'u012','123','Victor','Chuquihuaccha','73678923','CLI','ACT','1996-09-09','991299122','victor_nyx@gmail.com'),(14,'u013','123','Carlos','Ramos','89765412','CLI','ACT','1984-12-11','999123999','carlos.ramos@gmail.com');
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

-- Dump completed on 2015-11-07  2:44:05
