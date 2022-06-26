CREATE DATABASE  IF NOT EXISTS `jarvis2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jarvis2`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jarvis2
-- ------------------------------------------------------
-- Server version	5.6.48-log

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
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id_u` int(11) NOT NULL,
  `id_domicile` int(11) NOT NULL DEFAULT '0',
  `prenom_u` varchar(45) DEFAULT NULL,
  `nom_u` varchar(45) DEFAULT NULL,
  `date_de_naissance_u` date DEFAULT NULL,
  `email_u` varchar(45) DEFAULT NULL,
  `sexe_u` varchar(1) DEFAULT NULL,
  `mdp_u` varchar(10) DEFAULT NULL,
  `lien_parente` int(1) DEFAULT '3',
  PRIMARY KEY (`id_u`,`id_domicile`),
  KEY `fk_utilisateur_domicile_idx` (`id_domicile`),
  CONSTRAINT `fk_utilsateur_domicile` FOREIGN KEY (`id_domicile`) REFERENCES `domicile` (`id_domicile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,5,'Toki anthonio','RABOBA','1994-02-13','t@gmail.com','M','0000',2),(12,0,'0','CLAIRE','1995-05-28','m@c.com','F','456',0),(12,1,'Marie','JEANNE','1999-05-28','m@j.com','F','sdfd',0),(44,2,'','FFFFF','1994-05-09','fff','M','ret5r9t5',0),(45,2,'Didi','FRANCOIS','1992-05-14','d@f.com','M','45e',1),(58,4,'Koto','BABA','1999-03-28','b@k.org','M','foifo',0),(60,8,'Fily','BERT','1980-11-08','f@b.is','M','erz888',0),(77,8,'Boba','MAN','1994-05-25','b@m.man','M','456sd',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jarvis2`.`utilisateur_BEFORE_INSERT_1` 
BEFORE INSERT ON `utilisateur` FOR EACH ROW
BEGIN
SET new.nom_u = upper(new.nom_u);

SET new.prenom_u = concat(
upper (left(new.prenom_u,1)) ,
lower (substring(new.prenom_u,2)) 
 );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jarvis2`.`utilisateur_AFTER_INSERT`
AFTER INSERT ON `utilisateur` FOR EACH ROW
case
when (new.lien_parente = 0) then
begin
insert into
  membre (Utilisateur_id_u, lien_parente)
  values (new.id_u, new.lien_parente);
end;
when (new.lien_parente = 1) then
begin
insert into
  `co-proprietaire` (Utilisateur_id_u, lien_parente)
  values (new.id_u, new.lien_parente);
end;
when (new.lien_parente = 2) then
begin
insert into
  `proprietaire` (Utilisateur_id_u, lien_parente)
  values (new.id_u, new.lien_parente);
end;
end case */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-26 21:02:38
