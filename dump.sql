-- MySQL dump 10.13  Distrib 5.7.10, for osx10.11 (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Новость',7,'add_news'),(20,'Can change Новость',7,'change_news'),(21,'Can delete Новость',7,'delete_news'),(22,'Can add Страница',8,'add_page'),(23,'Can change Страница',8,'change_page'),(24,'Can delete Страница',8,'delete_page'),(25,'Can add kv store',9,'add_kvstore'),(26,'Can change kv store',9,'change_kvstore'),(27,'Can delete kv store',9,'delete_kvstore'),(28,'Can add Проект',10,'add_work'),(29,'Can change Проект',10,'change_work'),(30,'Can delete Проект',10,'delete_work'),(31,'Can add Подробность',11,'add_workpart'),(32,'Can change Подробность',11,'change_workpart'),(33,'Can delete Подробность',11,'delete_workpart'),(34,'Can add Настройки',12,'add_settingsobject'),(35,'Can change Настройки',12,'change_settingsobject'),(36,'Can delete Настройки',12,'delete_settingsobject'),(37,'Can add Рекоммендация',13,'add_recommendations'),(38,'Can change Рекоммендация',13,'change_recommendations'),(39,'Can delete Рекоммендация',13,'delete_recommendations');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$E03lUHcbrjEm$CgEcA0PfCKcGFfIsddYB+Ne34z3BQXUWhm7Rq8r7AG0=','2016-07-02 18:41:45',1,'admin','','','pman89@ya.ru',1,1,'2016-06-09 20:57:40');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_page`
--

DROP TABLE IF EXISTS `base_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `role` varchar(2) NOT NULL,
  `image` varchar(100),
  `use_video` tinyint(1) NOT NULL,
  `video` varchar(200),
  PRIMARY KEY (`id`),
  KEY `base_page_caf7cc51` (`lft`),
  KEY `base_page_3cfbd988` (`rght`),
  KEY `base_page_656442a0` (`tree_id`),
  KEY `base_page_c9e9a848` (`level`),
  KEY `base_page_6be37982` (`parent_id`),
  CONSTRAINT `base_page_parent_id_16ecf82d_fk_base_page_id` FOREIGN KEY (`parent_id`) REFERENCES `base_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_page`
--

