-- MySQL dump 10.13  Distrib 5.1.69, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: landfill_addons_allizom_org
-- ------------------------------------------------------
-- Server version	5.1.69-log

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
-- Table structure for table `abuse_reports`
--

DROP TABLE IF EXISTS `abuse_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abuse_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `reporter_id` int(11) unsigned DEFAULT NULL,
  `ip_address` varchar(255) NOT NULL,
  `addon_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reporter_id_refs_id_12d88e23` (`reporter_id`),
  KEY `user_id_refs_id_12d88e23` (`user_id`),
  KEY `addon_id_refs_id_2b6ff2a7` (`addon_id`),
  KEY `created_idx` (`created`),
  CONSTRAINT `addon_id_refs_id_2b6ff2a7` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `reporter_id_refs_id_12d88e23` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_id_refs_id_12d88e23` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abuse_reports`
--

LOCK TABLES `abuse_reports` WRITE;
/*!40000 ALTER TABLE `abuse_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `abuse_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_bluevia`
--

DROP TABLE IF EXISTS `addon_bluevia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_bluevia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `bluevia_config_id` int(11) unsigned NOT NULL,
  `status` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`),
  KEY `addon_bluevia_a27b43ff` (`bluevia_config_id`),
  KEY `addon_bluevia_c9ad71dd` (`status`),
  CONSTRAINT `addon_id_refs_id_5ed7b414` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `bluevia_config_id_refs_id_ef26bb4` FOREIGN KEY (`bluevia_config_id`) REFERENCES `bluevia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_bluevia`
--

LOCK TABLES `addon_bluevia` WRITE;
/*!40000 ALTER TABLE `addon_bluevia` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_bluevia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inapp`
--

DROP TABLE IF EXISTS `addon_inapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inapp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `chargeback_url` varchar(200) NOT NULL,
  `postback_url` varchar(200) NOT NULL,
  `public_key` varchar(255) NOT NULL,
  `status` int(11) unsigned NOT NULL,
  `is_https` tinyint(1) NOT NULL DEFAULT '1',
  `private_key` blob,
  `key_timestamp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_key` (`public_key`),
  KEY `addon_inapp_app` (`addon_id`),
  KEY `addon_inapp_status` (`status`),
  KEY `addon_inapp_public_key` (`public_key`),
  KEY `addon_inapp_667f58ba` (`key_timestamp`),
  CONSTRAINT `addon_id_addon` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inapp`
--

LOCK TABLES `addon_inapp` WRITE;
/*!40000 ALTER TABLE `addon_inapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inapp_image`
--

DROP TABLE IF EXISTS `addon_inapp_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inapp_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `config_id` int(11) unsigned NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `image_format` varchar(4) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `processed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_inapp_image_config_id` (`config_id`),
  KEY `addon_inapp_image_url` (`image_url`),
  KEY `addon_inapp_image_valid` (`valid`),
  KEY `addon_inapp_image_processed` (`processed`),
  CONSTRAINT `config_id_refs_inapp_product` FOREIGN KEY (`config_id`) REFERENCES `addon_inapp` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inapp_image`
--

LOCK TABLES `addon_inapp_image` WRITE;
/*!40000 ALTER TABLE `addon_inapp_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inapp_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inapp_log`
--

DROP TABLE IF EXISTS `addon_inapp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inapp_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `action` int(11) unsigned NOT NULL,
  `app_public_key` varchar(255) DEFAULT NULL,
  `session_key` varchar(64) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `config_id` int(11) unsigned DEFAULT NULL,
  `exception` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_inapp_log_fbfc09f1` (`user_id`),
  KEY `addon_inapp_log_c41bdac` (`config_id`),
  CONSTRAINT `config_id_refs_id_93ad9ec4` FOREIGN KEY (`config_id`) REFERENCES `addon_inapp` (`id`),
  CONSTRAINT `user_id_refs_id_8dae1945` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inapp_log`
--

LOCK TABLES `addon_inapp_log` WRITE;
/*!40000 ALTER TABLE `addon_inapp_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inapp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inapp_notice`
--

DROP TABLE IF EXISTS `addon_inapp_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inapp_notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `notice` int(11) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  `success` tinyint(1) NOT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_inapp_notice_842c533d` (`payment_id`),
  CONSTRAINT `payment_id_refs_id_8a79c182` FOREIGN KEY (`payment_id`) REFERENCES `addon_inapp_payment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inapp_notice`
--

LOCK TABLES `addon_inapp_notice` WRITE;
/*!40000 ALTER TABLE `addon_inapp_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inapp_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inapp_payment`
--

DROP TABLE IF EXISTS `addon_inapp_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inapp_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `config_id` int(11) unsigned NOT NULL,
  `contribution_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `app_data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_id` (`config_id`,`contribution_id`),
  KEY `addon_inapp_payment_c41bdac` (`config_id`),
  KEY `addon_inapp_payment_1b9d2c16` (`contribution_id`),
  CONSTRAINT `config_id_refs_id_7c502d8c` FOREIGN KEY (`config_id`) REFERENCES `addon_inapp` (`id`),
  CONSTRAINT `contribution_id_refs_id_5d086f0` FOREIGN KEY (`contribution_id`) REFERENCES `stats_contributions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inapp_payment`
--

LOCK TABLES `addon_inapp_payment` WRITE;
/*!40000 ALTER TABLE `addon_inapp_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inapp_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_payment_account`
--

DROP TABLE IF EXISTS `addon_payment_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_payment_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `provider` varchar(8) NOT NULL,
  `account_uri` varchar(255) NOT NULL,
  `product_uri` varchar(255) NOT NULL,
  `set_price` int(11) unsigned DEFAULT NULL,
  `payment_account_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`),
  UNIQUE KEY `product_uri` (`product_uri`),
  KEY `addon_payment_account_3ce7b59d` (`payment_account_id`),
  CONSTRAINT `addon_id_refs_id_e46b699a` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `payment_account_id_refs_id_af3e880c` FOREIGN KEY (`payment_account_id`) REFERENCES `payment_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_payment_account`
--

LOCK TABLES `addon_payment_account` WRITE;
/*!40000 ALTER TABLE `addon_payment_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_payment_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_payment_data`
--

DROP TABLE IF EXISTS `addon_payment_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_payment_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `country` varchar(64) NOT NULL,
  `payerID` varchar(255) NOT NULL,
  `address_one` varchar(255) NOT NULL,
  `address_two` varchar(255) NOT NULL,
  `post_code` varchar(128) NOT NULL,
  `state` varchar(64) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `city` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`),
  KEY `addon_payment_data` (`addon_id`),
  CONSTRAINT `addon_id_refs_id_addon` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_payment_data`
--

LOCK TABLES `addon_payment_data` WRITE;
/*!40000 ALTER TABLE `addon_payment_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_payment_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_purchase`
--

DROP TABLE IF EXISTS `addon_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`user_id`),
  KEY `addon_purchase_addon_id_idx` (`addon_id`),
  KEY `addon_purchase_user_id_idx` (`user_id`),
  KEY `addon_purchase_type` (`type`),
  CONSTRAINT `addon_id_refs_addon_purchase` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `user_id_refs_addon_purchase` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_purchase`
--

LOCK TABLES `addon_purchase` WRITE;
/*!40000 ALTER TABLE `addon_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_recommendations`
--

DROP TABLE IF EXISTS `addon_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_recommendations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `other_addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id_2` (`addon_id`,`other_addon_id`),
  KEY `addon_id` (`addon_id`),
  KEY `addon_recommendations_ibfk_2` (`other_addon_id`),
  CONSTRAINT `addon_recommendations_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `addon_recommendations_ibfk_2` FOREIGN KEY (`other_addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_recommendations`
--

LOCK TABLES `addon_recommendations` WRITE;
/*!40000 ALTER TABLE `addon_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_upsell`
--

DROP TABLE IF EXISTS `addon_upsell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_upsell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `free_id` int(11) unsigned NOT NULL,
  `premium_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `free_id` (`free_id`,`premium_id`),
  KEY `addon_upsell_free_id` (`free_id`),
  KEY `addon_upsell_premium_id` (`premium_id`),
  CONSTRAINT `free_id_refs_id_upsell` FOREIGN KEY (`free_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `premium_id_refs_id_upsell` FOREIGN KEY (`premium_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_upsell`
--

LOCK TABLES `addon_upsell` WRITE;
/*!40000 ALTER TABLE `addon_upsell` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_upsell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addonlogs`
--

DROP TABLE IF EXISTS `addonlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addonlogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `object1_id` int(11) unsigned DEFAULT NULL,
  `object2_id` int(11) unsigned DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `name2` varchar(255) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addonlogs`
--

LOCK TABLES `addonlogs` WRITE;
/*!40000 ALTER TABLE `addonlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `addonlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `name` int(11) unsigned DEFAULT NULL,
  `slug` varchar(30) DEFAULT NULL,
  `defaultlocale` varchar(10) NOT NULL DEFAULT 'en-US',
  `addontype_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `higheststatus` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `icontype` varchar(25) NOT NULL DEFAULT '',
  `homepage` int(11) unsigned DEFAULT NULL,
  `supportemail` int(11) unsigned DEFAULT NULL,
  `supporturl` int(11) unsigned DEFAULT NULL,
  `description` int(11) unsigned DEFAULT NULL,
  `summary` int(11) unsigned DEFAULT NULL,
  `averagerating` float NOT NULL DEFAULT '0',
  `bayesianrating` float NOT NULL DEFAULT '0',
  `totalreviews` int(11) NOT NULL DEFAULT '0',
  `weeklydownloads` int(11) unsigned NOT NULL DEFAULT '0',
  `totaldownloads` int(11) unsigned NOT NULL DEFAULT '0',
  `average_daily_downloads` int(11) unsigned NOT NULL DEFAULT '0',
  `average_daily_users` int(11) unsigned NOT NULL DEFAULT '0',
  `sharecount` int(11) unsigned NOT NULL DEFAULT '0',
  `developercomments` int(11) unsigned DEFAULT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trusted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `viewsource` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `publicstats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prerelease` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adminreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_review_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sitespecific` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `externalsoftware` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `eula` int(11) unsigned DEFAULT NULL,
  `privacypolicy` int(11) unsigned DEFAULT NULL,
  `nominationmessage` text,
  `target_locale` varchar(255) DEFAULT NULL,
  `locale_disambiguation` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dev_agreement` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `the_reason` int(11) unsigned DEFAULT NULL,
  `the_future` int(11) unsigned DEFAULT NULL,
  `paypal_id` varchar(255) NOT NULL DEFAULT '',
  `suggested_amount` varchar(255) DEFAULT NULL,
  `total_contributions` varchar(10) DEFAULT '0.00',
  `annoying` int(11) DEFAULT '0',
  `wants_contributions` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_thankyou` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thankyou_note` int(11) unsigned DEFAULT NULL,
  `get_satisfaction_company` varchar(255) DEFAULT NULL,
  `get_satisfaction_product` varchar(255) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `current_version` int(11) unsigned DEFAULT NULL,
  `charity_id` int(11) unsigned DEFAULT NULL,
  `ts_slowness` float DEFAULT NULL,
  `hotness` double NOT NULL DEFAULT '0',
  `backup_version` int(11) unsigned DEFAULT NULL,
  `auto_repackage` tinyint(1) NOT NULL DEFAULT '1',
  `app_slug` varchar(30) DEFAULT NULL,
  `premium_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `manifest_url` varchar(255) DEFAULT NULL,
  `app_domain` varchar(255) DEFAULT NULL,
  `outstanding` tinyint(1) NOT NULL DEFAULT '0',
  `make_public` datetime DEFAULT NULL,
  `mozilla_contact` varchar(75) NOT NULL DEFAULT '',
  `is_packaged` tinyint(1) NOT NULL DEFAULT '0',
  `latest_version` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `guid` (`guid`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `app_slug` (`app_slug`),
  KEY `addontype_id` (`addontype_id`),
  KEY `addons_ibfk_2` (`name`),
  KEY `addons_ibfk_3` (`homepage`),
  KEY `addons_ibfk_4` (`description`),
  KEY `addons_ibfk_5` (`summary`),
  KEY `addons_ibfk_6` (`developercomments`),
  KEY `addons_ibfk_7` (`eula`),
  KEY `addons_ibfk_8` (`privacypolicy`),
  KEY `status` (`status`),
  KEY `inactive` (`inactive`),
  KEY `supporturl` (`supporturl`),
  KEY `supportemail` (`supportemail`),
  KEY `target_locale` (`target_locale`),
  KEY `bayesianrating` (`bayesianrating`),
  KEY `sharecount` (`sharecount`),
  KEY `addons_ibfk_11` (`the_reason`),
  KEY `addons_ibfk_12` (`the_future`),
  KEY `last_updated` (`last_updated`),
  KEY `addons_ibfk_13` (`thankyou_note`),
  KEY `current_version` (`current_version`),
  KEY `created_idx` (`created`),
  KEY `modified_idx` (`modified`),
  KEY `weeklydownloads_idx` (`weeklydownloads`),
  KEY `rating_type_idx` (`bayesianrating`,`addontype_id`),
  KEY `created_type_idx` (`created`,`addontype_id`),
  KEY `modified_type_idx` (`modified`,`addontype_id`),
  KEY `downloads_type_idx` (`weeklydownloads`,`addontype_id`),
  KEY `last_updated_type_idx` (`last_updated`,`addontype_id`),
  KEY `type_status_inactive_idx` (`addontype_id`,`status`,`inactive`),
  KEY `charity_id` (`charity_id`),
  KEY `ts_slowness_idx` (`ts_slowness`),
  KEY `hotness_idx` (`hotness`),
  KEY `visible_idx` (`addontype_id`,`status`,`inactive`,`current_version`),
  KEY `addons_ibfk_16` (`backup_version`),
  KEY `adus_type_idx` (`average_daily_users`,`addontype_id`),
  KEY `premium_type_idx` (`premium_type`),
  KEY `addons_609c04a9` (`app_domain`),
  KEY `addons_is_packaged` (`is_packaged`),
  KEY `latest_version_refs_versions` (`latest_version`),
  CONSTRAINT `addons_ibfk_1` FOREIGN KEY (`addontype_id`) REFERENCES `addontypes` (`id`),
  CONSTRAINT `addons_ibfk_10` FOREIGN KEY (`supportemail`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_11` FOREIGN KEY (`the_reason`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_12` FOREIGN KEY (`the_future`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_13` FOREIGN KEY (`thankyou_note`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_14` FOREIGN KEY (`current_version`) REFERENCES `versions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `addons_ibfk_15` FOREIGN KEY (`charity_id`) REFERENCES `charities` (`id`),
  CONSTRAINT `addons_ibfk_16` FOREIGN KEY (`backup_version`) REFERENCES `versions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `addons_ibfk_2` FOREIGN KEY (`name`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_3` FOREIGN KEY (`homepage`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_4` FOREIGN KEY (`description`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_5` FOREIGN KEY (`summary`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_6` FOREIGN KEY (`developercomments`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_7` FOREIGN KEY (`eula`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_8` FOREIGN KEY (`privacypolicy`) REFERENCES `translations` (`id`),
  CONSTRAINT `addons_ibfk_9` FOREIGN KEY (`supporturl`) REFERENCES `translations` (`id`),
  CONSTRAINT `latest_version_refs_versions` FOREIGN KEY (`latest_version`) REFERENCES `versions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES (1,'jid0-arVzmwkosQBcRjPzByNer1jkTVg@jetpack',6,'status-watch','en-US',1,4,4,'icon/feeds',NULL,NULL,NULL,8,7,4.5,4.5,2,2,2,1,1,0,NULL,0,0,1,0,0,0,1,0,0,NULL,NULL,NULL,NULL,NULL,'2011-03-06 23:51:43','2012-10-17 15:51:19',0,NULL,NULL,'',NULL,NULL,0,0,0,NULL,NULL,NULL,'2011-03-06 23:51:43',1,NULL,NULL,0,NULL,1,NULL,0,NULL,NULL,0,NULL,'',0,1),(2,'24ab5701-7334-48ca-902b-3a6ae1159d5b',1166,'app-2','en-US',11,2,0,'image/png',1169,1170,1171,1172,1167,0,0,0,0,0,0,0,0,NULL,0,0,1,0,0,0,1,0,0,NULL,1173,NULL,NULL,NULL,'2013-01-25 12:47:21','2013-01-25 12:48:49',0,NULL,NULL,'',NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,2,NULL,NULL,0,NULL,1,'test-app-grizzlybear2302',0,'http://grizzlybear2302.testmanifest.com/manifest.webapp','http://grizzlybear2302.testmanifest.com',0,NULL,'',0,2),(3,'f58caa7e-25cb-4265-bb4f-a696e33679a6',1174,'app-3','en-US',11,0,0,'image/png',NULL,NULL,NULL,NULL,1175,0,0,0,0,0,0,0,0,NULL,0,0,1,0,0,0,1,0,0,NULL,NULL,NULL,NULL,NULL,'2013-01-25 13:32:16','2013-01-25 13:32:17',0,NULL,NULL,'',NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,3,NULL,NULL,0,NULL,1,'test-app-kinkajou3969',0,'http://kinkajou3969.testmanifest.com/manifest.webapp','http://kinkajou3969.testmanifest.com',0,NULL,'',0,3);
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_blacklistedslug`
--

DROP TABLE IF EXISTS `addons_blacklistedslug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_blacklistedslug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_blacklistedslug`
--

LOCK TABLES `addons_blacklistedslug` WRITE;
/*!40000 ALTER TABLE `addons_blacklistedslug` DISABLE KEYS */;
INSERT INTO `addons_blacklistedslug` VALUES (1,'2011-03-06 23:33:46','2011-03-06 23:33:46','validate'),(2,'2011-03-06 23:33:46','2011-03-06 23:33:46','submit');
/*!40000 ALTER TABLE `addons_blacklistedslug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_categories`
--

DROP TABLE IF EXISTS `addons_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `feature` int(1) unsigned NOT NULL DEFAULT '0',
  `feature_locales` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`category_id`),
  KEY `category_addon_idx` (`category_id`,`addon_id`),
  KEY `feature_addon_idx` (`feature`,`addon_id`),
  CONSTRAINT `addons_categories_ibfk_3` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addons_categories_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_categories`
--

LOCK TABLES `addons_categories` WRITE;
/*!40000 ALTER TABLE `addons_categories` DISABLE KEYS */;
INSERT INTO `addons_categories` VALUES (1,1,1,1,NULL),(2,1,2,0,''),(3,2,3,0,'');
/*!40000 ALTER TABLE `addons_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_collections`
--

DROP TABLE IF EXISTS `addons_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL,
  `collection_id` int(11) unsigned NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category` tinyint(3) unsigned DEFAULT NULL COMMENT 'for interactive collections template',
  `comments` int(11) unsigned DEFAULT NULL,
  `downloads` int(11) DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT NULL,
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id_2` (`addon_id`,`collection_id`),
  KEY `addon_id` (`addon_id`),
  KEY `collection_id` (`collection_id`),
  KEY `user_id` (`user_id`),
  KEY `comments` (`comments`),
  KEY `created_idx` (`collection_id`,`created`),
  CONSTRAINT `addons_collections_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addons_collections_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addons_collections_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addons_collections_ibfk_4` FOREIGN KEY (`comments`) REFERENCES `translations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_collections`
--

LOCK TABLES `addons_collections` WRITE;
/*!40000 ALTER TABLE `addons_collections` DISABLE KEYS */;
INSERT INTO `addons_collections` VALUES (1,1,1,'0000-00-00 00:00:00',NULL,NULL,0,NULL,'2011-03-23 21:09:23','2011-03-23 21:09:23',0),(2,1,2,'0000-00-00 00:00:00',NULL,30,0,NULL,'2011-03-29 12:47:08','2011-03-29 12:47:08',0),(3,1,3,'0000-00-00 00:00:00',NULL,NULL,0,NULL,'2012-02-26 03:30:34','2012-02-26 03:30:34',0);
/*!40000 ALTER TABLE `addons_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_dependencies`
--

DROP TABLE IF EXISTS `addons_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_dependencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  `dependent_addon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`dependent_addon_id`),
  KEY `addons_dependencies_addon_id_key` (`addon_id`),
  KEY `addons_dependencies_dependent_addon_id_key` (`dependent_addon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_dependencies`
--

LOCK TABLES `addons_dependencies` WRITE;
/*!40000 ALTER TABLE `addons_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_devicetypes`
--

DROP TABLE IF EXISTS `addons_devicetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_devicetypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `device_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`device_type`),
  UNIQUE KEY `addon_id_2` (`addon_id`,`device_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_devicetypes`
--

LOCK TABLES `addons_devicetypes` WRITE;
/*!40000 ALTER TABLE `addons_devicetypes` DISABLE KEYS */;
INSERT INTO `addons_devicetypes` VALUES (1,'2013-01-25 12:47:23','2013-01-25 12:47:23',2,4),(2,'2013-01-25 13:32:16','2013-01-25 13:32:16',3,1);
/*!40000 ALTER TABLE `addons_devicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_excluded_regions`
--

DROP TABLE IF EXISTS `addons_excluded_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_excluded_regions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `region` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`region`),
  KEY `addons_excluded_regions_addon_id_idx` (`addon_id`),
  KEY `addons_excluded_regions_region_idx` (`region`),
  CONSTRAINT `addons_excluded_regions_addon_id_fk` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_excluded_regions`
--

LOCK TABLES `addons_excluded_regions` WRITE;
/*!40000 ALTER TABLE `addons_excluded_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_excluded_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_features`
--

DROP TABLE IF EXISTS `addons_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  `has_apps` tinyint(1) NOT NULL,
  `has_packaged_apps` tinyint(1) NOT NULL,
  `has_pay` tinyint(1) NOT NULL,
  `has_activity` tinyint(1) NOT NULL,
  `has_light_events` tinyint(1) NOT NULL,
  `has_archive` tinyint(1) NOT NULL,
  `has_battery` tinyint(1) NOT NULL,
  `has_bluetooth` tinyint(1) NOT NULL,
  `has_contacts` tinyint(1) NOT NULL,
  `has_device_storage` tinyint(1) NOT NULL,
  `has_indexeddb` tinyint(1) NOT NULL,
  `has_geolocation` tinyint(1) NOT NULL,
  `has_idle` tinyint(1) NOT NULL,
  `has_network_info` tinyint(1) NOT NULL,
  `has_network_stats` tinyint(1) NOT NULL,
  `has_proximity` tinyint(1) NOT NULL,
  `has_push` tinyint(1) NOT NULL,
  `has_orientation` tinyint(1) NOT NULL,
  `has_time_clock` tinyint(1) NOT NULL,
  `has_vibrate` tinyint(1) NOT NULL,
  `has_fm` tinyint(1) NOT NULL,
  `has_sms` tinyint(1) NOT NULL,
  `has_touch` tinyint(1) NOT NULL,
  `has_qhd` tinyint(1) NOT NULL,
  `has_mp3` tinyint(1) NOT NULL,
  `has_audio` tinyint(1) NOT NULL,
  `has_webaudio` tinyint(1) NOT NULL,
  `has_video_h264` tinyint(1) NOT NULL,
  `has_video_webm` tinyint(1) NOT NULL,
  `has_fullscreen` tinyint(1) NOT NULL,
  `has_gamepad` tinyint(1) NOT NULL,
  `has_quota` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version_id` (`version_id`),
  CONSTRAINT `app_features_version_id_key` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_features`
--

LOCK TABLES `addons_features` WRITE;
/*!40000 ALTER TABLE `addons_features` DISABLE KEYS */;
INSERT INTO `addons_features` VALUES (1,'2013-06-25 08:49:25','2013-06-25 08:49:25',2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,'2013-06-25 08:49:25','2013-06-25 08:49:25',3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `addons_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_premium`
--

DROP TABLE IF EXISTS `addons_premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_premium` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `price_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`),
  KEY `price_id_refs_id_addons_premium` (`price_id`),
  CONSTRAINT `addon_id_refs_id_addons_premium` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `price_id_refs_id_addons_premium` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_premium`
--

LOCK TABLES `addons_premium` WRITE;
/*!40000 ALTER TABLE `addons_premium` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_users`
--

DROP TABLE IF EXISTS `addons_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `listed` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `listed` (`listed`),
  KEY `addon_user_listed_idx` (`addon_id`,`user_id`,`listed`),
  KEY `addon_listed_idx` (`addon_id`,`listed`),
  CONSTRAINT `addons_users_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addons_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_users`
--

LOCK TABLES `addons_users` WRITE;
/*!40000 ALTER TABLE `addons_users` DISABLE KEYS */;
INSERT INTO `addons_users` VALUES (1,1,1,5,1,0),(2,2,22,5,1,0),(3,3,22,5,1,0);
/*!40000 ALTER TABLE `addons_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addontypes`
--

DROP TABLE IF EXISTS `addontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addontypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) unsigned NOT NULL DEFAULT '0',
  `name_plural` int(11) unsigned NOT NULL DEFAULT '0',
  `description` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `addontypes_ibfk_1` (`name`),
  KEY `addontypes_ibfk_2` (`name_plural`),
  KEY `addontypes_ibfk_3` (`description`),
  CONSTRAINT `addontypes_ibfk_1` FOREIGN KEY (`name`) REFERENCES `translations` (`id`),
  CONSTRAINT `addontypes_ibfk_2` FOREIGN KEY (`name_plural`) REFERENCES `translations` (`id`),
  CONSTRAINT `addontypes_ibfk_3` FOREIGN KEY (`description`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addontypes`
--

LOCK TABLES `addontypes` WRITE;
/*!40000 ALTER TABLE `addontypes` DISABLE KEYS */;
INSERT INTO `addontypes` VALUES (1,1005,1006,1007,'2011-03-06 23:39:48','2011-03-06 23:39:48'),(11,0,0,0,'2011-08-12 14:00:30','2011-08-12 14:00:30');
/*!40000 ALTER TABLE `addontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_access`
--

DROP TABLE IF EXISTS `api_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `redirect_uri` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `api_access_user` (`user_id`),
  CONSTRAINT `user_id_api` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_access`
--

LOCK TABLES `api_access` WRITE;
/*!40000 ALTER TABLE `api_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `name` int(11) unsigned NOT NULL DEFAULT '0',
  `shortname` int(11) unsigned NOT NULL DEFAULT '0',
  `supported` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `applications_ibfk_1` (`name`),
  KEY `applications_ibfk_2` (`shortname`),
  KEY `guid` (`guid`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`name`) REFERENCES `translations` (`id`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`shortname`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'{ec8030f7-c20a-464f-9b0e-13a3a9e97384}',1001,1002,1,'2011-03-06 23:11:59','0000-00-00 00:00:00'),(61,'{aa3c5121-dab2-40e2-81ca-7ea25febc110}',0,0,1,'2012-04-04 17:17:55','2012-04-04 17:17:55');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications_versions`
--

DROP TABLE IF EXISTS `applications_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL DEFAULT '0',
  `version_id` int(11) unsigned NOT NULL DEFAULT '0',
  `min` int(11) unsigned NOT NULL DEFAULT '0',
  `max` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`,`version_id`),
  KEY `version_id` (`version_id`),
  KEY `min` (`min`),
  KEY `max` (`max`),
  CONSTRAINT `applications_versions_ibfk_3` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `applications_versions_ibfk_4` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `applications_versions_ibfk_5` FOREIGN KEY (`min`) REFERENCES `appversions` (`id`),
  CONSTRAINT `applications_versions_ibfk_6` FOREIGN KEY (`max`) REFERENCES `appversions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications_versions`
--

LOCK TABLES `applications_versions` WRITE;
/*!40000 ALTER TABLE `applications_versions` DISABLE KEYS */;
INSERT INTO `applications_versions` VALUES (1,1,1,1,2);
/*!40000 ALTER TABLE `applications_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvals`
--

DROP TABLE IF EXISTS `approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reply_to` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `reviewtype` varchar(10) NOT NULL DEFAULT 'pending',
  `action` int(11) NOT NULL DEFAULT '0',
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(11) unsigned DEFAULT NULL,
  `os` varchar(255) NOT NULL DEFAULT '',
  `applications` varchar(255) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`),
  KEY `addon_id` (`addon_id`),
  KEY `reply_to` (`reply_to`),
  CONSTRAINT `approvals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `approvals_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `approvals_ibfk_3` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `approvals_ibfk_4` FOREIGN KEY (`reply_to`) REFERENCES `approvals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvals`
--

