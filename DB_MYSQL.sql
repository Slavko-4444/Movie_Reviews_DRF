-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: imbd_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add director',7,'add_director'),(26,'Can change director',7,'change_director'),(27,'Can delete director',7,'delete_director'),(28,'Can view director',7,'view_director'),(29,'Can add Actor',8,'add_actor'),(30,'Can change Actor',8,'change_actor'),(31,'Can delete Actor',8,'delete_actor'),(32,'Can view Actor',8,'view_actor'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add movie',10,'add_movie'),(38,'Can change movie',10,'change_movie'),(39,'Can delete movie',10,'delete_movie'),(40,'Can view movie',10,'view_movie'),(41,'Can add series',11,'add_series'),(42,'Can change series',11,'change_series'),(43,'Can delete series',11,'delete_series'),(44,'Can view series',11,'view_series'),(45,'Can add favorite',12,'add_favorite'),(46,'Can change favorite',12,'change_favorite'),(47,'Can delete favorite',12,'delete_favorite'),(48,'Can view favorite',12,'view_favorite'),(49,'Can add rating se',13,'add_ratingse'),(50,'Can change rating se',13,'change_ratingse'),(51,'Can delete rating se',13,'delete_ratingse'),(52,'Can view rating se',13,'view_ratingse'),(53,'Can add rating mv',14,'add_ratingmv'),(54,'Can change rating mv',14,'change_ratingmv'),(55,'Can delete rating mv',14,'delete_ratingmv'),(56,'Can view rating mv',14,'view_ratingmv'),(57,'Can add comment mv',15,'add_commentmv'),(58,'Can change comment mv',15,'change_commentmv'),(59,'Can delete comment mv',15,'delete_commentmv'),(60,'Can view comment mv',15,'view_commentmv'),(61,'Can add comment se',16,'add_commentse'),(62,'Can change comment se',16,'change_commentse'),(63,'Can delete comment se',16,'delete_commentse'),(64,'Can view comment se',16,'view_commentse'),(65,'Can add genre',17,'add_genre'),(66,'Can change genre',17,'change_genre'),(67,'Can delete genre',17,'delete_genre'),(68,'Can view genre',17,'view_genre');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$AK8qUovTnxNl13G1wBMhXO$yhB5FYvZpC7XslBUOT/+fwWnGQlo3CknKyjfpwlXHKw=','2024-04-23 23:00:40.287302',1,'slavko','','','sosicslavko8@gmail.com',1,1,'2024-04-08 12:07:42.450253'),(5,'pbkdf2_sha256$720000$tijUFqyCw7wzoVxRfUea7r$iMnZYq0enZRfF9FwRe98c4rUPX4MHJhyfc0cSheb3l8=',NULL,0,'mica','','','mica@gmail.com',0,1,'2024-04-09 09:20:24.893099'),(22,'pbkdf2_sha256$720000$Sn1VScsK2UIKUMnDuPcox2$FoDfGe4ruwO7y5DTEULc1KZ7m1AWIJ7GHBoe8U9k304=',NULL,0,'milos','','','milos@gmail.com',0,1,'2024-04-19 09:00:39.535792'),(23,'pbkdf2_sha256$720000$oyLPqO8K8fRRbCEqTRQEip$bLxbvBAy8mWhS2nNyPvbC65Mo1lGCooesP9HGzS+bxE=',NULL,0,'luka','','','luka@gmail.com',0,1,'2024-04-25 08:05:52.032630'),(24,'pbkdf2_sha256$720000$oFREjAsPIuypnj0dOX8VCA$ly00rHnaFvbLpkFYAMeNkRxmEuX3kqlIxEZ+J6evJRo=',NULL,0,'marko123','','','marko1@gmail.com',0,1,'2024-04-25 10:04:09.049597');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_commentmv`
--

DROP TABLE IF EXISTS `comment_commentmv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_commentmv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `comment_commentmv_movie_id_5d7ed146_fk_show_movie_id` (`movie_id`),
  KEY `comment_commentmv_user_id_6d8e747b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_commentmv_movie_id_5d7ed146_fk_show_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `show_movie` (`id`),
  CONSTRAINT `comment_commentmv_user_id_6d8e747b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_commentmv`
--

