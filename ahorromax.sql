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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'19230923949010',2902.85,2,'ACT'),(7,'19230923950030',2500.00,35,'INA'),(8,'19130923951034',3800.00,36,'ACT'),(9,'19430923952034',5000.00,37,'ACT'),(10,'19330923953033',31.00,38,'ACT'),(11,'19130923954034',33.00,39,'INA'),(12,'19230923955034',4000.00,3,'ACT'),(14,'19430923956034',9000.00,5,'ACT'),(15,'19230923957031',36.00,40,'ACT'),(16,'19330923958033',3000.00,5,'ACT'),(17,'19230923959030',4000.00,21,'ACT'),(18,'19430923960032',1000.00,41,'ACT'),(19,'19130923961034',1000.00,42,'ACT'),(20,'19030923962031',4118.62,2,'ACT'),(21,'19430923963031',4000.00,8,'ACT');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
INSERT INTO `datos` VALUES ('2015-11-24',0.50000,0.00030,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (13,0.00,300.00,'2015-11-23 11:35:06',1,'Primer Ingreso',3600,0),(16,0.50,-200.00,'2015-11-23 11:39:00',1,'Primer Retiro',2999,0),(17,0.50,-100.00,'2015-11-23 11:44:56',1,'Segundo Retiro',2898.5,0),(18,0.00,2.61,'2015-11-24 11:57:10',1,'Interes Ganado',2901.1094326732596,0),(19,0.00,0.00,'2015-11-24 11:57:10',1,'Actualizado desde estado de cuenta',2901.1094326732596,1),(22,0.00,200.00,'2015-10-26 12:15:21',20,'Primer ingreso',2200,0),(23,0.50,-100.00,'2015-10-26 12:15:42',20,'Retiro',2099.5,0),(24,0.00,0.00,'2015-11-26 12:34:48',1,'Actualizado desde estado de cuenta',2902.8509270998998,1),(25,0.00,1.74,'2015-11-26 12:34:48',1,'Interes Ganado',2902.8509270998998,0),(26,0.00,19.61,'2015-11-26 12:35:28',20,'Interes Ganado',2119.113469416776,0),(27,0.00,0.00,'2015-11-26 12:35:28',20,'Actualizado desde estado de cuenta',2119.113469416776,1),(28,0.00,3000.00,'2015-11-26 12:36:18',20,'jaja',5119.113469416776,0),(29,0.50,-1000.00,'2015-11-26 12:36:57',20,'retiro 3',4118.62,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin','Alex','Matias','73257029','ADM','ACT','1995-02-09','992962762','alexmatiasupc123@gmail.com','assets/img/user4.jpg'),(2,'u001','123','Miguel','Aybarsito','92075237','CLI','ACT','1995-09-28','999999990','miguel_aybar@gmail.com','assets/img/user2.jpg'),(3,'u002','123','Mary','Soto','12345678','CLI','ACT','1880-01-01','111111111','msoto@mef.gob.pe','assets/img/user2.jpg'),(4,'u003','123','Lucas','Matias','86421357','CLI','ACT','1998-01-01','777777777','lucas@gmail.com','assets/img/user5.jpg'),(5,'u004','123','Brenda','Haro','87654321','CLI','ACT','1993-02-22','888888888','xime@gmail.com','assets/img/user6.jpg'),(6,'u005','123','Gaby','Shimabukuro','98989898','CLI','ACT','1980-02-03','333333333','gaby@gmail.com','assets/img/user7.jpg'),(7,'u006','123','Yuriko','Vega','89898989','CLI','ACT','1990-03-03','444444444','yuri@gmail.com','assets/img/user8.jpg'),(8,'u007','123','Nancy','Soto','10101010','CLI','ACT','1970-05-01','555555555','nancy@yahoo.es','assets/img/user9.jpg'),(9,'u008','123','Piero','Guevara','78787878','CLI','ACT','2000-11-11','909090900','piero@gmail.com','assets/img/user10.jpg'),(10,'u009','123','Pedro','Soto','12312312','CLI','INA','1960-12-01','123890678','pedro@gmail.com','assets/img/user2.jpg'),(11,'u010','123','Noelia','Ramirez','13489019','CLI','ACT','1992-10-01','897564123','noelia@gmail.com','assets/img/user2.jpg'),(12,'u011','123','Sofia','Arteaga','08612421','CLI','ACT','1990-02-05','129148674','sofi@hotmail.com','assets/img/user3.jpg'),(13,'u012','123','Victor','Chuquihuaccha','73678923','CLI','ACT','1996-09-09','991299122','victor_nyx@gmail.com','assets/img/user5.jpg'),(14,'u013','123','Carlos','Ramos','89765412','CLI','ACT','1984-12-11','999123999','carlos.ramos@gmail.com','assets/img/user6.jpg'),(15,'u014','123','Luis','Guevara','12781256','CLI','ACT','1970-10-20','789654128','lguevara@gmail.com','assets/img/user7.jpg'),(16,'u015','123','Cesar','Soto','87612367','CLI','ACT','1972-02-05','986567123','zurdocesar@hotmail.com','assets/img/user8.jpg'),(17,'u016','123','Walter','Matias','08612425','CLI','ACT','1969-12-08','999888111','walter_matias8@hotmail.com','assets/img/user9.jpg'),(18,'u017','123','Michel','Chuquipiondo','74819512','CLI','ACT','1990-08-15','997675123','michael.sanchez@hotmail.com','assets/img/user2.jpg'),(19,'u018','123','Victor','Parasi','09874517','CLI','ACT','1988-09-24','987567234','vparasi@gmail.com','assets/img/user1.jpg'),(20,'u019','123','Christian','Machuca','08671256','CLI','ACT','1992-04-12','992388126','chrisitan.m@gmail.com','assets/img/user2.jpg'),(21,'u020','123','Alexis','Quiñe','74256789','CLI','ACT','1995-04-02','978756423','ian.quiñe@gmail.com','assets/img/user3.jpg'),(22,'u021','123','Jorge','Torrico','09651240','CLI','ACT','1989-03-10','901245678','jtorricon@hotmail.com','assets/img/user4_.jpg'),(23,'u022','123','Felipe','Pallete','86126713','CLI','ACT','1985-01-05','960789123','fpalletea@hotmail.com','assets/img/user5.jpg'),(24,'u023','123','Sever','Falcon','06781289','CLI','ACT','1970-12-22','908769148','sfalcon@hotmail.com','assets/img/user6.jpg'),(35,'u024','123','Fiorella','Haro Bernal','73268978','CLI','ACT','1995-02-21','5617829','fharo@gmail.com','assets/img/user2.jpg'),(36,'u025','123','Alexito','Soto','73257029','CLI','ACT','1996-02-09','992962762','alexmatiasupc123@gmail.com','assets/img/user2.jpg'),(37,'u026','123','Valerie','Tafur','12345678','CLI','ACT','2015-11-12','1234567','valerie@gmail.com','assets/img/user2.jpg'),(38,'u027','123','Franck','Carrillo','10000003','CLI','ACT','2015-10-28','1000003','f@e.com','assets/img/user2.jpg'),(39,'u028','123','Lucas','Chuquipiondo','10000003','CLI','ACT','2015-02-11','1000004','xxx@xime.com','assets/img/user2.jpg'),(40,'u029','123','Oliver','Atom','87654321','CLI','ACT','1983-03-11','1000005','oliveratom10@supercampeones.com','assets/img/user2.jpg'),(41,'u030','123','Joseph','Perez','78654323','CLI','ACT','1971-11-26','1000004','jk@ui.com','assets/img/user2.jpg'),(42,'u031','123','Brunella','Aybar','10000005','CLI','ACT','1913-06-04','1000002','alwesf@df.com','assets/img/user2.jpg');
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

-- Dump completed on 2015-11-26 12:41:33