LOCK TABLES `approvals` WRITE;
/*!40000 ALTER TABLE `approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appsupport`
--

DROP TABLE IF EXISTS `appsupport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appsupport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `app_id` int(11) unsigned NOT NULL,
  `min` bigint(20) unsigned DEFAULT NULL,
  `max` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_id_refs_id_fd65824a` (`addon_id`),
  KEY `app_id_refs_id_481ce338` (`app_id`),
  KEY `minmax_idx` (`addon_id`,`app_id`,`min`,`max`)
) ENGINE=InnoDB AUTO_INCREMENT=561621 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appsupport`
--

LOCK TABLES `appsupport` WRITE;
/*!40000 ALTER TABLE `appsupport` DISABLE KEYS */;
INSERT INTO `appsupport` VALUES (561620,'2011-03-29 13:18:38','2011-03-29 13:18:38',1,1,4000000200100,4009900200100);
/*!40000 ALTER TABLE `appsupport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appversions`
--

DROP TABLE IF EXISTS `appversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appversions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL DEFAULT '0',
  `version` varchar(255) NOT NULL DEFAULT '',
  `version_int` bigint(20) unsigned DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  KEY `version` (`version`),
  KEY `version_int_idx` (`version_int`),
  CONSTRAINT `appversions_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appversions`
--

LOCK TABLES `appversions` WRITE;
/*!40000 ALTER TABLE `appversions` DISABLE KEYS */;
INSERT INTO `appversions` VALUES (1,1,'4.0',4000000200100,'2011-03-23 21:37:53','2011-03-23 21:37:53'),(2,1,'4.0.*',4009900200100,'2011-03-23 21:38:13','2011-03-23 21:38:13');
/*!40000 ALTER TABLE `appversions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id` (`group_id`),
  KEY `auth_group_permissions_permission_id` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
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
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'39998226-8a8a-11e1-83f0-0050568f000a','','','clouserw@gmail.com','sha512$4f6b12b42e80f7b432b2885f0b021008db4782ac7b32e2f2e0315ad78a16a028$65fefd17ef94934fec900777b980e8db7e91d011f1a7ef19e0758af74205ac8735e85e2f74dbf513393058af213e7d8fb55055b64477d3264a8c88b768fd401b',1,1,1,'2013-03-13 09:26:07','2011-03-01 20:15:00'),(2,'3999b58e-8a8a-11e1-83f0-0050568f000a','','','sancus@off.net','sha512$a55295e8947b0e9b8a2f2fcccd4c1d7895efb58767073a37faa3ca21bf8d9888$d0b561dceb281ea5b859d922a39861353878c6554abf171b4774c6c7d63c57537dc5d2de73cc9ec3e704d439e1652cf962b2addf0ddb0b5f6fb02293fc63dee6',0,1,0,'2012-09-08 17:46:15','2011-03-29 14:51:47'),(3,'3999b78c-8a8a-11e1-83f0-0050568f000a','','','markh@babelzilla.org','sha512$663eb3b67e4cddeb876ddef90d6a0ff10c3817545fd2fe08ac0b2d59c5ec82e2$a9d4909a961a994d4b9327233856d6cfbb91996809346fb31932a774b4ff0c9cb69839600e4b0c58435420f65026ca483dbc1fd5636421e828ec430d43c7869a',0,1,0,'2011-03-30 09:58:32','2011-03-30 00:37:54'),(4,'3999b91c-8a8a-11e1-83f0-0050568f000a','','','valastiak@mozilla.sk','sha512$e016297464aa5cae513d56a236235cd8da68601577d195a1b94fd387efc8b30c$057774d57a45c96befa65b5fe2bbb0969996a3c899d14418fd9924382c9ebdefe9ee0f6b5411c173af816acfe10e7c263476486361b1d8fc24c4a80e169a05cf',0,1,0,'2011-03-30 14:03:21','2011-03-30 14:00:28'),(5,'3999baa2-8a8a-11e1-83f0-0050568f000a','','','geoff@darktrojan.net','sha512$0145b0f21f6e047dc568e62f9c3ee5e0fd0bf03784be781fcb02956df3c9c519$6c31e938f996fbfbc91e45b4a25ba77e0377a2494e01689f1934ba21d70525a3380d39ab85a6e1c72a5cca79217f6d3382d5db3f40ae74da7f0c10a58eac430f',0,1,0,'2011-03-30 18:10:43','2011-03-30 18:06:50'),(6,'3999bc28-8a8a-11e1-83f0-0050568f000a','','','dynamis@firehacks.org','sha512$18cacaa00b1eab3f7edcc886abae11d9626b03ee86381e8578b17a889bfde7f1$48a248dc1608f230ba22690a01165a03ae750487ce96853f4c6d587815befa88f72198f408fc485210ad544a070e86bd9434f6d83d23c270b6f4612657d1546b',0,1,0,'2011-03-31 03:14:52','2011-03-31 02:21:26'),(7,'3999be3a-8a8a-11e1-83f0-0050568f000a','','','jasnapaka@jasnapaka.com','sha512$d3a89e02207c65539574cb36bd6434a9a088551e836bd9c1ad592d0c6afffc8c$1c10157d17f1a4d678f06edb8007470d668d3fcb1a6b02045a1508f6176c345ea61905ddc526266f1564dfffc08b644f72424cba586d792204ed75fb4d6f26e9',0,1,0,'2013-02-24 06:55:47','2011-03-31 13:28:04'),(8,'3999bfde-8a8a-11e1-83f0-0050568f000a','','','romihardiyanto+test@gmail.com','sha512$12cfdd9c76b8f5fe4c10dac59412295dad8a93586bf2e6d7c7b661f8247325d5$430ed3e7e6fbbca4acf80e17f657216dd9f9361694506011a68026eee57ceca51a20643eba6490942cec91d8a6f00973279fb3015deda10f5c986200fd0fda7a',0,1,0,'2011-04-03 09:07:22','2011-04-03 09:06:53'),(9,'3999c16e-8a8a-11e1-83f0-0050568f000a','','','witia@aviary.pl','sha512$8e30f9b395d7ce8f5ef59d44c74fa1d4116a831adc80e81b77006e56caf93582$166cbf37e9f28bc768e80de4bd668c713c7ad96bf6b7cccd637bc8e893a8c909022f2ef9b65d19c4fea00c2ea352e0348a102d001ef4b12c0560377e6cc665a9',0,1,0,'2011-07-14 08:36:54','2011-04-27 02:40:29'),(10,'3999c2f4-8a8a-11e1-83f0-0050568f000a','','','pcvrcek@mozilla.cz','sha512$497023eff5c6e7f5e08430361d962e3aea1947936cdc49d1aa7c24343427dc24$f805d7218f6032cc8b2173f6bc08bc6afcc136c50cf722fd9efcec199f52ebd7f397c5be9172edc034a8da5b48b4594d1d8d615c7a61f49c14a96f6dbe49822f',0,1,0,'2012-10-19 16:24:55','2011-05-14 07:05:09'),(11,'3999c47a-8a8a-11e1-83f0-0050568f000a','','','leszekz@gmail.com','sha512$df3a9ffaac7dd17e73978924ab591933124fb4aa83141366d0a9f2ddc9097a65$db7f6dff6c7ce963a3b67e2679add47cf09f835771b9e7ef66d68ddb609ae9b657cbf781fd9bd7f132bd85386652baac516097daf6f61653a7b53922ce93549a',0,1,0,'2011-12-04 13:39:42','2011-05-29 09:44:47'),(12,'3999c600-8a8a-11e1-83f0-0050568f000a','','','test@example.com','sha512$8b2d07656e2fcc8eb5d2f835ea5c1744d49031a9e453d466ee6588d3f2019a9f$3f43b52974e6aecc4c9b12bb448933e60058fd98e42a5cc9066bc004fad5be4b278831d6733307d0af2e9112d28d532d290bb24e884a13d28ac0a416c735d64b',0,1,0,'2011-08-26 14:51:26','2011-08-26 14:51:06'),(13,'3999c786-8a8a-11e1-83f0-0050568f000a','','','fk293ak@thursday.eml.cc','sha512$d1cb691eebd43883af90bbbbe5e2f411505a0116ec543cb944fd5399b126bd10$d487628d441a83ef820ac9e686d3d63d6a834e1fe11e9973863a7a2a59369cbd159c199587d72f14c1431f4677953ba7b867ce652d6d413d491c31de2cfca2b2',0,1,0,'2011-09-15 04:42:58','2011-09-15 04:41:46'),(14,'3999c902-8a8a-11e1-83f0-0050568f000a','','','albinowax@gmail.com','sha512$a5985729a084e0f49082036395c5b7a4925bf4a1c9dd5c1ca2fb2625e715b8a2$b0baa78e4ef71bebb498c32488d13c7665b311b592854217e32dd0b30388a3f2dbbe555af755f707866bfa228fb91375fa4afb6f257f859ee1501de8b48fac8f',0,1,0,'2011-12-30 08:15:02','2011-12-30 08:14:21'),(15,'3999ca7e-8a8a-11e1-83f0-0050568f000a','','','abcd@mailinator.com','sha512$b907962cc649f5559d3437c8d16ece7ea72a89ad5f6697e549a50c50a9858871$b02a366eca182c894e785653e1f7469a69356df8da042c8765c8013513801e5aa8fbe614a3c3d11c748130da565f4e04c1294903244b077ca0e505e15e8a5e82',0,1,0,'2012-02-26 03:28:09','2012-02-26 03:27:17'),(18,'clouserwone','','','clouserw+one@gmail.com','',0,1,0,'2013-02-25 09:20:56','2012-04-19 18:58:06'),(19,'hiepvannguyen','','','hiepvannguyen@gmail.com','',0,1,0,'2012-04-28 11:16:24','2012-04-28 11:16:24'),(20,'fernandopsilveira','','','fernandopsilveira@yahoo.com.br','',0,1,0,'2012-08-14 16:58:26','2012-08-14 16:58:25'),(21,'sancus2','','','sancus@mozilla.com','',0,1,0,'2012-09-08 17:45:24','2012-09-08 17:45:23'),(22,'jthomas','','','jthomas@mozilla.com','',0,1,0,'2013-04-26 09:57:59','2012-09-25 14:15:03'),(23,'l-hedgehog','','','l-hedgehog@126.com','',0,1,0,'2012-10-16 20:02:10','2012-10-16 20:02:09'),(24,'cmcdonald','','','cmcdonald@mozilla.com','',0,1,0,'2012-10-17 08:42:29','2012-10-17 08:42:29'),(25,'xwraithanx','','','xwraithanx@gmail.com','',0,1,0,'2012-10-17 08:42:50','2012-10-17 08:42:49'),(26,'charmston','','','charmston@mozilla.com','',1,1,1,'2013-03-13 09:23:30','2013-03-11 20:21:42');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id` (`user_id`),
  KEY `auth_user_groups_group_id` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id` (`user_id`),
  KEY `auth_user_user_permissions_permission_id` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklisted_guids`
--

DROP TABLE IF EXISTS `blacklisted_guids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklisted_guids` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklisted_guids`
--

LOCK TABLES `blacklisted_guids` WRITE;
/*!40000 ALTER TABLE `blacklisted_guids` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklisted_guids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blapps`
--

DROP TABLE IF EXISTS `blapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blapps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blitem_id` int(11) unsigned DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blplugin_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blitem_id` (`blitem_id`),
  KEY `guid` (`guid`),
  KEY `blplugin_id_apps` (`blplugin_id`),
  CONSTRAINT `blapps_ibfk_1` FOREIGN KEY (`blitem_id`) REFERENCES `blitems` (`id`),
  CONSTRAINT `blplugin_id_apps` FOREIGN KEY (`blplugin_id`) REFERENCES `blplugins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blapps`
--

LOCK TABLES `blapps` WRITE;
/*!40000 ALTER TABLE `blapps` DISABLE KEYS */;
/*!40000 ALTER TABLE `blapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blca`
--

DROP TABLE IF EXISTS `blca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blca`
--

LOCK TABLES `blca` WRITE;
/*!40000 ALTER TABLE `blca` DISABLE KEYS */;
/*!40000 ALTER TABLE `blca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bldetails`
--

DROP TABLE IF EXISTS `bldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `why` longtext NOT NULL,
  `who` longtext NOT NULL,
  `bug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bldetails`
--

LOCK TABLES `bldetails` WRITE;
/*!40000 ALTER TABLE `bldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `bldetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blgfxdrivers`
--

DROP TABLE IF EXISTS `blgfxdrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blgfxdrivers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `devices` varchar(255) DEFAULT NULL,
  `feature` varchar(255) DEFAULT NULL,
  `feature_status` varchar(255) DEFAULT NULL,
  `driver_version` varchar(255) DEFAULT NULL,
  `driver_version_comparator` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `details_id` int(11) DEFAULT NULL,
  `hardware` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `details_id` (`details_id`),
  KEY `guid` (`guid`(128)),
  CONSTRAINT `blgfxdrivers_ibfk_1` FOREIGN KEY (`details_id`) REFERENCES `bldetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blgfxdrivers`
--

LOCK TABLES `blgfxdrivers` WRITE;
/*!40000 ALTER TABLE `blgfxdrivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `blgfxdrivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blitems`
--

DROP TABLE IF EXISTS `blitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitems` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `min` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `severity` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `details_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `details_id` (`details_id`),
  CONSTRAINT `blitems_ibfk_1` FOREIGN KEY (`details_id`) REFERENCES `bldetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blitems`
--

LOCK TABLES `blitems` WRITE;
/*!40000 ALTER TABLE `blitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `blitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_cache_ryf`
--

DROP TABLE IF EXISTS `blog_cache_ryf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_cache_ryf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `excerpt` text,
  `permalink` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `date_posted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_cache_ryf`
--

LOCK TABLES `blog_cache_ryf` WRITE;
/*!40000 ALTER TABLE `blog_cache_ryf` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_cache_ryf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogposts`
--

DROP TABLE IF EXISTS `blogposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogposts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `date_posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `permalink` text NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogposts`
--

LOCK TABLES `blogposts` WRITE;
/*!40000 ALTER TABLE `blogposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blplugins`
--

DROP TABLE IF EXISTS `blplugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blplugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `xpcomabi` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `severity` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `details_id` int(11) DEFAULT NULL,
  `vulnerability_status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `details_id` (`details_id`),
  KEY `guid` (`guid`(128),`min`(128)),
  CONSTRAINT `blplugins_ibfk_1` FOREIGN KEY (`details_id`) REFERENCES `bldetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blplugins`
--

LOCK TABLES `blplugins` WRITE;
/*!40000 ALTER TABLE `blplugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `blplugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bluevia`
--

DROP TABLE IF EXISTS `bluevia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bluevia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `developer_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bluevia_fbfc09f1` (`user_id`),
  KEY `bluevia_dev_id_index` (`developer_id`),
  CONSTRAINT `user_id_refs_id_99d7c3ef` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bluevia`
--

LOCK TABLES `bluevia` WRITE;
/*!40000 ALTER TABLE `bluevia` DISABLE KEYS */;
/*!40000 ALTER TABLE `bluevia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cannedresponses`
--

DROP TABLE IF EXISTS `cannedresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cannedresponses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) unsigned NOT NULL DEFAULT '0',
  `response` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_group` varchar(255) DEFAULT NULL,
  `type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cannedresponses`
--

LOCK TABLES `cannedresponses` WRITE;
/*!40000 ALTER TABLE `cannedresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `cannedresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) unsigned DEFAULT NULL,
  `addontype_id` int(11) unsigned NOT NULL DEFAULT '0',
  `application_id` int(11) unsigned DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `count` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(50) NOT NULL DEFAULT '',
  `misc` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `carrier` int(11) unsigned DEFAULT NULL,
  `region` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addontype_id` (`addontype_id`),
  KEY `application_id` (`application_id`),
  KEY `tags_ibfk_3` (`name`),
  KEY `categories_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,2,1,1,0,'2011-03-06 23:41:26','2011-03-06 23:41:26',1,'piratey',0,NULL,NULL),(2,4,1,1,0,'2011-03-06 23:41:49','2011-03-06 23:41:49',0,'ninjay',0,NULL,NULL),(3,1164,11,1,0,'2012-11-06 08:47:48','2012-11-06 08:49:20',0,'appy',0,NULL,NULL),(4,1165,11,1,0,'2012-11-06 08:49:10','2012-11-06 08:49:10',0,'appy-2',0,NULL,NULL),(5,1181,11,NULL,0,'2013-04-29 13:49:48','2013-04-29 13:49:48',0,'sports',0,NULL,NULL),(6,1182,11,NULL,0,'2013-04-29 13:49:48','2013-04-29 13:49:48',0,'reference',0,NULL,NULL),(7,1183,11,NULL,0,'2013-04-29 13:49:48','2013-04-29 13:49:48',0,'maps-navigation',0,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_supervisors`
--

DROP TABLE IF EXISTS `categories_supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_supervisors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_supervisors_42dc49bc` (`category_id`),
  KEY `categories_supervisors_fbfc09f1` (`user_id`),
  CONSTRAINT `category_id_refs_id_882d0587` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `user_id_refs_id_8ddff2da` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_supervisors`
--

LOCK TABLES `categories_supervisors` WRITE;
/*!40000 ALTER TABLE `categories_supervisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_supervisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charities`
--

DROP TABLE IF EXISTS `charities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `paypal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charities`
--

LOCK TABLES `charities` WRITE;
/*!40000 ALTER TABLE `charities` DISABLE KEYS */;
/*!40000 ALTER TABLE `charities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_data`
--

DROP TABLE IF EXISTS `client_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `download_source_id` int(11) unsigned DEFAULT NULL,
  `device_type` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `is_chromeless` tinyint(1) DEFAULT NULL,
  `language` varchar(7) NOT NULL,
  `region` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `download_source_id` (`download_source_id`,`device_type`,`user_agent`,`is_chromeless`,`language`,`region`),
  CONSTRAINT `download_source_id_refs_id_b71b78fb` FOREIGN KEY (`download_source_id`) REFERENCES `download_sources` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_data`
--

LOCK TABLES `client_data` WRITE;
/*!40000 ALTER TABLE `client_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_features`
--

DROP TABLE IF EXISTS `collection_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` int(11) unsigned NOT NULL DEFAULT '0',
  `tagline` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `collection_features_ibfk_1` (`title`),
  KEY `collection_features_ibfk_2` (`tagline`),
  CONSTRAINT `collection_features_ibfk_1` FOREIGN KEY (`title`) REFERENCES `translations` (`id`),
  CONSTRAINT `collection_features_ibfk_2` FOREIGN KEY (`tagline`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_features`
--

LOCK TABLES `collection_features` WRITE;
/*!40000 ALTER TABLE `collection_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_promos`
--

DROP TABLE IF EXISTS `collection_promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_promos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(10) DEFAULT NULL,
  `collection_feature_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `one_collection_per_tagline_per_locale` (`collection_id`,`locale`,`collection_feature_id`),
  KEY `collection_id` (`collection_id`),
  KEY `collection_promos_ibfk_2` (`collection_feature_id`),
  CONSTRAINT `collection_promos_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  CONSTRAINT `collection_promos_ibfk_2` FOREIGN KEY (`collection_feature_id`) REFERENCES `collection_features` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_promos`
--

LOCK TABLES `collection_promos` WRITE;
/*!40000 ALTER TABLE `collection_promos` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_recommendations`
--

DROP TABLE IF EXISTS `collection_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_recommendations` (
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `other_collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `score` float DEFAULT NULL,
  KEY `collection_id` (`collection_id`),
  KEY `collection_recommendations_ibfk_2` (`other_collection_id`),
  CONSTRAINT `collection_recommendations_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collection_recommendations_ibfk_2` FOREIGN KEY (`other_collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_recommendations`
--

LOCK TABLES `collection_recommendations` WRITE;
/*!40000 ALTER TABLE `collection_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_subscriptions`
--

DROP TABLE IF EXISTS `collection_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `collection_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id` (`collection_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `user_created_idx` (`user_id`,`created`),
  CONSTRAINT `collections_subscriptions_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  CONSTRAINT `collections_subscriptions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_subscriptions`
--

LOCK TABLES `collection_subscriptions` WRITE;
/*!40000 ALTER TABLE `collection_subscriptions` DISABLE KEYS */;
INSERT INTO `collection_subscriptions` VALUES (1,1,2,'2011-03-29 12:47:19','2011-03-29 12:47:19');
/*!40000 ALTER TABLE `collection_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL DEFAULT '',
  `name` int(11) unsigned DEFAULT NULL,
  `defaultlocale` varchar(10) NOT NULL DEFAULT 'en-US',
  `collection_type` int(11) unsigned NOT NULL DEFAULT '0',
  `icontype` varchar(25) NOT NULL DEFAULT '',
  `nickname` varchar(30) DEFAULT NULL,
  `description` int(11) unsigned DEFAULT NULL,
  `listed` tinyint(1) NOT NULL DEFAULT '1',
  `subscribers` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `downloads` int(11) DEFAULT '0',
  `application_id` int(10) unsigned DEFAULT NULL,
  `weekly_subscribers` int(11) unsigned NOT NULL DEFAULT '0',
  `monthly_subscribers` int(11) unsigned NOT NULL DEFAULT '0',
  `addonCount` int(11) unsigned NOT NULL DEFAULT '0',
  `upvotes` int(11) unsigned NOT NULL DEFAULT '0',
  `downvotes` int(11) unsigned NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `addon_index` varchar(40) DEFAULT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  `slug` varchar(30) DEFAULT NULL,
  `all_personas` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `author_id` (`author_id`,`slug`),
  KEY `listed` (`listed`),
  KEY `application_id` (`application_id`),
  KEY `name` (`name`),
  KEY `description` (`description`),
  KEY `collections_addon_index` (`addon_index`),
  KEY `subscribers_idx` (`subscribers`),
  KEY `slug_idx` (`slug`),
  KEY `type_idx` (`collection_type`),
  KEY `watcher_idx` (`weekly_subscribers`),
  KEY `rating_idx` (`rating`),
  KEY `created_idx` (`created`),
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `collections_ibfk_4` FOREIGN KEY (`name`) REFERENCES `translations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `collections_ibfk_5` FOREIGN KEY (`description`) REFERENCES `translations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `collections_ibfk_7` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'9469736f-66f8-43b7-bf9e-429855041e7a',26,'en-US',4,'',NULL,NULL,0,0,'2011-03-23 21:09:22','2011-03-23 21:09:23',0,NULL,0,0,1,0,0,0,'c4ca4238a0b923820dcc509a6f75849b',1,'favorites',0),(2,'3d7f0be6-036f-41a5-95dd-fda273befc39',28,'en-US',0,'',NULL,29,1,1,'2011-03-29 12:47:08','2012-04-19 18:54:17',0,1,0,0,1,1,0,0,'c4ca4238a0b923820dcc509a6f75849b',1,'firefox-features',0),(3,'2ade647c-cb4b-4bbf-83cd-6a86ead4345f',1155,'en-US',4,'',NULL,NULL,0,0,'2012-02-26 03:30:32','2012-02-26 03:30:34',0,NULL,0,0,1,0,0,0,'c4ca4238a0b923820dcc509a6f75849b',15,'favorites',0),(4,'e58c4357-5f19-4bf4-bb43-974758934fe8',NULL,'en-US',2,'',NULL,NULL,0,0,'2012-04-19 18:43:30','2012-04-23 00:40:56',0,NULL,0,0,0,0,0,0,'d41d8cd98f00b204e9800998ecf8427e',16,'featured_apps_home',0),(5,'4d325818-11be-4bde-a99b-c5c6b1b7e3a4',NULL,'en-US',2,'',NULL,NULL,0,0,'2012-04-19 18:43:36','2012-04-23 00:40:58',0,NULL,0,0,0,0,0,0,'d41d8cd98f00b204e9800998ecf8427e',16,'featured_apps_category',0);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_users`
--

DROP TABLE IF EXISTS `collections_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role` tinyint(2) unsigned NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id` (`collection_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collections_users_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  CONSTRAINT `collections_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_users`
--

LOCK TABLES `collections_users` WRITE;
/*!40000 ALTER TABLE `collections_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_votes`
--

DROP TABLE IF EXISTS `collections_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `vote` tinyint(2) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id` (`collection_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collections_votes_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  CONSTRAINT `collections_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_votes`
--

LOCK TABLES `collections_votes` WRITE;
/*!40000 ALTER TABLE `collections_votes` DISABLE KEYS */;
INSERT INTO `collections_votes` VALUES (1,2,15,1,'2012-02-26 03:31:07');
/*!40000 ALTER TABLE `collections_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm_thread_cc`
--

DROP TABLE IF EXISTS `comm_thread_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comm_thread_cc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `thread_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`thread_id`),
  KEY `comm_thread_cc_9a6ed576` (`thread_id`),
  KEY `comm_thread_cc_fbfc09f1` (`user_id`),
  CONSTRAINT `thread_cc_thread_id_key` FOREIGN KEY (`thread_id`) REFERENCES `comm_threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `thread_cc_user_id_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm_thread_cc`
--

LOCK TABLES `comm_thread_cc` WRITE;
/*!40000 ALTER TABLE `comm_thread_cc` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm_thread_cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm_thread_notes`
--

DROP TABLE IF EXISTS `comm_thread_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comm_thread_notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `thread_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `note_type` int(11) NOT NULL,
  `body` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `body` (`body`),
  KEY `comm_thread_notes_9a6ed576` (`thread_id`),
  KEY `comm_thread_notes_cc846901` (`author_id`),
  CONSTRAINT `thread_notes_author_id_key` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `thread_notes_body_key` FOREIGN KEY (`body`) REFERENCES `translations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `thread_notes_thread_id_key` FOREIGN KEY (`thread_id`) REFERENCES `comm_threads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm_thread_notes`
--

LOCK TABLES `comm_thread_notes` WRITE;
/*!40000 ALTER TABLE `comm_thread_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm_thread_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm_thread_tokens`
--

DROP TABLE IF EXISTS `comm_thread_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comm_thread_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `thread_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `uuid` char(32) NOT NULL,
  `use_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `thread_id` (`thread_id`,`user_id`),
  KEY `comm_thread_tokens_fbfc09f1` (`user_id`),
  KEY `comm_thread_tokens_9a6ed576` (`thread_id`),
  KEY `comm_thread_tokens_uuid_index` (`uuid`),
  CONSTRAINT `thread_tokens_thread_id_key` FOREIGN KEY (`thread_id`) REFERENCES `comm_threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `thread_tokens_user_id_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm_thread_tokens`
--

LOCK TABLES `comm_thread_tokens` WRITE;
/*!40000 ALTER TABLE `comm_thread_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm_thread_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm_threads`
--

DROP TABLE IF EXISTS `comm_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comm_threads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `version_id` int(11) unsigned DEFAULT NULL,
  `read_permission_public` tinyint(1) NOT NULL,
  `read_permission_developer` tinyint(1) NOT NULL,
  `read_permission_reviewer` tinyint(1) NOT NULL,
  `read_permission_senior_reviewer` tinyint(1) NOT NULL,
  `read_permission_mozilla_contact` tinyint(1) NOT NULL,
  `read_permission_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comm_threads_269da59a` (`addon_id`),
  KEY `comm_threads_fef0b09d` (`version_id`),
  CONSTRAINT `comm_threads_addon_id_key` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comm_threads_version_id_key` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm_threads`
--

LOCK TABLES `comm_threads` WRITE;
/*!40000 ALTER TABLE `comm_threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compat_override`
--

DROP TABLE IF EXISTS `compat_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compat_override` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `guid` varchar(255) NOT NULL,
  `addon_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid` (`guid`),
  KEY `addon_id` (`addon_id`),
  CONSTRAINT `compat_override_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compat_override`
--

LOCK TABLES `compat_override` WRITE;
/*!40000 ALTER TABLE `compat_override` DISABLE KEYS */;
/*!40000 ALTER TABLE `compat_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compat_override_range`
--

DROP TABLE IF EXISTS `compat_override_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compat_override_range` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `compat_id` int(11) unsigned NOT NULL,
  `type` smallint(6) NOT NULL,
  `min_version` varchar(255) NOT NULL,
  `max_version` varchar(255) NOT NULL,
  `app_id` int(11) unsigned NOT NULL,
  `min_app_version` varchar(255) NOT NULL,
  `max_app_version` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  KEY `compat_id` (`compat_id`),
  CONSTRAINT `compat_override_range_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `compat_override_range_ibfk_2` FOREIGN KEY (`compat_id`) REFERENCES `compat_override` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compat_override_range`
--

LOCK TABLES `compat_override_range` WRITE;
/*!40000 ALTER TABLE `compat_override_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `compat_override_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compat_totals`
--

DROP TABLE IF EXISTS `compat_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compat_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `app` int(11) unsigned NOT NULL,
  `total` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compat_totals`
--

LOCK TABLES `compat_totals` WRITE;
/*!40000 ALTER TABLE `compat_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `compat_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compatibility_reports`
--

DROP TABLE IF EXISTS `compatibility_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compatibility_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(128) DEFAULT NULL,
  `works_properly` tinyint(1) unsigned DEFAULT NULL,
  `app_guid` varchar(128) DEFAULT NULL,
  `app_version` varchar(128) DEFAULT NULL,
  `app_build` varchar(128) DEFAULT NULL,
  `client_os` varchar(128) DEFAULT NULL,
  `client_ip` varchar(128) DEFAULT NULL,
  `comments` text,
  `other_addons` text,
  `created` datetime DEFAULT NULL,
  `version` varchar(128) DEFAULT '0.0',
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `created_idx` (`created`),
  KEY `guid_created_idx` (`guid`,`created`),
  KEY `guid_wp_idx` (`guid`,`works_properly`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compatibility_reports`
--

LOCK TABLES `compatibility_reports` WRITE;
/*!40000 ALTER TABLE `compatibility_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `compatibility_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('editors_review_motd','To jest próba wiadomości dnia.'),('site_notice','This is a public test server.  <b>Any information on this site is public including passwords.  Don\'t put private information here!</b>  For more information:  <a href=\"http://micropipes.com/blog/2011/03/29/welcome-to-the-landfill/\">What this server is for</a> or the <a href=\"http://jbalogh.github.com/zamboni/\">development documentation</a>');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discovery_modules`
--

DROP TABLE IF EXISTS `discovery_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discovery_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `app_id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  `locales` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discovery_modules`
--

LOCK TABLES `discovery_modules` WRITE;
/*!40000 ALTER TABLE `discovery_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `discovery_modules` ENABLE KEYS */;
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
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-03-06 23:41:26',1,1,'1','Pirate-y',1,''),(2,'2011-03-06 23:41:49',1,1,'2','Ninja-y',1,''),(3,'2011-11-18 15:53:26',1,5,'6','ajax-search: on',2,'Changed active.'),(4,'2011-11-18 15:53:32',1,5,'5','search-suggestions: on',2,'Changed active.'),(5,'2011-11-18 15:53:37',1,5,'4','browserid-login: on',2,'Changed active.'),(6,'2011-11-18 15:54:02',1,6,'2','csp-store-reports',2,'Changed percent.'),(7,'2011-11-18 15:54:14',1,7,'6','edit-dependencies',2,'Changed everyone.'),(8,'2012-11-06 08:47:48',1,1,'3','App-y',1,''),(9,'2012-11-06 08:49:10',1,1,'4','Another App-y',1,''),(10,'2012-11-06 08:49:20',1,1,'3','App-y',2,'Changed application.'),(11,'2012-11-06 09:05:31',1,7,'3','accept-webapps',2,'Changed everyone.'),(12,'2013-03-13 09:28:57',1,9,'1','Admins',2,'Added group user \"GroupUser object\".');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'category','addons','category'),(2,'application','applications','application'),(3,'user','auth','user'),(4,'group','auth','group'),(5,'switch','waffle','switch'),(6,'sample','waffle','sample'),(7,'flag','waffle','flag'),(8,'group user','access','groupuser'),(9,'group','access','group'),(10,'user profile','users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('001a3c8322fc23194ab13232e652dc50','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:56:11'),('0187ae34bee0c368a3430bb5de4d3aa5','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:10:10'),('029a2cb3ee9156f778be94cc275df672','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-01-13 08:24:55'),('035265ef278e6f4093ba089b0188342c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 01:21:09'),('063dac5fd32840bd229df0d4ea59c848','NTY5ZGMwZjc0YzA5MjhkMDdlNDYxMDZmOGQ4M2RhYjlhYzViYzJhZDqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSgB1EgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVR11c2Vycy5iYWNrZW5kcy5BbW9V\nc2VyQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQV1Lg==\n','2011-04-13 18:10:43'),('0b79ca30dfec46e08eab2131c1c04814','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-06 10:56:56'),('0d65fcaa8fea708e76ad1ed9d4ec5903','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-02-23 00:14:27'),('0d8c82499dd5c8026342bddd49fd0cd9','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-29 13:55:50'),('0e3e7cd81407a24a2330c1a1b953bd54','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-05 20:22:23'),('0f2dcf1cb685a852bae2175e1e9785c2','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-07 11:02:52'),('0fd4be0ac8d38b07ea009a0733f7f7cc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-01 14:09:36'),('11c5843f13d478816275aa559114aa5a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-31 17:22:43'),('12f4811a5a44ad184c179f9c1e2764ca','MzkzYmJjYjA3YzBiMTc5M2Y1YTA2YTg0MTBkMDhkZjBjMjc3YjkzZjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZjUxYjBlNDcxZjg1ZTJjNGQxNGUwM2ExZjYzZGRkMmNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEUVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2012-08-28 16:58:27'),('135633c460b2ddcd29f9f105e4dcd43a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-21 10:31:02'),('17192f455196a6bd7c0f54dae9fcc112','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:19:01'),('173ad4c7d5c5474dff9cc6e3434a2aa1','NTJkZmEzMWUxZmViMTZjZDhiNjZhODljZmU1NGE0ZTBhY2QwMWNlZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSZkamFuZ29fYnJvd3NlcmlkLmF1dGguQnJvd3NlcklEQmFja2VuZHEDVQ1f\nYXV0aF91c2VyX2lkcQSKARJ1Lg==\n','2013-03-11 09:20:56'),('1770c33aff84b3e71275c9b48e3c8177','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-09 02:21:51'),('18d09e65f970a6da65adec3b5e983c6c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:20:16'),('1c0f4f87a5d4b82694e8d877ba14bf89','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-11-17 04:36:12'),('1cad29c815003400dc4327f2b1f024d6','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-12-24 22:08:59'),('234e49b7d80722ea9700514b529cad8a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-30 01:43:22'),('237f4c6e0c26f5cf28ebdfb6dfa70e30','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:10:10'),('243c9cd44460d91d697487cc8f8ec1f1','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-02-09 01:35:23'),('268a749fc58f0ac1ef8c89613df26bf7','NTJkZmEzMWUxZmViMTZjZDhiNjZhODljZmU1NGE0ZTBhY2QwMWNlZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSZkamFuZ29fYnJvd3NlcmlkLmF1dGguQnJvd3NlcklEQmFja2VuZHEDVQ1f\nYXV0aF91c2VyX2lkcQSKARJ1Lg==\n','2013-03-11 09:19:57'),('28e8b3de7ffa63ea1282bbfef7dda90f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-02-09 03:15:15'),('293c638717f3cb78469b84a154a11d08','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-02-09 00:18:52'),('2aebb7a84b2e245a090cc3c2102ce495','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:37:15'),('2b4844fd9bfc88818c5c0490d80db1bd','NDA5MTJlYTQ4YTRkYWFlYTdmODdlZTFmNTkxNzMzNDU0OGNiNjhjMjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgN2VlY2YyNmRiMzgyODk0M2RiNzhhYzFmMmY5OTFjZjNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-12 05:50:54'),('2ced58c7bae1bf0f2d0d6c200484c0aa','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-21 02:21:00'),('2cef50443ba103600b337b2beea00242','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-11-17 04:36:17'),('2e0ba0f3866f9865ee69dc6589acf279','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-26 06:17:17'),('310b8052101709ba5019a14d2ca4871d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-15 06:06:05'),('310edd747d5ae733098031c5aa1374ef','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:44:29'),('3183a97155e95f2327b11445e02e3c07','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-05 20:14:35'),('331a8c9513d3d72c15a797557ac6e905','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 13:09:46'),('3321a48762be77cb34796a2cf2388829','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:33:57'),('33c4cdb2aeca0cbb81d87a42c8b635cc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:18:44'),('33dff3680e652bb151b89bea7fc84158','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:37:21'),('36352769dc79cde1306abe7868f2c41c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:56:02'),('36db4aa4e293855b26b72aba5a6e7ecd','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-03-28 11:45:50'),('3741e2aed9b900d2e98e2af04c16a52c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 12:58:53'),('3775c75bbd49b7bff1f380cc91c8c893','YTAzZTg5YTEyZDM1ODllYWE4Zjg4ODE0Mjc2OWI1MTY1ZGMyOTMzZTqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSgB1EgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVR11c2Vycy5iYWNrZW5kcy5BbW9V\nc2VyQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQd1Lg==\n','2011-04-14 13:44:27'),('3a12aea9842a10c84ee7a91ee0c2c8cc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-06 17:53:11'),('3b19e0cf9c33ed1eda6dfdb7ff2a7038','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:37:26'),('3b3656af44983536381dab0b4dfad493','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:44:29'),('3bef931c6f9705f2b2c21cb996c98d1c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:30:36'),('3cd084571e7988a42a61a46760781356','OTc3MDE3NzAzYzY3ZmVjZTNlNzM5ZDhhY2E0YTU4ZDgyYTAzOWViMzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgRUJTS0VuUWFpM3dVOGRvb3plUUFUVE53RUFKNnNNTjVxA1UNX2F1dGhfdXNlcl9pZHEE\nigEHVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2012-11-02 16:26:12'),('3cfbc70f57633b61fad36d2ffa625fab','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-31 17:22:46'),('3d007430bd3e799b590513a32ddf298d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-30 00:06:13'),('3d90cd98683b7ad5bb33dd3a0ebb9c0c','ZGY1M2Q1ZTM1ZjFjY2RhZjgyYWMyMzRmNDdjOGE3NjNjNTU0YmVlMzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgMDVkNTkxZmVmN2QxN2FlY2U2ZmY4Y2U5NzAwYjg2MmNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-05 20:23:26'),('3e8242293fb334e88ca5e2633729a9a3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-12 06:14:57'),('4038be36afc704315745b15b97f40ce5','ZjcyMjc1NWM2ZTBmMDk3YzMzY2M0YThkZGYyM2VkZjY3MTRjYzUzZjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgYzJiYTA5MjU3ZjRhYjgzODk0ZDU2YmZhOTQ5NTY1MjFxA1UNX2F1dGhfdXNlcl9pZHEE\nigEHVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2011-06-23 13:34:00'),('4132bc1bd4ff6964c6219d0ff5585f42','YWE3ZTE4MDczMzRhMzk5MjcwNmFiZTMzODE0NjU2ODYwNzk5Mzg5ZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgOWQxNzQzOTEwMmQ0Y2EyZGIxMmEyYTRhN2E2NjU2OTdxA1UNX2F1dGhfdXNlcl9pZHEE\nigEKVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2011-07-22 14:35:00'),('41cb8d9b8b94f63bf2155b4ac0666859','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-20 14:06:54'),('422ac8eb9738582cd1dde94fdf954c3c','NTcyYWMyYzgxNTJmYzVmMzA2NjRlNTBlY2RkYjlkYjJkNDhjNGE5OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQFVD19zZXNzaW9uX2V4cGlyeXEFSgB1EgB1Lg==\n','2011-03-20 23:54:03'),('42f8152c13bf304673924fed99280224','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:10:10'),('459c05610122d0b7d86bb23b814916c5','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-07 15:03:49'),('461e860915bbbcf7cd518789f1b3c3ea','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:56:01'),('4627e2d9402c8414e2c7c6242bdca08b','ZjAzZmM2NTMyNDdlMGU0OWNjZDk4YjRhNGY2MDRkMGExMGQzNzA0ZDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgUnFPNXNHT2hydGU5a1dVb0k0SFA5QmlrcFdQTXZUYXhxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2013-03-27 09:26:08'),('463fde969a97df580c540e29e0b6eaee','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-09-09 14:45:59'),('46969eef72ec6c66756dfadeeb25019a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:30:35'),('47914151c3a30a644412a4dc378fe2a0','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:33:35'),('48665572b688f96e2b036cb93dfc4f01','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:19:03'),('4ae9bb62302ce566cf970fffe0950d1a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-12 10:41:35'),('4b8551280eea3570008d7219c3d0bf33','N2U4YjJmMzg4MDRjOGVjNWMzYzI1MGEzYzBlYzA4Zjk2MDdjMjFhMjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgS2ZjV3NpS0NwTzJzeUtKRFE1bjVHUVBHNVJCMWdIZERxA1UNX2F1dGhfdXNlcl9pZHEE\nigEWVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2013-02-08 12:36:37'),('4cc496c4dc74183bf70278fdc7af6a1c','N2FkMTViOTMzMTc2YTRjNDNlMzI2YzNlM2Y2YWM5YzAyMmY3YmYyMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQh1Lg==\n','2011-04-17 09:07:22'),('4d8694a7298c03f817f30eaaedf1facd','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-16 14:13:12'),('4dd3418dd1b5e5e40a977f859af2f717','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-31 17:22:30'),('4ee27e4dbab81e0829e0a0ff37656733','OGQ4YzZkY2E1NmFjMzMyZTllMmM3YzQ3ZGJkNGE5NmMwYmNiZTc2YjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZTQyNmIxMmRmOTQyZTdhNDcwYzc1OTM5MzlkMjhkYTZxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-11 02:41:57'),('516cbd730dadd0a3a7c3d378ab665f88','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-09-21 10:26:32'),('516fddb935cd68d2e4f7c9ce657148d8','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-28 08:46:22'),('51be47479d24257edf02381a412e051d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-12 14:43:05'),('5466a5c383101ca7789e9d68ece4d4f0','ODY5YjUyYjY3ZDRmNjQyNjQ4OTQ1NzkyMDk5YTE4YjY0ZmUyYTY0ZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgYWQ2NjNiYmM1ZjdjZDM3MzMzYzhhMDBlNzc0ZWZlZmZxA1UNX2F1dGhfdXNlcl9pZHEE\nigETVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2012-05-12 11:16:25'),('55f63f5ca441fda7c77569f0eb1cd50d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:13:21'),('56dda5919e15f7275da3e9522e38b922','MDU4NmFlOWYwOWU2YjA5NjdiZmRhMTY4NjRjZmVjMTFjY2Q1NTFjNTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgNTk2YzI5ZDk5NDBjMDIxMzQ5ZjY2NzQyNGZiZjkyZTNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEHVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2011-05-28 08:30:21'),('59224e87258cf9dbb68f416c5decfc22','YzNlMmQ1Y2ZmZDhlNjAwYzVkNGMyYjAxMDMwOTYxOWE1Y2MwYmRjZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgM2I3YWQxMWRiMDM4NjIwMDE3YzYwZDJlOGU2NjRjMDRxA1UNX2F1dGhfdXNlcl9pZHEE\nigECVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-06-21 00:50:47'),('59304d90020aba357b1f2b555c3f87f3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:33:00'),('59c02860b84a5916a2a2271baad2d5cf','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-06 05:19:21'),('5a10bcd3ae3f219760be96ae5734a5cc','ZjdjMjY0M2FjOGZiM2MyYjU2YmE1ZDBlNTJhZWFlZWIzNGIwYTlmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSZkamFuZ29fYnJvd3NlcmlkLmF1dGguQnJvd3NlcklEQmFja2VuZHEDVQ1f\nYXV0aF91c2VyX2lkcQSKARZ1Lg==\n','2013-02-19 08:47:10'),('5b285b913f64e43611a2f870a7fe4d2f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-09-09 14:41:36'),('5b883bc83b1c2ccab074c745905c975f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-03-07 01:29:01'),('5c3e65be72e5b63607a988689ee7662a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-27 09:21:53'),('5dbc07764ee7ee966f1dea0aaca69d36','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 01:35:59'),('5efe823bfb8999c0978fca8c40083338','YjVmZWM4ZTM4MWVmMjM0MThkM2MwYTE3YjEwNDk0MTFjNmY4MzA2YzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgOWNlZGI2MWM3ZWM3NDNmNzk5Y2Y4MjRhOTZkYjNiMTZxA1UNX2F1dGhfdXNlcl9pZHEE\nigEHVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-12-04 10:46:01'),('61aa6a5ebbeff31179de7805f484d54b','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-12-04 06:58:29'),('631dea3a2669eed624e71dab3a3c3f27','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-03 09:09:50'),('6330febeec1bd0a789104e243bd77694','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-29 04:37:04'),('642bd1a4f754e064332fa34834edf0e3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-12 15:01:27'),('64dd1a19a7f7654786574d554fe9cf6a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-05 19:58:51'),('672ad30df4433350bbd503a092bec8d3','NDU3MDY2MzAyYTFmYmE0YTRhYTNlYTEwYWE1YmNjOWQ0YjEzOTI3NDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgOGNmYzk0MjYxYzkzYmYwMzcyMGUxNTY3MmRlNjgzMDhxA1UNX2F1dGhfdXNlcl9pZHEE\nigESVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2012-05-03 18:58:07'),('69394bdc567dc92b3b65d55a425473f3','OWJjNTU1NjlkMzgwYzAyNGM5YzM1OTJhYTg1YjMxZWY5MTA1NjM3MTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgMGM3MjA2MjllOWY1NGRkYTMxZTg3M2ViZjRhMzIwMzdxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2012-05-06 17:58:43'),('698406b03a1455ee6f513f7567220e13','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-14 18:56:46'),('69c5bb8170c9ed44dbf1014fcbedefeb','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 01:42:41'),('6a965a29e56c7401c5f5b754e1e484f5','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-03 01:34:50'),('6afa5925b108601e38822cc39174e633','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:37:20'),('6b3006ea18dbcacc2e0ebcaa2ea47879','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-17 01:35:52'),('6fabb80f97dfc7348cb2f06a8e682f63','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-14 15:28:51'),('70a1cf91b20c9786f5cb382db4d7bd02','ZDNhZThkM2ZiYWNjZTE1NzNjMTE0NWIxNDFkNDI5NWZiYjUwMTNkZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgOTY3NjAzZDhlOWJjNTBlNmY4NjJjYzg2NDBkMGQ5YTRxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-11 15:36:41'),('70fee6bdedcd648f8d4b1ea77a920983','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-17 01:35:49'),('73ac82cfd92a15d72d4241c855ce6e4b','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 01:40:26'),('7408ecf2ddb9a33752469aa12626e9c2','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:13:47'),('749961672176d8a4655529b0cefab643','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:42:11'),('755094f7e67f00bbe1497cf9d938ce8d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-27 02:23:02'),('75f08b92afae476d9b7b68099a7036b3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-25 05:19:28'),('75f53b1ad27fae42cad8857f2ffcfa67','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-12-04 11:20:24'),('7639f31c700bce4565b7791b96805e8a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:10:17'),('7745309e0b27e28b1bbc19fa232958b9','N2QyZDU2YzQyYmU3N2MwYTExZThlMTQ4NjJmMjBhYzZmODU3MjkxZjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgYldWVWZpZmNMNTE0dTk3SFl0bjQzcjRsNGhWell5aXNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2013-03-08 21:56:17'),('7896ca5c1a0a01290e950d8be6524c9a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-12-26 20:09:30'),('791ffdbdcbe6a67ecfc80ed055a6c63f','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-17 01:38:03'),('7adbcf60f9d9740bf95d027860bf5037','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-28 04:46:30'),('7b3b1d500b1c9728fcc4c6cb1cb5bb7f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:26:14'),('7d96276c1bbbd99a1986eb76bd2a99a3','OWY2YTdiNWE3MDMwYjJhZDc1ZDJiZDA2YmEzYjVhODU3YzYzMTkwYjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgODU3M2U3MmYwYzkyMjA1YWNkZTRhNGZjNzViYzU0MmNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-07-28 08:36:58'),('7df1abfce004dda28b68ef128c78f61f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-09-09 14:40:38'),('7fa51d62f4abff0772479537f971191d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-17 01:37:21'),('80048a58ad58e0ed49446f818ae3334a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-27 02:33:53'),('80178a8841fb82fa9fce8ab6958b4fa0','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 12:58:55'),('82686cff535e69612489eb2c073ec703','MTRlOWExZjQ0OTgzNzlhNzcxMmZjYWJlMDZiMWNmOWJjMWVkMjJjYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQF1Lg==\n','2011-04-13 10:06:40'),('82c01d8aa8c70ab4207d420b82b5f6bc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-05 20:02:43'),('83ff8fe4d47f9d22d0c7db534eff66a4','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:41:43'),('8793f005e92adef660022e152bf90035','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2012-04-18 17:37:43'),('888bf2a6be8c9774878469b3103e46fa','YzRhZTUxYTlmZjFlMTJjNTA2ZWFmNmEyYWFhODA4YTRiMDg5NDlmYjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgN2IyYTk0MjAyODZmY2Q2MjE3YWRmMWZjYmFhNzE2NjhxA1UNX2F1dGhfdXNlcl9pZHEE\nigELVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-09-13 06:19:37'),('88a533cc18ed00cdb9fe432a6e45ecad','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-05-05 19:54:29'),('893bbc07078cd7beda0fc54048ad366a','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2013-02-08 12:34:45'),('8a57be975559b84e9c0d18a5e31e42c4','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:30:35'),('8b068ad6abd5db07101cb5a2d9b9259d','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-09-09 14:51:27'),('8b333dfbb1b903d2d1b694317a22bbc7','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2012-10-09 14:15:14'),('8ed074121baaf4131a7498547f02604e','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-03-20 14:12:49'),('9216cb713eec5cfd0859f417b47cfc22','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:13:28'),('9221d9e5765ba7659c14e82992cfeee9','YmZhNjFkNjdiYmRmOWEyODY3OTRlMDU2YjQ5MGY3NTNjZWE4OGNlYzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgRVBnZUNQVWJIZU9NQ0poTU02d1FOQ3ZRQWxRdUtRTDZxA1UNX2F1dGhfdXNlcl9pZHEE\nigECVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2012-09-22 17:46:17'),('9415a8318a288126469151b55ee861ba','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2012-10-30 20:02:17'),('94194bdd36849db986cb3c8f2d0c21e2','ZTNlMDIwYWI5YTdmMTk3OWU5ZWMyZThlYjNlYTIwYzBhMGQxM2YzYTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgNjk5NzgzOGM5NmI0YmFiZTA4NWZhZjdlM2I2YjZjOWFxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-11 13:35:27'),('94bea9af24cb682eb6d4e52b03ab2b86','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:44:29'),('94fa4c27ac364fcfaf2d764886a298cc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-03-26 06:19:37'),('9568d40096d918ab6fdd700b87961dd3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-08 20:39:34'),('95b4cce2fa8783cb528e0bbbfce09737','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 01:22:14'),('9663cfaac330b323ff5756439ab0a27c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 13:09:14'),('97269b949063d4eebdc2be44454140e7','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 13:23:02'),('97f3d2983384a965ebb9a43449e5e1d4','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-05 01:22:22'),('9898755b63d336fd26074eb4e5d8b88d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:42:11'),('9a737c57d3533f254f3658e9aee13cdc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:44:30'),('9d8719cc039adbc8476d3a34d527a276','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-03-28 11:45:52'),('a004641b5f4041faae5d0f03d2ad8bfa','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-21 02:21:02'),('a1195fcea030bc0c064bc634246cfa8b','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-09 04:37:14'),('a13377b2e4fc414bf55cccd098aa2f6a','MTRlOWExZjQ0OTgzNzlhNzcxMmZjYWJlMDZiMWNmOWJjMWVkMjJjYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQF1Lg==\n','2011-04-12 12:47:10'),('a1723871133dbe6abaeff11e66cd8471','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-13 16:25:12'),('a30dbf9820e4af602af35ed70e85f61c','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-28 01:29:11'),('a3233b865611b1316cd682f73161e6e4','NDM1YWZiNTljYzczYjQzZGU4MGYzNzRiN2FmNjU5NWJhYzRlM2Q5MzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgd25kVzl3MDJLVjlncHVTN1F3czJZYnNWTndNUXMzc0NxA1UNX2F1dGhfdXNlcl9pZHEE\nigEaVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2013-03-27 09:29:19'),('a4599f06c3caebf06e71425335159187','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-21 02:21:05'),('a4f0e523ba79a1f47fc4d23f82006088','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-12-26 20:09:18'),('a5dc7266883d4544b390bd8a621d65b6','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:30:35'),('a67f6b411c1f98907eaf2236aa60887f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-17 01:37:52'),('a826b9424dc4206b8b47bff7f784e2a6','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-17 03:36:29'),('aa0c2e65f81b8847568bc5d082a74480','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-01 01:28:58'),('acb22cef5f058e071c783118b15a6c14','OTkzMDEzNWMwODZjYTcwMjg4OWNmMTQwMmM5MTdiYTUxZWFjY2QwMzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgc0V4UEdEUUtnUWxCR2ZRN1lyR0ZETm5OZmNsbWpxck5xA1UKdGVzdGNvb2tpZXEEVQZ3\nb3JrZWRxBVUNX2F1dGhfdXNlcl9pZHEGigEZVRJfYXV0aF91c2VyX2JhY2tlbmRxB1UmZGphbmdv\nX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJREJhY2tlbmRxCHUu\n','2012-10-31 08:42:50'),('acd1b747480bdd63d49377a29b2ddc04','OWNmZjVhYTczNTI4ZGE2OTc4MzcxZjFjYTFhODc5OWEzOGJmMjFmNzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZmMzOTVjZDdjMjVlOWQwZmY3ZWYwODA3Y2I3YzRlZTVxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-06-16 12:36:24'),('b09999d7c656cee2bc4c245dc7fd128f','NjQ2NGRkOTJkYWIwOTRlNDlmNGFlMTE2NzQwMDhlZjg5MDU0NjVkNTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgbTJVYUNWWDFQRVpSTld3WVh0eHJMdnNvVlFaeXdmODRxA1UNX2F1dGhfdXNlcl9pZHEE\nigEaVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUmZGphbmdvX2Jyb3dzZXJpZC5hdXRoLkJyb3dzZXJJ\nREJhY2tlbmRxBnUu\n','2013-03-25 20:22:05'),('b1b848b124fa99c52bc85b97a3935bcb','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-03 06:48:50'),('b204dacf98692798142c31444121c528','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 01:54:16'),('b371b0eed85c723f36d0c5b29dc56390','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:36:49'),('b4102075a9665bedc59bd22bf51f711b','MTk0NDQ1ZmRlM2QxOTY1NGM0MmVmYzhmYmJjZWJkY2FlYzcyNGU4NDqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgNDZmZGMyMGM5MjhhYmRiMDg4ZTNkMDJhODFhOWViNGNxA1UNX2F1dGhfdXNlcl9pZHEE\nigELVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2011-07-24 15:20:31'),('b4963c57fa353da80f4a744232e85f1e','NDc1OGEzNzlhOWEyZGJmOTE2Y2Y1YzQ0ZjM1MDM0ODBjYmNlNDdlMzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZTVhZDZiZTE4NmY1YzI2ZjZmZWNmMWQ2ZGMzNGM4ODlxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-06-12 15:33:24'),('b4aee111016b8d0c74055cb805504275','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 13:23:02'),('b647c6cec171ae6e97ebea56944c563d','ZjNjYmVjNjkwODM3ZmIxNTEzN2U3N2Q4YzdjNmFjNDllMWNlOTQ4MjqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgM2JjNDdkZWE3NmJhZWI1MWIxN2VlZWVhYjAxMTc3ZTRxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-13 02:27:59'),('b76e2a52444894079dcc21709cd76623','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-08-27 20:30:31'),('ba150565f0c8d9c8da822e5e60d35e68','NTYzZDc0YmMyOTJlNzRiNTY2OThkNTM3Y2Y5YzY4MTBkYjY3MmQ2ZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZTExNTc4NDNjZWJiZTRhYzZkZDVmNTI5YzI5NGI0ZjFxA1UNX2F1dGhfdXNlcl9pZHEE\nigELVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2011-06-12 16:59:02'),('bb10d05f70f815b051636e4a34d3be35','YTAzZTg5YTEyZDM1ODllYWE4Zjg4ODE0Mjc2OWI1MTY1ZGMyOTMzZTqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSgB1EgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVR11c2Vycy5iYWNrZW5kcy5BbW9V\nc2VyQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQd1Lg==\n','2011-04-17 01:37:08'),('bba77eaace3c857d0d42a60ce582dd1a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:20:16'),('bbb601a94ce6ae0062fabb637931ffa1','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:20:05'),('bc4da6c59c57aa1cf6804e031bdf2200','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-08 15:16:38'),('bc5084eee8b0ae20fa7b067c79eab9a7','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-05 23:35:19'),('bc5770c20337939dd44ce81f9d8c606f','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-12-26 20:27:19'),('be2b2ea3801cd78ee3419ab333a3fdfe','NjE5ZmU3OWYzMzMzZGI5M2NkNTE4Y2Y1NGVmYWE1Njc5ZGE5ZTBlNDqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSgB1EgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVR11c2Vycy5iYWNrZW5kcy5BbW9V\nc2VyQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQZ1Lg==\n','2011-04-14 03:14:52'),('bf300311006353cebbe7ae7f18b9f3cd','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-12 20:40:06'),('c17b024b88c3406eccca56a2f8d60cf3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 13:09:08'),('c17bf0e1d397c6759f2c0ed35b4cdc15','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-17 01:37:31'),('c30eb8e67e95d7bb4325a14064ed5085','ZjQ2ODE4ZjhlMjBkMjdmZDI4Y2E0ODY0MDk0YmFlMmYwYjVmMzgzMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQpjc3JmX3Rva2Vu\ncQRVIDZmMmMyZmJhYWViMjQ4OTMzMzY1MjJkYTRhMDNkNjYxcQVVDV9hdXRoX3VzZXJfaWRxBooB\nDVUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2011-09-29 04:44:55'),('c45f95011da5954da32bd33cd42f0828','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2013-02-08 12:34:42'),('c54fdd5f52d8228f4ff4b5eb377f8c26','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-05 19:41:21'),('c5b9f694a43c43b841615a6322f6eddc','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:56:11'),('c6b36d7c1c43aca6cf9ab7c4f145fb8e','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 01:19:59'),('c74f911d1d500fb2e1d95be9aa3adb95','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-17 01:37:10'),('c88c43d4e37582a1d5ed6812bec26eb2','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:37:26'),('caa28e1428bd9744d845d6f6c90f6d89','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-04 03:01:09'),('cafcfa6b48335170b0878525f417c081','NThiZjY5YmYzNjcyMTNiMTkyMTYzZTJhYWI1ODY4YmJkZDgyM2VhZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQR1Lg==\n','2011-04-13 14:03:21'),('cb1640fd54485c28354ff001c43672dd','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-17 01:35:50'),('cb5f2180952057e0ddc1dd2174f5dc81','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 01:21:08'),('cb77849c5e8c91832a69f141b4686df8','NDliYmJjNjczZGI0NDZiZjg1NjhmMzg1YWE0MzY1MTlhYjE5MjZmMzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgNDkxNzM0ZTViYmZlZWNlNmI1NTE5Y2Y3OGRlN2M2OWJxA1UNX2F1dGhfdXNlcl9pZHEE\nigELVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-12-18 13:39:42'),('cc3741b13abb97b6aee61fd84e5731b8','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-17 01:37:05'),('ce69ae0a779432a354b5f9f5fc295c53','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 10:20:18'),('ced1c4f2c52eb6b25ce3a477c6bfa8c0','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-27 10:13:49'),('d153dfbaa8a09eda1df282f79f993492','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-11-16 15:47:34'),('d214b9790b9a5081a822e7c8eb99a9c9','YTAzZTg5YTEyZDM1ODllYWE4Zjg4ODE0Mjc2OWI1MTY1ZGMyOTMzZTqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSgB1EgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVR11c2Vycy5iYWNrZW5kcy5BbW9V\nc2VyQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQd1Lg==\n','2011-04-17 01:40:33'),('d2174cf50fef34d97317e79781df7ff5','MTRlOWExZjQ0OTgzNzlhNzcxMmZjYWJlMDZiMWNmOWJjMWVkMjJjYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQF1Lg==\n','2011-04-06 21:38:35'),('d292934483f690183ab7b855849e0e66','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 00:10:17'),('d380c2afd3a53ee6055db7c353b9c9de','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-02 10:00:33'),('d3bb2b498818a92640a020e38adbaf1a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-09-09 14:45:45'),('d5b3a4ced2c0d55a6f395b1aae838664','NzczYjkxMDZlNDhhNmQ4ZjRmYzM0Y2U4YTQ1OTMwYTM1MTYzNjJkYTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZDBlZDMzMzBiYTk1MGI2NGQ4YWI3MzIwNzI4NWExZjNxA1UNX2F1dGhfdXNlcl9pZHEE\nigEPVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2012-03-11 03:28:10'),('d78e2f6a6b9cea5b28dc78f08be60801','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-30 01:46:18'),('d840a650b4ce73ec80f409431c8d9354','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-29 05:23:38'),('d933f06ca3477a78619b964f67d739bc','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-03-28 11:45:51'),('da3150f4b5aed730df51f5ec762d70c3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-11 13:10:34'),('dea62f8f13497219151a1d16e6002bf5','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-27 02:45:26'),('e0ac53aac79585bc5ec5378fde091087','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-13 00:38:23'),('e11cc69a605f61ca0b85dea21e78e343','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-21 02:20:50'),('e27395a2dce78e06e2b367f4f8f002a0','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-07 15:03:51'),('e28657fe7f57fbc340a01fd0ea903551','N2E2Y2U2OTEyYmMwNDNkNmQ0ZDM1NGFmM2I1ZmE1NmMwODc4MGYwOTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgZlNjSkl6cjlLcnlFUU9iMjA2eXlCOFRvS2RrNjZCdkdxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2012-11-20 08:46:52'),('e42f383e3677ba6737e22c431f94e43b','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:56:06'),('e49279ac7c93636b60202be173448931','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:37:16'),('e88dc623fb81a2066b84100d43327700','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-30 01:41:42'),('e996b76c7aedb251f21e61acec1cc9eb','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-07-06 00:47:54'),('ebb4319142977d663190e5e0a86c4fd3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-04-17 01:37:44'),('ec052a5a9633c8e446a9d636d4c2ff2d','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-22 21:52:18'),('ec1bf75ab555b095b13dae75e1a0508a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-20 12:58:54'),('ec616d54d2e304767658e39f4028e1dc','OGY0M2ZiZTg2YjY0MjdiYzY3ZTdkM2VmNzFmYjU2NzczYTA4MWRhNzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgOEV0MnhCTVFGOFQ1ckk3YnZCelJ3UHg2eGo1cEJCQ2dxA1UNX2F1dGhfdXNlcl9pZHEE\nigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2012-11-20 09:03:08'),('ec7517f92f3c889ee5a3249987e33e8a','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-03-23 07:27:53'),('eee466757b93e199a2ba6799ad16046a','MmMzMmM2MmM2MzM3YzMwYTc2YzllNGM1ZTI2YjNlYThiMmYxOTNiMzqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgOE96Z3pqVVZFZTVNbFlIUmJpdnVkeXNWbUtqMGNDMnFxA1UNX2F1dGhfdXNlcl9pZHEE\nigEHVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBlUPX3Nlc3Npb25fZXhwaXJ5cQdKAHUSAHUu\n','2013-03-10 06:55:55'),('ef61ec3256b34bf76526fb31b1bcddda','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-10-29 23:55:24'),('f04ad9548c72d36dae29f774bf767dcd','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-06-30 02:25:04'),('f14d99d86a9858271f68d15fa798ace7','YTAzZTg5YTEyZDM1ODllYWE4Zjg4ODE0Mjc2OWI1MTY1ZGMyOTMzZTqAAn1xAShVD19zZXNzaW9u\nX2V4cGlyeXECSgB1EgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVR11c2Vycy5iYWNrZW5kcy5BbW9V\nc2VyQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQd1Lg==\n','2011-04-17 01:38:02'),('f1f14fd2f58da70fa4c62c780f5c95c8','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-09-09 14:43:01'),('f332adae49373b7712fbce65fed9bfed','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-09 04:37:14'),('f52338db060993af850ea44560962fd3','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-29 22:51:43'),('f5a007a7ef1118aa10b22c9d3661af77','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-19 15:56:07'),('f62a6469e57aedf018b0bfc61e8cdc57','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-13 16:25:06'),('f67cbbc4d93e934b2d979cc27996df29','MzUxN2UwMDFmMmY4MjhhYjMxYzYxYTE4NTU5NTMwYjE4Mjk3N2M2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQJ1Lg==\n','2011-04-12 14:54:32'),('f7abb3c12ccb385dea6983328f9c885e','OTgxZWJjM2RhMzZjNzMyNzBjYzQ3MTZiZmExN2NkM2ZjYzg0YWU0ODqAAn1xAS4=\n','2011-04-17 05:58:42'),('f9c9fe62981debd6b9612cd8a092ef62','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-24 15:13:47'),('f9f3bea2b9c3b62698eedfc6eda68907','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-21 05:17:30'),('fb0cb0ea30e5aeaba50a6fe59692c834','ZDU2OTkyN2JkMmFkNDViY2FjNDQ4YTU0ZjRmZWNjZDA1YTQ3NWY3NjqAAn1xAS4=\n','2011-03-16 10:43:37'),('fb5795fce98122b7efb5bc4289f9a764','NTE5YmNiY2NmYjZkNTM2ZjljOTZhZTg1NDlmZGY3YTQ0ZGI4MTVhZTqAAn1xAShVCmNzcmZfdG9r\nZW5xAlUgMjY1MmYwZWRhNzY2YzBiMzUyNDY4ZmQ4N2UyM2MzZDhxA1UNX2F1dGhfdXNlcl9pZHEE\nigEJVRJfYXV0aF91c2VyX2JhY2tlbmRxBVUddXNlcnMuYmFja2VuZHMuQW1vVXNlckJhY2tlbmRx\nBnUu\n','2011-05-25 04:56:05'),('fc8ddb41a5ffbc235ad43eb2d5fe7f04','ZGE2M2FlMzM4YWIxMzJhZjEyM2RlMDQ5MzcyNTAwMzRjMTUyNzY2NjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-02-08 13:23:41'),('fd5e3287d7089ae88a23d5b989aedf51','YTQ5NTY1N2NmNjYwMTkxMzJjMjljYTc3NzNjNWIxNjgzOWEzY2Y2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVR11c2Vycy5iYWNrZW5kcy5BbW9Vc2VyQmFja2VuZHEDVQ1fYXV0aF91c2Vy\nX2lkcQSKAQN1Lg==\n','2011-04-13 09:58:32');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_counts`
--

