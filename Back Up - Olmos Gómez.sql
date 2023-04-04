-- Back Up base de datos hospital

-- En la siguiente lista se mencionará las tablas de las cuáles se realizó el backup correspondiente:
-- Tabla cama
-- Tabla historial_entrada
-- Tabla log_médico
-- Tabla log_paciente
-- Tabla médico
-- Tabla paciente
-- Tabla paciente_cama
-- Tabla sala


-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Dumping data for table `cama`
--

LOCK TABLES `cama` WRITE;
/*!40000 ALTER TABLE `cama` DISABLE KEYS */;
INSERT INTO `cama` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10);
/*!40000 ALTER TABLE `cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historial_entrada`
--

LOCK TABLES `historial_entrada` WRITE;
/*!40000 ALTER TABLE `historial_entrada` DISABLE KEYS */;
INSERT INTO `historial_entrada` VALUES (1,'2022-10-11','Infarto de Miocardio','2022-10-28',1,1),(2,'2022-10-18','Desprendimiento de Retina','2022-10-21',2,2),(3,'2022-10-26','SÃ­ndrome del Ovario PoliquÃ­stico','2022-10-30',3,3),(4,'2022-05-16','Hernia Discal L4-L5','2022-05-27',4,4),(5,'2022-05-19','Asma','2022-05-24',5,5),(6,'2022-07-04','Tromboembolismo pulmonar','2022-07-22',6,6),(7,'2022-07-09','SÃ­ndrome de Stevens-Johnson','2022-07-20',7,7),(8,'2022-11-18','Glaucoma','2022-11-26',8,8),(9,'2022-11-10','Insuficiencia cardÃ­aca','2022-11-23',9,9),(10,'2022-12-04','NeumonÃ­a','2022-12-06',10,10);
/*!40000 ALTER TABLE `historial_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_mÃ©dico`
--

LOCK TABLES `log_mÃ©dico` WRITE;
/*!40000 ALTER TABLE `log_mÃ©dico` DISABLE KEYS */;
INSERT INTO `log_mÃ©dico` VALUES ('root@localhost','2023-03-09','01:59:32','Insert',1),('root@localhost','2023-03-09','01:59:32','Update',1),('root@localhost','2023-03-09','01:59:32','Delete',1),('root@localhost','2023-03-13','00:51:11','Insert',1),('root@localhost','2023-03-13','00:51:11','Insert',1),('root@localhost','2023-03-13','00:51:11','Insert',1),('root@localhost','2023-03-13','00:51:11','Insert',1),('root@localhost','2023-03-13','00:51:11','Insert',1),('root@localhost','2023-03-13','00:54:45','Delete',1),('root@localhost','2023-03-13','00:54:45','Delete',1),('root@localhost','2023-03-13','00:54:45','Delete',1),('root@localhost','2023-03-13','00:54:45','Delete',1),('root@localhost','2023-03-13','00:54:45','Delete',1);
/*!40000 ALTER TABLE `log_mÃ©dico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_paciente`
--

LOCK TABLES `log_paciente` WRITE;
/*!40000 ALTER TABLE `log_paciente` DISABLE KEYS */;
INSERT INTO `log_paciente` VALUES ('root@localhost','2023-03-09','01:59:19','Insert',1),('root@localhost','2023-03-09','01:59:19','Delete',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:46:37','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-09','01:59:19','Insert',1),('root@localhost','2023-03-09','01:59:19','Delete',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:46:37','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-09','01:59:19','Insert',1),('root@localhost','2023-03-09','01:59:19','Delete',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:01:32','Insert',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:05:01','Delete',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:06:09','Insert',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:09:55','Delete',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','22:11:26','Insert',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:12','Delete',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:21:47','Insert',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:45:51','Delete',1),('root@localhost','2023-03-12','23:46:37','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:46:38','Insert',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:55:34','Delete',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-12','23:59:08','Insert',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:00:06','Delete',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1),('root@localhost','2023-03-13','00:01:29','Insert',1);
/*!40000 ALTER TABLE `log_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mÃ©dico`
--

LOCK TABLES `mÃ©dico` WRITE;
/*!40000 ALTER TABLE `mÃ©dico` DISABLE KEYS */;
INSERT INTO `mÃ©dico` VALUES (1,'Ana MarÃ­a','Lopez Alonso','JosÃ© MarÃ­a Bedoya','BÂ° Alta CÃ³rdoba','+ 549 11-4444-4444','CardiologÃ­a'),(2,'JosÃ© RodrÃ­guez','Ãlvarez','DeÃ¡n Funes','BÂ° Alto Alberdi','+ 549 11-5555-5555','OftalmologÃ­a'),(3,'MarÃ­a Lourdes','Da Costa PÃ©rez','Gral. RomÃ¡n Deheza','BÂ° Gral Paz','+ 549 11-3333-3333','EndocrinologÃ­a'),(4,'Juan Carlos','Soler MartÃ­nez','Gabriela Mistral','BÂ° Parque','+549 11-2222-2222','TraumatologÃ­a'),(5,'RocÃ­o','GÃ³mez Bueno','Obispo Salguero','BÂ° Nueva CÃ³rdoba','+ 549 11-1111-1111','PediatrÃ­a'),(6,'Mario Alejandro','MuÃ±oz RodrÃ­guez','FÃ©lix FrÃ­as','BÂ° JardÃ­n','+ 549 11-9999-9999','CardiologÃ­a'),(7,'Daniela Elizabeth','HernÃ¡ndez DÃ­az','San Luis','BÂ° Alto Alberdi','+ 549 11-7777-7777','DermatologÃ­a'),(8,'Alejandro JosÃ©','MartÃ­nez SÃ¡nchez','Juan B. Justo','BÂ° Nueva CÃ³rdoba','+ 549 11-8888-8888','OftalmologÃ­a'),(9,'Laura SofÃ­a','LÃ³pez GÃ³mez','9 de Julio','BÂ° Gral Paz','+ 549 11-6666-6666','CardiologÃ­a'),(10,'Sergio Eduardo','Moreno RuÃ­z','San JerÃ³nimo','BÂ° Nueva CÃ³rdoba','+ 549 11-0000-0000','PediatrÃ­a');
/*!40000 ALTER TABLE `mÃ©dico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Elena','GonzÃ¡lez DurÃ¡n','98.765.432','1979-03-14'),(2,'Luis Alberto','SÃ¡nchez','12.345.678','1960-07-23'),(3,'MarÃ­a Paz','RuÃ­z HernÃ¡ndez','87.654.321','1993-02-25'),(4,'Cristian Manuel','DÃ­az Ortiz','23.456.789','2016-09-07'),(5,'Melina Daniela','LÃ³pez GarcÃ­a','98.761.234','1980-11-12'),(6,'Diego Fernando','MartÃ­n Morales','34.567.890','1986-08-04'),(7,'Gabriela Valentina','Flores VÃ¡zquez','45.678.901','1975-06-09'),(8,'TomÃ¡s AgustÃ­n','Aguilar Ortiz','78.901.234','1997-05-19'),(9,'MÃ³nica Victoria','Torres Navarro','56.789.012','1968-01-29'),(10,'Bruno Emiliano','Cruz JimÃ©nez','90.123.456','2019-04-16'),(11,'Luciana Soledad','GarcÃ­a GonzÃ¡lez','67.890.123','1985-09-10'),(12,'Pablo Ariel','HernÃ¡ndez Ortiz','78.901.234','1970-11-20'),(13,'Carolina Fernanda','GÃ³mez Torres','89.012.345','1995-12-30'),(14,'Juan Carlos','MartÃ­nez RodrÃ­guez','90.123.456','2000-01-11'),(15,'Ana BelÃ©n','LÃ³pez GarcÃ­a','12.345.678','1978-02-22'),(16,'Roberto Luis','SÃ¡nchez PÃ©rez','43.210.987','1983-03-03'),(17,'Marcela Andrea','GonzÃ¡lez HernÃ¡ndez','56.789.012','1965-04-14'),(18,'Gustavo Adolfo','RuÃ­z GÃ³mez','98.765.432','1991-05-25');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paciente_cama`
--

LOCK TABLES `paciente_cama` WRITE;
/*!40000 ALTER TABLE `paciente_cama` DISABLE KEYS */;
INSERT INTO `paciente_cama` VALUES (1,'2022-10-11',1,1),(2,'2022-10-18',2,2),(3,'2022-10-26',3,3),(4,'2022-05-16',4,4),(5,'2022-05-19',5,5),(6,'2022-07-04',6,6),(7,'2022-07-09',7,7),(8,'2022-11-18',8,8),(9,'2022-11-10',9,9),(10,'2022-12-04',10,10);
/*!40000 ALTER TABLE `paciente_cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'Salvador Mazza',1,1),(2,'Salvador Mazza',2,2),(3,'Salvador Mazza',3,3),(4,'Salvador Mazza',4,4),(5,'Salvador Mazza',5,5),(6,'Florencio Fiorini',1,6),(7,'Florencio Fiorini',2,7),(8,'Florencio Fiorini',3,8),(9,'Florencio Fiorini',4,9),(10,'Florencio Fiorini',5,10);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 14:25:44