LOCK TABLES `comment_commentmv` WRITE;
/*!40000 ALTER TABLE `comment_commentmv` DISABLE KEYS */;
INSERT INTO `comment_commentmv` VALUES (1,'2024-04-11 12:33:33.641051',1,5,'Sve super'),(2,'2024-04-11 13:05:02.068308',1,1,'asdfsdafsda'),(3,'2024-04-11 13:05:24.122131',1,1,'Jos jednom,'),(4,'2024-04-11 13:46:09.808176',1,5,'Vero dignissimos sequi enim repellat illum consequuntur laborum.'),(5,'2024-04-11 13:46:52.595695',1,5,'Sit quidem nesciunt.'),(6,'2024-04-11 13:46:53.623986',1,5,'Repudiandae maiores quas nisi saepe sequi totam.'),(7,'2024-04-22 13:43:18.184838',1,5,'Qui perferendis consequatur commodi architecto provident numquam ipsum reiciendis mollitia.'),(8,'2024-04-22 13:46:03.522441',1,5,'Est reprehenderit blanditiis officiis.'),(9,'2024-04-22 13:46:36.174350',1,5,'Aut fugit id provident facilis dolorum perspiciatis.'),(10,'2024-04-22 13:57:52.047848',1,1,'Aut soluta iste possimus.'),(11,'2024-04-22 17:01:18.348387',2,1,'Nikola Kojo je odlicno iznio ovu ulogu!!! sve pohvale'),(12,'2024-04-22 17:03:55.488418',3,1,'Heard about the guy who fell off a skyscraper? On his way down past each floor, he kept saying to reassure himself: So far so good... so far so good... so far so good. How you fall doesn\'t matter. It\'s how you land!'),(14,'2024-04-25 09:17:12.756800',1,1,'Sjajan film!'),(15,'2024-04-25 09:17:55.662759',1,1,'Nije lose....'),(16,'2024-04-25 09:18:26.338427',29,1,'Sjajan film'),(17,'2024-04-25 09:18:39.931159',29,1,'Ipak sam se predomislio'),(18,'2024-04-25 10:07:00.363227',29,24,'odlicno');
/*!40000 ALTER TABLE `comment_commentmv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_commentse`
--

DROP TABLE IF EXISTS `comment_commentse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_commentse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `series_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_commentse_series_id_470884be_fk_show_series_id` (`series_id`),
  KEY `comment_commentse_user_id_ac70233a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_commentse_series_id_470884be_fk_show_series_id` FOREIGN KEY (`series_id`) REFERENCES `show_series` (`id`),
  CONSTRAINT `comment_commentse_user_id_ac70233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_commentse`
--

LOCK TABLES `comment_commentse` WRITE;
/*!40000 ALTER TABLE `comment_commentse` DISABLE KEYS */;
INSERT INTO `comment_commentse` VALUES (1,'Idemoo nis','2024-04-11 13:08:23.311531',1,1),(2,'Jos jednom','2024-04-11 13:08:37.657715',1,1),(3,'zaista su odlicnee','2024-04-11 13:08:48.395749',1,5),(4,'Ovoo je moj graaad!','2024-04-11 13:13:07.203205',1,5),(5,'Ipak je serija odlicna!','2024-04-11 13:20:44.134482',1,5),(6,'Ili ipak ne!','2024-04-11 13:20:53.889395',1,5),(7,'Quidem aspernatur a nam.','2024-04-11 13:21:25.829611',1,1),(8,'Ipsum nisi aliquam qui dolorum non molestiae laboriosam fugit.','2024-04-11 13:22:14.688557',1,1),(9,'Dolorum similique at est molestias distinctio.','2024-04-11 13:22:20.064525',1,1),(10,'Za sada najbolji koji sam gledao','2024-04-22 14:53:56.200662',2,1),(11,'Odlican je','2024-04-23 07:51:54.219805',4,1),(12,'Najboljaa serija do sada!!!','2024-04-25 08:13:32.853991',4,23);
/*!40000 ALTER TABLE `comment_commentse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-08 12:58:13.927826','1','Rados',1,'[{\"added\": {}}]',7,1),(2,'2024-04-08 12:58:35.485060','2','Marko',1,'[{\"added\": {}}]',7,1),(3,'2024-04-08 12:59:19.164452','3','Janko',1,'[{\"added\": {}}]',7,1),(4,'2024-04-08 13:09:59.890166','4','Vuk Kostic',1,'[{\"added\": {}}]',8,1),(5,'2024-04-08 13:11:27.096428','5','Aleksandar Bercek',1,'[{\"added\": {}}]',8,1),(6,'2024-04-08 14:13:05.925725','1','slavkososic sosicslavko8@gmail.com',1,'[{\"added\": {}}]',9,1),(7,'2024-04-08 17:37:44.396241','1','sosicslavko8@gmail.com',3,'',9,1),(8,'2024-04-08 17:46:55.167854','2','slavko@gmail.com',3,'',9,1),(9,'2024-04-08 17:47:58.411212','3','slavko@gmail.com',3,'',9,1),(10,'2024-04-08 17:49:09.280701','4','slavko@gmail.com',3,'',9,1),(11,'2024-04-08 17:53:45.991014','5','slavko@gmail.com',3,'',9,1),(12,'2024-04-09 08:07:55.893633','6','slavko@gmail.com',3,'',9,1),(13,'2024-04-09 08:30:49.199345','3','milos',1,'[{\"added\": {}}]',4,1),(14,'2024-04-09 09:05:40.036483','3','milos',3,'',4,1),(15,'2024-04-09 09:19:20.129700','4','mica',3,'',4,1),(16,'2024-04-09 10:11:35.098610','5','Aleksandar Bercek',3,'',7,1),(17,'2024-04-09 10:11:35.110944','4','Rados Bajic',3,'',7,1),(18,'2024-04-09 10:11:35.128641','3','Janko Jankovic',3,'',7,1),(19,'2024-04-09 10:11:35.148765','2','Marko Markovic',3,'',7,1),(20,'2024-04-09 10:11:35.163540','1','Rados Bajic',3,'',7,1),(21,'2024-04-10 07:21:46.313407','2','Movie object (2)',1,'[{\"added\": {}}]',10,1),(22,'2024-04-10 10:03:11.136635','6','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(23,'2024-04-10 10:03:11.140097','5','slavko likes aut aut enim - 1999-09-18',3,'',12,1),(24,'2024-04-10 10:03:11.142417','4','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(25,'2024-04-10 11:39:16.266120','9','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(26,'2024-04-10 11:39:16.288494','8','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(27,'2024-04-10 11:39:16.300325','7','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(28,'2024-04-10 11:55:41.895781','3','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(29,'2024-04-10 11:55:41.909198','2','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(30,'2024-04-10 11:55:41.920474','1','slavko likes Ko to tamo peva - 2024-04-09',3,'',12,1),(31,'2024-04-11 10:18:33.959904','1','Movie 5',1,'[{\"added\": {}}]',14,1),(32,'2024-04-11 10:18:50.417170','2','Movie 8',1,'[{\"added\": {}}]',14,1),(33,'2024-04-11 10:19:00.901309','3','Movie 9',1,'[{\"added\": {}}]',14,1),(34,'2024-04-11 10:58:51.103541','3','Movie 9',3,'',14,1),(35,'2024-04-11 10:58:51.112500','2','Movie 8',3,'',14,1),(36,'2024-04-11 10:58:51.114799','1','Movie 5',3,'',14,1),(37,'2024-04-11 11:09:52.873261','4','Movie 6',1,'[{\"added\": {}}]',14,1),(38,'2024-04-11 11:12:55.568883','4','Movie 6',3,'',14,1),(39,'2024-04-11 11:18:46.628439','5','Movie 5',1,'[{\"added\": {}}]',14,1),(40,'2024-04-11 12:33:33.642022','1','CommentMV object (1)',1,'[{\"added\": {}}]',15,1),(41,'2024-04-12 12:26:26.763884','1','Genre object (1)',1,'[{\"added\": {}}]',17,1),(42,'2024-04-15 14:35:32.778523','6','nikola',3,'',4,1),(43,'2024-04-15 14:35:32.787450','7','nikolaaa',3,'',4,1),(44,'2024-04-15 18:15:40.143087','8','nikolaaa1z',3,'',4,1),(45,'2024-04-15 18:36:41.524310','9','jokic12',3,'',4,1),(46,'2024-04-15 18:38:07.789292','10','jokic12',3,'',4,1),(47,'2024-04-15 18:39:18.513478','11','jokic12',3,'',4,1),(48,'2024-04-15 18:40:55.560447','12','jokic12',3,'',4,1),(49,'2024-04-15 18:42:48.688172','13','jokic12',3,'',4,1),(50,'2024-04-15 18:43:21.744680','14','jokic12',3,'',4,1),(51,'2024-04-15 19:21:00.981282','15','jokic12',3,'',4,1),(52,'2024-04-15 19:21:00.992793','16','jokic12aa',3,'',4,1),(53,'2024-04-15 19:21:48.281302','17','asdfadsfsdf',3,'',4,1),(54,'2024-04-15 19:54:52.461771','18','milos',3,'',4,1),(55,'2024-04-16 07:16:38.751146','19','markoni',3,'',4,1),(56,'2024-04-16 09:19:27.050173','2','Genre object (2)',1,'[{\"added\": {}}]',17,1),(57,'2024-04-16 09:19:32.730482','1','Ko to tamo peva - 2024-04-09',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',10,1),(58,'2024-04-16 09:26:17.495978','1','Ko to tamo peva - 2024-04-09',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',10,1),(59,'2024-04-16 09:26:39.878404','1','Ko to tamo peva - 2024-04-09',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',10,1),(60,'2024-04-16 11:26:16.049551','4','aut aut enim - 2024-04-18',2,'[{\"changed\": {\"fields\": [\"Director\", \"Date of release\", \"Genre\"]}}]',11,1),(61,'2024-04-16 11:39:58.342636','3','Treiler',1,'[{\"added\": {}}]',17,1),(62,'2024-04-16 11:40:00.704991','3','minus ab doloremque - 2020-03-13',2,'[{\"changed\": {\"fields\": [\"Director\", \"Date of release\", \"Genre\"]}}]',11,1),(63,'2024-04-16 11:40:24.097954','2','quo possimus sit - 2000-08-15',2,'[{\"changed\": {\"fields\": [\"Director\", \"Date of release\", \"Genre\"]}}]',11,1),(64,'2024-04-16 11:40:50.102553','1','doloremque aut natus - 2001-07-15',2,'[{\"changed\": {\"fields\": [\"Director\", \"Date of release\", \"Genre\"]}}]',11,1),(65,'2024-04-16 12:05:53.804402','3','La Haine - 1995-01-18',2,'[{\"changed\": {\"fields\": [\"Title\", \"Date of release\", \"Description\", \"Genre\"]}}]',10,1),(66,'2024-04-16 12:06:20.841926','4','The Wire - 2004-04-18',2,'[{\"changed\": {\"fields\": [\"Title\", \"Date of release\"]}}]',11,1),(67,'2024-04-16 12:06:36.912423','3','Sopranos - 2020-03-13',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',11,1),(68,'2024-04-16 14:11:18.342438','2','4 Covek - 2024-04-10',2,'[{\"changed\": {\"fields\": [\"Photo url\", \"Genre\"]}}]',10,1),(69,'2024-04-16 14:22:46.859559','3','La Haine - 1995-01-18',2,'[{\"changed\": {\"fields\": [\"Photo url\"]}}]',10,1),(70,'2024-04-16 14:23:23.172918','4','Comedy',1,'[{\"added\": {}}]',17,1),(71,'2024-04-16 14:23:30.510968','1','Ko to tamo peva - 2024-04-09',2,'[{\"changed\": {\"fields\": [\"Photo url\", \"Genre\"]}}]',10,1),(72,'2024-04-16 14:24:46.505492','4','Once upon a time in America - 2000-09-18',2,'[{\"changed\": {\"fields\": [\"Title\", \"Photo url\", \"Genre\"]}}]',10,1),(73,'2024-04-16 14:41:56.970988','1','Brad Pitt',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Image\"]}}]',8,1),(74,'2024-04-17 09:36:44.359792','1','Series 5',2,'[]',13,1),(75,'2024-04-17 09:36:58.882281','2','Series 8',1,'[{\"added\": {}}]',13,1),(76,'2024-04-17 13:29:40.982638','3','Sopranos - 2020-03-13',2,'[{\"changed\": {\"fields\": [\"Photo url\"]}}]',11,1),(77,'2024-04-17 13:31:05.816798','4','The Wire - 2004-04-18',2,'[{\"changed\": {\"fields\": [\"Photo url\", \"Description\"]}}]',11,1),(78,'2024-04-17 13:32:27.046238','2','Moj rodjak sa sela - 2008-08-15',2,'[{\"changed\": {\"fields\": [\"Title\", \"Photo url\", \"Date of release\", \"Description\"]}}]',11,1),(79,'2024-04-17 13:34:14.822341','1','prison break - 2001-07-15',2,'[{\"changed\": {\"fields\": [\"Title\", \"Photo url\", \"Description\", \"Genre\"]}}]',11,1),(80,'2024-04-17 13:47:29.367627','20','boro',3,'',4,1),(81,'2024-04-18 07:25:35.738713','4','Stanley Kubrick',1,'[{\"added\": {}}]',7,1),(82,'2024-04-18 11:39:40.109693','3','La Haine - 2024-04-18',2,'[{\"changed\": {\"fields\": [\"Date of release\"]}}]',10,1),(83,'2024-04-18 11:40:09.562227','4','The Wire - 2024-04-18',2,'[{\"changed\": {\"fields\": [\"Date of release\"]}}]',11,1),(84,'2024-04-18 11:40:19.521402','1','prison break - 2024-04-18',2,'[{\"changed\": {\"fields\": [\"Date of release\"]}}]',11,1),(85,'2024-04-18 11:40:28.438185','2','Moj rodjak sa sela - 2024-04-18',2,'[{\"changed\": {\"fields\": [\"Date of release\"]}}]',11,1),(86,'2024-04-18 14:42:11.591614','2','Steven Spielberg',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Biography\", \"Nationality\", \"Image\"]}}]',7,1),(87,'2024-04-18 14:45:52.381093','1','Ken Loach',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Biography\", \"Nationality\", \"Birth date\", \"Image\"]}}]',7,1),(88,'2024-04-19 07:09:08.366704','2','Steven Spielberg',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(89,'2024-04-19 07:13:11.833731','1','Ken Loach',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(90,'2024-04-19 07:39:58.850046','1','Brad Pitt',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(91,'2024-04-19 07:40:58.941477','1','Brad Pitt',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(92,'2024-04-19 07:43:43.498532','1','Brad Pitt',2,'[{\"changed\": {\"fields\": [\"Biography\", \"Nationality\"]}}]',8,1),(93,'2024-04-19 09:00:06.708966','21','marko',3,'',4,1),(94,'2024-04-19 11:55:50.805815','5','Eyes Wide Shut - 1998-10-10;5',1,'[{\"added\": {}}]',10,1),(95,'2024-04-19 11:58:01.432196','6','Bread and Roses - 2000-12-15;6',1,'[{\"added\": {}}]',10,1),(96,'2024-04-23 23:01:50.444910','7','Proba 1 - 2024-04-17;7',1,'[{\"added\": {}}]',10,1),(97,'2024-04-24 07:30:37.880136','8','Slavklo proba - 2024-04-02;8',1,'[{\"added\": {}}]',10,1),(98,'2024-04-24 07:54:35.454840','9','Proba - 2024-04-15;9',1,'[{\"added\": {}}]',10,1),(99,'2024-04-24 15:09:48.131255','12','asd - 2024-04-02;12',3,'',10,1),(100,'2024-04-24 15:09:48.139226','11','asd - 2024-04-02;11',3,'',10,1),(101,'2024-04-24 15:09:48.141720','10','asd - 2024-04-02;10',3,'',10,1),(102,'2024-04-24 21:56:07.282760','5','Series 9',3,'',13,1),(103,'2024-04-24 21:56:07.298508','4','Series 10',3,'',13,1),(104,'2024-04-24 21:56:07.302689','3','Series 7',3,'',13,1),(105,'2024-04-24 21:56:07.305319','2','Series 8',3,'',13,1),(106,'2024-04-24 21:56:07.307197','1','Series 5',3,'',13,1),(107,'2024-04-24 21:56:21.990643','10','Movie 10',3,'',14,1),(108,'2024-04-24 21:56:22.007986','9','Movie 10',3,'',14,1),(109,'2024-04-24 21:56:22.014721','8','Movie 9',3,'',14,1),(110,'2024-04-24 21:56:22.020744','7','Movie 9',3,'',14,1),(111,'2024-04-24 21:56:22.024943','6','Movie 1',3,'',14,1),(112,'2024-04-24 21:56:22.027889','5','Movie 5',3,'',14,1),(113,'2024-04-24 22:02:27.242339','5','Srdjan Dragojevic',1,'[{\"added\": {}}]',7,1),(114,'2024-04-24 22:03:28.232550','5','Srdjan Dragojevic',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(115,'2024-04-24 22:06:44.553228','6','Sinisa Pavic',1,'[{\"added\": {}}]',7,1),(116,'2024-04-24 22:09:40.509192','3','Nikola Kojo',1,'[{\"added\": {}}]',8,1),(117,'2024-04-24 22:12:00.384037','4','Dragan Bjelogrlic',1,'[{\"added\": {}}]',8,1),(118,'2024-04-24 22:14:58.500436','5','Milorad Mandic',1,'[{\"added\": {}}]',8,1),(119,'2024-04-24 22:17:25.887318','6','Tom Cruise',1,'[{\"added\": {}}]',8,1),(120,'2024-04-24 22:19:34.069405','7','Nicole Kidman',1,'[{\"added\": {}}]',8,1),(121,'2024-04-24 22:22:28.394706','8','Todd Field',1,'[{\"added\": {}}]',8,1),(122,'2024-04-24 22:34:45.066211','5','Eyes Wide Shut - 1998-10-10;5',2,'[{\"changed\": {\"fields\": [\"Actor\", \"Description\", \"Is new\"]}}]',10,1),(123,'2024-04-25 07:32:03.028207','9','Nebojsa Glogovac',1,'[{\"added\": {}}]',8,1),(124,'2024-04-25 07:40:39.823996','10','Danilo Lazovic',1,'[{\"added\": {}}]',8,1),(125,'2024-04-25 07:42:40.862229','11','Branka Katic',1,'[{\"added\": {}}]',8,1),(126,'2024-04-25 07:44:38.830221','12','Srdjan Todorovic',1,'[{\"added\": {}}]',8,1),(127,'2024-04-25 08:32:05.865411','13','Ljubisa Samardzic',1,'[{\"added\": {}}]',8,1),(128,'2024-04-25 08:34:23.781387','14','Bora Todorovic',1,'[{\"added\": {}}]',8,1),(129,'2024-04-25 08:36:24.669232','5','Vruc Vetar - 1980-12-05;5',1,'[{\"added\": {}}]',11,1),(130,'2024-04-25 08:37:57.601824','25','Lepa sela lepo gore! - 1996-02-10;25',2,'[{\"changed\": {\"fields\": [\"Director\", \"Description\"]}}]',10,1),(131,'2024-04-25 08:39:56.590407','1','Ko to tamo peva! - 2024-04-09;1',2,'[{\"changed\": {\"fields\": [\"Director\", \"Actor\"]}}]',10,1),(132,'2024-04-25 08:40:37.102581','2','4 Covek - 2024-04-10;2',2,'[{\"changed\": {\"fields\": [\"Director\", \"Actor\"]}}]',10,1),(133,'2024-04-25 08:40:52.801630','6','Bread and Roses - 2000-12-15;6',2,'[{\"changed\": {\"fields\": [\"Actor\"]}}]',10,1),(134,'2024-04-25 08:41:06.298969','4','Once upon a time in America - 2000-09-18;4',2,'[{\"changed\": {\"fields\": [\"Actor\"]}}]',10,1),(135,'2024-04-25 08:41:37.642256','1','prison break - 2024-04-18;1',2,'[{\"changed\": {\"fields\": [\"Actor\"]}}]',11,1),(136,'2024-04-25 08:42:00.290143','4','The Wire - 2020-04-18;4',2,'[{\"changed\": {\"fields\": [\"Actor\", \"Date of release\"]}}]',11,1),(137,'2024-04-25 08:42:19.161128','2','Moj rodjak sa sela - 2010-04-18;2',2,'[{\"changed\": {\"fields\": [\"Actor\", \"Date of release\"]}}]',11,1),(138,'2024-04-25 08:42:29.519077','3','Sopranos - 2020-03-13;3',2,'[{\"changed\": {\"fields\": [\"Actor\"]}}]',11,1),(139,'2024-04-25 08:42:57.370684','2','4 Covek - 2012-04-10;2',2,'[{\"changed\": {\"fields\": [\"Date of release\"]}}]',10,1),(140,'2024-04-25 08:43:37.834862','3','La Haine - 2000-04-18;3',2,'[{\"changed\": {\"fields\": [\"Actor\", \"Date of release\"]}}]',10,1),(141,'2024-04-25 08:46:32.923762','1','Ko to tamo peva! - 1970-04-09;1',2,'[{\"changed\": {\"fields\": [\"Date of release\"]}}]',10,1),(142,'2024-04-25 09:00:14.695666','1','Ko to tamo peva! - 1970-04-09;1',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',10,1),(143,'2024-04-25 09:04:07.561830','6','Shogun - 2024-04-25;6',1,'[{\"added\": {}}]',11,1),(144,'2024-04-25 09:07:21.443313','7','Vratice se rode! - 2024-04-25;7',1,'[{\"added\": {}}]',11,1),(145,'2024-04-25 09:11:03.661423','8','Fallout - 2024-04-25;8',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(15,'comment','commentmv'),(16,'comment','commentse'),(5,'contenttypes','contenttype'),(12,'favorite','favorite'),(14,'favorite','ratingmv'),(13,'favorite','ratingse'),(6,'sessions','session'),(17,'show','genre'),(10,'show','movie'),(11,'show','series'),(8,'show_worker','actor'),(7,'show_worker','director'),(9,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-08 08:41:48.172245'),(2,'auth','0001_initial','2024-04-08 08:41:50.071128'),(3,'admin','0001_initial','2024-04-08 08:41:50.476665'),(4,'admin','0002_logentry_remove_auto_add','2024-04-08 08:41:50.493907'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-08 08:41:50.512800'),(6,'contenttypes','0002_remove_content_type_name','2024-04-08 08:41:50.742414'),(7,'auth','0002_alter_permission_name_max_length','2024-04-08 08:41:50.951406'),(8,'auth','0003_alter_user_email_max_length','2024-04-08 08:41:51.026251'),(9,'auth','0004_alter_user_username_opts','2024-04-08 08:41:51.071727'),(10,'auth','0005_alter_user_last_login_null','2024-04-08 08:41:51.266163'),(11,'auth','0006_require_contenttypes_0002','2024-04-08 08:41:51.280790'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-08 08:41:51.303912'),(13,'auth','0008_alter_user_username_max_length','2024-04-08 08:41:51.532051'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-08 08:41:51.693227'),(15,'auth','0010_alter_group_name_max_length','2024-04-08 08:41:51.730698'),(16,'auth','0011_update_proxy_permissions','2024-04-08 08:41:51.750395'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-08 08:41:51.936115'),(18,'sessions','0001_initial','2024-04-08 08:41:52.058007'),(21,'user','0001_initial','2024-04-08 14:11:40.899056'),(22,'user','0002_rename_password_hash_user_password','2024-04-09 07:55:29.642923'),(26,'show_worker','0002_actor_alter_director_options','2024-04-09 11:49:57.786547'),(27,'show_worker','0001_initial','2024-04-09 12:19:10.715593'),(28,'show','0001_initial','2024-04-09 13:26:07.063514'),(29,'show','0002_movie_actor_movie_director_series_actor_and_more','2024-04-09 13:38:20.772041'),(42,'show','0003_alter_movie_director_alter_series_director_id','2024-04-11 09:41:07.705270'),(43,'show','0004_rename_director_id_series_director_alter_movie_actor_and_more','2024-04-11 09:41:07.976916'),(44,'show','0005_remove_movie_is_new_remove_series_is_new_and_more','2024-04-11 09:41:08.442184'),(45,'show','0006_movie_is_new_series_is_new','2024-04-11 09:41:38.859489'),(46,'favorite','0001_initial','2024-04-11 09:41:39.441049'),(47,'favorite','0002_ratingmv_ratingse','2024-04-11 10:01:40.171335'),(48,'comment','0001_initial','2024-04-11 12:13:57.714399'),(49,'comment','0002_remove_commentmv_rating_commentmv_content','2024-04-11 12:33:03.022995'),(50,'show','0007_genre_movie_genre','2024-04-12 12:25:19.329040'),(51,'show','0008_series_genre','2024-04-16 11:25:17.783407'),(52,'show','0009_alter_movie_photo_url_alter_series_photo_url','2024-04-16 14:09:35.140982'),(53,'show_worker','0002_actor_image_director_image','2024-04-16 14:09:35.270528');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3a87p30arzxbhgmmnupe042uoubtmzp9','.eJxVjMEOwiAQRP-FsyFdQVg8eu83kIUFqRqalPZk_HdL0oMeZ96beQtP21r81tLiJxZXAeL02wWKz1Q74AfV-yzjXNdlCrIr8qBNjjOn1-1w_w4KtdLX5GBAYjZZE2QGYxkUwaDt2ap8CehwF0wmUCmogHt2ETErzNrFID5f4cY3ug:1rwq82:FfsPGgU4Tc1sxgbaE6K8ytPbimbXJAjuSOohRsCsURg','2024-04-30 21:14:10.189155'),('6wpsg5iu3ied8yspzlkfnol9d8mt9xb2','.eJxVjMEOwiAQRP-FsyFdQVg8eu83kIUFqRqalPZk_HdL0oMeZ96beQtP21r81tLiJxZXAeL02wWKz1Q74AfV-yzjXNdlCrIr8qBNjjOn1-1w_w4KtdLX5GBAYjZZE2QGYxkUwaDt2ap8CehwF0wmUCmogHt2ETErzNrFID5f4cY3ug:1rzP7w:RdfjxrmHB5CVe5N2__UMdW1gMldHpGZDXsQQGyCrROg','2024-05-07 23:00:40.291355'),('jqe1e0s1mdr1f0eo3xxtjp3ejus5ptfp','.eJxVjMEOwiAQRP-FsyFdQVg8eu83kIUFqRqalPZk_HdL0oMeZ96beQtP21r81tLiJxZXAeL02wWKz1Q74AfV-yzjXNdlCrIr8qBNjjOn1-1w_w4KtdLX5GBAYjZZE2QGYxkUwaDt2ap8CehwF0wmUCmogHt2ETErzNrFID5f4cY3ug:1rxiMR:JxKhGvv3tRrmZD1ymS2GOtxezTFqu_jWk1CDthv7g_s','2024-05-03 07:08:39.225066'),('xqiqi8tsyb4rki44t8a17bgmh0rc2sv8','.eJxVjMEOwiAQRP-FsyFdQVg8eu83kIUFqRqalPZk_HdL0oMeZ96beQtP21r81tLiJxZXAeL02wWKz1Q74AfV-yzjXNdlCrIr8qBNjjOn1-1w_w4KtdLX5GBAYjZZE2QGYxkUwaDt2ap8CehwF0wmUCmogHt2ETErzNrFID5f4cY3ug:1ruX1W:ss68beHGwvc3RY3GwrXxhxJ2_yHvpOjREbHdHWiiiyE','2024-04-24 12:25:54.746619');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_favorite`
--

DROP TABLE IF EXISTS `favorite_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint DEFAULT NULL,
  `series_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_favorite_movie_id_cb20588a_fk_show_movie_id` (`movie_id`),
  KEY `favorite_favorite_series_id_853e6f95_fk_show_series_id` (`series_id`),
  KEY `favorite_favorite_user_id_d75a5c08_fk_auth_user_id` (`user_id`),
  CONSTRAINT `favorite_favorite_movie_id_cb20588a_fk_show_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `show_movie` (`id`),
  CONSTRAINT `favorite_favorite_series_id_853e6f95_fk_show_series_id` FOREIGN KEY (`series_id`) REFERENCES `show_series` (`id`),
  CONSTRAINT `favorite_favorite_user_id_d75a5c08_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_favorite`
--

LOCK TABLES `favorite_favorite` WRITE;
/*!40000 ALTER TABLE `favorite_favorite` DISABLE KEYS */;
INSERT INTO `favorite_favorite` VALUES (1,'2024-04-11 11:53:18.652918',1,NULL,5),(2,'2024-04-11 11:53:56.855024',NULL,1,5),(3,'2024-04-16 21:03:16.509587',2,NULL,5),(4,'2024-04-16 21:03:25.389072',NULL,3,5),(5,'2024-04-17 09:36:02.223512',NULL,1,1),(6,'2024-04-17 09:47:49.190267',NULL,3,1),(7,'2024-04-17 09:49:35.119078',NULL,2,1),(8,'2024-04-19 09:02:06.128018',1,NULL,22),(9,'2024-04-24 21:15:06.721572',2,NULL,1),(10,'2024-04-24 21:26:45.633957',3,NULL,5),(11,'2024-04-24 21:27:04.755042',4,NULL,5),(12,'2024-04-24 21:27:38.090968',25,NULL,5),(13,'2024-04-24 21:32:06.654549',NULL,4,5),(14,'2024-04-25 08:11:33.630539',2,NULL,23),(15,'2024-04-25 08:12:26.099692',3,NULL,23),(16,'2024-04-25 09:31:17.265525',29,NULL,5),(17,'2024-04-25 10:06:02.897287',29,NULL,24),(18,'2024-04-25 10:06:19.579427',NULL,1,24);
/*!40000 ALTER TABLE `favorite_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_ratingmv`
--

DROP TABLE IF EXISTS `favorite_ratingmv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_ratingmv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_ratingmv_movie_id_f4ab655a_fk_show_movie_id` (`movie_id`),
  KEY `favorite_ratingmv_user_id_a8f15d13_fk_auth_user_id` (`user_id`),
  CONSTRAINT `favorite_ratingmv_movie_id_f4ab655a_fk_show_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `show_movie` (`id`),
  CONSTRAINT `favorite_ratingmv_user_id_a8f15d13_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_ratingmv`
--

LOCK TABLES `favorite_ratingmv` WRITE;
/*!40000 ALTER TABLE `favorite_ratingmv` DISABLE KEYS */;
INSERT INTO `favorite_ratingmv` VALUES (11,10,'2024-04-24 21:56:35.667610',1,5),(12,8,'2024-04-25 08:06:41.076523',2,23),(13,5,'2024-04-25 08:08:15.093211',1,23),(14,9,'2024-04-25 08:51:14.290617',29,1),(15,10,'2024-04-25 08:51:25.165356',31,1),(16,10,'2024-04-25 08:52:05.722008',1,1),(17,10,'2024-04-25 08:54:54.699715',3,1),(18,6,'2024-04-25 08:58:09.883987',6,1),(19,8,'2024-04-25 08:58:38.069355',4,1),(20,9,'2024-04-25 08:58:45.949367',5,1),(21,7,'2024-04-25 08:58:55.263822',25,1),(22,6,'2024-04-25 08:59:01.266786',27,1),(23,6,'2024-04-25 08:59:08.967356',28,1),(24,4,'2024-04-25 08:59:26.444109',30,1),(25,7,'2024-04-25 09:12:29.519480',2,1),(26,8,'2024-04-25 09:30:24.501477',29,5),(27,9,'2024-04-25 09:31:56.212127',3,5),(28,7,'2024-04-25 09:32:07.351737',30,5),(29,9,'2024-04-25 09:32:13.973782',31,5),(30,9,'2024-04-25 10:05:20.719434',29,24);
/*!40000 ALTER TABLE `favorite_ratingmv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_ratingse`
--

DROP TABLE IF EXISTS `favorite_ratingse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_ratingse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `series_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_ratingse_series_id_e1bf27a7_fk_show_series_id` (`series_id`),
  KEY `favorite_ratingse_user_id_89a3fb94_fk_auth_user_id` (`user_id`),
  CONSTRAINT `favorite_ratingse_series_id_e1bf27a7_fk_show_series_id` FOREIGN KEY (`series_id`) REFERENCES `show_series` (`id`),
  CONSTRAINT `favorite_ratingse_user_id_89a3fb94_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_ratingse`
--

LOCK TABLES `favorite_ratingse` WRITE;
/*!40000 ALTER TABLE `favorite_ratingse` DISABLE KEYS */;
INSERT INTO `favorite_ratingse` VALUES (6,9,'2024-04-24 21:56:50.802396',1,5),(7,5,'2024-04-25 09:04:40.705553',6,1),(8,10,'2024-04-25 09:07:42.025811',7,1),(9,9,'2024-04-25 09:12:03.595206',8,1),(10,9,'2024-04-25 09:15:41.271003',2,1),(11,6,'2024-04-25 09:15:48.677679',1,1),(12,10,'2024-04-25 09:16:01.853040',3,1),(13,10,'2024-04-25 09:16:09.295870',5,1),(14,7,'2024-04-25 09:32:20.235051',6,5),(15,8,'2024-04-25 09:32:34.615275',3,5);
/*!40000 ALTER TABLE `favorite_ratingse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_genre`
--

DROP TABLE IF EXISTS `show_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_genre`
--

LOCK TABLES `show_genre` WRITE;
/*!40000 ALTER TABLE `show_genre` DISABLE KEYS */;
INSERT INTO `show_genre` VALUES (1,'Action'),(2,'Drama'),(3,'Treiler'),(4,'Comedy');
/*!40000 ALTER TABLE `show_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_movie`
--

DROP TABLE IF EXISTS `show_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `photo_url` varchar(100) NOT NULL,
  `movie_length` int NOT NULL,
  `date_of_release` date DEFAULT NULL,
  `description` longtext NOT NULL,
  `director_id` bigint DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_movie_director_id_bae06eb3_fk_show_worker_director_id` (`director_id`),
  CONSTRAINT `show_movie_director_id_bae06eb3_fk_show_worker_director_id` FOREIGN KEY (`director_id`) REFERENCES `show_worker_director` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_movie`
--

LOCK TABLES `show_movie` WRITE;
/*!40000 ALTER TABLE `show_movie` DISABLE KEYS */;
INSERT INTO `show_movie` VALUES (1,'Ko to tamo peva!','images/Kototamopeva.jpg',123,'1970-04-09','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',6,1),(2,'4 Covek','images/4_covek.jpg',145,'2012-04-10','lore, dsfa sfdj asfs afdasfd',5,1),(3,'La Haine','images/71o1qHfUg9L._AC_UF8941000_QL80_.jpg',59,'2000-04-18','La Haine (French pronunciation: [la ɛn], lit. \'Hatred\'; released in the United States as Hate) is a 1995 French social thriller film written, co-edited, and directed by Mathieu Kassovitz.[2] Starring Vincent Cassel, Hubert Koundé and Saïd Taghmaoui, the film chronicles a day and night in the lives o',2,1),(4,'Once upon a time in America','images/Once_Upon_a_Time_in_America.png',280,'2000-09-18','Nobis sed fugit ut delectus harum nobis. Est molestiae aut ut et voluptas sapiente. Fuga sunt totam blanditiis sunt necessitatibus provident laudantium. Ullam quis est aut est molestiae aut autem. Delectus quo ipsa. Ut non deserunt sed.',2,1),(5,'Eyes Wide Shut','images/Eyes_Wide_Shut2.jpg',134,'1998-10-10','Eyes Wide Shut is a 1999 American erotic mystery psychological drama film directed, produced, and co-written by Stanley Kubrick. It is based on the 1926 novella Traumnovelle (Dream Story) by Arthur Schnitzler, transferring the story\'s setting from early twentieth-century Vienna to 1990s',4,0),(6,'Bread and Roses','images/Bread_and_Roses_poster.jpg',98,'2000-12-15','Bread and Roses is a 2000 film directed by Ken Loach, starring Pilar Padilla, Adrien Brody and Elpidia Carrillo. The plot deals with the struggle of poorly paid janitorial workers in Los Angeles and their fight for better working conditions and the right to unionize. It is based on the \"Justice for',1,1),(25,'Lepa sela lepo gore!','images/Lepaselalepogore_WFVQ8R5.jpg',123,'1996-02-10','Pretty Village, Pretty Flame (Serbian: Лепа села лепо горе / Lepa sela lepo gore, literally \"Pretty villages burn nicely\") is a 1996 Serbian film directed by Srđan Dragojević with a screenplay based on a book written by Vanja Bulić.',5,1),(27,'Zena sa slomljenim nosem','images/Zena-sa-slomljenim-nosem-podloga-V1.jpg',98,'2007-09-08','The film intertwines three stories, the destinies of three couples who through impossible love save each other, overcome personal traumas and discover the true reasons to continue life. There is also the main character - Branko\'s bridge as a metaphor for the spiritual and emotional state of people stopped in a traffic jam, but also in their torn lives.',5,1),(28,'Jagoda u supermarketu','images/jagoda_us.jpg',80,'2001-05-10','Srdjan \'Zika\' Todorovic was born on March 28, 1965 in Belgrade, Serbia, Yugoslavia. He is an actor, known for A Serbian Film (2010), Black Cat, White Cat (1998) and Underground (1995). He has been married to Ana Todorovic since 2004. They have one child',6,1),(29,'Mali Budo','images/idemo_budo1.jpg',80,'2024-04-25','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',5,1),(30,'Barbie','images/barbie1.jpg',60,'2024-04-25','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',1,1),(31,'Montevideo','images/Montevideo-Bog-te-video.jpg',89,'2024-04-25','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',5,1);
/*!40000 ALTER TABLE `show_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_movie_actor`
--

DROP TABLE IF EXISTS `show_movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_movie_actor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `actor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_movie_actor_movie_id_actor_id_eee3762a_uniq` (`movie_id`,`actor_id`),
  KEY `show_movie_actor_actor_id_55936d88_fk_show_worker_actor_id` (`actor_id`),
  CONSTRAINT `show_movie_actor_actor_id_55936d88_fk_show_worker_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `show_worker_actor` (`id`),
  CONSTRAINT `show_movie_actor_movie_id_96cc9d83_fk_show_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `show_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_movie_actor`
--

LOCK TABLES `show_movie_actor` WRITE;
/*!40000 ALTER TABLE `show_movie_actor` DISABLE KEYS */;
INSERT INTO `show_movie_actor` VALUES (43,1,10),(44,1,13),(45,1,14),(49,2,3),(47,2,9),(48,2,10),(46,2,11),(56,3,1),(4,3,2),(57,3,6),(5,4,2),(55,4,7),(54,4,8),(36,5,6),(37,5,7),(35,5,8),(51,6,1),(8,6,2),(52,6,6),(53,6,7),(50,6,8),(32,25,1),(33,25,2),(39,27,4),(38,27,9),(41,28,3),(40,28,11),(42,28,12),(60,29,3),(59,29,9),(58,29,11),(61,30,1),(62,30,2),(63,30,7),(64,31,3),(65,31,4),(66,31,9),(67,31,11),(68,31,12),(69,31,14);
/*!40000 ALTER TABLE `show_movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_movie_genre`
--

DROP TABLE IF EXISTS `show_movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_movie_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_movie_genre_movie_id_genre_id_2c633c78_uniq` (`movie_id`,`genre_id`),
  KEY `show_movie_genre_genre_id_0874d0eb_fk_show_genre_id` (`genre_id`),
  CONSTRAINT `show_movie_genre_genre_id_0874d0eb_fk_show_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `show_genre` (`id`),
  CONSTRAINT `show_movie_genre_movie_id_75be9eba_fk_show_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `show_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_movie_genre`
--

LOCK TABLES `show_movie_genre` WRITE;
/*!40000 ALTER TABLE `show_movie_genre` DISABLE KEYS */;
INSERT INTO `show_movie_genre` VALUES (10,1,4),(7,2,1),(8,2,2),(9,2,3),(4,3,1),(5,3,2),(6,3,3),(11,4,1),(12,4,2),(13,4,3),(14,5,2),(15,5,3),(16,6,2),(17,6,3),(36,25,1),(37,25,2),(40,27,2),(41,27,4),(42,28,1),(43,28,4),(44,29,4),(45,30,1),(46,31,4);
/*!40000 ALTER TABLE `show_movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_series`
--

DROP TABLE IF EXISTS `show_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_series` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `photo_url` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `director_id` bigint DEFAULT NULL,
  `date_of_release` date DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_series_director_id_472eefc9_fk_show_worker_director_id` (`director_id`),
  CONSTRAINT `show_series_director_id_472eefc9_fk_show_worker_director_id` FOREIGN KEY (`director_id`) REFERENCES `show_worker_director` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_series`
--

LOCK TABLES `show_series` WRITE;
/*!40000 ALTER TABLE `show_series` DISABLE KEYS */;
INSERT INTO `show_series` VALUES (1,'prison break','images/Prison_Break_miniseries.jpg','Prison Break is an American serial drama television series created by Paul Scheuring for Fox. The series revolves around two brothers, Lincoln Burrows (Dominic Purcell) and Michael Scofield (Wentworth Miller); Burrows has been sentenced to death for a crime he did not commit, while Scofield devises',1,'2024-04-18',1),(2,'Moj rodjak sa sela','images/Moj_rodjak_sa_sela_1.jpg','Moj rođak sa sela (Serbian: Мој рођак са села; English: My cousin from the countryside) is a TV series program written by Radoslav Pavlović and co-produced by Radio Television of Serbia and Košutnjak Film. Two seasons, with a total of 28 episodes have been produced by now. The first episode aired in',2,'2010-04-18',1),(3,'Sopranos!','images/sopranos_family.jpg','Quae sunt tempore nam omnis ducimus cupiditate distinctio officia. Eligendi minus ea aliquam quia perferendis enim. Et cupiditate dolores nihil animi. Tempora dolorem non accusantium vitae debitis enim cumque architecto vel. Sapiente quo quis.',2,'2020-03-13',1),(4,'The Wire','images/the_wire.jpg','The Wire is an American crime drama television series created and primarily written by American author and former police reporter David Simon. The series was broadcast by the cable network HBO in the United States. The Wire premiered on June 2, 2002, and ended on March 9, 2008, comprising 60 episode',1,'2020-04-18',1),(5,'Vruc Vetar','images/vr1.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',6,'1980-12-05',0),(6,'Shogun','images/shogun1.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',4,'2024-04-25',1),(7,'Vratice se rode!','images/vrode1.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',6,'2024-04-25',1),(8,'Fallout','images/FallOut.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',1,'2024-04-25',1);
/*!40000 ALTER TABLE `show_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_series_actor`
--

DROP TABLE IF EXISTS `show_series_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_series_actor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `series_id` bigint NOT NULL,
  `actor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_series_actor_series_id_actor_id_d7de7241_uniq` (`series_id`,`actor_id`),
  KEY `show_series_actor_actor_id_eac3a307_fk_show_worker_actor_id` (`actor_id`),
  CONSTRAINT `show_series_actor_actor_id_eac3a307_fk_show_worker_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `show_worker_actor` (`id`),
  CONSTRAINT `show_series_actor_series_id_bc0ea5fd_fk_show_series_id` FOREIGN KEY (`series_id`) REFERENCES `show_series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_series_actor`
--

LOCK TABLES `show_series_actor` WRITE;
/*!40000 ALTER TABLE `show_series_actor` DISABLE KEYS */;
INSERT INTO `show_series_actor` VALUES (1,1,1),(2,1,2),(13,1,6),(14,1,7),(12,1,8),(18,2,3),(19,2,4),(17,2,11),(20,2,12),(5,3,1),(6,3,2),(21,3,8),(7,4,1),(8,4,2),(16,4,7),(15,4,8),(9,5,10),(10,5,13),(11,5,14),(23,6,1),(24,6,2),(25,6,6),(22,6,8),(26,7,3),(27,7,4),(28,7,9),(29,7,11),(30,7,12),(31,8,1),(32,8,2),(33,8,6),(34,8,7);
/*!40000 ALTER TABLE `show_series_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_series_genre`
--

DROP TABLE IF EXISTS `show_series_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_series_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `series_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_series_genre_series_id_genre_id_1a826c57_uniq` (`series_id`,`genre_id`),
  KEY `show_series_genre_genre_id_29d8bfde_fk_show_genre_id` (`genre_id`),
  CONSTRAINT `show_series_genre_genre_id_29d8bfde_fk_show_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `show_genre` (`id`),
  CONSTRAINT `show_series_genre_series_id_e4fbf053_fk_show_series_id` FOREIGN KEY (`series_id`) REFERENCES `show_series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_series_genre`
--

LOCK TABLES `show_series_genre` WRITE;
/*!40000 ALTER TABLE `show_series_genre` DISABLE KEYS */;
INSERT INTO `show_series_genre` VALUES (8,1,1),(7,1,2),(5,2,1),(6,2,3),(3,3,2),(4,3,3),(1,4,1),(2,4,2),(9,5,4),(10,6,1),(11,6,3),(12,6,4),(13,7,2),(14,7,4),(15,8,1),(16,8,2),(17,8,3);
/*!40000 ALTER TABLE `show_series_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_worker_actor`
--

DROP TABLE IF EXISTS `show_worker_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_worker_actor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `biography` longtext,
  `nationality` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_worker_actor`
--

LOCK TABLES `show_worker_actor` WRITE;
/*!40000 ALTER TABLE `show_worker_actor` DISABLE KEYS */;
INSERT INTO `show_worker_actor` VALUES (1,'Brad','Pitt','William Bradley Pitt (born December 18, 1963) is an American actor and film producer. He is the recipient of various accolades, including two Academy Awards, two British Academy Film Awards, two Golden Globe Awards, and a Primetime Emmy Award. As a public figure, Pitt has been cited as one of the most powerful and influential people in the American entertainment industry.\r\n\r\nPitt first gained recognition as a cowboy hitchhiker in the Ridley Scott road film Thelma & Louise (1991). His first leading roles in big-budget productions came with the drama films A River Runs Through It (1992) and Legends of the Fall (1994). He also starred in the horror film Interview with the Vampire (1994), alongside Tom Cruise. He gave critically acclaimed performances in David Fincher\'s crime thriller Seven (1995) and the science fiction film 12 Monkeys (1995). The latter earned him a Golden Globe Award for Best Supporting Actor and his first Academy Award nomination.\r\n\r\nPitt found greater commercial success starring in Steven Soderbergh\'s heist film Ocean\'s Eleven (2001), and reprised his role in its sequels. He cemented his leading man status starring in blockbusters such as the historical epic Troy (2004), the romantic crime film Mr. & Mrs. Smith (2005), the horror film World War Z (2013), and the action film Bullet Train (2022). Pitt also starred in the critically acclaimed films Fight Club (1999), Babel (2006), The Assassination of Jesse James by the Coward Robert Ford (2007),','American','1986-12-12','images/Brad-Pitt-7c171caca50d4185acc6d8d474158771.jpg'),(2,'Laney','Kerluke','Impedit temporibus voluptate nihil dolore reprehenderit enim. Explicabo assumenda repudiandae. Est qui nihil reiciendis repellat. Aut aut modi. Veniam et est debitis inventore saepe eaque.','Eritrea','1986-12-12',NULL),(3,'Nikola','Kojo','Nikola Kojo was born on September 5, 1967 in Belgrade, Serbia, Yugoslavia. He is an Serbian actor and producer, known for Parada (2011), Pretty Village, Pretty Flame (1996) and We Are Not Angels (1992). He has been married to Aleksandra Djuric since 2006. They have three children. Nikola name comes from the great-grandfather, who was arch-priest of Mostar. Kojo is the film debut with less than 13 years, the role of the boy in the film Ivana \"Working at a certain time\". During the 1980s, played a prominent role in the film \"The Igman march\" (1983) TV series \"Sivi dom\" (1984), and one of the lead roles in three sequels (\"What happens when love is born\" - 1984 \"Zikina dynasty\" - 1985, \"Second Zika dynasty\" - 1986), a very popular film series \"Crazy Years\", which is profiled in one of the most famous actors of the younger generation in the former Yugoslavia. In 1992, he played a major role in the film Srdjan Dragojevic \"We are not angels,\" by which it remains remarkable. Although it was all brought immense popularity and media attention, he continued to the increasing success and builds more seriously challenging roles in recent years, mainly in the film, because the theater withdrew indefinitely.','Serbian','1968-07-24','images/nikola-kojo1.jpg'),(4,'Dragan','Bjelogrlic','Dragan Bjelogrlic is one of the greatest Serbian actors, directors, and producers. Apart from a successful acting career that lasts 40 years, in the last two decades, he also devoted to producing and directing movies and TV shows, consequently becoming one of the most recognized and successful cinematographic creators in the entire region. As an actor, he played over 90 roles on film and TV series.\r\n\r\nHe started directing in 2009. He directed three films that brought in 2.500.000 viewers to the movie theaters which makes him the most successful director in the Balkans in the last ten years. His last film \"Toma\" attracted over 1.100.000 viewers and became the most seen film in the cinematographic history of the Balkans. The film \"Toma\" closed the 2021 Sarajevo Film Festival.\r\n\r\nHe directed the \"Black sun\" series (2 seasons ) which is the first series of the region streamed on the \"Amazon Prime\" platform. His directorial debut \"Montevideo, God bless you\" was shown on over fifty international festivals (Moscow/Audience Choice Award, Warsaw/Audience Choice Award, Beijing/Grand Prix, Sao Paulo, Jakarta, etc.) and was the Serbian candidate for the Oscars. It won The Best Director and The Best Film award at the Serbian \"FIPRESCI\" association.\r\n\r\nHe produced six films that together won over thirty awards on various film festivals and five TV series. Dragan Bjelogrlic was born on October 10, 1963. After finishing elementary and high school in Belgrade, he enrolled at the Faculty of Dramatic Arts (FDA). His first acting role in front of the camera was at the age of 15, as the character of Sava Jovanovic Sirogojno in the film \"Bosko Buha\" (1978).\r\n\r\nAfter graduating from the FDA in 1989, he had a number of roles that made him a well-known actor and also recognized as one of Serbia\'s leading artists. He attracted a lot of public attention with the role of Slobodan Popadic in the series \"Better Life\" (1987-1990). After that role, he was in the TV show \"Forgotten\" (1990) and the films \"The Black Bomber\" (1992), \"Full Moon over Belgrade\" (1993), \" Pretty Village, Pretty Flame\" (1996). So far, he has played in almost 60 films, about 30 TV shows and dramas and 11 theater plays.\r\n\r\nAt the beginning of 1994, together with his brother Goran Bjelogrlic, he founded the production company \"Cobra Film\", which has produced some of the most famous theater plays, films, and TV series in Serbia and the Ex-Yu region.\r\n\r\nA period drama Chain Reaction, is a big international project, with shooting planned for the middle of 2022. The Chain Reaction will be an emotional story that connects the Serbian and French people.\r\n\r\nTwo years ago, he established Master class at Faculty for media and communications, Singidunum University Belgrade. He is married to Maja Bjelogrlic with whom he has a daughter Mia and a son Aleksej.','Serbian','1967-06-24','images/dragan_bjelogrlic.jpeg'),(5,'Milorad','Mandic','In the age of 21 he become a member of amateur Drama Experimental Studio in Belgrade. Six years later he graduated in Belgrade Academy of Film and Theater in class of professor Vladimir Jevtovic. After graduation he become a member of Belgrade children theater \"Bosko Buha\", where he worked occasionally. In 1989 he made more then 260 episodes of \"Bajka za laku noc\" fairytales for goodnight on national television. From 1989 to 1995 he had a children\'s weekly show \"S\' one strane duge\" (Over the rainbow), on national television, which has made him one of the most popular children actor and entertainer. From 1995 he had a children\'s weekly show \"Vise od igre\" on Serbian and Montenegrian most popular television \"Pink\". During his career he has made many outstanding roles in former Yugoslav moves. One of his best drama appearances was in \"Lepa sela lepo gore\", Srdjan Dragojevic\'s movie which was proclaimed in top five Yugoslav moves of all times. This role and many others made Milorad Mandic one of the most famous and talented actors of modern Serbian comedy and drama.','Serbian','1972-01-10','images/manda1.jpeg'),(6,'Tom','Cruise','In 1976, if you had told fourteen-year-old Franciscan seminary student Thomas Cruise Mapother IV that one day in the not too distant future he would be Tom Cruise, one of the top 100 movie stars of all time, he would have probably grinned and told you that his ambition was to join the priesthood. Nonetheless, this sensitive, deeply religious youngster who was born in 1962 in Syracuse, New York, was destined to become one of the highest paid and most sought after actors in screen history.\r\n\r\nTom is the only son (among four children) of nomadic parents, Mary Lee (Pfeiffer), a special education teacher, and Thomas Cruise Mapother III, an electrical engineer. His parents were both from Louisville, Kentucky, and he has German, Irish, and English ancestry. Young Tom spent his boyhood always on the move, and by the time he was 14 he had attended 15 different schools in the U.S. and Canada. He finally settled in Glen Ridge, New Jersey with his mother and her new husband. While in high school, Tom wanted to become a priest but pretty soon he developed an interest in acting and abandoned his plans of becoming a priest, dropped out of school, and at age 18 headed for New York and a possible acting career. The next 15 years of his life are the stuff of legends. He made his film debut with a small part in Endless Love (1981) and from the outset exhibited an undeniable box office appeal to both male and female audiences.\r\n\r\nWith handsome movie star looks and a charismatic smile, within 5 years Tom Cruise was starring in some of the top-grossing films of the 1980s including Top Gun (1986); The Color of Money (1986), Rain Man (1988) and Born on the Fourth of July (1989). By the 1990s he was one of the highest-paid actors in the world earning an average 15 million dollars a picture in such blockbuster hits as Interview with the Vampire: The Vampire Chronicles (1994), Mission: Impossible (1996) and Jerry Maguire (1996), for which he received an Academy Award Nomination for best actor. Tom Cruise\'s biggest franchise, Mission Impossible, has also earned a total of 3 billion dollars worldwide. Tom Cruise has also shown lots of interest in producing, with his biggest producer credits being the Mission Impossible franchise.','American','1962-03-04','images/Tom_Cruise_by_Gage_Skidmore_1.jpg'),(7,'Nicole','Kidman','Elegant Nicole Kidman, known as one of Hollywood\'s top Australian imports, was actually born in Honolulu, Hawaii, while her Australian parents were there on educational visas.\r\n\r\nKidman is the daughter of Janelle Ann (Glenny), a nursing instructor, and Antony David Kidman, a biochemist and clinical psychologist. She is of English, Irish, and Scottish descent. Shortly after her birth, the family moved to Washington, D.C., where Nicole\'s father pursued his research on breast cancer, and then, three years later, made the pilgrimage back to her parents\' native Sydney in Australia, where Nicole was raised. Young Nicole\'s first love was ballet, but she eventually took up mime and drama as well (her first stage role was a bleating sheep in an elementary school Christmas pageant). In her adolescent years, acting edged out the other arts and became a kind of refuge -- as her classmates sought out fun in the sun, the fair-skinned Kidman retreated to dark rehearsal halls to practice her craft. She worked regularly at the Philip Street Theater, where she once received a personal letter of praise and encouragement from audience member Jane Campion (then a film student). Kidman eventually dropped out of high school to pursue acting full-time. She broke into movies at age 16, landing a role in the Australian holiday favorite Bush Christmas (1983). That appearance touched off a flurry of film and television offers, including a lead in BMX Bandits (1983) and a turn as a schoolgirl-turned-protester in the miniseries Vietnam (1987) (for which she won her first Australian Film Institute Award). With the help of an American agent, she eventually made her US debut opposite Sam Neill in the at-sea thriller Dead Calm (1989).','American','1967-06-24','images/kidman1.jpeg'),(8,'Todd','Field','William Todd Field was born in Pomona, California, and began acting after graduating from high school in Portland, Oregon, where he was raised. A budding jazz musician as well, he skipped college in favor of a move east to New York to study acting. Once there, he began performing with the Ark Theatre Company as both an actor and musician.\r\n\r\nField subsequently won a role in Woody Allen\'s nostalgic Radio Days (1987). Then had an independent Spirit Award-nominated turn in Victor Nunez\'s Sundance Film Festival Grand jury Prize-winner Ruby in Paradise (1993). He also starred in Nicole Holofcener\'s_Walking and Talking (1996)_ which won the Grand Special Prize at the Deauville Film Festival. Other credits include Scott Ziehl\'s_Broken Vessels (1998)_ in which Field starred and produced, and\'Stanley Kubrick\'\'s final masterpiece, Eyes Wide Shut (1999) in which he played the mysterious \"Nick Nightingale\".\r\nIn 1999, Kevin Thomas of the Los Angeles Times wrote, \"Field has a deceptive facade of all-American clean-cut looks that allows him to suggest a wide range of emotions and thoughts behind such a regular-guy appearance; in \"Ruby in Paradise\" he expressed such uncommon decency and intelligence you had to wonder how Ashley Judd\'s hardscrabble Ruby could ever have considered letting him get away.','American','1972-08-17','images/tod1.jpg'),(9,'Nebojsa','Glogovac','Nebojsa Glogovac was born on August 30, 1969 in Trebinje, Bosnia and Herzegovina, Yugoslavia. He was an actor and producer, known for South Wind (2018), Huddersfield (2007) and Sky Hook (2000). He was married to Milica Scepanovic and Mina Glogovac. He died on February 9, 2018 in Belgrade, Serbia. Pictured on one of a set of eight 23d Serbian commemorative postage stamps celebrating Serbian actors and actresses, issued 27 March 2019. Stamps were issued in a single souvenir sheet. Others honored in this set were Velimir \'Bata\' Zivojinovic, Ljubisa Samardzic, Mira Stupica, Slobodan Aligrudic, Predrag Lakovic, Sonja Savic, and Milorad Mandic-Manda.','Serbian','1968-06-24','images/glogovac1.jpeg'),(10,'Danilo','Lazovic','Danilo Lazovic was born on November 25, 1951 in Brodarevo near Prijepolje, Serbia, Yugoslavia. He was an actor, known for Srecni ljudi (1993), A Holy Place (1990) and Porodicno blago (1998). He was married to Branka Lazovic. He died on March 25, 2006 in Belgrade, Serbia and Montenegro.','Serbian','1951-07-02','images/Danilo_lazovic.jpg'),(11,'Branka','Katic','Branka Katic was born on January 20, 1970 in Belgrade, Serbia, Yugoslavia. She is an actress, known for The King\'s Man (2021), Public Enemies (2009) and Black Cat, White Cat (1998). She has been married to Julian Farino since August 31, 2000. They have two children.Branka Katic was born on January 20, 1970 in Belgrade, Serbia, Yugoslavia. She is an actress, known for The King\'s Man (2021), Public Enemies (2009) and Black Cat, White Cat (1998). She has been married to Julian Farino since August 31, 2000. They have two children.Branka Katic was born on January 20, 1970 in Belgrade, Serbia, Yugoslavia. She is an actress, known for The King\'s Man (2021), Public Enemies (2009) and Black Cat, White Cat (1998). She has been married to Julian Farino since August 31, 2000. They have two children.','Serbian','1972-03-05','images/brankKatic1.jpeg'),(12,'Srdjan','Todorovic','Srdjan \'Zika\' Todorovic was born on March 28, 1965 in Belgrade, Serbia, Yugoslavia. He is an actor, known for A Serbian Film (2010), Black Cat, White Cat (1998) and Underground (1995). He has been married to Ana Todorovic since 2004. They have one childSrdjan \'Zika\' Todorovic was born on March 28, 1965 in Belgrade, Serbia, Yugoslavia. He is an actor, known for A Serbian Film (2010), Black Cat, White Cat (1998) and Underground (1995). He has been married to Ana Todorovic since 2004. They have one child','Serbian','1962-10-16','images/1255147_zika-todorovic-foto-mandic_ls.jpg'),(13,'Ljubisa','Samardzic','Ljubisa Samardzic was born into a miner\'s family. His acting talent was discovered very early and he won a scholarship with respected director Bojan Stupica. After graduating Belgrade Drama Arts Academy and playing a few theater roles, Ljubisa Samardzic was given the part in Igre na skelama (1961). After that experience, he decided to quit theater and try his luck in movies. In a few years he got the leading roles in some of the most popular or influential movies ever made in former Yugoslavia and soon became one of the movie icons in that country, together with \'Velimir \'Bata\' Zivojinovic\', Milena Dravic and Boris Dvornik. In the 1980s and during the break-up of Yugoslavia his acting star began to fade but he managed to switch careers by founding his own movie production company together with his son Dragan Samardzic. The company not only survived the harsh times of UN sanctions against rump Yugoslavia, but managed to produce few successful movies that became popular in many of the former Yugoslav republics. Ljubisa Samardzic now lives and works in Belgrade, is married and has two children and two grandchildren.','Serbian','1950-04-05','images/ljubisa11.jpg'),(14,'Bora','Todorovic','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Serbian','1950-12-20','images/todo1.jpeg');
/*!40000 ALTER TABLE `show_worker_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_worker_director`
--

DROP TABLE IF EXISTS `show_worker_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_worker_director` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `biography` longtext,
  `nationality` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_worker_director`
--

LOCK TABLES `show_worker_director` WRITE;
/*!40000 ALTER TABLE `show_worker_director` DISABLE KEYS */;
INSERT INTO `show_worker_director` VALUES (1,'Ken','Loach','Unlike virtually all his contemporaries, Ken Loach has never succumbed to the siren call of Hollywood, and it\'s virtually impossible to imagine his particular brand of British socialist realism translating well to that context.\r\n\r\nAfter studying law at St. Peter\'s College, Oxford, he branched out into the theater, performing with a touring repertory company. This led to television, where in alliance with producer Tony Garnett he produced a series of docudramas, most notably the devastating \"Cathy Come Home\" episode of The Wednesday Play (1964), whose impact was so massive that it led directly to a change in the homeless laws.\r\n\r\nHe made his feature debut Poor Cow (1967) the following year, and with Kes (1969), he produced what is now acclaimed as one of the finest films ever made in Britain. However, the following two decades saw his career in the doldrums with his films poorly distributed (despite the obvious quality of work such as The Gamekeeper (1968) and Looks and Smiles (1981)) and his TV work in some cases never broadcast (most notoriously, his documentaries on the 1984 miners\' strike).','American','1965-05-24','images/imagesasdfsadfsadfasdf.jpeg'),(2,'Steven','Spielberg','One of the most influential personalities in the history of cinema, Steven Spielberg is Hollywood\'s best known director and one of the wealthiest filmmakers in the world. He has an extraordinary number of commercially successful and critically acclaimed credits to his name, either as a director, producer or writer since launching the summer blockbuster with Jaws (1975), and he has done more to define popular film-making since the mid-1970s than anyone else.\r\n\r\nSteven Allan Spielberg was born in 1946 in Cincinnati, Ohio, to Leah Frances (Posner), a concert pianist and restaurateur, and Arnold Spielberg, an electrical engineer who worked in computer development. His parents were both born to Russian Jewish immigrant families. Steven spent his younger years in Haddon Township, New Jersey, Phoenix, Arizona, and later Saratoga, California. He went to California State University Long Beach, but dropped out to pursue his entertainment career. Among his early directing efforts were Battle Squad (1961), which combined World War II footage with footage of an airplane on the ground that he makes you believe is moving. He also directed Escape to Nowhere (1961), which featured children as World War Two soldiers, including his sister Anne Spielberg, and The Last Gun (1959), a western.','American','1956-12-12','images/MKr25402_Steven_Spielberg_Berlinale_2023.jpg'),(4,'Stanley','Kubrick','Stanley Kubrick (/ˈkuːbrɪk/; July 26, 1928 – March 7, 1999) was an American filmmaker and photographer. Widely considered one of the greatest filmmakers of all time, his films were nearly all adaptations of novels or short stories, spanning a number of genres and gaining recognition for their intense attention to detail, innovative cinematography, extensive set design, and dark humor.\r\n\r\nBorn and raised in New York City, Kubrick was an average school student but displayed a keen interest in literature, photography, and film from a young age; he began to teach himself all aspects of film producing and directing after graduating from high school. After working as a photographer for Look magazine in the late 1940s and early 1950s, he began making low-budget short films and made his first major Hollywood film, The Killing, for United Artists in 1956. This was followed by two collaborations with Kirk Douglas: the anti-war film Paths of Glory (1957) and the historical epic film Spartacus (1960).','American','1928-04-02','images/Kubrick_on_the_set_of_Barry_Lyndon_1975_publicity_photo_crop.jpg'),(5,'Srdjan','Dragojevic','Born in 1963. in Belgrade. Degree in Clinical Psychology and in Film Directing. Author of the 8 feature films and 8 books for grown-up\'s and the kids. Professor at Film Academy in Belgrade 2000-2004. MP at Serbian Parliament, 2012-2015. Director of 200 commercials, for \"the bread and butter\" purposes. His books for kids \"Poopwille\", \"Poopking\" and \"Winged childhood\" are among the bestsellers for the kids in Ex-Yu region. His film \"Pretty Village, Pretty Flame is among 1000 best films of all time in Halliwell\'s film encyclopedia and among 30 best war films in history, according to Sight&Sound critics. \"The Parade\" was a huge box office hit in Europe in 2012 after receiving three awards at Berlinale.\r\nHe obtained a degree in clinical psychology from the University of Belgrade\'s Faculty of Philosophy.\r\nIn parallel, Dragojević was active in poetry, publishing a book of poems called Knjiga akcione poezije (The Book of Action Poetry)[5] in 1986 and winning the prestigious Branko\'s Award [sr] for it. By his own admission, much of his poetry was inspired by the 1920s Soviet art and poets like Vladimir Mayakovsky','Serbian','1968-08-18','images/Srdjan_Dragojevic_portrait.jpg'),(6,'Sinisa','Pavic','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham','Serbian','1947-04-03','images/sinisa_pavic1.jpeg');
/*!40000 ALTER TABLE `show_worker_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registered_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 18:26:10