DROP TABLE IF EXISTS `download_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `src` mediumtext,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date_2` (`date`,`addon_id`),
  KEY `addon_id` (`addon_id`),
  KEY `count` (`count`),
  KEY `addon_and_count` (`addon_id`,`count`),
  KEY `addon_date_idx` (`addon_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_counts`
--

LOCK TABLES `download_counts` WRITE;
/*!40000 ALTER TABLE `download_counts` DISABLE KEYS */;
INSERT INTO `download_counts` VALUES (1,1,5,'','2011-03-23');
/*!40000 ALTER TABLE `download_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_sources`
--

DROP TABLE IF EXISTS `download_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Source list for add-on downloads. Bug 507221.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_sources`
--

LOCK TABLES `download_sources` WRITE;
/*!40000 ALTER TABLE `download_sources` DISABLE KEYS */;
INSERT INTO `download_sources` VALUES (1,'discovery-','prefix','2011-03-06 23:33:46',NULL),(2,'hp-btn-promo','full','2011-07-06 15:28:06',NULL),(3,'hp-dl-promo','full','2011-07-06 15:28:06',NULL),(4,'hp-hc-featured','full','2011-07-06 15:28:06',NULL),(5,'hp-dl-featured','full','2011-07-06 15:28:06',NULL),(6,'hp-hc-upandcoming','full','2011-07-06 15:28:06',NULL),(7,'hp-dl-upandcoming','full','2011-07-06 15:28:06',NULL),(8,'hp-hc-mostpopular','full','2011-07-06 15:28:06',NULL),(9,'hp-dl-mostpopular','full','2011-07-06 15:28:06',NULL),(10,'dp-hc-oftenusedwith','full','2011-07-06 15:28:06',NULL),(11,'dp-dl-oftenusedwith','full','2011-07-06 15:28:06',NULL),(12,'dp-hc-othersby','full','2011-07-06 15:28:06',NULL),(13,'dp-dl-othersby','full','2011-07-06 15:28:06',NULL),(14,'dp-btn-primary','full','2011-07-14 10:59:50',NULL),(15,'dp-btn-version','full','2011-07-14 14:30:00',NULL),(16,'dp-btn-devchannel','full','2011-07-14 14:30:00',NULL),(17,'cb-hc-featured','full','2011-07-14 14:30:00',NULL),(18,'cb-dl-featured','full','2011-07-14 14:30:00',NULL),(19,'cb-hc-toprated','full','2011-07-14 14:30:00',NULL),(20,'cb-dl-toprated','full','2011-07-14 14:30:00',NULL),(21,'cb-hc-mostpopular','full','2011-07-14 14:30:00',NULL),(22,'cb-dl-mostpopular','full','2011-07-14 14:30:00',NULL),(23,'cb-hc-recentlyadded','full','2011-07-14 14:30:00',NULL),(24,'cb-dl-recentlyadded','full','2011-07-14 14:30:00',NULL),(27,'prerelease-banner','full','2011-08-26 01:51:32',NULL),(28,'co-hc-sidebar','full','2011-08-29 17:10:36',NULL),(29,'co-dp-sidebar','full','2011-08-29 17:10:36',NULL),(30,'dp-hc-dependencies','full','2011-08-29 17:10:36',NULL),(31,'dp-dl-dependencies','full','2011-08-29 17:10:36',NULL),(32,'dp-hc-upsell','full','2011-08-29 17:10:36',NULL),(33,'dp-dl-upsell','full','2011-08-29 17:10:36',NULL),(34,'discovery-dependencies','full','2011-08-29 17:10:36',NULL),(35,'discovery-upsell','full','2011-08-29 17:10:36',NULL),(36,'cb-btn-','prefix','2011-09-01 13:31:21',NULL),(37,'cb-dl-','prefix','2011-09-01 13:31:21',NULL),(38,'ss','full','2012-04-04 17:17:19',NULL),(39,'discovery-video','full','2012-04-04 17:17:53',NULL),(40,'mkt-home','full','0000-00-00 00:00:00',NULL),(41,'mkt-category-featured','full','0000-00-00 00:00:00',NULL),(42,'mkt-category','full','0000-00-00 00:00:00',NULL),(43,'mkt-detail','full','0000-00-00 00:00:00',NULL),(44,'mkt-detail-upsell','full','0000-00-00 00:00:00',NULL),(45,'mkt-search','full','0000-00-00 00:00:00',NULL),(46,'mkt-ss','full','0000-00-00 00:00:00',NULL),(47,'mkt-user-profile','full','0000-00-00 00:00:00',NULL),(48,'hp-contest-winners','full','2012-08-08 14:40:42',NULL),(49,'mkt-browse','full','2012-09-25 13:39:34',NULL),(50,'mkt-browse-featured','full','2012-09-25 13:39:34',NULL);
/*!40000 ALTER TABLE `download_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor_subscriptions`
--

DROP TABLE IF EXISTS `editor_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editor_subscriptions` (
  `user_id` int(11) unsigned NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `addon_id` (`addon_id`),
  CONSTRAINT `editor_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `editor_subscriptions_ibfk_2` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Editor subscriptions for add-on updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor_subscriptions`
--

LOCK TABLES `editor_subscriptions` WRITE;
/*!40000 ALTER TABLE `editor_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `editor_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_preview`
--

DROP TABLE IF EXISTS `email_preview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `topic` varchar(255) NOT NULL,
  `recipient_list` longtext NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_preview_277e394d` (`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_preview`
--

LOCK TABLES `email_preview` WRITE;
/*!40000 ALTER TABLE `email_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_preview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalation_queue`
--

DROP TABLE IF EXISTS `escalation_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalation_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `escalation_queue_addon_id_idx` (`addon_id`),
  KEY `escalation_queue_created_idx` (`created`),
  CONSTRAINT `escalation_queue_addon_id_fk` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalation_queue`
--

LOCK TABLES `escalation_queue` WRITE;
/*!40000 ALTER TABLE `escalation_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalation_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventlog`
--

DROP TABLE IF EXISTS `eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `field` varchar(20) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `changed_id` int(11) unsigned NOT NULL DEFAULT '0',
  `added` varchar(255) DEFAULT NULL,
  `removed` varchar(255) DEFAULT NULL,
  `notes` mediumtext,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlog`
--

LOCK TABLES `eventlog` WRITE;
/*!40000 ALTER TABLE `eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fake_email`
--

DROP TABLE IF EXISTS `fake_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fake_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fake_email`
--

LOCK TABLES `fake_email` WRITE;
/*!40000 ALTER TABLE `fake_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `fake_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `favorite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reviewfavorite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_collections`
--

DROP TABLE IF EXISTS `featured_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `collection_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id_idx` (`application_id`),
  KEY `collection_id_idx` (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_collections`
--

LOCK TABLES `featured_collections` WRITE;
/*!40000 ALTER TABLE `featured_collections` DISABLE KEYS */;
INSERT INTO `featured_collections` VALUES (1,'2012-04-19 18:55:39','2012-04-19 18:55:39',1,2,'');
/*!40000 ALTER TABLE `featured_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locale` varchar(10) DEFAULT NULL,
  `application_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `features_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `features_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,1,'2009-01-01 00:00:00','2020-11-11 11:11:11','2011-03-23 21:05:05','2011-03-23 21:05:05',NULL,1);
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_uploads`
--

DROP TABLE IF EXISTS `file_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_uploads` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `uuid` char(32) NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `validation` longtext,
  `task_error` longtext,
  `hash` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `compat_with_app_id` int(11) unsigned DEFAULT NULL,
  `compat_with_appver_id` int(11) unsigned DEFAULT NULL,
  `is_webapp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `file_uploads_afe99c5e` (`compat_with_app_id`),
  KEY `file_uploads_9a93262a` (`compat_with_appver_id`),
  CONSTRAINT `compat_with_appver_id_refs_id_3747a309` FOREIGN KEY (`compat_with_appver_id`) REFERENCES `appversions` (`id`),
  CONSTRAINT `compat_with_app_id_refs_id_939661ad` FOREIGN KEY (`compat_with_app_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `file_uploads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_uploads`
--

LOCK TABLES `file_uploads` WRITE;
/*!40000 ALTER TABLE `file_uploads` DISABLE KEYS */;
INSERT INTO `file_uploads` VALUES ('2012-04-19 18:59:24','2012-04-19 18:59:24','0444cd24a278452f9fbaadb74357daae','/data/amo_data/files/temp/99d7c75cf6ad4826af383c7d55b6a19b.xpi','threadbubble-0.8-tb.xpi',18,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0, \"metadata\": {}}','','sha256:2abb2c381a7ecbdd2473d307af0789fb72933380cc80e4597df17fdf3021d1d5',1,NULL,NULL,0),('2013-01-25 13:30:54','2013-01-25 13:30:54','17f5e9f6dd8144888f669adf9f88253b','/data/amo_data/files/temp/1a43f7dbd6fe4f65893efcb090bd8c09.webapp','http://kinkajou3969.testmanifest.com/manifest.webapp',NULL,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"2d4b5b7fc1054d6a8a4b6944c764bbaa\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (kinkajou3969)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}',NULL,'sha256:94785db757cf5d4f650557780c9fe60d5013d019a8e55b81e29a9b768af6c3f5',1,NULL,NULL,1),('2011-03-06 23:48:43','2011-03-06 23:48:45','182c1d75a608401a8cd002af36c43da8','/data/amo_data/files/temp/a76f9f863dac4002869ffa3a4b76357d.xpi','status-watch.xpi',1,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:09d428d225006f6d86c8427cd29452a5d8c49b2bcd1f1ddca8197a07fecc3996',1,NULL,NULL,0),('2011-09-01 15:12:23','2011-09-01 15:12:23','21270ea2df254811a4a9ab96b29eab2f','/data/amo_data/files/temp/c752d21f30cb4a868fb8cdf554b92005.xpi','1cA.xpi',11,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:681dbf5e2fc0a3c23dd6d4c3ef676fae433c31ec875d0cb86b5739dc6ae640aa',1,NULL,NULL,0),('2012-04-19 19:00:10','2012-04-19 19:00:10','2195fa36a3b542468f3c56f4af504c1a','/data/amo_data/files/temp/3035f82e48f84b9ea529724af460abc7.xpi','password_exporter-1.2.1-fx+tb+sm.xpi',18,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0, \"metadata\": {}}','','sha256:e7e4b897de5c0842384c86ca51948f681050c6cf8b220bc90fe88c8f29bd51cd',1,NULL,NULL,0),('2011-06-03 14:40:04','2011-06-03 14:40:06','31d8952cd0b24b14a69d628e84f4fad7','/data/amo_data/files/temp/4d06e963d4d442f19633da8ff66838a4.xpi','latin_dictionary-0.41.201120110603-fx+tb+sm.xpi',11,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:70469e6b4a9fe2c22532ebae7d6773cb1d7bc41b0aa8e5dcef41b99dda2c2b21',1,NULL,NULL,0),('2011-04-03 02:43:47','2011-04-03 02:43:47','393262d799e04f1d8be519c61bb28367','/data/amo_data/files/temp/1d8ebc19f5d947cfa3433da049bcb063.xpi','scrapbook-1.4.3-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:78f74cf7b9a5c2a8bbe3161769ef8ab28b032fd02335197364bf53b3d5bfdbf7',1,NULL,NULL,0),('2011-03-06 23:51:39','2011-03-06 23:51:40','3a18a3d4d21c47c5906a5f7e834e952e','/data/amo_data/files/temp/d05e0770cc4c4dee91fa28be5e969e7c.xpi','status-watch.xpi',1,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:09d428d225006f6d86c8427cd29452a5d8c49b2bcd1f1ddca8197a07fecc3996',1,NULL,NULL,0),('2011-04-03 02:33:47','2011-04-03 02:33:59','41817e3495a34ebf979431c9624f9505','/data/amo_data/files/temp/c35bf9f5005641338342e80090a2cd98.xpi','scrapbook-1.4.3-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:78f74cf7b9a5c2a8bbe3161769ef8ab28b032fd02335197364bf53b3d5bfdbf7',1,NULL,NULL,0),('2013-01-25 13:31:54','2013-01-25 13:31:54','419e51fab20b40c3a9ee0a18c1194ee3','/data/amo_data/files/temp/1da8c420ca25445598a8b1fdcb0928d0.webapp','http://kinkajou3969.testmanifest.com/manifest.webapp',NULL,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"9dc76f106ea044d7830a7d4689afc26f\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (kinkajou3969)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}',NULL,'sha256:94785db757cf5d4f650557780c9fe60d5013d019a8e55b81e29a9b768af6c3f5',1,NULL,NULL,1),('2012-04-28 11:17:16','2012-04-28 11:17:23','46e8595a5e6f43febac046d716f97833','/data/amo_data/files/temp/68c3e0c02c114436bbf00c4a9cc7bb6d.xpi','yoono_twitter_facebook_linkedin_youtube_gtalk_aim-7.7.10-fx.xpi',19,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0, \"metadata\": {}}','','sha256:9bb596e9c1ed23f635aa98d444422ce2c0b54f707de2473a715720b1f31d05a2',1,NULL,NULL,0),('2013-01-25 12:46:02','2013-01-25 12:46:02','4949c032a4ea4e7da76d075506fd7e76','/data/amo_data/files/temp/89473260fd3144e884dd683b977a998c.webapp','http://ewe9884.testmanifest.com/manifest.webapp',NULL,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"1d39cd4294b94e0d9725ad086bd4ffd2\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (ewe9884)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}',NULL,'sha256:2a12e66fbd4c10f7b5d66a548b7889c5d10e61a1ee5dbc76533198665b8f2ce5',1,NULL,NULL,1),('2011-03-06 23:44:58','2011-03-06 23:44:58','4a2770bb49b44034b348bdb0faeef30a','/data/amo_data/files/temp/2eeb35ab8b47407b83cba5d979000531.xpi','status-watch.xpi',1,NULL,'Traceback (most recent call last):\n  File \"/data/amo_python/www/landfill/zamboni/apps/devhub/tasks.py\", line 27, in validator\n    result = _validator(upload.path)\n  File \"/data/amo_python/www/landfill/zamboni/apps/devhub/tasks.py\", line 70, in _validator\n    spidermonkey=settings.SPIDERMONKEY)\n  File \"/data/amo_python/www/landfill/zamboni/vendor/src/amo-validator/validator/validate.py\", line 30, in validate\n    apps = json.load(open(approved_applications))\n  File \"/usr/lib64/python2.6/json/__init__.py\", line 267, in load\n    parse_constant=parse_constant, **kw)\n  File \"/usr/lib64/python2.6/json/__init__.py\", line 307, in loads\n    return _default_decoder.decode(s)\n  File \"/usr/lib64/python2.6/json/decoder.py\", line 319, in decode\n    obj, end = self.raw_decode(s, idx=_w(s, 0).end())\n  File \"/usr/lib64/python2.6/json/decoder.py\", line 338, in raw_decode\n    raise ValueError(\"No JSON object could be decoded\")\nValueError: No JSON object could be decoded\n','sha256:09d428d225006f6d86c8427cd29452a5d8c49b2bcd1f1ddca8197a07fecc3996',0,NULL,NULL,0),('2011-04-03 02:29:08','2011-04-03 02:29:09','5e6dcbea82374406943a3a66d8e1d8e4','/data/amo_data/files/temp/35f785a3aca04c13a0e01bca271ac706.xpi','scrapbook-1.4.3-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:86048bd41fb5d3ef395ee302227a36b21823948046c3cb18e3689e37878982e3',1,NULL,NULL,0),('2011-04-03 02:33:28','2011-04-03 02:33:28','67d90a19a63745c692d2b7fa0e2701bd','/data/amo_data/files/temp/6edeb4c57333492ebeaecc3a2e0f4b61.xpi','rss_icon_in_awesombar-1.4-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:60e10207f5818f315d445b56e25d48179bc1dd69d4cd18ea63a426ac6fe6c3fe',1,NULL,NULL,0),('2011-05-30 11:00:51','2011-05-30 11:01:20','7252a8d097b54fcf85c4187692635fa3','/data/amo_data/files/temp/0aae235409a24193a158270a8919f2e7.xpi','autocopy_1.0.xpi',11,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:13ed42ec330261246659299d61f4ee80db03da49a59f2e7faeb14659bd5e3c32',1,NULL,NULL,0),('2013-01-25 12:47:18','2013-01-25 12:47:18','7603adf1bc4e49fda299bd503f431bc7','/data/amo_data/files/temp/2a6e38a8201f495c8e477616c2bad460.webapp','http://grizzlybear2302.testmanifest.com/manifest.webapp',NULL,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"a5db3e598be842c48c741b7bc005833f\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (grizzlybear2302)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}',NULL,'sha256:f0fcb3dd04e13979ba491202bf2c4e91810728713df5cf50a43b8c637d191171',1,NULL,NULL,1),('2011-11-20 10:51:26','2011-11-20 10:51:26','9b0eea8c5fd342559eb75f346663ea1e','/data/amo_data/files/temp/18c9dd1beb1747b2966030c87e1876d9.xpi','webapp_tabs-1.0-tb.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:8036c257f12b1b8c4f900ecb25fdda58d1bb8744db218ae4a29108be0ededf33',1,NULL,NULL,0),('2012-04-28 11:16:44','2012-04-28 11:16:46','a3b3054f40034ff487b5fa45ad447226','/data/amo_data/files/temp/f84b1a7a45e441c7a7c7a2d5f0416cc8.xpi','tab_utilities-1.1.4-fx.xpi',19,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0, \"metadata\": {}}','','sha256:d1e5ad5f6ed576549aa3438d3fd91d04fe45bee192e1cca4d45ef0e42bbd12ab',1,NULL,NULL,0),('2011-11-20 10:50:51','2011-11-20 10:50:53','b3c8565509ea4d3cb775b85b6c762889','/data/amo_data/files/temp/5c580f018174483c88dfdd1a88dc4afa.xpi','page-speed.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:ff496076ab233fe5adee4806a6beee8ea0894f987b70c38d6046ef5f2b174fef',1,NULL,NULL,0),('2013-01-25 13:32:02','2013-01-25 13:32:02','be735dd133e14b9ea5fc0d0e2de1251b','/data/amo_data/files/temp/d2cfe08c5c894b5ea156b87b8e1cbad3.webapp','http://ewe9884.testmanifest.com/manifest.webapp',NULL,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"7b4a82237f4e43feaee996fa02601663\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (ewe9884)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}',NULL,'sha256:2a12e66fbd4c10f7b5d66a548b7889c5d10e61a1ee5dbc76533198665b8f2ce5',1,NULL,NULL,1),('2013-01-25 12:37:11','2013-01-25 12:37:11','cd3b16c295174fbea573d4cbf6858fda','','',NULL,NULL,NULL,'',0,NULL,NULL,0),('2011-04-03 02:21:52','2011-04-03 02:22:02','cf387b7732a0449abcd1e670a4eddc5d','/data/amo_data/files/temp/2ef76b6338b5473b9668eefc7058fda8.xpi','rss_icon_in_awesombar-1.4-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:60e10207f5818f315d445b56e25d48179bc1dd69d4cd18ea63a426ac6fe6c3fe',1,NULL,NULL,0),('2011-06-09 13:37:49','2011-06-09 13:37:53','d0b8c0ec612e405695aac75e5db7b433','/data/amo_data/files/temp/01681c2d04ac47ccad5ee9153fd83fcc.xpi','add_on_builder_helper-0.0.19-tb+fx+fn.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:834943df10b5e935e903f48913eb1b0009c3c6ee6329bb04cb03f691dbfa8470',1,NULL,NULL,0),('2011-06-09 13:37:28','2011-06-09 13:37:28','d1a4556db1f2464a98accd1f3146e025','/data/amo_data/files/temp/ae838b46c763439f8de57bcc645ae2de.xpi','rss_icon_in_awesombar-1.4-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:60e10207f5818f315d445b56e25d48179bc1dd69d4cd18ea63a426ac6fe6c3fe',1,NULL,NULL,0),('2011-09-01 15:13:19','2011-09-01 15:13:20','d3497ca5fdf5449594116ff9cafb0d5c','/data/amo_data/files/temp/cf905317977c47f39a40bc0ca91fd912.xpi','1cA.xpi',11,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:681dbf5e2fc0a3c23dd6d4c3ef676fae433c31ec875d0cb86b5739dc6ae640aa',1,NULL,NULL,0),('2013-01-25 13:32:14','2013-01-25 13:32:14','d391226c03e44bfa964ab3ac9c8f1b7c','/data/amo_data/files/temp/ae66511deff3496c962d649b24d67a47.webapp','http://kinkajou3969.testmanifest.com/manifest.webapp',NULL,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"d7e563ccf49745499aebfaae4661f48c\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (kinkajou3969)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}',NULL,'sha256:94785db757cf5d4f650557780c9fe60d5013d019a8e55b81e29a9b768af6c3f5',1,NULL,NULL,1),('2011-04-21 20:13:47','2011-04-21 20:13:47','dbf6c0e8587d4cb7b2da5ae73f2e75ea','/data/amo_data/files/temp/06b07292792e45948d6860b67fa9ef0c.xpi','scrapbook-1.4.3-fx.xpi',1,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:78f74cf7b9a5c2a8bbe3161769ef8ab28b032fd02335197364bf53b3d5bfdbf7',1,NULL,NULL,0),('2011-07-08 14:42:06','2011-07-08 14:42:06','e37a918253d9447889999736790c0a89','/data/amo_data/files/temp/c667b5c125c5481db708daac0a924242.xpi','add_on_builder_helper-0.0.19-tb+fx+fn.xpi',10,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:834943df10b5e935e903f48913eb1b0009c3c6ee6329bb04cb03f691dbfa8470',1,NULL,NULL,0),('2011-11-20 10:49:50','2011-11-20 10:49:51','e87a86538f7a4ea8bb4d5d49f56809fd','/data/amo_data/files/temp/f63e5b086e274caa9ed8e7c130e0dd20.xpi','fast_dial-3.5.1.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:7b904bbe582fd289ec87cceedbb25d2376647a3bef6724a5b026138ac0d20648',1,NULL,NULL,0),('2011-04-03 02:26:48','2011-04-03 02:26:49','f5d6a66237764815ab64f658ab85bb3b','/data/amo_data/files/temp/60c205bc347c4453be661584d0b02cfa.xpi','rss_icon_in_awesombar-1.4-fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:60e10207f5818f315d445b56e25d48179bc1dd69d4cd18ea63a426ac6fe6c3fe',1,NULL,NULL,0),('2011-05-14 08:36:33','2011-05-14 08:36:34','fb1121fcbef24192907b7b78458993c4','/data/amo_data/files/temp/9abb456b6fc34ec9b49edbc195ed2c10.xpi','firefm-1.4.14-sm+fx.xpi',7,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}','','sha256:0cea17449403b8c99b19c109337dca0075f779e1e4740bd9fb17ba25b8108f13',1,NULL,NULL,0);
/*!40000 ALTER TABLE `file_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_validation`
--

DROP TABLE IF EXISTS `file_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_validation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `file_id` int(11) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `errors` int(11) NOT NULL,
  `warnings` int(11) NOT NULL,
  `notices` int(11) NOT NULL,
  `validation` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_id_2` (`file_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_validation`
--

LOCK TABLES `file_validation` WRITE;
/*!40000 ALTER TABLE `file_validation` DISABLE KEYS */;
INSERT INTO `file_validation` VALUES (68,'2011-03-06 23:51:43','2011-03-06 23:51:43',1,1,0,0,0,'{\"notices\": 0, \"errors\": 0, \"messages\": [], \"warnings\": 0}'),(69,'2013-01-25 12:47:23','2013-01-25 12:47:23',2,1,0,1,0,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"a5db3e598be842c48c741b7bc005833f\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (grizzlybear2302)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}'),(70,'2013-01-25 13:32:16','2013-01-25 13:32:16',3,1,0,1,0,'{\"errors\": 0, \"success\": false, \"warnings\": 1, \"ending_tier\": 1, \"messages\": [{\"tier\": 1, \"context\": null, \"uid\": \"d7e563ccf49745499aebfaae4661f48c\", \"file\": \"\", \"column\": null, \"type\": \"warning\", \"message\": \"App name may be truncated on Firefox OS devices.\", \"line\": null, \"id\": [\"webapp\", \"b2g\", \"name_truncated\"], \"description\": [\"Your app\'s name is long enough to possibly be truncated on Firefox OS devices. Consider using a shorter name for your app.\", \"App names may be truncated after 12 characters.\"]}], \"manifest\": {\"name\": \"Test App (kinkajou3969)\", \"icons\": {\"128\": \"http://testmanifest.com/icon-128.png\", \"48\": \"http://testmanifest.com/icon-48.png\", \"16\": \"http://testmanifest.com/icon-16.png\"}, \"installs_allowed_from\": [\"*\"], \"description\": \"This app has been automatically generated by testmanifest.com\", \"version\": \"1.0\", \"developer\": {\"url\": \"http://gkoberger.net\", \"name\": \"Gregory Koberger\"}}, \"notices\": 0, \"metadata\": {}}');
/*!40000 ALTER TABLE `file_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(11) unsigned NOT NULL DEFAULT '0',
  `platform_id` int(11) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `hash` varchar(255) DEFAULT NULL,
  `codereview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `datestatuschanged` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `no_restart` tinyint(1) DEFAULT '0',
  `reviewed` datetime DEFAULT NULL,
  `jetpack_version` varchar(10) DEFAULT NULL,
  `requires_chrome` tinyint(1) NOT NULL DEFAULT '0',
  `strict_compatibility` tinyint(1) NOT NULL DEFAULT '0',
  `builder_version` varchar(10) DEFAULT NULL,
  `binary` tinyint(1) NOT NULL DEFAULT '0',
  `binary_components` tinyint(1) NOT NULL DEFAULT '0',
  `uses_flash` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version_id` (`version_id`),
  KEY `platform_id` (`platform_id`),
  KEY `status` (`status`),
  KEY `statuschanged_idx` (`datestatuschanged`,`version_id`),
  KEY `created_idx` (`created`,`version_id`),
  KEY `jetpack_version_idx` (`jetpack_version`),
  KEY `builder_version_idx` (`builder_version`),
  KEY `files_cedd2560` (`binary_components`),
  KEY `uses_flash_idx` (`uses_flash`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,1,1,'status_watch-0.2.rev11.xpi',196608,'sha256:09d428d225006f6d86c8427cd29452a5d8c49b2bcd1f1ddca8197a07fecc3996',0,4,'2011-03-06 23:51:43','2011-03-06 23:51:43','2011-03-06 23:51:43',1,NULL,NULL,0,0,NULL,0,0,0),(2,2,1,'test-app-grizzlybear2302-1.0.webapp',429,'sha256:f0fcb3dd04e13979ba491202bf2c4e91810728713df5cf50a43b8c637d191171',0,2,'2013-01-25 12:47:23','2013-01-25 12:47:23','2013-01-25 12:47:23',0,NULL,NULL,0,0,NULL,0,0,0),(3,3,1,'test-app-kinkajou3969-1.0.webapp',426,'sha256:94785db757cf5d4f650557780c9fe60d5013d019a8e55b81e29a9b768af6c3f5',0,2,'2013-01-25 13:32:16','2013-01-25 13:32:16','2013-01-25 13:32:16',0,NULL,NULL,0,0,NULL,0,0,0);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frozen_addons`
--

DROP TABLE IF EXISTS `frozen_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frozen_addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frozen_addons`
--

LOCK TABLES `frozen_addons` WRITE;
/*!40000 ALTER TABLE `frozen_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `frozen_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_stats`
--

DROP TABLE IF EXISTS `global_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `namedate` (`name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_stats`
--

LOCK TABLES `global_stats` WRITE;
/*!40000 ALTER TABLE `global_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rules` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50070 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admins','*:*','2011-03-01 20:17:12','2013-03-13 09:28:57',''),(50000,'Staff','Addons:Review,Apps:Review,Personas:Review,Reviews:Edit,Addons:Edit,Addons:Configure,Users:Edit,Stats:View,CollectionStats:View,Collections:Edit,AdminTools:View,Apps:Configure,FeaturedApps:View,FeaturedApps:Edit','2012-04-19 18:43:22','2012-04-19 18:43:22',''),(50001,'Statistic Viewers','Stats:View,CollectionStats:View','2012-04-04 17:17:55','2012-04-04 17:17:55',''),(50002,'Add-on Reviewers','Addons:Review,Reviews:Edit','2012-04-04 17:17:55','2012-04-04 17:17:55',''),(50003,'App Reviewers','Apps:Review,Reviews:Edit','2012-04-04 17:17:55','2012-04-04 17:17:55',''),(50004,'Persona Reviewers','Personas:Review,Reviews:Edit','2012-04-04 17:17:55','2012-04-04 17:17:55',''),(50005,'Senior Add-on Reviewers','Addons:Review,Reviews:Edit,CollectionStats:View,Addons:Edit,Spam:Flag,ReviewerAdminTools:View','2012-04-04 17:17:55','2012-04-04 17:17:55',''),(50006,'Senior Localizers','Locales:Edit','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50007,'af Localizers','Locale.af:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50008,'ar Localizers','Locale.ar:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50009,'bg Localizers','Locale.bg:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50010,'ca Localizers','Locale.ca:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50011,'cs Localizers','Locale.cs:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50012,'cy Localizers','Locale.cy:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50013,'da Localizers','Locale.da:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50014,'de Localizers','Locale.de:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50015,'el Localizers','Locale.el:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50016,'es-ES Localizers','Locale.es-ES:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50017,'eu Localizers','Locale.eu:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50018,'fa Localizers','Locale.fa:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50019,'fi Localizers','Locale.fi:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50020,'fr Localizers','Locale.fr:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50021,'ga-IE Localizers','Locale.ga-IE:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50022,'he Localizers','Locale.he:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50023,'hu Localizers','Locale.hu:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50024,'id Localizers','Locale.id:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50025,'it Localizers','Locale.it:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50026,'ja Localizers','Locale.ja:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50027,'ko Localizers','Locale.ko:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50028,'mn Localizers','Locale.mn:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50029,'nl Localizers','Locale.nl:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50030,'pl Localizers','Locale.pl:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50031,'pt-BR Localizers','Locale.pt-BR:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50032,'pt-PT Localizers','Locale.pt-PT:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50033,'ro Localizers','Locale.ro:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50034,'ru Localizers','Locale.ru:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50035,'sk Localizers','Locale.sk:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50036,'sl Localizers','Locale.sl:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50037,'sq Localizers','Locale.sq:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50038,'sr Localizers','Locale.sr:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50039,'sr-Latn Localizers','Locale.sr-Latn:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50040,'sv-SE Localizers','Locale.sv-SE:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50041,'tr Localizers','Locale.tr:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50042,'uk Localizers','Locale.uk:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50043,'vi Localizers','Locale.vi:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50044,'zh-CN Localizers','Locale.zh-CN:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50045,'zh-TW Localizers','Locale.zh-TW:Edit,L10nTools:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50046,'Developers Credits','None:None','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50047,'Past Developers Credits','None:None','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50048,'Other Contributors Credits','None:None','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50049,'QA','None:None','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50050,'Revenue Stats Viewers','RevenueStats:View','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50051,'System Administrators','None:None','2012-04-04 17:17:58','2012-04-04 17:17:58','Preserved through permissions migration for future use.'),(50052,'Add-on Reviewer MOTD','AddonReviewerMOTD:Edit','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50053,'App Reviewer MOTD','AppReviewerMOTD:Edit','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50054,'Persona Reviewer MOTD','PersonaReviewerMOTD:Edit','2012-04-04 17:17:58','2012-04-04 17:17:58',''),(50055,'Developers','AdminTools:View,Apps:ViewConfiguration','2012-05-01 08:47:38','2012-05-01 08:47:38',''),(50056,'Bulk Compatibility Updaters','BulkValidationAdminTools:View','2012-05-09 15:40:07','2012-05-09 15:40:07',''),(50057,'Support Staff','AccountLookup:View,Apps:Configure,Transaction:View,Transaction:View,Transaction:Refund','2012-05-22 17:12:04','2012-05-22 17:12:04',''),(50058,'Restricted Users','Restricted:UGC','2012-08-08 14:40:39','2012-08-08 14:40:39',''),(50059,'Senior App Reviewers','Apps:Review,Reviews:Edit,CollectionStats:View,Addons:Edit,Spam:Flag,ReviewerAdminTools:View,Apps:ReviewEscalated','2012-08-08 14:40:41','2012-08-08 14:40:41',''),(50060,'Feature Managers','FeaturedApps:View,FeaturedApps:Edit','2012-10-18 09:03:16','2012-10-18 09:03:16','For users to manage only featured apps.'),(50061,'Engagement','MailingLists:View','2012-11-02 09:58:47','2012-11-02 09:58:47',''),(50066,'No Reviewer Incentives','None:None','2013-04-26 09:53:58','2013-04-26 09:53:58','Reviewers who should not be included in incentives tables'),(50067,'Payment transactions clients','Transaction:NotifyFailure','2013-04-26 09:54:00','2013-04-26 09:54:00','Clients that can notify of failures in payments'),(50068,'Payment product icon clients','ProductIcon:Create','2013-04-26 09:54:00','2013-04-26 09:54:00','Clients that can create cached product icon URLs'),(50069,'Senior Personas Reviewers','SeniorPersonasTools:View','2013-05-06 06:43:11','2013-05-06 06:43:11','');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `groups_users_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `groups_users_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (1,1,1),(2,1,3),(3,1,7),(4,1,11),(5,1,26);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubevents`
--

DROP TABLE IF EXISTS `hubevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hubevents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubevents`
--

LOCK TABLES `hubevents` WRITE;
/*!40000 ALTER TABLE `hubevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `hubevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubpromos`
--

DROP TABLE IF EXISTS `hubpromos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hubpromos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading` int(11) unsigned NOT NULL DEFAULT '0',
  `body` int(11) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `hubpromos_ibfk_1` (`heading`),
  KEY `hubpromos_ibfk_2` (`body`),
  CONSTRAINT `hubpromos_ibfk_1` FOREIGN KEY (`heading`) REFERENCES `translations` (`id`),
  CONSTRAINT `hubpromos_ibfk_2` FOREIGN KEY (`body`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubpromos`
--

LOCK TABLES `hubpromos` WRITE;
/*!40000 ALTER TABLE `hubpromos` DISABLE KEYS */;
/*!40000 ALTER TABLE `hubpromos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubrsskeys`
--

DROP TABLE IF EXISTS `hubrsskeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hubrsskeys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rsskey` char(36) NOT NULL DEFAULT '',
  `addon_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rsskey` (`rsskey`),
  UNIQUE KEY `addon_id` (`addon_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `hubrsskeys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hubrsskeys_ibfk_2` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubrsskeys`
--

LOCK TABLES `hubrsskeys` WRITE;
/*!40000 ALTER TABLE `hubrsskeys` DISABLE KEYS */;
INSERT INTO `hubrsskeys` VALUES (1,'d683bd92b1fd43e8bb70ec9079b17061',NULL,1,'2011-03-06 00:00:00'),(2,'8311257810e646c9b9a280ce0c3e38fc',NULL,7,'2011-04-03 00:00:00'),(3,'7d3dec2da88b4462ae2b6091dda9ee3e',NULL,9,'2011-07-14 00:00:00'),(4,'09ef83b57d3b4e348e5975b7d2235918',NULL,11,'2011-09-01 00:00:00');
/*!40000 ALTER TABLE `hubrsskeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_assets`
--

DROP TABLE IF EXISTS `image_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `filetype` varchar(25) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `hue` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `imageassets_ab59e4f` (`addon_id`,`slug`),
  CONSTRAINT `addon_id_refs_id_5ef1767b` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_assets`
--

LOCK TABLES `image_assets` WRITE;
/*!40000 ALTER TABLE `image_assets` DISABLE KEYS */;
INSERT INTO `image_assets` VALUES (1,'2013-01-25 12:48:49','2013-01-25 12:48:49',2,'image/png','featured_tile',0),(2,'2013-01-25 12:48:49','2013-01-25 12:48:49',2,'image/png','mobile_tile',0),(3,'2013-01-25 12:48:49','2013-01-25 12:48:49',2,'image/png','desktop_tile',0);
/*!40000 ALTER TABLE `image_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incompatible_versions`
--

DROP TABLE IF EXISTS `incompatible_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incompatible_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  `app_id` int(11) unsigned NOT NULL,
  `min_app_version` varchar(255) NOT NULL,
  `max_app_version` varchar(255) NOT NULL,
  `min_app_version_int` bigint(20) DEFAULT NULL,
  `max_app_version_int` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incompatible_versions_fef0b09d` (`version_id`),
  KEY `incompatible_versions_269da59a` (`app_id`),
  KEY `incompatible_versions_68156cb3` (`min_app_version_int`),
  KEY `incompatible_versions_3d2f16b5` (`max_app_version_int`),
  CONSTRAINT `incompatible_versions_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `incompatible_versions_ibfk_2` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incompatible_versions`
--

LOCK TABLES `incompatible_versions` WRITE;
/*!40000 ALTER TABLE `incompatible_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `incompatible_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_eventlog`
--

DROP TABLE IF EXISTS `l10n_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_eventlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(10) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `field` varchar(20) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `changed_id` int(11) unsigned NOT NULL DEFAULT '0',
  `added` varchar(255) DEFAULT NULL,
  `removed` varchar(255) DEFAULT NULL,
  `notes` mediumtext,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `locale` (`locale`,`type`,`action`,`created`),
  KEY `locale_2` (`locale`,`type`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_eventlog`
--

LOCK TABLES `l10n_eventlog` WRITE;
/*!40000 ALTER TABLE `l10n_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `l10n_eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_settings`
--

DROP TABLE IF EXISTS `l10n_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `locale` varchar(30) NOT NULL,
  `motd` int(11) DEFAULT NULL,
  `team_homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale` (`locale`),
  UNIQUE KEY `motd` (`motd`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_settings`
--

LOCK TABLES `l10n_settings` WRITE;
/*!40000 ALTER TABLE `l10n_settings` DISABLE KEYS */;
INSERT INTO `l10n_settings` VALUES (1,'2011-11-02 15:52:55','2011-11-02 15:52:55','ca',NULL,'http://www.mozilla.cat/'),(2,'2011-11-02 15:52:55','2011-11-02 15:52:55','cs',NULL,'http://www.mozilla.cz/'),(3,'2011-11-02 15:52:55','2011-11-02 15:52:55','da',NULL,'http://mozilladanmark.dk/'),(4,'2011-11-02 15:52:55','2011-11-02 15:52:55','es-ES',NULL,'http://www.proyectonave.es/'),(5,'2011-11-02 15:52:55','2011-11-02 15:52:55','eu',NULL,'http://www.librezale.org/'),(6,'2011-11-02 15:52:55','2011-11-02 15:52:55','fy-NL',NULL,'http://www.mozilla-nl.org/projecten/frysk'),(7,'2011-11-02 15:52:55','2011-11-02 15:52:55','fr',NULL,'http://www.frenchmozilla.fr/'),(8,'2011-11-02 15:52:55','2011-11-02 15:52:55','ga-IE',NULL,'http://gaeilge.mozdev.org/'),(9,'2011-11-02 15:52:55','2011-11-02 15:52:55','he',NULL,'http://mozilla.org.il/'),(10,'2011-11-02 15:52:55','2011-11-02 15:52:55','hu',NULL,'http://mozilla.fsf.hu/'),(11,'2011-11-02 15:52:55','2011-11-02 15:52:55','it',NULL,'http://www.mozillaitalia.it/'),(12,'2011-11-02 15:52:55','2011-11-02 15:52:55','lt',NULL,'http://firefox.lt/'),(13,'2011-11-02 15:52:55','2011-11-02 15:52:55','nl',NULL,'http://www.mozilla-nl.org'),(14,'2011-11-02 15:52:55','2011-11-02 15:52:55','pl',NULL,'http://www.aviary.pl/'),(15,'2011-11-02 15:52:55','2011-11-02 15:52:55','pt-PT',NULL,'http://mozilla.pt/'),(16,'2011-11-02 15:52:55','2011-11-02 15:52:55','si',NULL,'http://www.mozilla.lk/'),(17,'2011-11-02 15:52:55','2011-11-02 15:52:55','sk',NULL,'http://www.mozilla.sk/'),(18,'2011-11-02 15:52:55','2011-11-02 15:52:55','ta-LK',NULL,'http://www.mozilla.lk/'),(19,'2011-11-02 15:52:55','2011-11-02 15:52:55','uk',NULL,'http://mozilla.org.ua/'),(20,'2011-11-02 15:52:55','2011-11-02 15:52:55','vi',NULL,'http://vi.mozdev.org/'),(21,'2011-11-02 15:52:55','2011-11-02 15:52:55','zh-CN',NULL,'http://narro.mozest.com/'),(22,'2011-11-02 15:52:55','2011-11-02 15:52:55','zh-TW',NULL,'http://moztw.org/');
/*!40000 ALTER TABLE `l10n_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `url` varchar(200) DEFAULT NULL,
  `builtin` int(10) unsigned NOT NULL DEFAULT '0',
  `on_form` tinyint(1) NOT NULL DEFAULT '0',
  `some_rights` tinyint(1) NOT NULL DEFAULT '0',
  `icons` varchar(255) DEFAULT NULL,
  `name` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `text` (`text`),
  KEY `name` (`name`),
  KEY `builtin_idx` (`builtin`),
  CONSTRAINT `licenses_ibfk_1` FOREIGN KEY (`text`) REFERENCES `translations` (`id`),
  CONSTRAINT `licenses_ibfk_2` FOREIGN KEY (`name`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,15,'2011-03-06 23:53:40','2011-06-02 12:36:20',NULL,0,0,0,NULL,14);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity`
--

DROP TABLE IF EXISTS `log_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `action` smallint(6) NOT NULL,
  `arguments` longtext NOT NULL,
  `details` longtext,
  PRIMARY KEY (`id`),
  KEY `log_activity_fbfc09f1` (`user_id`),
  KEY `log_activity_1bd4707b` (`action`),
  KEY `created_idx` (`created`),
  CONSTRAINT `user_id_refs_id_3fa7a30a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity`
--

LOCK TABLES `log_activity` WRITE;
/*!40000 ALTER TABLE `log_activity` DISABLE KEYS */;
INSERT INTO `log_activity` VALUES (1,'2011-03-06 23:51:43','2011-03-06 23:51:43',1,1,'[{\"addons.addon\": 1}]',''),(2,'2011-03-06 23:59:50','2011-03-06 23:59:50',1,39,'[{\"addons.addon\": 1}]',''),(3,'2011-03-23 13:00:15','2011-03-23 13:00:15',1,39,'[{\"addons.addon\": 1}]',''),(4,'2011-03-23 13:01:43','2011-03-23 13:01:43',1,39,'[{\"addons.addon\": 1}]',''),(5,'2011-03-23 13:04:21','2011-03-23 13:04:21',1,39,'[{\"addons.addon\": 1}]',''),(6,'2011-03-23 13:04:58','2011-03-23 13:04:58',1,39,'[{\"addons.addon\": 1}]',''),(7,'2011-03-23 13:05:32','2011-03-23 13:05:32',1,39,'[{\"addons.addon\": 1}]',''),(8,'2011-03-23 14:08:05','2011-03-23 14:08:05',1,39,'[{\"addons.addon\": 1}]',''),(9,'2011-03-23 14:08:40','2011-03-23 14:08:40',1,39,'[{\"addons.addon\": 1}]',''),(10,'2011-03-23 14:09:01','2011-03-23 14:09:01',1,39,'[{\"addons.addon\": 1}]',''),(11,'2011-03-23 14:45:49','2011-03-23 14:45:49',1,39,'[{\"addons.addon\": 1}]',''),(12,'2011-03-23 14:46:44','2011-03-23 14:46:44',1,39,'[{\"addons.addon\": 1}]',''),(13,'2011-03-23 14:49:18','2011-03-23 14:49:18',1,39,'[{\"addons.addon\": 1}]',''),(14,'2011-03-23 14:49:37','2011-03-23 14:49:37',1,39,'[{\"addons.addon\": 1}]',''),(15,'2011-03-23 14:56:52','2011-03-23 14:56:52',1,39,'[{\"addons.addon\": 1}]',''),(16,'2011-03-23 15:01:58','2011-03-23 15:01:58',1,39,'[{\"addons.addon\": 1}]',''),(17,'2011-03-23 21:39:15','2011-03-23 21:39:15',1,2,'[{\"addons.addon\": 1}]',''),(18,'2011-03-29 12:47:08','2011-03-29 12:47:08',1,27,'[{\"addons.addon\": 1}, {\"bandwagon.collection\": 2}]',''),(19,'2011-06-02 12:34:28','2011-06-02 12:34:28',1,37,'[{\"versions.license\": 1}, {\"addons.addon\": 1}]',''),(20,'2011-06-02 12:36:20','2011-06-02 12:36:20',1,37,'[{\"versions.license\": 1}, {\"addons.addon\": 1}]',''),(21,'2012-02-26 03:31:59','2012-02-26 03:31:59',15,29,'[{\"addons.addon\": 1}, {\"reviews.review\": 1}]',''),(22,'2012-04-19 18:58:27','2012-04-19 18:58:27',18,29,'[{\"addons.addon\": 1}, {\"reviews.review\": 2}]','');
/*!40000 ALTER TABLE `log_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_addon`
--

DROP TABLE IF EXISTS `log_activity_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_addon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(10) unsigned NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_activity_addon_cc3d5937` (`addon_id`),
  KEY `log_activity_addon_3bf68f54` (`activity_log_id`),
  CONSTRAINT `activity_log_id_refs_id_9c20a926` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addon_id_refs_id_5bfa17d1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_addon`
--

LOCK TABLES `log_activity_addon` WRITE;
/*!40000 ALTER TABLE `log_activity_addon` DISABLE KEYS */;
INSERT INTO `log_activity_addon` VALUES (1,'2011-03-06 23:51:43','2011-03-06 23:51:43',1,1),(2,'2011-03-06 23:59:50','2011-03-06 23:59:50',1,2),(3,'2011-03-23 13:00:15','2011-03-23 13:00:15',1,3),(4,'2011-03-23 13:01:43','2011-03-23 13:01:43',1,4),(5,'2011-03-23 13:04:21','2011-03-23 13:04:21',1,5),(6,'2011-03-23 13:04:58','2011-03-23 13:04:58',1,6),(7,'2011-03-23 13:05:32','2011-03-23 13:05:32',1,7),(8,'2011-03-23 14:08:05','2011-03-23 14:08:05',1,8),(9,'2011-03-23 14:08:40','2011-03-23 14:08:40',1,9),(10,'2011-03-23 14:09:01','2011-03-23 14:09:01',1,10),(11,'2011-03-23 14:45:49','2011-03-23 14:45:49',1,11),(12,'2011-03-23 14:46:44','2011-03-23 14:46:44',1,12),(13,'2011-03-23 14:49:18','2011-03-23 14:49:18',1,13),(14,'2011-03-23 14:49:37','2011-03-23 14:49:37',1,14),(15,'2011-03-23 14:56:52','2011-03-23 14:56:52',1,15),(16,'2011-03-23 15:01:58','2011-03-23 15:01:58',1,16),(17,'2011-03-23 21:39:15','2011-03-23 21:39:15',1,17),(18,'2011-03-29 12:47:08','2011-03-29 12:47:08',1,18),(19,'2011-06-02 12:34:28','2011-06-02 12:34:28',1,19),(20,'2011-06-02 12:36:20','2011-06-02 12:36:20',1,20),(21,'2012-02-26 03:32:00','2012-02-26 03:32:00',1,21),(22,'2012-04-19 18:58:27','2012-04-19 18:58:27',1,22);
/*!40000 ALTER TABLE `log_activity_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_addon_mkt`
--

DROP TABLE IF EXISTS `log_activity_addon_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_addon_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(10) unsigned NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_activity_addon_cc3d5937` (`addon_id`),
  KEY `log_activity_addon_3bf68f54` (`activity_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_addon_mkt`
--

LOCK TABLES `log_activity_addon_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_addon_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_addon_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_app`
--

DROP TABLE IF EXISTS `log_activity_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_activity_app_activity_log_id_key` (`activity_log_id`),
  CONSTRAINT `log_activity_app_activity_log_id_key` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_app`
--

LOCK TABLES `log_activity_app` WRITE;
/*!40000 ALTER TABLE `log_activity_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_app_mkt`
--

DROP TABLE IF EXISTS `log_activity_app_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_app_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_id_refs_id_d08a7a0f` (`activity_log_id`),
  CONSTRAINT `activity_log_id_refs_id_d08a7a0f` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity_mkt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_app_mkt`
--

LOCK TABLES `log_activity_app_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_app_mkt` DISABLE KEYS */;
INSERT INTO `log_activity_app_mkt` VALUES (1,'2013-01-25 12:47:23','2013-01-25 12:47:23',2,1),(2,'2013-01-25 12:47:23','2013-01-25 12:47:23',2,2),(3,'2013-01-25 13:32:16','2013-01-25 13:32:16',3,3),(4,'2013-01-25 13:32:16','2013-01-25 13:32:16',3,4);
/*!40000 ALTER TABLE `log_activity_app_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_attachment_mkt`
--

DROP TABLE IF EXISTS `log_activity_attachment_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_attachment_mkt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_id_log_activity_attachment_key_mkt` (`activity_log_id`),
  CONSTRAINT `activity_log_id_log_activity_attachment_key_mkt` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity_mkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_attachment_mkt`
--

LOCK TABLES `log_activity_attachment_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_attachment_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_attachment_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_comment`
--

DROP TABLE IF EXISTS `log_activity_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_id` (`activity_log_id`),
  CONSTRAINT `log_activity_comment_ibfk_1` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_comment`
--

LOCK TABLES `log_activity_comment` WRITE;
/*!40000 ALTER TABLE `log_activity_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_comment_mkt`
--

DROP TABLE IF EXISTS `log_activity_comment_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_comment_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_id_refs_id_8c3808d7` (`activity_log_id`),
  CONSTRAINT `activity_log_id_refs_id_8c3808d7` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity_mkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_comment_mkt`
--

LOCK TABLES `log_activity_comment_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_comment_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_comment_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_group`
--

DROP TABLE IF EXISTS `log_activity_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id_refs_id_757b3ceb` (`group_id`),
  KEY `activity_log_id_refs_id_15e06f3d` (`activity_log_id`),
  CONSTRAINT `activity_log_id_refs_id_15e06f3d` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_id_refs_id_757b3ceb` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_group`
--

LOCK TABLES `log_activity_group` WRITE;
/*!40000 ALTER TABLE `log_activity_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_group_mkt`
--

DROP TABLE IF EXISTS `log_activity_group_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_group_mkt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id_refs_id_mkt_757b3ceb` (`group_id`),
  KEY `activity_log_mkt_id_refs_id_15e06f3d` (`activity_log_id`),
  CONSTRAINT `activity_log_mkt_id_refs_id_15e06f3d` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity_mkt` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_id_refs_id_mkt_757b3ceb` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_group_mkt`
--

LOCK TABLES `log_activity_group_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_group_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_group_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_mkt`
--

DROP TABLE IF EXISTS `log_activity_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(1) unsigned DEFAULT NULL,
  `action` smallint(6) NOT NULL,
  `arguments` longtext NOT NULL,
  `details` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_user_id_ee305b55` (`user_id`),
  CONSTRAINT `user_id_refs_user_id_ee305b55` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_mkt`
--

LOCK TABLES `log_activity_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_mkt` DISABLE KEYS */;
INSERT INTO `log_activity_mkt` VALUES (1,'2013-01-25 12:47:23','2013-01-25 12:47:23',22,12,'[{\"str\": \"Incomplete\"}, {\"webapps.webapp\": 2}]',''),(2,'2013-01-25 12:47:23','2013-01-25 12:47:23',22,1,'[{\"webapps.webapp\": 2}]',''),(3,'2013-01-25 13:32:16','2013-01-25 13:32:16',22,12,'[{\"str\": \"Incomplete\"}, {\"webapps.webapp\": 3}]',''),(4,'2013-01-25 13:32:16','2013-01-25 13:32:16',22,1,'[{\"webapps.webapp\": 3}]','');
/*!40000 ALTER TABLE `log_activity_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_user`
--

DROP TABLE IF EXISTS `log_activity_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_activity_user_3bf68f54` (`activity_log_id`),
  KEY `log_activity_user_fbfc09f1` (`user_id`),
  CONSTRAINT `activity_log_id_refs_id_4f8d99d4` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_refs_id_e987c199` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_user`
--

LOCK TABLES `log_activity_user` WRITE;
/*!40000 ALTER TABLE `log_activity_user` DISABLE KEYS */;
INSERT INTO `log_activity_user` VALUES (1,'2011-03-06 23:51:43','2011-03-06 23:51:43',1,1),(2,'2011-03-06 23:59:50','2011-03-06 23:59:50',2,1),(3,'2011-03-23 13:00:15','2011-03-23 13:00:15',3,1),(4,'2011-03-23 13:01:43','2011-03-23 13:01:43',4,1),(5,'2011-03-23 13:04:21','2011-03-23 13:04:21',5,1),(6,'2011-03-23 13:04:58','2011-03-23 13:04:58',6,1),(7,'2011-03-23 13:05:32','2011-03-23 13:05:32',7,1),(8,'2011-03-23 14:08:05','2011-03-23 14:08:05',8,1),(9,'2011-03-23 14:08:40','2011-03-23 14:08:40',9,1),(10,'2011-03-23 14:09:01','2011-03-23 14:09:01',10,1),(11,'2011-03-23 14:45:49','2011-03-23 14:45:49',11,1),(12,'2011-03-23 14:46:44','2011-03-23 14:46:44',12,1),(13,'2011-03-23 14:49:18','2011-03-23 14:49:18',13,1),(14,'2011-03-23 14:49:37','2011-03-23 14:49:37',14,1),(15,'2011-03-23 14:56:52','2011-03-23 14:56:52',15,1),(16,'2011-03-23 15:01:58','2011-03-23 15:01:58',16,1),(17,'2011-03-23 21:39:15','2011-03-23 21:39:15',17,1),(18,'2011-03-29 12:47:08','2011-03-29 12:47:08',18,1),(19,'2011-06-02 12:34:28','2011-06-02 12:34:28',19,1),(20,'2011-06-02 12:36:20','2011-06-02 12:36:20',20,1),(21,'2012-02-26 03:32:00','2012-02-26 03:32:00',21,15),(22,'2012-04-19 18:58:27','2012-04-19 18:58:27',22,18);
/*!40000 ALTER TABLE `log_activity_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_user_mkt`
--

DROP TABLE IF EXISTS `log_activity_user_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_user_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_2eb55c34` (`user_id`),
  KEY `activity_log_id_refs_id_fbabd042` (`activity_log_id`),
  CONSTRAINT `activity_log_id_refs_id_fbabd042` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity_mkt` (`id`),
  CONSTRAINT `user_id_refs_id_2eb55c34` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_user_mkt`
--

LOCK TABLES `log_activity_user_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_user_mkt` DISABLE KEYS */;
INSERT INTO `log_activity_user_mkt` VALUES (1,'2013-01-25 12:47:23','2013-01-25 12:47:23',1,22),(2,'2013-01-25 12:47:23','2013-01-25 12:47:23',2,22),(3,'2013-01-25 13:32:16','2013-01-25 13:32:16',3,22),(4,'2013-01-25 13:32:16','2013-01-25 13:32:16',4,22);
/*!40000 ALTER TABLE `log_activity_user_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_version`
--

DROP TABLE IF EXISTS `log_activity_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_id` (`activity_log_id`),
  KEY `version_id` (`version_id`),
  CONSTRAINT `log_activity_version_ibfk_1` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity` (`id`),
  CONSTRAINT `log_activity_version_ibfk_2` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_version`
--

LOCK TABLES `log_activity_version` WRITE;
/*!40000 ALTER TABLE `log_activity_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_activity_version_mkt`
--

DROP TABLE IF EXISTS `log_activity_version_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity_version_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version_id_refs_id_e1ef9328` (`version_id`),
  KEY `activity_log_id_refs_id_f626a650` (`activity_log_id`),
  CONSTRAINT `activity_log_id_refs_id_f626a650` FOREIGN KEY (`activity_log_id`) REFERENCES `log_activity_mkt` (`id`),
  CONSTRAINT `version_id_refs_id_e1ef9328` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_activity_version_mkt`
--

LOCK TABLES `log_activity_version_mkt` WRITE;
/*!40000 ALTER TABLE `log_activity_version_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_activity_version_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monolith_record`
--

DROP TABLE IF EXISTS `monolith_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monolith_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `recorded` datetime NOT NULL,
  `user_hash` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monolith_record_key` (`key`),
  KEY `monolith_record_date` (`recorded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monolith_record`
--

LOCK TABLES `monolith_record` WRITE;
/*!40000 ALTER TABLE `monolith_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `monolith_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_pick`
--

DROP TABLE IF EXISTS `monthly_pick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_pick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `blurb` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale` (`locale`),
  UNIQUE KEY `locale_2` (`locale`),
  KEY `monthly_pick_cc3d5937` (`addon_id`),
  CONSTRAINT `addon_id_refs_id_a94677f3` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_pick`
--

LOCK TABLES `monthly_pick` WRITE;
/*!40000 ALTER TABLE `monthly_pick` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_pick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `nonce` varchar(128) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `client_key` varchar(255) NOT NULL,
  `request_token` varchar(128) DEFAULT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nonce` (`nonce`,`timestamp`,`client_key`,`request_token`,`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `token_type` int(11) NOT NULL,
  `creds_id` int(11) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creds_id_refs_id_3bd47889` (`creds_id`),
  KEY `user_id_refs_id_e213c7fc` (`user_id`),
  CONSTRAINT `creds_id_refs_id_3bd47889` FOREIGN KEY (`creds_id`) REFERENCES `api_access` (`id`),
  CONSTRAINT `user_id_refs_id_e213c7fc` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token`
--

LOCK TABLES `oauth_token` WRITE;
/*!40000 ALTER TABLE `oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_accounts`
--

DROP TABLE IF EXISTS `payment_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_accounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `seller_uri` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `inactive` tinyint(1) NOT NULL,
  `bango_package_id` int(11) unsigned DEFAULT NULL,
  `solitude_seller_id` int(11) unsigned NOT NULL,
  `agreed_tos` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seller_uri` (`seller_uri`),
  UNIQUE KEY `uri` (`uri`),
  UNIQUE KEY `user_id` (`user_id`,`uri`),
  KEY `payment_accounts_fbfc09f1` (`user_id`),
  KEY `payment_accounts_613b0f94` (`solitude_seller_id`),
  CONSTRAINT `solitude_seller_id_refs_id_e68bc3b0` FOREIGN KEY (`solitude_seller_id`) REFERENCES `payments_seller` (`id`),
  CONSTRAINT `user_id_refs_id_4f9c3df5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_accounts`
--

LOCK TABLES `payment_accounts` WRITE;
/*!40000 ALTER TABLE `payment_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_assets`
--

DROP TABLE IF EXISTS `payment_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `ext_url` varchar(255) NOT NULL,
  `ext_size` int(11) unsigned NOT NULL,
  `size` int(11) unsigned NOT NULL,
  `format` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ext_url` (`ext_url`),
  KEY `payment_assets_3d23e06b` (`ext_url`),
  KEY `payment_assets_a6ff5cf0` (`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_assets`
--

LOCK TABLES `payment_assets` WRITE;
/*!40000 ALTER TABLE `payment_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_seller`
--

DROP TABLE IF EXISTS `payments_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_seller` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `resource_uri` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `payments_seller_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_29692a2a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_seller`
--

LOCK TABLES `payments_seller` WRITE;
/*!40000 ALTER TABLE `payments_seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_checkstatus`
--

DROP TABLE IF EXISTS `paypal_checkstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_checkstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `failure_data` longtext,
  PRIMARY KEY (`id`),
  KEY `paypal_checkstatus_addon_id_idx` (`addon_id`),
  CONSTRAINT `paypal_checkstatys_addon_id_fk` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_checkstatus`
--

LOCK TABLES `paypal_checkstatus` WRITE;
/*!40000 ALTER TABLE `paypal_checkstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_checkstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perf_appversions`
--

DROP TABLE IF EXISTS `perf_appversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_appversions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(255) DEFAULT NULL,
  `version` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perf_appversions`
--

LOCK TABLES `perf_appversions` WRITE;
/*!40000 ALTER TABLE `perf_appversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `perf_appversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perf_osversions`
--

DROP TABLE IF EXISTS `perf_osversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_osversions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `os` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perf_osversions`
--

LOCK TABLES `perf_osversions` WRITE;
/*!40000 ALTER TABLE `perf_osversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `perf_osversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perf_results`
--

DROP TABLE IF EXISTS `perf_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_results` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned DEFAULT NULL,
  `appversion_id` int(11) unsigned NOT NULL,
  `osversion_id` int(11) unsigned NOT NULL,
  `average` float NOT NULL DEFAULT '0',
  `test` enum('tp','ts') DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`appversion_id`,`osversion_id`),
  KEY `perf_results_addon_id_key` (`addon_id`),
  KEY `perf_results_appversion_key` (`appversion_id`),
  KEY `perf_results_osversion_key` (`osversion_id`),
  KEY `avg_addon_idx` (`average`,`addon_id`),
  KEY `addon_created_idx` (`addon_id`,`created`),
  KEY `created_idx` (`created`),
  CONSTRAINT `perf_results_addon_id_key` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `perf_results_appversion_key` FOREIGN KEY (`appversion_id`) REFERENCES `perf_appversions` (`id`),
  CONSTRAINT `perf_results_osversion_key` FOREIGN KEY (`osversion_id`) REFERENCES `perf_osversions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perf_results`
--

LOCK TABLES `perf_results` WRITE;
/*!40000 ALTER TABLE `perf_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `perf_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perf_stage`
--

DROP TABLE IF EXISTS `perf_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_stage` (
  `addon` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perf_stage`
--

LOCK TABLES `perf_stage` WRITE;
/*!40000 ALTER TABLE `perf_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `perf_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL,
  `persona_id` int(11) unsigned NOT NULL,
  `name` int(11) unsigned DEFAULT NULL,
  `description` int(11) unsigned DEFAULT NULL,
  `header` varchar(64) DEFAULT NULL,
  `footer` varchar(64) DEFAULT NULL,
  `accentcolor` varchar(10) DEFAULT NULL,
  `textcolor` varchar(10) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `display_username` varchar(32) DEFAULT NULL,
  `submit` datetime DEFAULT NULL,
  `approve` datetime DEFAULT NULL,
  `movers` double DEFAULT NULL,
  `popularity` int(11) NOT NULL DEFAULT '0',
  `license` int(11) unsigned DEFAULT NULL,
  `checksum` varchar(64) NOT NULL DEFAULT '',
  `dupe_persona_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `personas_ibfk_1` (`addon_id`),
  KEY `personas_ibfk_3` (`description`),
  KEY `license_id` (`license`),
  KEY `personas_persona_id` (`persona_id`),
  KEY `personas_movers_idx` (`movers`),
  KEY `personas_popularity_idx` (`popularity`),
  KEY `author_addon_idx` (`author`,`addon_id`),
  KEY `dupe_persona_id_refs_id` (`dupe_persona_id`),
  KEY `personas_checksum_index` (`checksum`),
  CONSTRAINT `dupe_persona_id_refs_id` FOREIGN KEY (`dupe_persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`name`) REFERENCES `translations` (`id`),
  CONSTRAINT `personas_ibfk_3` FOREIGN KEY (`description`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piston_consumer`
--

DROP TABLE IF EXISTS `piston_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piston_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `key` varchar(18) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `piston_consumer_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_aad30107` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piston_consumer`
--

LOCK TABLES `piston_consumer` WRITE;
/*!40000 ALTER TABLE `piston_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `piston_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piston_nonce`
--

DROP TABLE IF EXISTS `piston_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piston_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_key` varchar(18) NOT NULL,
  `consumer_key` varchar(18) NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piston_nonce`
--

LOCK TABLES `piston_nonce` WRITE;
/*!40000 ALTER TABLE `piston_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `piston_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piston_token`
--

DROP TABLE IF EXISTS `piston_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piston_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(18) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `verifier` varchar(10) NOT NULL,
  `token_type` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `consumer_id` int(11) NOT NULL,
  `callback` varchar(255) DEFAULT NULL,
  `callback_confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `piston_token_fbfc09f1` (`user_id`),
  KEY `piston_token_6565fc20` (`consumer_id`),
  CONSTRAINT `consumer_id_refs_id_85f42355` FOREIGN KEY (`consumer_id`) REFERENCES `piston_consumer` (`id`),
  CONSTRAINT `user_id_refs_id_efc02d17` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piston_token`
--

LOCK TABLES `piston_token` WRITE;
/*!40000 ALTER TABLE `piston_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `piston_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) unsigned NOT NULL DEFAULT '0',
  `shortname` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `platforms_ibfk_1` (`name`),
  KEY `platforms_ibfk_2` (`shortname`),
  CONSTRAINT `platforms_ibfk_1` FOREIGN KEY (`name`) REFERENCES `translations` (`id`),
  CONSTRAINT `platforms_ibfk_2` FOREIGN KEY (`shortname`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,1010,1011,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1137,1138,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1139,1140,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1135,1136,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1143,1144,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,1141,1142,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1145,1146,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1147,1148,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,32,33,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `previews`
--

DROP TABLE IF EXISTS `previews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `filetype` varchar(25) NOT NULL DEFAULT '',
  `thumbtype` varchar(25) NOT NULL DEFAULT '',
  `caption` int(11) unsigned DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sizes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `previews_ibfk_2` (`caption`),
  KEY `addon_position_created_idx` (`addon_id`,`position`,`created`),
  CONSTRAINT `previews_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `previews_ibfk_2` FOREIGN KEY (`caption`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `previews`
--

LOCK TABLES `previews` WRITE;
/*!40000 ALTER TABLE `previews` DISABLE KEYS */;
INSERT INTO `previews` VALUES (10,1,'','',25,0,'2011-03-23 15:01:57','2011-03-23 15:01:57',''),(11,2,'image/png','',1168,0,'2013-01-25 12:48:49','2013-01-25 12:48:49','{\"image\":[700,750],\"thumbnail\":[180,193]}');
/*!40000 ALTER TABLE `previews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_currency`
--

DROP TABLE IF EXISTS `price_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `currency` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tier_id` int(11) NOT NULL,
  `carrier` int(11) unsigned DEFAULT NULL,
  `provider` int(11) unsigned NOT NULL,
  `region` int(11) unsigned NOT NULL,
  `method` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tier_id` (`tier_id`,`currency`,`carrier`,`region`,`provider`),
  KEY `price_currency_tier_id` (`tier_id`),
  CONSTRAINT `price_currency_tier_id` FOREIGN KEY (`tier_id`) REFERENCES `prices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1399 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_currency`
--

LOCK TABLES `price_currency` WRITE;
/*!40000 ALTER TABLE `price_currency` DISABLE KEYS */;
INSERT INTO `price_currency` VALUES (1338,'2013-06-25 12:31:02','2013-06-25 12:31:02','COP','0.00',6,NULL,1,9,2),(1339,'2013-06-25 12:31:02','2013-06-25 12:31:02','EUR','0.00',6,NULL,1,8,2),(1340,'2013-06-25 12:31:02','2013-06-25 12:31:02','PLN','0.00',6,NULL,1,11,2),(1341,'2013-06-25 12:31:02','2013-06-25 12:31:02','USD','0.00',6,NULL,1,2,2),(1342,'2013-06-25 12:31:02','2013-06-25 12:31:02','EUR','0.10',7,NULL,1,8,0),(1343,'2013-06-25 12:31:02','2013-06-25 12:31:02','PLN','0.49',7,NULL,1,11,0),(1344,'2013-06-25 12:31:02','2013-06-25 12:31:02','USD','0.10',7,NULL,1,2,1),(1345,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','0.25',8,NULL,1,8,0),(1346,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','0.99',8,NULL,1,11,0),(1347,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','0.25',8,NULL,1,2,1),(1348,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','0.45',9,NULL,1,8,0),(1349,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','1.99',9,NULL,1,11,0),(1350,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','0.50',9,NULL,1,2,1),(1351,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','2060.00',10,NULL,1,9,2),(1352,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','0.89',10,NULL,1,8,2),(1353,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','3.99',10,NULL,1,11,2),(1354,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','0.99',10,NULL,1,2,2),(1355,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','4150.00',11,NULL,1,9,1),(1356,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','1.89',11,NULL,1,8,2),(1357,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','7.69',11,NULL,1,11,2),(1358,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','1.99',11,NULL,1,2,2),(1359,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','6240.00',12,NULL,1,9,2),(1360,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','2.79',12,NULL,1,8,2),(1361,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','11.59',12,NULL,1,11,2),(1362,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','2.99',12,NULL,1,2,2),(1363,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','8320.00',13,NULL,1,9,2),(1364,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','3.79',13,NULL,1,8,2),(1365,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','15.49',13,NULL,1,11,2),(1366,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','3.99',13,NULL,1,2,2),(1367,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','10420.00',14,NULL,1,9,2),(1368,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','4.69',14,NULL,1,8,2),(1369,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','19.49',14,NULL,1,11,2),(1370,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','4.99',14,NULL,1,2,2),(1371,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','14600.00',15,NULL,1,9,1),(1372,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','6.59',15,NULL,1,8,2),(1373,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','26.99',15,NULL,1,11,2),(1374,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','6.99',15,NULL,1,2,2),(1375,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','20840.00',16,NULL,1,9,1),(1376,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','9.49',16,NULL,1,8,2),(1377,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','38.79',16,NULL,1,11,2),(1378,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','9.99',16,NULL,1,2,2),(1379,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','26070.00',17,NULL,1,9,1),(1380,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','11.59',17,NULL,1,8,2),(1381,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','48.49',17,NULL,1,11,2),(1382,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','12.49',17,NULL,1,2,2),(1383,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','31280.00',18,NULL,1,9,1),(1384,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','14.19',18,NULL,1,8,2),(1385,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','57.99',18,NULL,1,11,1),(1386,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','14.99',18,NULL,1,2,2),(1387,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','41720.00',19,NULL,1,9,1),(1388,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','18.99',19,NULL,1,8,2),(1389,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','77.49',19,NULL,1,11,1),(1390,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','19.99',19,NULL,1,2,2),(1391,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','52160.00',20,NULL,1,9,1),(1392,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','23.59',20,NULL,1,8,2),(1393,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','96.99',20,NULL,1,11,1),(1394,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','24.99',20,NULL,1,2,2),(1395,'2013-06-25 12:31:03','2013-06-25 12:31:03','COP','62580.00',21,NULL,1,9,1),(1396,'2013-06-25 12:31:03','2013-06-25 12:31:03','EUR','28.39',21,NULL,1,8,2),(1397,'2013-06-25 12:31:03','2013-06-25 12:31:03','PLN','116.49',21,NULL,1,11,1),(1398,'2013-06-25 12:31:03','2013-06-25 12:31:03','USD','29.99',21,NULL,1,2,2);
/*!40000 ALTER TABLE `price_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `name` varchar(4) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `method` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_translated` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (6,'2013-06-25 12:31:02','2013-06-25 12:31:02','0.00','0',1,2),(7,'2013-06-25 12:31:02','2013-06-25 12:31:02','0.10','1',1,2),(8,'2013-06-25 12:31:03','2013-06-25 12:31:03','0.25','5',1,2),(9,'2013-06-25 12:31:03','2013-06-25 12:31:03','0.50','7',1,2),(10,'2013-06-25 12:31:03','2013-06-25 12:31:03','0.99','10',1,2),(11,'2013-06-25 12:31:03','2013-06-25 12:31:03','1.99','20',1,2),(12,'2013-06-25 12:31:03','2013-06-25 12:31:03','2.99','30',1,2),(13,'2013-06-25 12:31:03','2013-06-25 12:31:03','3.99','40',1,2),(14,'2013-06-25 12:31:03','2013-06-25 12:31:03','4.99','50',1,2),(15,'2013-06-25 12:31:03','2013-06-25 12:31:03','6.99','60',1,2),(16,'2013-06-25 12:31:03','2013-06-25 12:31:03','9.99','70',1,2),(17,'2013-06-25 12:31:03','2013-06-25 12:31:03','12.49','80',1,2),(18,'2013-06-25 12:31:03','2013-06-25 12:31:03','14.99','90',1,2),(19,'2013-06-25 12:31:03','2013-06-25 12:31:03','19.99','100',1,2),(20,'2013-06-25 12:31:03','2013-06-25 12:31:03','24.99','110',1,2),(21,'2013-06-25 12:31:03','2013-06-25 12:31:03','29.99','120',1,2);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `contribution_id` int(11) unsigned NOT NULL,
  `status` int(11) unsigned NOT NULL,
  `refund_reason` longtext NOT NULL,
  `rejection_reason` longtext NOT NULL,
  `requested` datetime DEFAULT NULL,
  `approved` datetime DEFAULT NULL,
  `declined` datetime DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_contribution_id_idx` (`contribution_id`),
  KEY `refunds_status_idx` (`status`),
  KEY `refunds_requested_idx` (`requested`),
  KEY `refunds_approved_idx` (`approved`),
  KEY `refunds_declined_idx` (`declined`),
  CONSTRAINT `contribution_id_pk` FOREIGN KEY (`contribution_id`) REFERENCES `stats_contributions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rereview_queue`
--

DROP TABLE IF EXISTS `rereview_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rereview_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rereview_queue_addon_id_idx` (`addon_id`),
  KEY `rereview_queue_created_idx` (`created`),
  CONSTRAINT `rereview_queue_addon_id_fk` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rereview_queue`
--

LOCK TABLES `rereview_queue` WRITE;
/*!40000 ALTER TABLE `rereview_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `rereview_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rereview_queue_theme`
--

DROP TABLE IF EXISTS `rereview_queue_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rereview_queue_theme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) unsigned NOT NULL,
  `footer` varchar(72) NOT NULL,
  `header` varchar(72) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `dupe_persona_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_id` (`theme_id`),
  KEY `rqt_dupe_persona_id_refs_id` (`dupe_persona_id`),
  CONSTRAINT `rereview_queue_theme_ibfk_1` FOREIGN KEY (`theme_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rqt_dupe_persona_id_refs_id` FOREIGN KEY (`dupe_persona_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rereview_queue_theme`
--

LOCK TABLES `rereview_queue_theme` WRITE;
/*!40000 ALTER TABLE `rereview_queue_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `rereview_queue_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_scores`
--

DROP TABLE IF EXISTS `reviewer_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_scores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `addon_id` int(11) unsigned DEFAULT NULL,
  `score` smallint(6) NOT NULL,
  `note_key` smallint(6) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviewer_scores_addon_id_fk` (`addon_id`),
  KEY `reviewer_scores_created_idx` (`created`),
  KEY `reviewer_scores_user_id_idx` (`user_id`),
  CONSTRAINT `reviewer_scores_addon_id_fk` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_scores_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_scores`
--

LOCK TABLES `reviewer_scores` WRITE;
/*!40000 ALTER TABLE `reviewer_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `reply_to` int(11) unsigned DEFAULT NULL,
  `rating` tinyint(3) unsigned DEFAULT NULL,
  `title` int(11) unsigned DEFAULT NULL,
  `body` int(11) unsigned DEFAULT NULL,
  `editorreview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sandbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip_address` varchar(255) NOT NULL DEFAULT '0.0.0.0',
  `addon_id` int(11) unsigned DEFAULT NULL,
  `previous_count` int(11) unsigned DEFAULT '0',
  `is_latest` tinyint(1) DEFAULT '1',
  `client_data_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reply_to` (`reply_to`),
  UNIQUE KEY `one_review_per_user` (`version_id`,`user_id`,`reply_to`),
  KEY `version_id` (`version_id`),
  KEY `reviews_ibfk_2` (`user_id`),
  KEY `reviews_ibfk_3` (`title`),
  KEY `reviews_ibfk_4` (`body`),
  KEY `addon_id` (`addon_id`),
  KEY `latest_reviews` (`reply_to`,`is_latest`,`addon_id`,`created`),
  KEY `client_data_id_refs_id_d160c5ba` (`client_data_id`),
  CONSTRAINT `client_data_id_refs_id_d160c5ba` FOREIGN KEY (`client_data_id`) REFERENCES `client_data` (`id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`title`) REFERENCES `translations` (`id`),
  CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`body`) REFERENCES `translations` (`id`),
  CONSTRAINT `reviews_ibfk_5` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `reviews_reply` FOREIGN KEY (`reply_to`) REFERENCES `reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,15,NULL,5,1156,1157,0,0,0,'2012-02-26 03:31:59','2012-02-26 03:31:59','10.8.74.211',1,0,1,NULL),(2,1,18,NULL,4,1162,1163,0,0,0,'2012-04-19 18:58:27','2012-10-17 15:51:19','10.8.74.212',1,0,1,NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_moderation_flags`
--

DROP TABLE IF EXISTS `reviews_moderation_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_moderation_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT NULL,
  `flag_name` varchar(64) NOT NULL DEFAULT 'review_flag_reason_other',
  `flag_notes` varchar(100) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_review_user` (`review_id`,`user_id`),
  KEY `index_user` (`user_id`),
  KEY `index_review` (`review_id`),
  KEY `index_modified` (`modified`),
  CONSTRAINT `reviews_moderation_flags_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  CONSTRAINT `reviews_moderation_flags_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_moderation_flags`
--

LOCK TABLES `reviews_moderation_flags` WRITE;
/*!40000 ALTER TABLE `reviews_moderation_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_moderation_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (617);
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_addons_collections_counts`
--

DROP TABLE IF EXISTS `stats_addons_collections_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_addons_collections_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(10) unsigned NOT NULL DEFAULT '0',
  `collection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `collection_id` (`collection_id`),
  KEY `count` (`count`),
  KEY `date` (`date`),
  CONSTRAINT `stats_addons_collections_counts_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `stats_addons_collections_counts_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_addons_collections_counts`
--

LOCK TABLES `stats_addons_collections_counts` WRITE;
/*!40000 ALTER TABLE `stats_addons_collections_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_addons_collections_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_collections`
--

DROP TABLE IF EXISTS `stats_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `collectionnamedate` (`collection_id`,`name`,`date`),
  KEY `collection_id` (`collection_id`),
  CONSTRAINT `stats_collections_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_collections`
--

LOCK TABLES `stats_collections` WRITE;
/*!40000 ALTER TABLE `stats_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_collections_counts`
--

DROP TABLE IF EXISTS `stats_collections_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_collections_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `collection_id` (`collection_id`),
  KEY `count` (`count`),
  KEY `date` (`date`),
  CONSTRAINT `stats_collections_counts_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_collections_counts`
--

LOCK TABLES `stats_collections_counts` WRITE;
/*!40000 ALTER TABLE `stats_collections_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_collections_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_collections_share_counts`
--

DROP TABLE IF EXISTS `stats_collections_share_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_collections_share_counts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `service` varchar(128) DEFAULT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id` (`collection_id`,`service`,`date`),
  KEY `date` (`date`),
  CONSTRAINT `stats_collections_share_counts_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_collections_share_counts`
--

LOCK TABLES `stats_collections_share_counts` WRITE;
/*!40000 ALTER TABLE `stats_collections_share_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_collections_share_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_collections_share_counts_totals`
--

DROP TABLE IF EXISTS `stats_collections_share_counts_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_collections_share_counts_totals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `service` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id` (`collection_id`,`service`),
  CONSTRAINT `stats_collections_share_counts_totals_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_collections_share_counts_totals`
--

LOCK TABLES `stats_collections_share_counts_totals` WRITE;
/*!40000 ALTER TABLE `stats_collections_share_counts_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_collections_share_counts_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_contributions`
--

DROP TABLE IF EXISTS `stats_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_contributions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) DEFAULT '0.00',
  `source` varchar(255) DEFAULT '',
  `source_locale` varchar(10) DEFAULT NULL,
  `annoying` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` varchar(255) DEFAULT NULL,
  `is_suggested` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suggested_amount` varchar(255) DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `post_data` text,
  `charity_id` int(11) unsigned DEFAULT NULL,
  `paykey` varchar(255) DEFAULT NULL,
  `type` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `price_tier_id` int(11) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `client_data_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `charity_id` (`charity_id`),
  KEY `user_id_refs` (`user_id`),
  KEY `price_tier_id_refs` (`price_tier_id`),
  KEY `client_data_id_refs_id_c8ef1728` (`client_data_id`),
  CONSTRAINT `client_data_id_refs_id_c8ef1728` FOREIGN KEY (`client_data_id`) REFERENCES `client_data` (`id`),
  CONSTRAINT `price_tier_id_refs` FOREIGN KEY (`price_tier_id`) REFERENCES `prices` (`id`),
  CONSTRAINT `stats_contributions_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `stats_contributions_ibfk_2` FOREIGN KEY (`charity_id`) REFERENCES `charities` (`id`),
  CONSTRAINT `user_id_refs` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_contributions`
--

LOCK TABLES `stats_contributions` WRITE;
/*!40000 ALTER TABLE `stats_contributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_contributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_share_counts`
--

DROP TABLE IF EXISTS `stats_share_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_share_counts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `service` varchar(128) DEFAULT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `one_count_per_addon_service_and_date` (`addon_id`,`service`,`date`),
  KEY `addon_id` (`addon_id`),
  KEY `count` (`count`),
  KEY `date` (`date`),
  KEY `service` (`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_share_counts`
--

LOCK TABLES `stats_share_counts` WRITE;
/*!40000 ALTER TABLE `stats_share_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_share_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_share_counts_totals`
--

DROP TABLE IF EXISTS `stats_share_counts_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_share_counts_totals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(10) unsigned NOT NULL DEFAULT '0',
  `service` varchar(255) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id_2` (`addon_id`,`service`),
  KEY `addon_id` (`addon_id`),
  KEY `count` (`count`),
  CONSTRAINT `stats_share_counts_totals_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_share_counts_totals`
--

LOCK TABLES `stats_share_counts_totals` WRITE;
/*!40000 ALTER TABLE `stats_share_counts_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_share_counts_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_checklist_apps`
--

DROP TABLE IF EXISTS `submission_checklist_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_checklist_apps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL,
  `terms` tinyint(1) NOT NULL,
  `manifest` tinyint(1) NOT NULL,
  `details` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`),
  KEY `created_idx` (`created`),
  KEY `modified_idx` (`modified`),
  CONSTRAINT `addons_id_pk` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_checklist_apps`
--

LOCK TABLES `submission_checklist_apps` WRITE;
/*!40000 ALTER TABLE `submission_checklist_apps` DISABLE KEYS */;
INSERT INTO `submission_checklist_apps` VALUES (1,2,1,1,1,'2013-01-25 12:47:23','2013-01-25 12:47:23'),(2,3,1,1,0,'2013-01-25 13:32:17','2013-01-25 13:32:17');
/*!40000 ALTER TABLE `submission_checklist_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submit_step`
--

DROP TABLE IF EXISTS `submit_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submit_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL,
  `step` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  CONSTRAINT `submit_step_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submit_step`
--

LOCK TABLES `submit_step` WRITE;
/*!40000 ALTER TABLE `submit_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `submit_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synced_addons_collections`
--

DROP TABLE IF EXISTS `synced_addons_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synced_addons_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL,
  `collection_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_id` (`addon_id`,`collection_id`),
  KEY `collection_id` (`collection_id`),
  CONSTRAINT `synced_addons_collections_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `synced_addons_collections_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `synced_collections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synced_addons_collections`
--

LOCK TABLES `synced_addons_collections` WRITE;
/*!40000 ALTER TABLE `synced_addons_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `synced_addons_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synced_collections`
--

DROP TABLE IF EXISTS `synced_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synced_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_index` varchar(40) DEFAULT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_index` (`addon_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synced_collections`
--

LOCK TABLES `synced_collections` WRITE;
/*!40000 ALTER TABLE `synced_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `synced_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_stat`
--

DROP TABLE IF EXISTS `tag_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_stat` (
  `tag_id` int(11) unsigned NOT NULL,
  `num_addons` int(11) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tag_id`),
  KEY `tag_num_addons_idx` (`tag_id`,`num_addons`),
  CONSTRAINT `tag_stat_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_stat`
--

LOCK TABLES `tag_stat` WRITE;
/*!40000 ALTER TABLE `tag_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(128) NOT NULL,
  `blacklisted` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `restricted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_text` (`tag_text`),
  KEY `blacklisted_idx` (`blacklisted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'restartless',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,'jetpack',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_locks`
--

DROP TABLE IF EXISTS `theme_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_locks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) unsigned NOT NULL,
  `reviewer_id` int(11) unsigned NOT NULL,
  `expiry` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_id` (`theme_id`),
  KEY `theme_locks_d0f17e2b` (`reviewer_id`),
  CONSTRAINT `reviewer_id_refs_id_fk` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `theme_id_refs_id_fk` FOREIGN KEY (`theme_id`) REFERENCES `personas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_locks`
--

LOCK TABLES `theme_locks` WRITE;
/*!40000 ALTER TABLE `theme_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `autoid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT '',
  `localized_string` text,
  `localized_string_clean` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`autoid`),
  UNIQUE KEY `id` (`id`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,1,'en-us','This is an example administrative account for AMO.','This is an example administrative account for AMO.','2011-03-01 20:15:00','2011-03-23 12:44:28'),(2,1001,'en-US','Firefox',NULL,'2011-03-06 23:11:19',NULL),(3,1002,'en-US','fx',NULL,'2011-03-06 23:11:19',NULL),(13,1005,'en-US','Changearound',NULL,NULL,NULL),(14,1006,'en-US','Changearounds',NULL,NULL,NULL),(15,1007,'en-US','Changing things around!',NULL,NULL,NULL),(16,2,'en-us','Pirate-y',NULL,'2011-03-06 23:41:26','2011-03-06 23:41:26'),(17,3,'en-us','Arr',NULL,'2011-03-06 23:41:26','2011-03-06 23:41:26'),(18,4,'en-us','Ninja-y',NULL,'2011-03-06 23:41:49','2011-03-06 23:41:49'),(19,5,'en-us','(silence)',NULL,'2011-03-06 23:41:49','2011-03-06 23:41:49'),(20,1010,'en-US','ALL',NULL,NULL,NULL),(21,1011,'en-US','ALL',NULL,NULL,NULL),(22,6,'en-us','Status Watch',NULL,'2011-03-06 23:51:43','2011-03-23 21:39:15'),(23,7,'en-us','Show notifications if any HTTP requests on the page fail.','Show notifications if any HTTP requests on the page fail.','2011-03-06 23:51:43','2011-03-23 21:39:15'),(24,8,'en-us','','','2011-03-06 23:51:53','2011-03-06 23:51:53'),(25,9,'en-us','robot and a muffin.',NULL,'2011-03-06 23:53:19','2011-03-06 23:53:19'),(26,14,'en-us','polish license name',NULL,'2011-03-06 23:53:40','2011-06-02 12:36:20'),(27,15,'en-us','whatevera','whatevera','2011-03-06 23:53:40','2011-06-02 12:36:20'),(28,12,'en-us','','','2011-03-06 23:53:40','2011-03-06 23:53:40'),(29,13,'en-us','','','2011-03-06 23:53:40','2011-03-06 23:53:40'),(30,16,'en-us','00000',NULL,'2011-03-06 23:59:50','2011-03-23 13:00:15'),(31,17,'en-us','a picture of an arrow?',NULL,'2011-03-23 13:00:15','2011-03-23 13:00:15'),(32,19,'en-us','an old arrow?',NULL,'2011-03-23 13:04:21','2011-03-23 13:04:21'),(33,20,'en-us','an old arrow?',NULL,'2011-03-23 13:05:32','2011-03-23 13:05:32'),(34,21,'en-us','an old arrow?',NULL,'2011-03-23 14:08:40','2011-03-23 14:08:40'),(35,22,'en-us','an old arrow?',NULL,'2011-03-23 14:45:49','2011-03-23 14:45:49'),(36,23,'en-us','an old arrow?',NULL,'2011-03-23 14:49:18','2011-03-23 14:49:18'),(37,24,'en-us','an old arrow?',NULL,'2011-03-23 14:56:52','2011-03-23 14:56:52'),(38,25,'en-us','',NULL,'2011-03-23 15:01:57','2011-03-23 15:01:57'),(39,26,'en-us','My Favorite Add-ons',NULL,'2011-03-23 21:09:22','2011-03-23 21:09:22'),(40,27,'en-us','','','2011-03-23 21:38:31','2011-03-23 21:38:31'),(41,28,'en-us','Firefox Features',NULL,'2011-03-29 12:47:08','2012-04-19 18:54:16'),(42,29,'en-us','Full o\' add-ons','Full o\' add-ons','2011-03-29 12:47:08','2012-04-19 18:54:17'),(43,30,'en-us','','','2011-03-29 12:47:08','2011-03-29 12:47:08'),(44,31,'en-us','','','2011-03-29 14:51:47','2011-03-29 14:54:32'),(45,32,'en-US','All Platforms',NULL,NULL,NULL),(46,33,'en-US','allmobile',NULL,NULL,NULL),(47,34,'en-us',NULL,'','2011-03-30 00:37:54','2011-03-30 00:37:54'),(48,35,'en-us',NULL,'','2011-03-30 14:00:28','2011-03-30 14:00:28'),(49,36,'en-us',NULL,'','2011-03-30 18:06:50','2011-03-30 18:06:50'),(50,37,'en-us',NULL,'','2011-03-31 02:21:26','2011-03-31 02:21:26'),(51,38,'en-us',NULL,'','2011-03-31 13:28:04','2011-03-31 13:28:04'),(52,39,'en-us',NULL,'','2011-04-03 09:06:53','2011-04-03 09:06:53'),(277,40,'en-us',NULL,'','2011-04-27 02:40:29','2011-04-27 02:40:29'),(278,41,'en-us',NULL,'','2011-05-14 07:05:08','2011-05-14 07:05:09'),(279,42,'en-us',NULL,'','2011-05-29 09:44:47','2011-05-29 09:44:47'),(280,43,'en-us','','','2011-06-02 12:34:28','2011-06-02 12:34:28'),(281,44,'en-us','','','2011-06-02 12:34:28','2011-06-02 12:34:28'),(282,45,'en-us','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(283,45,'pl','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(284,45,'bg','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(285,45,'da','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(286,46,'en-us','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(287,46,'pl','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(288,46,'bg','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(289,46,'da','','','2011-06-02 12:36:20','2011-06-02 12:36:21'),(290,1135,'en-US','BSD',NULL,NULL,NULL),(291,1136,'en-US','bsd',NULL,NULL,NULL),(292,1137,'en-US','Linux',NULL,NULL,NULL),(293,1138,'en-US','Linux',NULL,NULL,NULL),(294,1139,'en-US','MacOSX',NULL,NULL,NULL),(295,1140,'en-US','macosx',NULL,NULL,NULL),(296,1141,'en-US','Solaris',NULL,NULL,NULL),(297,1142,'en-US','Solaris',NULL,NULL,NULL),(298,1143,'en-US','Windows',NULL,NULL,NULL),(299,1144,'en-US','win',NULL,NULL,NULL),(300,1145,'en-US','Android',NULL,NULL,NULL),(301,1146,'en-US','android',NULL,NULL,NULL),(302,1147,'en-US','Maemo',NULL,NULL,NULL),(303,1148,'en-US','maemo',NULL,NULL,NULL),(304,0,'en-US','Apps','Apps','2011-08-12 14:00:05','2011-08-12 14:00:05'),(305,1151,'en-us',NULL,'','2011-08-26 14:51:06','2011-08-26 14:51:06'),(306,1152,'en-us','```111','```111','2011-09-15 04:41:46','2011-09-15 04:44:48'),(307,1153,'en-us','','','2011-12-30 08:14:21','2011-12-30 08:15:44'),(308,1154,'en-us',NULL,'','2012-02-26 03:27:17','2012-02-26 03:27:17'),(309,1155,'en-us','My Favorite Add-ons',NULL,'2012-02-26 03:30:32','2012-02-26 03:30:32'),(310,1156,'en-us','Test',NULL,'2012-02-26 03:31:59','2012-02-26 03:31:59'),(311,1157,'en-us','It\'s OK to test',NULL,'2012-02-26 03:31:59','2012-02-26 03:31:59'),(315,1161,'en-us','Tier 0',NULL,'2012-04-19 18:43:24','2013-04-26 09:54:03'),(316,1162,'en-us','',NULL,'2012-04-19 18:58:27','2012-04-19 18:58:27'),(317,1163,'en-us','hell yeah',NULL,'2012-04-19 18:58:27','2012-04-19 18:58:27'),(318,1164,'en-us','App-y',NULL,'2012-11-06 08:47:48','2012-11-06 08:49:20'),(319,1165,'en-us','Another App-y',NULL,'2012-11-06 08:49:10','2012-11-06 08:49:10'),(320,1166,'en-US','Test App (grizzlybear2302)',NULL,'2013-01-25 12:47:20','2013-01-25 12:47:23'),(321,1167,'en-US','This app has been automatically generated by testmanifest.com','This app has been automatically generated by <a href=\"https://outgoing.allizom.org/v1/4818602cb1fca6d851bf5cc50f117f01a3696e964d279014202a46d6aa708b6d/http%3A//testmanifest.com\" rel=\"nofollow\">testmanifest.com</a>','2013-01-25 12:47:21','2013-01-25 12:48:49'),(322,1169,'en-us','',NULL,'2013-01-25 12:48:48','2013-01-25 12:48:49'),(323,1170,'en-us','jthomas@mozilla.com',NULL,'2013-01-25 12:48:48','2013-01-25 12:48:49'),(324,1171,'en-us','',NULL,'2013-01-25 12:48:48','2013-01-25 12:48:49'),(325,1172,'en-us','','','2013-01-25 12:48:48','2013-01-25 12:48:49'),(326,1173,'en-us','None','None','2013-01-25 12:48:48','2013-01-25 12:48:49'),(327,1168,'en-us','',NULL,'2013-01-25 12:48:49','2013-01-25 12:48:49'),(328,1174,'en-US','Test App (kinkajou3969)',NULL,'2013-01-25 13:32:16','2013-01-25 13:32:17'),(329,1175,'en-US','This app has been automatically generated by testmanifest.com','This app has been automatically generated by <a href=\"https://outgoing.allizom.org/v1/4818602cb1fca6d851bf5cc50f117f01a3696e964d279014202a46d6aa708b6d/http%3A//testmanifest.com\" rel=\"nofollow\">testmanifest.com</a>','2013-01-25 13:32:16','2013-01-25 13:32:17'),(330,1177,'en-us','Tier 1',NULL,'2013-04-26 09:54:02','2013-04-26 09:54:03'),(331,1178,'en-us','Tier 2',NULL,'2013-04-26 09:54:02','2013-04-26 09:54:03'),(332,1179,'en-us','Tier 3',NULL,'2013-04-26 09:54:02','2013-04-26 09:54:03'),(333,1180,'en-us','Tier 4',NULL,'2013-04-26 09:54:02','2013-04-26 09:54:03'),(334,1181,'en-us','Sports',NULL,'2013-04-29 13:49:47','2013-04-29 13:49:47'),(335,1182,'en-us','Reference',NULL,'2013-04-29 13:49:48','2013-04-29 13:49:48'),(336,1183,'en-us','Maps & Navigation',NULL,'2013-04-29 13:49:48','2013-04-29 13:49:48');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_seq`
--

DROP TABLE IF EXISTS `translations_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_seq` (
  `id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_seq`
--

LOCK TABLES `translations_seq` WRITE;
/*!40000 ALTER TABLE `translations_seq` DISABLE KEYS */;
INSERT INTO `translations_seq` VALUES (1183);
/*!40000 ALTER TABLE `translations_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_counts`
--

DROP TABLE IF EXISTS `update_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_counts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `version` text,
  `status` text,
  `application` text,
  `os` text,
  `locale` text,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `count` (`count`),
  KEY `date` (`date`),
  KEY `addon_and_count` (`addon_id`,`count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_counts`
--

LOCK TABLES `update_counts` WRITE;
/*!40000 ALTER TABLE `update_counts` DISABLE KEYS */;
INSERT INTO `update_counts` VALUES (1,1,4,'','','','','','2011-03-23');
/*!40000 ALTER TABLE `update_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inapp_keys`
--

DROP TABLE IF EXISTS `user_inapp_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_inapp_keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `solitude_seller_id` int(11) unsigned NOT NULL,
  `seller_product_pk` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seller_product_pk` (`seller_product_pk`),
  KEY `user_inapp_keys_613b0f94` (`solitude_seller_id`),
  CONSTRAINT `solitude_seller_id_refs_id_cd630821` FOREIGN KEY (`solitude_seller_id`) REFERENCES `payments_seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inapp_keys`
--

LOCK TABLES `user_inapp_keys` WRITE;
/*!40000 ALTER TABLE `user_inapp_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inapp_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `bio` int(11) unsigned DEFAULT NULL,
  `emailhidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `homepage` varchar(255) DEFAULT NULL,
  `display_collections` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `display_collections_fav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `confirmationcode` varchar(255) NOT NULL DEFAULT '',
  `resetcode` varchar(255) NOT NULL DEFAULT '',
  `resetcode_expires` datetime DEFAULT NULL,
  `notifycompat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notifyevents` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text,
  `location` varchar(255) NOT NULL DEFAULT '',
  `occupation` varchar(255) NOT NULL DEFAULT '',
  `picture_type` varchar(25) NOT NULL DEFAULT '',
  `averagerating` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_login_ip` char(45) NOT NULL DEFAULT '',
  `last_login_attempt` datetime DEFAULT NULL,
  `last_login_attempt_ip` char(45) NOT NULL DEFAULT '',
  `failed_login_attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `read_dev_agreement` datetime DEFAULT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) unsigned DEFAULT '1',
  `lang` varchar(5) DEFAULT NULL,
  `region` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `created` (`created`,`confirmationcode`),
  KEY `notifycompat` (`notifycompat`),
  KEY `notifyevents` (`notifyevents`),
  KEY `bio` (`bio`),
  KEY `user_id_refs_id_eb1f4611` (`user_id`),
  KEY `resetcode_expires` (`resetcode_expires`),
  KEY `users_source` (`source`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`bio`) REFERENCES `translations` (`id`),
  CONSTRAINT `user_id_refs_id_eb1f4611` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nobody@mozilla.org','landfilladmin','Landfill Admin','sha512$3cd0cddefc8711c73b9b7190e13e755bd1c00e9dcbf6d837956fa9dc92dab2e1$5669268c0f604520f13b5b956580bf137914df81f99702b77d462ac24f7b63e60611560ee754ad729674149543d11e54d7596453d9a739c40a0a5a4ca4b062e1',1,0,'https://landfill.addons.allizom.org',0,0,'','','2011-03-23 12:44:28',0,0,0,'2011-03-01 20:15:00','2013-03-13 09:26:07','','','','','',1,'127.0.0.1','2013-03-13 09:26:07','127.0.0.1',0,NULL,0,1,NULL,NULL),(2,'sancus@off.net','Sancus','Sancus','sha512$984c7090e496f5f949690dbaa474fd0d0ee03451e2c5d8aa11bdc716cf1b149f$a5d48ee7901d5e51e19ab7ac1edf08c4de2ad318f9040b18ed8d777854ddac5c5277f90d53a05dd089782790f4f829790f42badc0ef730eb7f1c9f06b5a2793b',31,1,'',0,0,'','','2011-03-29 14:54:32',0,0,0,'2011-03-29 14:51:47','2012-09-08 17:46:15','','','','','',2,'10.8.74.212','2012-09-08 17:46:15','10.8.74.212',0,NULL,0,1,NULL,NULL),(3,'markh@babelzilla.org','Localizer','Localizer','sha512$663eb3b67e4cddeb876ddef90d6a0ff10c3817545fd2fe08ac0b2d59c5ec82e2$a9d4909a961a994d4b9327233856d6cfbb91996809346fb31932a774b4ff0c9cb69839600e4b0c58435420f65026ca483dbc1fd5636421e828ec430d43c7869a',34,0,'',0,0,'','','2011-03-30 00:37:54',0,0,0,'2011-03-30 00:37:54','2011-03-30 09:58:32','','','','','',3,'63.245.217.200','2011-03-30 09:58:32','63.245.217.200',0,NULL,0,1,NULL,NULL),(4,'valastiak@mozilla.sk','wladow','','sha512$e016297464aa5cae513d56a236235cd8da68601577d195a1b94fd387efc8b30c$057774d57a45c96befa65b5fe2bbb0969996a3c899d14418fd9924382c9ebdefe9ee0f6b5411c173af816acfe10e7c263476486361b1d8fc24c4a80e169a05cf',35,0,'',0,0,'','','2011-03-30 14:00:28',0,0,0,'2011-03-30 14:00:28','2011-03-30 14:03:21','','','','','',4,'63.245.217.200','2011-03-30 14:03:21','63.245.217.200',0,NULL,0,1,NULL,NULL),(5,'geoff@darktrojan.net','geoff-lankow','','sha512$0145b0f21f6e047dc568e62f9c3ee5e0fd0bf03784be781fcb02956df3c9c519$6c31e938f996fbfbc91e45b4a25ba77e0377a2494e01689f1934ba21d70525a3380d39ab85a6e1c72a5cca79217f6d3382d5db3f40ae74da7f0c10a58eac430f',36,1,'',0,0,'','','2011-03-30 18:06:50',0,0,0,'2011-03-30 18:06:50','2011-03-30 18:07:27','','','','','',5,'',NULL,'',0,NULL,0,1,NULL,NULL),(6,'dynamis@firehacks.org','dynamis','dynamis','sha512$18cacaa00b1eab3f7edcc886abae11d9626b03ee86381e8578b17a889bfde7f1$48a248dc1608f230ba22690a01165a03ae750487ce96853f4c6d587815befa88f72198f408fc485210ad544a070e86bd9434f6d83d23c270b6f4612657d1546b',37,1,'',0,0,'','','2011-03-31 02:21:26',0,0,0,'2011-03-31 02:21:26','2011-03-31 03:14:48','','','','','',6,'',NULL,'',0,NULL,0,1,NULL,NULL),(7,'jasnapaka@jasnapaka.com','JasnaPaka','pavel','sha512$39fdbb57186dd493d705088483ceb3808610366573da13dcf0fb11171a46e29c$88b7ed90d8065fcc709772a893d679fb43c1fd4d8c5f5c25046408f370bf9c9983446b94b99f24cae9d216e027cd60ce7369a42352b449d6c71e20729bdb8b2a',38,1,'http://www.jasnapaka.com/',0,0,'','','2011-03-31 13:28:04',0,0,0,'2011-03-31 13:28:04','2013-02-24 06:55:48','','','','','',7,'127.0.0.1','2013-02-24 06:55:48','127.0.0.1',0,NULL,0,1,NULL,NULL),(8,'romihardiyanto+test@gmail.com','rodin','rodin','sha512$12cfdd9c76b8f5fe4c10dac59412295dad8a93586bf2e6d7c7b661f8247325d5$430ed3e7e6fbbca4acf80e17f657216dd9f9361694506011a68026eee57ceca51a20643eba6490942cec91d8a6f00973279fb3015deda10f5c986200fd0fda7a',39,0,'http://rodin.ewesewes.web.id/',0,0,'','','2011-04-03 09:06:53',0,0,0,'2011-04-03 09:06:53','2011-04-03 09:07:22','','','','','',8,'63.245.217.200','2011-04-03 09:07:22','63.245.217.200',0,NULL,0,1,NULL,NULL),(9,'witia@aviary.pl','Wowa','Wowa','sha512$8e30f9b395d7ce8f5ef59d44c74fa1d4116a831adc80e81b77006e56caf93582$166cbf37e9f28bc768e80de4bd668c713c7ad96bf6b7cccd637bc8e893a8c909022f2ef9b65d19c4fea00c2ea352e0348a102d001ef4b12c0560377e6cc665a9',40,0,'',0,0,'','','2011-04-27 02:40:29',0,0,0,'2011-04-27 02:40:29','2013-03-29 06:10:35','','','','','',9,'10.8.74.200','2013-03-29 06:10:35','127.0.0.1',1,NULL,0,1,NULL,NULL),(10,'pcvrcek@mozilla.cz','pcvrcek','','sha512$497023eff5c6e7f5e08430361d962e3aea1947936cdc49d1aa7c24343427dc24$f805d7218f6032cc8b2173f6bc08bc6afcc136c50cf722fd9efcec199f52ebd7f397c5be9172edc034a8da5b48b4594d1d8d615c7a61f49c14a96f6dbe49822f',41,1,'',0,0,'','','2011-05-14 07:05:08',0,0,0,'2011-05-14 07:05:09','2012-10-19 16:24:55','','','','','',10,'127.0.0.1','2012-10-19 16:24:55','127.0.0.1',0,NULL,0,1,NULL,NULL),(11,'leszekz@gmail.com','teo','Teo','sha512$df3a9ffaac7dd17e73978924ab591933124fb4aa83141366d0a9f2ddc9097a65$db7f6dff6c7ce963a3b67e2679add47cf09f835771b9e7ef66d68ddb609ae9b657cbf781fd9bd7f132bd85386652baac516097daf6f61653a7b53922ce93549a',42,1,'',0,0,'','','2011-05-29 09:44:47',0,0,0,'2011-05-29 09:44:47','2011-12-04 13:39:42','','','','','',11,'10.8.74.200','2011-12-04 13:39:42','10.8.74.200',0,NULL,0,1,NULL,NULL),(12,'test@example.com','test','test','sha512$8b2d07656e2fcc8eb5d2f835ea5c1744d49031a9e453d466ee6588d3f2019a9f$3f43b52974e6aecc4c9b12bb448933e60058fd98e42a5cc9066bc004fad5be4b278831d6733307d0af2e9112d28d532d290bb24e884a13d28ac0a416c735d64b',1151,1,'',0,0,'ZouCbBUyQE7fKmxdSAnW04MrjvGzc63w29Oqg5FNHtRkDYIe8JilaXs1hLTP','','2011-08-26 14:51:06',0,0,0,'2011-08-26 14:51:06','2011-08-26 14:51:06','','','','','',12,'',NULL,'',0,NULL,0,1,NULL,NULL),(13,'fk293ak@thursday.eml.cc','fk293ak','fk293ak','sha512$d1cb691eebd43883af90bbbbe5e2f411505a0116ec543cb944fd5399b126bd10$d487628d441a83ef820ac9e686d3d63d6a834e1fe11e9973863a7a2a59369cbd159c199587d72f14c1431f4677953ba7b867ce652d6d413d491c31de2cfca2b2',1152,1,'',0,0,'','','2011-09-15 04:44:48',0,0,0,'2011-09-15 04:41:46','2011-09-15 04:44:48','','','','','',13,'',NULL,'',0,NULL,0,1,NULL,NULL),(14,'albinowax@gmail.com','albinowax','','sha512$a5985729a084e0f49082036395c5b7a4925bf4a1c9dd5c1ca2fb2625e715b8a2$b0baa78e4ef71bebb498c32488d13c7665b311b592854217e32dd0b30388a3f2dbbe555af755f707866bfa228fb91375fa4afb6f257f859ee1501de8b48fac8f',1153,1,'',0,0,'','','2011-12-30 08:15:44',0,0,0,'2011-12-30 08:14:21','2011-12-30 08:15:44','','','','','',14,'','2011-12-30 08:15:02','10.8.74.211',1,NULL,0,1,NULL,NULL),(15,'abcd@mailinator.com','abcd','ABCD','sha512$b907962cc649f5559d3437c8d16ece7ea72a89ad5f6697e549a50c50a9858871$b02a366eca182c894e785653e1f7469a69356df8da042c8765c8013513801e5aa8fbe614a3c3d11c748130da565f4e04c1294903244b077ca0e505e15e8a5e82',1154,1,'',0,0,'','','2012-02-26 03:27:17',0,0,0,'2012-02-26 03:27:17','2012-02-26 03:28:09','','','','','',15,'','2012-02-26 03:28:09','10.8.74.211',1,NULL,0,1,NULL,NULL),(16,NULL,'mozilla','','',NULL,1,'',0,0,'','','2012-04-19 18:43:28',1,1,0,'2012-04-19 18:43:28','2012-04-19 18:43:28',NULL,'','','',NULL,NULL,'',NULL,'',0,NULL,0,1,NULL,NULL),(18,'clouserw+one@gmail.com','clouserwone','','',NULL,1,'',0,0,'','','2012-04-19 18:58:06',1,1,0,'2012-04-19 18:58:06','2013-02-25 09:20:56',NULL,'','','',NULL,18,'127.0.0.1','2013-02-25 09:20:56','127.0.0.1',0,NULL,0,1,NULL,NULL),(19,'hiepvannguyen@gmail.com','hiepvannguyen','hiepvannguyen','',NULL,1,'',0,0,'','','2012-04-28 11:16:24',1,1,0,'2012-04-28 11:16:24','2012-04-28 11:16:24',NULL,'','','',NULL,19,'',NULL,'',0,NULL,0,1,NULL,NULL),(20,'fernandopsilveira@yahoo.com.br','fernandopsilveira','fernandopsilveira','',NULL,1,'',0,0,'','','2012-08-14 16:58:25',1,1,0,'2012-08-14 16:58:25','2012-08-14 16:58:26',NULL,'','','',NULL,20,'',NULL,'',0,NULL,0,1,NULL,NULL),(21,'sancus@mozilla.com','sancus2','sancus2','',NULL,1,'',0,0,'','','2012-09-08 17:45:23',1,1,0,'2012-09-08 17:45:23','2012-09-08 17:45:24',NULL,'','','',NULL,21,'10.8.74.212','2012-09-08 17:45:24','10.8.74.212',0,NULL,1,1,NULL,NULL),(22,'jthomas@mozilla.com','jthomas','jthomas','',NULL,1,'',0,0,'','','2012-09-25 14:15:03',1,1,0,'2012-09-25 14:15:03','2013-04-26 09:57:59',NULL,'','','',NULL,22,'127.0.0.1','2013-04-26 09:57:59','127.0.0.1',0,'2013-01-25 12:37:03',1,1,NULL,NULL),(23,'l-hedgehog@126.com','l-hedgehog','l-hedgehog','',NULL,1,'',0,0,'','','2012-10-16 20:02:09',1,1,0,'2012-10-16 20:02:09','2012-10-16 20:02:10',NULL,'','','',NULL,23,'127.0.0.1','2012-10-16 20:02:10','127.0.0.1',0,NULL,1,1,NULL,NULL),(24,'cmcdonald@mozilla.com','cmcdonald','cmcdonald','',NULL,1,'',0,0,'','','2012-10-17 08:42:29',1,1,0,'2012-10-17 08:42:29','2012-10-17 08:42:29',NULL,'','','',NULL,24,'127.0.0.1','2012-10-17 08:42:29','127.0.0.1',0,NULL,1,1,NULL,NULL),(25,'xwraithanx@gmail.com','xwraithanx','xwraithanx','',NULL,1,'',0,0,'','','2012-10-17 08:42:49',1,1,0,'2012-10-17 08:42:49','2012-10-17 08:42:50',NULL,'','','',NULL,25,'127.0.0.1','2012-10-17 08:42:50','127.0.0.1',0,NULL,1,1,NULL,NULL),(26,'charmston@mozilla.com','charmston','charmston','',NULL,1,'',0,0,'','','2013-03-11 20:21:42',1,1,0,'2013-03-11 20:21:42','2013-03-13 09:23:30',NULL,'','','',NULL,26,'127.0.0.1','2013-03-13 09:23:30','127.0.0.1',0,NULL,2,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_blacklistedemaildomain`
--

DROP TABLE IF EXISTS `users_blacklistedemaildomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_blacklistedemaildomain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_blacklistedemaildomain`
--

LOCK TABLES `users_blacklistedemaildomain` WRITE;
/*!40000 ALTER TABLE `users_blacklistedemaildomain` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_blacklistedemaildomain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_blacklistedpassword`
--

DROP TABLE IF EXISTS `users_blacklistedpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_blacklistedpassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_blacklistedpassword`
--

LOCK TABLES `users_blacklistedpassword` WRITE;
/*!40000 ALTER TABLE `users_blacklistedpassword` DISABLE KEYS */;
INSERT INTO `users_blacklistedpassword` VALUES (1,'2011-05-27 00:00:00','2011-05-27 00:00:00','password'),(2,'2011-05-27 00:00:00','2011-05-27 00:00:00','12345678');
/*!40000 ALTER TABLE `users_blacklistedpassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_blacklistedusername`
--

DROP TABLE IF EXISTS `users_blacklistedusername`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_blacklistedusername` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_blacklistedusername`
--

LOCK TABLES `users_blacklistedusername` WRITE;
/*!40000 ALTER TABLE `users_blacklistedusername` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_blacklistedusername` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_history`
--

DROP TABLE IF EXISTS `users_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_history_user_idx` (`user_id`),
  KEY `users_history_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_history`
--

LOCK TABLES `users_history` WRITE;
/*!40000 ALTER TABLE `users_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_install`
--

DROP TABLE IF EXISTS `users_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_install` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `premium_type` int(10) unsigned DEFAULT NULL,
  `client_data_id` int(11) unsigned DEFAULT NULL,
  `install_type` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `users_install_addon_idx` (`addon_id`),
  KEY `users_install_user_idx` (`user_id`),
  KEY `users_install_email` (`uuid`),
  KEY `client_data_id_refs_id_15062d7f` (`client_data_id`),
  KEY `users_install_install_type` (`install_type`),
  CONSTRAINT `addon_id_refs_id` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`),
  CONSTRAINT `client_data_id_refs_id_15062d7f` FOREIGN KEY (`client_data_id`) REFERENCES `client_data` (`id`),
  CONSTRAINT `user_id_refs_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_install`
--

LOCK TABLES `users_install` WRITE;
/*!40000 ALTER TABLE `users_install` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_notifications`
--

DROP TABLE IF EXISTS `users_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `notification_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_notifications`
--

LOCK TABLES `users_notifications` WRITE;
/*!40000 ALTER TABLE `users_notifications` DISABLE KEYS */;
INSERT INTO `users_notifications` VALUES (1,13,2,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(2,13,3,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(3,13,4,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(4,13,5,'2011-09-15 04:44:48','2011-09-15 04:44:48',0),(5,13,6,'2011-09-15 04:44:48','2011-09-15 04:44:48',0),(6,13,7,'2011-09-15 04:44:48','2011-09-15 04:44:48',0),(7,13,8,'2011-09-15 04:44:48','2011-09-15 04:44:48',0),(8,13,9,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(9,13,10,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(10,13,11,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(11,13,12,'2011-09-15 04:44:48','2011-09-15 04:44:48',1),(12,14,2,'2011-12-30 08:15:44','2011-12-30 08:15:44',1),(13,14,3,'2011-12-30 08:15:44','2011-12-30 08:15:44',1),(14,14,4,'2011-12-30 08:15:44','2011-12-30 08:15:44',1),(15,14,5,'2011-12-30 08:15:44','2011-12-30 08:15:44',0),(16,14,6,'2011-12-30 08:15:44','2011-12-30 08:15:44',0),(17,14,7,'2011-12-30 08:15:44','2011-12-30 08:15:44',0),(18,14,8,'2011-12-30 08:15:44','2011-12-30 08:15:44',0),(19,14,9,'2011-12-30 08:15:44','2011-12-30 08:15:44',1),(20,14,10,'2011-12-30 08:15:44','2011-12-30 08:15:44',1),(21,14,11,'2011-12-30 08:15:44','2011-12-30 08:15:44',1),(22,14,12,'2011-12-30 08:15:44','2011-12-30 08:15:44',1);
/*!40000 ALTER TABLE `users_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_preapproval`
--

DROP TABLE IF EXISTS `users_preapproval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_preapproval` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `paypal_key` varchar(255) DEFAULT NULL,
  `paypal_expiry` date DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_preapproval_idx` (`user_id`),
  CONSTRAINT `user_id_refs_id_idx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_preapproval`
--

LOCK TABLES `users_preapproval` WRITE;
/*!40000 ALTER TABLE `users_preapproval` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_preapproval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tags_addons`
--

DROP TABLE IF EXISTS `users_tags_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_tags_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id_2` (`tag_id`,`addon_id`),
  KEY `tag_id` (`tag_id`),
  KEY `addon_id` (`addon_id`),
  CONSTRAINT `users_tags_addons_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_tags_addons_ibfk_3` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tags_addons`
--

LOCK TABLES `users_tags_addons` WRITE;
/*!40000 ALTER TABLE `users_tags_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_tags_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_versioncomments`
--

DROP TABLE IF EXISTS `users_versioncomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_versioncomments` (
  `user_id` int(11) unsigned NOT NULL,
  `comment_id` int(11) unsigned NOT NULL,
  `subscribed` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `users_versioncomments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_versioncomments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `versioncomments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Editor subscriptions to version discussion threads';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_versioncomments`
--

LOCK TABLES `users_versioncomments` WRITE;
/*!40000 ALTER TABLE `users_versioncomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_versioncomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validation_job`
--

DROP TABLE IF EXISTS `validation_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validation_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `application_id` int(11) unsigned NOT NULL,
  `curr_max_version_id` int(11) unsigned NOT NULL,
  `target_version_id` int(11) unsigned NOT NULL,
  `finish_email` varchar(255) DEFAULT NULL,
  `completed` datetime DEFAULT NULL,
  `creator_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `validation_job_398529ef` (`application_id`),
  KEY `validation_job_cc1f3b9a` (`curr_max_version_id`),
  KEY `validation_job_1cf8b594` (`target_version_id`),
  KEY `validation_job_e490d511` (`completed`),
  KEY `creator_id_validation_job_key` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validation_job`
--

LOCK TABLES `validation_job` WRITE;
/*!40000 ALTER TABLE `validation_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `validation_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validation_result`
--

DROP TABLE IF EXISTS `validation_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validation_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `validation_job_id` int(11) unsigned NOT NULL,
  `task_error` longtext,
  `completed` datetime DEFAULT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `errors` int(11) unsigned DEFAULT NULL,
  `warnings` int(11) unsigned DEFAULT NULL,
  `notices` int(11) unsigned DEFAULT NULL,
  `validation` longtext,
  PRIMARY KEY (`id`),
  KEY `validation_result_61162f45` (`validation_job_id`),
  KEY `validation_result_e490d511` (`completed`),
  KEY `validation_result_2243e3be` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validation_result`
--

LOCK TABLES `validation_result` WRITE;
/*!40000 ALTER TABLE `validation_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `validation_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versioncomments`
--

DROP TABLE IF EXISTS `versioncomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versioncomments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `reply_to` int(11) unsigned DEFAULT NULL,
  `subject` varchar(1000) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `version_id` (`version_id`),
  KEY `reply_to` (`reply_to`),
  KEY `created` (`created`),
  KEY `versioncomments_ibfk_2` (`user_id`),
  CONSTRAINT `versioncomments_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`),
  CONSTRAINT `versioncomments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `versioncomments_ibfk_3` FOREIGN KEY (`reply_to`) REFERENCES `versioncomments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Editor comments for version discussion threads';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versioncomments`
--

LOCK TABLES `versioncomments` WRITE;
/*!40000 ALTER TABLE `versioncomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `versioncomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `license_id` int(11) unsigned DEFAULT NULL,
  `version` varchar(255) NOT NULL DEFAULT '',
  `approvalnotes` text,
  `releasenotes` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version_int` bigint(20) DEFAULT NULL,
  `reviewed` datetime DEFAULT NULL,
  `nomination` datetime DEFAULT NULL,
  `has_editor_comment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `has_info_request` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `supported_locales` varchar(255) NOT NULL,
  `_developer_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `addon_id` (`addon_id`),
  KEY `versions_ibfk_2` (`releasenotes`),
  KEY `license_id` (`license_id`),
  KEY `version_int_idx` (`version_int`),
  CONSTRAINT `versions_ibfk_1` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `versions_ibfk_2` FOREIGN KEY (`releasenotes`) REFERENCES `translations` (`id`),
  CONSTRAINT `versions_ibfk_3` FOREIGN KEY (`license_id`) REFERENCES `licenses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,1,'0.2.rev11','',27,'2011-03-06 23:51:43','2011-03-23 21:38:31',20000200100,NULL,'2011-03-06 23:53:44',0,0,0,'',''),(2,2,NULL,'1.0','',NULL,'2013-01-25 12:47:23','2013-01-25 12:47:23',1000000200100,NULL,'2013-01-25 12:47:23',0,0,0,'',''),(3,3,NULL,'1.0','',NULL,'2013-01-25 13:32:16','2013-01-25 13:32:16',1000000200100,NULL,'2013-01-25 13:32:16',0,0,0,'','');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_amo`
--

DROP TABLE IF EXISTS `waffle_flag_amo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_amo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `everyone` tinyint(1) DEFAULT NULL,
  `percent` decimal(3,1) DEFAULT NULL,
  `superusers` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  `rollout` tinyint(1) NOT NULL,
  `note` text NOT NULL,
  `testing` tinyint(1) NOT NULL,
  `languages` longtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_amo`
--

LOCK TABLES `waffle_flag_amo` WRITE;
/*!40000 ALTER TABLE `waffle_flag_amo` DISABLE KEYS */;
INSERT INTO `waffle_flag_amo` VALUES (1,'disco-pane-show-recs',0,NULL,1,0,0,0,'',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(3,'accept-webapps',1,NULL,1,0,0,0,'Allow webapps to be submitted to AMO',0,'','2012-10-17 15:51:18','2012-11-06 09:05:31'),(4,'submit-personas',0,NULL,1,0,0,0,'Allow Personas to be submitted to AMO',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(5,'perf-tests',NULL,NULL,1,0,0,0,'Allow devs to start addon perf tests',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(9,'collect-timings',0,NULL,0,0,0,0,'Collect front end timings',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(10,'solitude-payments',0,NULL,0,0,0,0,'Solitude for payments',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(11,'legacy-payments',1,NULL,0,0,0,0,'Legacy payments systems',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18');
/*!40000 ALTER TABLE `waffle_flag_amo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_amo_groups`
--

DROP TABLE IF EXISTS `waffle_flag_amo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_amo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag_id` (`flag_id`,`group_id`),
  KEY `group_id_refs_id_4ea49f34` (`group_id`),
  CONSTRAINT `flag_id_refs_id_8e6a807d` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag_amo` (`id`),
  CONSTRAINT `group_id_refs_id_4ea49f34` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_amo_groups`
--

LOCK TABLES `waffle_flag_amo_groups` WRITE;
/*!40000 ALTER TABLE `waffle_flag_amo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_amo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_amo_users`
--

DROP TABLE IF EXISTS `waffle_flag_amo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_amo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag_id` (`flag_id`,`user_id`),
  KEY `user_id_refs_id_bae2dfc2` (`user_id`),
  CONSTRAINT `flag_id_refs_id_8fef0c12` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag_amo` (`id`),
  CONSTRAINT `user_id_refs_id_bae2dfc2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_amo_users`
--

LOCK TABLES `waffle_flag_amo_users` WRITE;
/*!40000 ALTER TABLE `waffle_flag_amo_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_amo_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_mkt`
--

DROP TABLE IF EXISTS `waffle_flag_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `everyone` tinyint(1) DEFAULT NULL,
  `percent` decimal(3,1) DEFAULT NULL,
  `superusers` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  `rollout` tinyint(1) NOT NULL,
  `note` text NOT NULL,
  `testing` tinyint(1) NOT NULL,
  `languages` longtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_mkt`
--

LOCK TABLES `waffle_flag_mkt` WRITE;
/*!40000 ALTER TABLE `waffle_flag_mkt` DISABLE KEYS */;
INSERT INTO `waffle_flag_mkt` VALUES (1,'disco-pane-show-recs',0,NULL,1,0,0,0,'',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(3,'accept-webapps',0,NULL,1,0,0,0,'Allow webapps to be submitted to AMO',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(4,'submit-personas',0,NULL,1,0,0,0,'Allow Personas to be submitted to AMO',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(5,'perf-tests',NULL,NULL,1,0,0,0,'Allow devs to start addon perf tests',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(9,'collect-timings',0,NULL,0,0,0,0,'Collect front end timings',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(12,'solitude-payments',0,NULL,0,0,0,0,'Solitude for payments',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(13,'legacy-payments',1,NULL,0,0,0,0,'Legacy payments systems',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(14,'allow-b2g-paid-submission',0,NULL,0,0,0,0,'Enable this to allow paid apps in the submission process.',0,'','2013-06-25 08:49:26','2013-06-25 08:49:26'),(15,'allow-paid-app-search',0,NULL,0,0,0,0,'ON: paid apps show up in search results on desktop and firefoxos but not android; OFF: paid apps show up nowhere',0,'','2013-06-25 08:51:18','2013-06-25 08:51:18');
/*!40000 ALTER TABLE `waffle_flag_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_mkt_groups`
--

DROP TABLE IF EXISTS `waffle_flag_mkt_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_mkt_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag_id` (`flag_id`,`group_id`),
  KEY `group_id_refs_id_4ea49f34` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_mkt_groups`
--

LOCK TABLES `waffle_flag_mkt_groups` WRITE;
/*!40000 ALTER TABLE `waffle_flag_mkt_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_mkt_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_mkt_users`
--

DROP TABLE IF EXISTS `waffle_flag_mkt_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_mkt_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag_id` (`flag_id`,`user_id`),
  KEY `user_id_refs_id_bae2dfc2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_mkt_users`
--

LOCK TABLES `waffle_flag_mkt_users` WRITE;
/*!40000 ALTER TABLE `waffle_flag_mkt_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_mkt_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_sample_amo`
--

DROP TABLE IF EXISTS `waffle_sample_amo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_sample_amo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` decimal(4,1) NOT NULL,
  `note` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample_amo`
--

LOCK TABLES `waffle_sample_amo` WRITE;
/*!40000 ALTER TABLE `waffle_sample_amo` DISABLE KEYS */;
INSERT INTO `waffle_sample_amo` VALUES (1,'disco-pane-store-collections','0.0','','2012-10-17 15:51:18','2012-10-17 15:51:18'),(2,'csp-store-reports','0.0','','2012-10-17 15:51:18','2012-10-17 15:51:18'),(3,'paypal-disabled-limit','10.0','Sanity check limit on paypal cron','2012-10-17 15:51:18','2012-10-17 15:51:18'),(4,'autosuggest-throttle','0.0','Percentage of search autosuggest API requests to ignore','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `waffle_sample_amo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_sample_mkt`
--

DROP TABLE IF EXISTS `waffle_sample_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_sample_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` decimal(4,1) NOT NULL,
  `note` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample_mkt`
--

LOCK TABLES `waffle_sample_mkt` WRITE;
/*!40000 ALTER TABLE `waffle_sample_mkt` DISABLE KEYS */;
INSERT INTO `waffle_sample_mkt` VALUES (1,'disco-pane-store-collections','0.0','','2012-10-17 15:51:18','2012-10-17 15:51:18'),(2,'csp-store-reports','0.0','','2012-10-17 15:51:18','2012-10-17 15:51:18'),(3,'paypal-disabled-limit','10.0','Sanity check limit on paypal cron','2012-10-17 15:51:18','2012-10-17 15:51:18');
/*!40000 ALTER TABLE `waffle_sample_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_switch_amo`
--

DROP TABLE IF EXISTS `waffle_switch_amo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_switch_amo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `note` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch_amo`
--

LOCK TABLES `waffle_switch_amo` WRITE;
/*!40000 ALTER TABLE `waffle_switch_amo` DISABLE KEYS */;
INSERT INTO `waffle_switch_amo` VALUES (3,'marketplace',1,'Controls apps/addon marketplace content.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(4,'browserid-login',0,'Support for BrowserID login.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(10,'site-events',1,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(11,'paypal-disable',0,'Actually disable addons from paypal cron','2012-10-17 15:51:18','2012-10-17 15:51:18'),(13,'in-app-payments',0,'Support in-app payments.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(14,'allow-refund',0,'Allow refund of paypal payments','2012-10-17 15:51:18','2012-10-17 15:51:18'),(15,'soft_delete',1,'Set addons/webapps to STATUS_DELETED instead of removing them','2012-10-17 15:51:18','2012-10-17 15:51:18'),(17,'collection-stats',0,'This enables the collections stats pages.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(18,'video-upload',0,'Allows the developer to upload videos with their addon.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(19,'personas-migration-completed',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(20,'d2c-at-the-disco',0,'If active, this turns on default-to-compatible in the disco pane.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(21,'d2c-buttons',0,'If active, this turns on default-to-compatible for the install buttons.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(22,'video-encode',0,'Encode videos when they get uploaded.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(24,'d2c-api-search',0,'Activate to enable default-to-compatible filtering in API search.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(25,'current_version_crons',1,'Flip this to disable some crons and see if stuff breaks. Bug 750510','2012-10-17 15:51:18','2012-10-17 15:51:18'),(27,'no-redis',1,'','2012-10-17 15:51:18','2012-10-17 15:51:18');
/*!40000 ALTER TABLE `waffle_switch_amo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_switch_mkt`
--

DROP TABLE IF EXISTS `waffle_switch_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_switch_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `note` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch_mkt`
--

LOCK TABLES `waffle_switch_mkt` WRITE;
/*!40000 ALTER TABLE `waffle_switch_mkt` DISABLE KEYS */;
INSERT INTO `waffle_switch_mkt` VALUES (3,'marketplace',1,'Controls apps/addon marketplace content.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(4,'browserid-login',1,'Support for BrowserID login.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(10,'site-events',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(11,'paypal-disable',0,'Actually disable addons from paypal cron','2012-10-17 15:51:18','2012-10-17 15:51:18'),(13,'in-app-payments',1,'Support in-app payments.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(14,'allow-refund',1,'Allow refund of paypal payments','2012-10-17 15:51:18','2012-10-17 15:51:18'),(15,'soft_delete',1,'Set addons/webapps to STATUS_DELETED instead of removing them','2012-10-17 15:51:18','2012-10-17 15:51:18'),(18,'in-app-payments-ui',1,'Support in-app payments UI.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(19,'webapps-unique-by-domain',0,'Allow only one app per domain.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(20,'video-encode',0,'Encode videos when they get uploaded.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(24,'currencies',0,'Currency support','2012-10-17 15:51:18','2012-10-17 15:51:18'),(28,'mkt-themes',1,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(29,'no-redis',0,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(32,'disabled-payments',0,'Enable this to disable payments.','2012-10-17 15:51:18','2012-10-17 15:51:18'),(33,'enabled-paypal',0,'Enable this to enable PayPal payments in Developer Hub (and soon in consumer pages).','2012-10-17 15:51:18','2012-10-17 15:51:18'),(34,'enabled-bluevia',0,'Enable this to enable BlueVia payments in Developer Hub (and soon in consumer pages).','2012-10-17 15:51:18','2012-10-17 15:51:18'),(35,'create-api-tokens',1,'','2012-10-17 15:51:18','2012-10-17 15:51:18'),(37,'view-transactions',0,'Enable transaction pages on Marketplace.','2013-01-25 10:19:45','2013-01-25 10:19:45'),(38,'in-app-sandbox',0,'Enable the in-app payment sandbox','2013-02-11 14:33:18','2013-02-11 14:33:18'),(39,'monolith-stats',0,'','2013-04-26 09:53:58','2013-04-26 09:53:58'),(40,'geoip-geodude',0,'Toggles using the geodude GeoIP server to determine region','2013-04-26 09:54:00','2013-04-26 09:54:00'),(41,'stats-api',0,'Enable the stats API resource','2013-04-26 09:54:03','2013-04-26 09:54:03'),(42,'buchets',0,'Functionality related to bug 858314, \"Defragmenting the Marketplace\"','2013-05-15 14:01:53','2013-05-15 14:01:53'),(43,'search-api-es',0,'Enables the search API to use the new mkt index','2013-05-20 19:46:29','2013-05-20 19:46:29');
/*!40000 ALTER TABLE `waffle_switch_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapps_contentrating`
--

DROP TABLE IF EXISTS `webapps_contentrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webapps_contentrating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `addon_id` int(11) unsigned NOT NULL,
  `ratings_body` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_id_refs_id_4fa22f5e` (`addon_id`),
  CONSTRAINT `addon_id_refs_id_4fa22f5e` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapps_contentrating`
--

LOCK TABLES `webapps_contentrating` WRITE;
/*!40000 ALTER TABLE `webapps_contentrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `webapps_contentrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadmin_featuredapp`
--

DROP TABLE IF EXISTS `zadmin_featuredapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadmin_featuredapp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `is_sponsor` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `zadmin_featuredapp_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadmin_featuredapp`
--

LOCK TABLES `zadmin_featuredapp` WRITE;
/*!40000 ALTER TABLE `zadmin_featuredapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadmin_featuredapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadmin_featuredappcarrier`
--

DROP TABLE IF EXISTS `zadmin_featuredappcarrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadmin_featuredappcarrier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `featured_app_id` int(11) unsigned NOT NULL,
  `carrier` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadmin_featuredappcarrier`
--

LOCK TABLES `zadmin_featuredappcarrier` WRITE;
/*!40000 ALTER TABLE `zadmin_featuredappcarrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadmin_featuredappcarrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadmin_featuredappregion`
--

DROP TABLE IF EXISTS `zadmin_featuredappregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadmin_featuredappregion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `featured_app_id` int(11) unsigned NOT NULL,
  `region` tinyint(2) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadmin_featuredappregion`
--

LOCK TABLES `zadmin_featuredappregion` WRITE;
/*!40000 ALTER TABLE `zadmin_featuredappregion` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadmin_featuredappregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadmin_reindexing`
--

DROP TABLE IF EXISTS `zadmin_reindexing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadmin_reindexing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `old_index` varchar(255) DEFAULT NULL,
  `new_index` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadmin_reindexing`
--

LOCK TABLES `zadmin_reindexing` WRITE;
/*!40000 ALTER TABLE `zadmin_reindexing` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadmin_reindexing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadmin_siteevent`
--

DROP TABLE IF EXISTS `zadmin_siteevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadmin_siteevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `event_type` int(10) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `more_info_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadmin_siteevent`
--

LOCK TABLES `zadmin_siteevent` WRITE;
/*!40000 ALTER TABLE `zadmin_siteevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadmin_siteevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadmin_siteevent_mkt`
--

DROP TABLE IF EXISTS `zadmin_siteevent_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zadmin_siteevent_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `event_type` int(10) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `more_info_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadmin_siteevent_mkt`
--

LOCK TABLES `zadmin_siteevent_mkt` WRITE;
/*!40000 ALTER TABLE `zadmin_siteevent_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadmin_siteevent_mkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-12  1:11:02
