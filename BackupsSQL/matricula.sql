-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: matricula
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `Aluno`
--

DROP TABLE IF EXISTS `Aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aluno` (
  `email` varchar(100) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `matricula` int NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno`
--

LOCK TABLES `Aluno` WRITE;
/*!40000 ALTER TABLE `Aluno` DISABLE KEYS */;
INSERT INTO `Aluno` VALUES ('kauan@gmail.com','Kauan Oliveira Freitas',123456789);
/*!40000 ALTER TABLE `Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplina`
--

DROP TABLE IF EXISTS `Disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disciplina` (
  `CargaHoraria` int NOT NULL,
  `Cod` int NOT NULL,
  `Semestre` int NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `SIAPE` varchar(7) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `SIAPE` (`SIAPE`),
  CONSTRAINT `Disciplina_ibfk_1` FOREIGN KEY (`SIAPE`) REFERENCES `Professor` (`SIAPE`),
  CONSTRAINT `Disciplina_chk_1` CHECK ((`Semestre` < 6)),
  CONSTRAINT `Disciplina_chk_2` CHECK ((`CargaHoraria` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplina`
--

LOCK TABLES `Disciplina` WRITE;
/*!40000 ALTER TABLE `Disciplina` DISABLE KEYS */;
INSERT INTO `Disciplina` VALUES (60,101,1,'Matemtica I','1001'),(80,102,1,'Introduo  Programao','1002'),(60,103,1,'Fsica I','1003'),(80,201,2,'Algoritmos','1002'),(80,202,2,'Estruturas de Dados','1004'),(60,203,2,'Matemtica II','1001'),(80,301,3,'Banco de Dados','1005'),(60,302,3,'Redes de Computadores','1003'),(80,303,3,'Sistemas Operacionais','1004'),(80,401,4,'Programao Orientada a Objetos','1002'),(60,402,4,'Engenharia de Software','1005'),(60,403,4,'Segurana da Informao','1003'),(60,501,5,'Inteligncia Artificial','1001'),(80,502,5,'Computao em Nuvem','1005'),(80,503,5,'Projeto de Sistemas','1004');
/*!40000 ALTER TABLE `Disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faz`
--

DROP TABLE IF EXISTS `faz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faz` (
  `Estado` varchar(10) NOT NULL,
  `matricula` int NOT NULL,
  `Cod` int NOT NULL,
  PRIMARY KEY (`matricula`,`Cod`),
  KEY `Cod` (`Cod`),
  CONSTRAINT `faz_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `Aluno` (`matricula`),
  CONSTRAINT `faz_ibfk_2` FOREIGN KEY (`Cod`) REFERENCES `Disciplina` (`Cod`),
  CONSTRAINT `faz_chk_1` CHECK (((`Estado` = _latin1'Cursando') or (`Estado` = _latin1'Concluido') or (`Estado` = _latin1'Trancado') or (`Estado` = _latin1'Reprovado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faz`
--

LOCK TABLES `faz` WRITE;
/*!40000 ALTER TABLE `faz` DISABLE KEYS */;
INSERT INTO `faz` VALUES ('Concluido',123456789,101),('Concluido',123456789,102),('Concluido',123456789,103),('Concluido',123456789,201),('Concluido',123456789,202),('Concluido',123456789,203),('Cursando',123456789,301),('Cursando',123456789,302),('Cursando',123456789,303),('Cursando',123456789,401);
/*!40000 ALTER TABLE `faz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PreRequisito`
--

DROP TABLE IF EXISTS `PreRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PreRequisito` (
  `Cod` int NOT NULL,
  `PreRequisitoCod` int NOT NULL,
  PRIMARY KEY (`Cod`,`PreRequisitoCod`),
  KEY `PreRequisitoCod` (`PreRequisitoCod`),
  CONSTRAINT `PreRequisito_ibfk_1` FOREIGN KEY (`Cod`) REFERENCES `Disciplina` (`Cod`),
  CONSTRAINT `PreRequisito_ibfk_2` FOREIGN KEY (`PreRequisitoCod`) REFERENCES `Disciplina` (`Cod`),
  CONSTRAINT `PreRequisito_chk_1` CHECK ((`PreRequisitoCod` <> `Cod`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PreRequisito`
--

LOCK TABLES `PreRequisito` WRITE;
/*!40000 ALTER TABLE `PreRequisito` DISABLE KEYS */;
INSERT INTO `PreRequisito` VALUES (203,101),(201,102),(302,103),(401,201),(301,202),(303,202),(401,203),(501,203),(502,302),(403,303),(503,303),(501,402),(503,402);
/*!40000 ALTER TABLE `PreRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Professor` (
  `TempoDeCasa` date NOT NULL,
  `SIAPE` varchar(7) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`SIAPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
INSERT INTO `Professor` VALUES ('2015-03-10','1001','Maria Luz'),('2012-07-01','1002','Carlos Eduardo Silva'),('2018-11-23','1003','Fernanda Costa'),('2014-05-15','1004','Joao Pedro Almeida'),('2016-09-30','1005','Mariana Goncalves');
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 15:55:38
