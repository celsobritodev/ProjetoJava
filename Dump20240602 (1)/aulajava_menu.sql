-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: aulajava
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `idMenu` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `exibir` int NOT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Inicio','index.jsp','',1),(2,'Perfis','listar_perfil.jsp','',1),(3,'Menus','listar_menu.jsp','',1),(4,'Cadastrar Perfil','form_perfil.jsp','',2),(5,'Alterar Perfil','gerenciar_perfil.do?acao=alterar',' ',2),(6,'Deletar Perfil','gerenciar_perfil.do?acao=deletar',' ',2),(7,'Acessos','gerenciar_menu_perfil.do?acao=gerenciar',' ',2),(8,'Formulario Menu Perfil','form_menu_perfil.jsp',' ',2),(9,'Usuarios','listar_usuario.jsp',' ',1),(10,'Cadastrar Menu','form_menu.jsp',' ',2),(11,'Produtos','listar_produto.jsp','',1),(12,'Cadastrar Produto','form_produto.jsp','',2),(13,'Alterar Produto','gerenciar_produto.do?acao=alterar','',2),(14,'Deletar Produto','gerenciar_produto.do?acao=deletar','',2),(15,'Alterar Menu','gerenciar_menu.do?acao=alterar','',2),(16,'Clientes','listar_cliente.jsp','',1),(17,'Cadastrar Cliente','form_cliente.jsp','',2),(18,'Alterar Cliente','gerenciar_cliente.do?acao=alterar','',2),(19,'Deletar Cliente','gerenciar_cliente.do?acao=deletar','',2),(20,'Realizar Venda','form_venda.jsp?acao=novo','',2),(21,'Continuar Vendendo JSP','form_venda.jsp?acao=c','',2),(22,'Finalizar Venda JSP','form_finalizar_venda.jsp','',2),(23,'Vendas','listar_venda.jsp','',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 16:06:37