LOCK TABLES `base_page` WRITE;
/*!40000 ALTER TABLE `base_page` DISABLE KEYS */;
INSERT INTO `base_page` VALUES (1,'Главная','index','1',1,1,1,2,1,0,NULL,'MN','pages/main_bg.jpg',0,''),(2,'Проекты','projects','1',2,1,1,2,2,0,NULL,'PJ',NULL,0,NULL),(3,'Профиль','profile','1',3,1,1,8,3,0,NULL,'PR',NULL,0,NULL),(4,'Дизайн','design','Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:',4,1,2,3,3,1,3,'PC','pages/profile_1.jpg',0,''),(5,'Архитектура','architecture','1',5,1,4,5,3,1,3,'PC','pages/profile_2.jpg',0,''),(6,'Интерьер','interior','1',6,1,6,7,3,1,3,'PC','pages/profile_1_rHnQ6lr.jpg',0,''),(7,'Рекомендации','recommendations','1',7,1,1,2,4,0,NULL,'RC',NULL,0,NULL),(8,'Новости','news','1',8,1,1,2,5,0,NULL,'NW','pages/news_bg.jpg',0,''),(9,'Контакты','contacts','1',9,1,1,2,6,0,NULL,'CT','pages/contacts_bg.jpg',0,'');
/*!40000 ALTER TABLE `base_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_settingsobject`
--

DROP TABLE IF EXISTS `base_settingsobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_settingsobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_url` varchar(200) NOT NULL,
  `insta_url` varchar(200) NOT NULL,
  `vk_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_settingsobject`
--

LOCK TABLES `base_settingsobject` WRITE;
/*!40000 ALTER TABLE `base_settingsobject` DISABLE KEYS */;
INSERT INTO `base_settingsobject` VALUES (1,'1','2','3','4','5','6','7','8');
/*!40000 ALTER TABLE `base_settingsobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-06-09 20:58:34','1','Главная',1,'Добавлено.',8,1),(2,'2016-06-09 20:58:53','2','Проекты',1,'Добавлено.',8,1),(3,'2016-06-09 20:59:16','3','Профиль',1,'Добавлено.',8,1),(4,'2016-06-09 20:59:31','4','Дизайн',1,'Добавлено.',8,1),(5,'2016-06-09 20:59:47','5','Архитектура',1,'Добавлено.',8,1),(6,'2016-06-09 21:00:04','6','Интерьер',1,'Добавлено.',8,1),(7,'2016-06-09 21:00:25','7','Рекомендации',1,'Добавлено.',8,1),(8,'2016-06-09 21:00:45','8','Новости',1,'Добавлено.',8,1),(9,'2016-06-09 21:01:03','9','Контакты',1,'Добавлено.',8,1),(10,'2016-06-14 19:40:43','1','8',1,'Добавлено.',12,1),(11,'2016-07-02 18:43:41','3','rec 3',1,'Добавлено.',13,1),(12,'2016-07-02 18:44:33','4','rec 4',1,'Добавлено.',13,1),(13,'2016-07-02 18:45:14','1','новость 1',1,'Добавлено.',7,1),(14,'2016-07-02 18:45:38','2','Новость 2',1,'Добавлено.',7,1),(15,'2016-07-02 18:46:04','3','При нападении боевиков ИГ на кафе в Бангладеш погибли девять итальянцев',1,'Добавлено.',7,1),(16,'2016-07-02 18:47:12','4','Лучшие иллюзии 2016 года: Превращение круга в квадрат и эксперимент с локтем',1,'Добавлено.',7,1),(17,'2016-07-02 18:47:58','5','Марш против «Брекзита»',1,'Добавлено.',7,1),(18,'2016-07-02 18:48:39','6','Россия задействует авианосец для бомбежек в Сирии',1,'Добавлено.',7,1),(19,'2016-07-02 18:54:13','1','Дом 1',1,'Добавлено. Добавлен Подробность \"Общий план\".',10,1),(20,'2016-07-02 18:55:21','1','Дом 1',2,'Добавлен Подробность \"Чертеж\".',10,1),(21,'2016-07-02 18:57:13','1','Дом 1',2,'Изменен image.',10,1),(22,'2016-07-02 19:08:54','9','Контакты',2,'Изменен image.',8,1),(23,'2016-07-02 19:09:07','8','Новости',2,'Изменен image.',8,1),(24,'2016-07-02 19:09:23','4','Дизайн',2,'Изменен image.',8,1),(25,'2016-07-02 19:09:33','5','Архитектура',2,'Изменен image.',8,1),(26,'2016-07-02 19:09:43','6','Интерьер',2,'Изменен image.',8,1),(27,'2016-07-02 19:09:54','1','Главная',2,'Изменен image.',8,1),(28,'2016-07-02 19:48:09','4','Дизайн',2,'Изменен content.',8,1),(29,'2016-07-02 19:48:18','4','Дизайн',2,'Ни одно поле не изменено.',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'base','page'),(12,'base','settingsobject'),(5,'contenttypes','contenttype'),(7,'news','news'),(13,'recommendations','recommendations'),(6,'sessions','session'),(9,'thumbnail','kvstore'),(10,'works','work'),(11,'works','workpart');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-06-02 09:09:13'),(2,'auth','0001_initial','2016-06-02 09:09:13'),(3,'admin','0001_initial','2016-06-02 09:09:13'),(4,'admin','0002_logentry_remove_auto_add','2016-06-02 09:09:13'),(5,'contenttypes','0002_remove_content_type_name','2016-06-02 09:09:13'),(6,'auth','0002_alter_permission_name_max_length','2016-06-02 09:09:13'),(7,'auth','0003_alter_user_email_max_length','2016-06-02 09:09:13'),(8,'auth','0004_alter_user_username_opts','2016-06-02 09:09:13'),(9,'auth','0005_alter_user_last_login_null','2016-06-02 09:09:13'),(10,'auth','0006_require_contenttypes_0002','2016-06-02 09:09:13'),(11,'auth','0007_alter_validators_add_error_messages','2016-06-02 09:09:13'),(12,'sessions','0001_initial','2016-06-02 09:09:13'),(13,'news','0001_initial','2016-06-02 09:33:34'),(14,'news','0002_auto_20160603_1447','2016-06-03 14:47:47'),(15,'base','0001_initial','2016-06-09 19:54:25'),(16,'news','0003_auto_20160609_1954','2016-06-09 19:54:25'),(17,'base','0002_auto_20160609_2043','2016-06-09 20:43:37'),(18,'base','0003_settingsobject','2016-06-14 19:38:34'),(19,'works','0001_initial','2016-06-14 19:38:34'),(20,'works','0002_auto_20160614_1938','2016-06-14 19:38:34'),(21,'base','0004_auto_20160623_1444','2016-07-02 18:42:03'),(22,'news','0004_news_published','2016-07-02 18:42:04'),(23,'works','0003_work_published','2016-07-02 18:49:11'),(24,'works','0004_auto_20160623_1444','2016-07-02 18:49:11'),(25,'works','0005_auto_20160624_0941','2016-07-02 18:49:11'),(26,'works','0006_auto_20160702_1856','2016-07-02 18:56:52');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ly1eqlkj2j4w6lw8p61lfjw0nsi7u0wo','N2MwMzBiMzdkMWY5NTA3ODQ5OTVjMjY4NjM5NzkwOTFiNzlkZWRjODp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4ZDgwZTQxZDNhZTg1MDE2MTY1NmQ1Y2M1Yjk3ZWE5MTA4NDYxODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-06-23 20:58:11'),('s6knjnt8jur9mashia4suvgxubcsjt7x','N2MwMzBiMzdkMWY5NTA3ODQ5OTVjMjY4NjM5NzkwOTFiNzlkZWRjODp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4ZDgwZTQxZDNhZTg1MDE2MTY1NmQ1Y2M1Yjk3ZWE5MTA4NDYxODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-16 18:41:45');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news`
--

DROP TABLE IF EXISTS `news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `pub_date` datetime NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news`
--

LOCK TABLES `news_news` WRITE;
/*!40000 ALTER TABLE `news_news` DISABLE KEYS */;
INSERT INTO `news_news` VALUES (1,'новость 1','<p>В&nbsp;американском аэропорту пассажир после прохождения досмотра у&nbsp;сотрудников транспортной безопасности унес с&nbsp;собой ящик для вещей. Мужчина решил проверить, можно&nbsp;ли без проблем украсть эту емкость.<br></p>','2016-07-02 20:45:12','news/Снимок_экрана_2016-05-18_в_21.03.16.png',1),(2,'Новость 2','<p>В&nbsp;Москве&nbsp;запретили проведение фестиваля электронной музыки Outline. По&nbsp;данным Life, против фестиваля выступила прокуратура.<br></p>','2016-07-02 20:45:36','news/корабель1_x0dlzHp.png',1),(3,'При нападении боевиков ИГ на кафе в Бангладеш погибли девять итальянцев','<p>В&nbsp;кафе в&nbsp;столице Бангладеш, на&nbsp;которое напали исламисты, погибли девять итальянцев. Всего были убиты 20 человек. Известно, что среди них были японцы. Все жертвы пока не&nbsp;опознаны.&nbsp;<br></p>','2016-07-02 20:46:02','news/корабель2.png',1),(4,'Лучшие иллюзии 2016 года: Превращение круга в квадрат и эксперимент с локтем','<p><div>В&nbsp;США прошел конкурс «Лучшая иллюзия года». Одна из&nbsp;целей проекта -&nbsp;помощь в&nbsp;обнаружении основ иллюзорного восприятия, которое интересует офтальмологов, неврологов и&nbsp;художников, работающих с&nbsp;иллюзиями.</div></p>','2016-07-02 20:47:10','news/29951.png',1),(5,'Марш против «Брекзита»','<p>В&nbsp;Лондоне прошел марш с&nbsp;требованием сохранить Великобританию в&nbsp;составе Европейского союза. На&nbsp;улицы вышли десятки тысяч людей, в&nbsp;основном, молодежь&nbsp;— по&nbsp;опросам, за&nbsp;выход из&nbsp;ЕС&nbsp;голосовало старшее поколение. «Медуза» представляет фотографии из&nbsp;столицы Великобритании.&nbsp;<br></p>','2016-07-02 20:47:57','news/Z4wluNglrNtVD-fba5M7Hw.jpg',1),(6,'Россия задействует авианосец для бомбежек в Сирии','<p>В&nbsp;октябре 2016 года&nbsp;по&nbsp;Сирии начнет наносить удары российская авиация, размещенная на&nbsp;авианосце «Адмирал Кузнецов». На&nbsp;корабле будут находится около 15 самолетов&nbsp;Су-33 и&nbsp;МиГ-29К/КУБ, а&nbsp;также вертолеты.&nbsp;<br></p>','2016-07-02 20:48:38','news/29972.png',1);
/*!40000 ALTER TABLE `news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations_recommendations`
--

DROP TABLE IF EXISTS `recommendations_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendations_recommendations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations_recommendations`
--

LOCK TABLES `recommendations_recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations_recommendations` DISABLE KEYS */;
INSERT INTO `recommendations_recommendations` VALUES (1,'recommendation','recommendations/корабель2.png','<p>fbsafg lsdkjf lksdjf wr agl;fg kfh</p>',1,'2016-06-26 08:18:01.000000'),(2,'rec 2','recommendations/Снимок_экрана_2016-05-18_в_21.03.16.png','<p>Сайт для покупки и&nbsp;продажи автомобилей «Авто.ру» внедрил в&nbsp;свое мобильное приложение искусственный интеллект: пользователь может сфотографировать на&nbsp;улице машину, а&nbsp;приложение с&nbsp;помощью нейросетей определит, какая это марка и&nbsp;модель.<br></p>',1,'2016-07-02 20:40:30.000000'),(3,'rec 3','recommendations/корабель1.png','<p>Министр обороны США Эш&nbsp;Картер объявил о&nbsp;снятии запрета на&nbsp;службу в&nbsp;армии для открытых трансгендеров.<br></p>',1,'2016-07-02 20:43:33.000000'),(4,'rec 4','recommendations/корабель2_IQx6LHB.png','<p>Рамзан Кадыров решил выдвинуться в&nbsp;главы Чечни. Об&nbsp;этом он&nbsp;сообщил в&nbsp;своем инстаграме. Выборы состоятся в&nbsp;сентябре 2016 года.&nbsp;</p>',1,'2016-07-02 20:44:31.000000');
/*!40000 ALTER TABLE `recommendations_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_work`
--

DROP TABLE IF EXISTS `works_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `image` varchar(100),
  `use_video` tinyint(1) NOT NULL,
  `video` varchar(200),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_work`
--

LOCK TABLES `works_work` WRITE;
/*!40000 ALTER TABLE `works_work` DISABLE KEYS */;
INSERT INTO `works_work` VALUES (1,'Дом 1',1,'works/Снимок_экрана_2016-07-02_в_20.51.00_iuMpFib.png',0,'');
/*!40000 ALTER TABLE `works_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_workpart`
--

DROP TABLE IF EXISTS `works_workpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_workpart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `use_video` tinyint(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `video` varchar(200) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `works_workpart_work_id_b1a6e25b_fk_works_work_id` (`work_id`),
  CONSTRAINT `works_workpart_work_id_b1a6e25b_fk_works_work_id` FOREIGN KEY (`work_id`) REFERENCES `works_work` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_workpart`
--

LOCK TABLES `works_workpart` WRITE;
/*!40000 ALTER TABLE `works_workpart` DISABLE KEYS */;
INSERT INTO `works_workpart` VALUES (1,'Общий план','<p><div>В&nbsp;Башкирии на&nbsp;несколько часов отключилась электроэнергия в&nbsp;нескольких районах республики. Без света остались тысячи домов. Всего от&nbsp;отключения энергии пострадали более 600 тысяч человек.&nbsp;</div></p>',0,'works/Снимок_экрана_2016-07-02_в_20.51.00.png','',1),(2,'Чертеж','<p><strong>htop</strong>&nbsp;— это интерактивная программа для наблюдения за процессами; она — альтернатива программы top. Каждый, кто работает за машиной с линуксом на борту, хоть раз использовал её: будь то поиск процесса (и его последующее убийство) или тщательный мониторинг используемых ресурсов.<br></p>',0,'works/Снимок_экрана_2016-07-02_в_20.50.15.png','',1);
/*!40000 ALTER TABLE `works_workpart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-02 21:55:02
