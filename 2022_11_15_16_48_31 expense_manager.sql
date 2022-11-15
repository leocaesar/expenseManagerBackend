-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: expense_manager
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `balances`
--

DROP TABLE IF EXISTS `balances`;
/*!50001 DROP VIEW IF EXISTS `balances`*/;
SET
@saved_cs_client     = @@character_set_client;
SET
character_set_client = utf8;
/*!50001 CREATE TABLE `balances` (
  `id` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `cr_db` tinyint NOT NULL,
  `new_amount` tinyint NOT NULL,
  `balances` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET
character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `balances_month`
--

DROP TABLE IF EXISTS `balances_month`;
/*!50001 DROP VIEW IF EXISTS `balances_month`*/;
SET
@saved_cs_client     = @@character_set_client;
SET
character_set_client = utf8;
/*!50001 CREATE TABLE `balances_month` (
  `id` tinyint NOT NULL,
  `last_date` tinyint NOT NULL,
  `cr_db` tinyint NOT NULL,
  `new_amount` tinyint NOT NULL,
  `balances` tinyint NOT NULL
) ENGINE=MyISAM */;
SET
character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `balances_year`
--

DROP TABLE IF EXISTS `balances_year`;
/*!50001 DROP VIEW IF EXISTS `balances_year`*/;
SET
@saved_cs_client     = @@character_set_client;
SET
character_set_client = utf8;
/*!50001 CREATE TABLE `balances_year` (
  `id` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `cr_db` tinyint NOT NULL,
  `new_amount` tinyint NOT NULL,
  `balances` tinyint NOT NULL
) ENGINE=MyISAM */;
SET
character_set_client = @saved_cs_client;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT,
    `date`             datetime     NOT NULL,
    `description`      varchar(100) NOT NULL,
    `amount`           int(11) NOT NULL,
    `category_expense` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY                `expense_expense_categories_id_fk` (`category_expense`),
    CONSTRAINT `expense_expense_categories_id_fk` FOREIGN KEY (`category_expense`) REFERENCES `expense_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK
TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense`
VALUES (2, '2022-11-06 12:33:00', 'Sushi Yay', 42000, 4),
       (3, '2022-11-06 12:33:26', 'Rinso', 15000, 5),
       (4, '2022-10-15 08:55:30', 'Sunlight', 12000, 5),
       (5, '2022-10-15 09:02:44', 'Shihlin', 43000, 4),
       (6, '2022-07-15 16:05:16', 'Tropicana Slim', 56000, 5),
       (7, '2022-07-15 09:06:04', 'Burger Bros', 101000, 4),
       (8, '2022-07-19 09:06:46', 'KFC', 56000, 4);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_categories`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK
TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
INSERT INTO `expense_categories`
VALUES (4, 'Makanan'),
       (5, 'Kebutuhan Harian');
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `date`            datetime     NOT NULL,
    `description`     varchar(100) NOT NULL,
    `amount`          int(11) NOT NULL,
    `category_income` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY               `income_income_categories_id_fk` (`category_income`),
    CONSTRAINT `income_income_categories_id_fk` FOREIGN KEY (`category_income`) REFERENCES `income_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK
TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income`
VALUES (1, '2022-11-23 01:00:00', 'Gaji Bulan November', 3000000, 1),
       (2, '2022-11-23 00:00:00', 'Freelance Desain Undangan', 1000000, 2),
       (6, '2022-07-08 09:07:52', 'Gaji Bulan July ', 3000000, 1);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `income_categories`
--

DROP TABLE IF EXISTS `income_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_categories`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_categories`
--

LOCK
TABLES `income_categories` WRITE;
/*!40000 ALTER TABLE `income_categories` DISABLE KEYS */;
INSERT INTO `income_categories`
VALUES (1, 'Gaji Bulanan'),
       (2, 'Freelance'),
       (3, 'Piutang');
/*!40000 ALTER TABLE `income_categories` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users`
(
    `user_id`  int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(150) NOT NULL,
    `password` varchar(255) NOT NULL,
    `role`     varchar(150) NOT NULL,
    `enabled`  tinyint(1) NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK
TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users`
VALUES (1, 'guest', '$2a$12$PHIMqTgdcTffCzq.tZnxwewEcu3X9WqsKY8WfhddTTAf/jNZjXOF6', 'guest', 1),
       (2, 'admin', '$2a$12$TRcfHiqzlHPd9.VC1AZ7S.V4HTT5gXX4bNO1f7roCKZMZ0C4aAE12', 'admin', 1),
       (3, 'operator', '$2a$12$m3HYgz1E8B7g2Ih37dwwzuNCO6XyGahJCv4RDKWUGb7z8ORJf8kTS', 'operator', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Final view structure for view `balances`
--

/*!50001 DROP TABLE IF EXISTS `balances`*/;
/*!50001 DROP VIEW IF EXISTS `balances`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `balances` AS select row_number() over ( order by `c`.`date`) AS `id`,`c`.`date` AS `date`,`c`.`cr_db` AS `cr_db`,case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end AS `new_amount`,sum(case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end) over ( order by `c`.`date`) AS `balances`,`c`.`name` AS `name`,`c`.`description` AS `description` from (select `a`.`date` AS `date`,'C' AS `cr_db`,`a`.`amount` AS `amount`,`b`.`name` AS `name`,`a`.`description` AS `description` from (`expense` `a` join `expense_categories` `b` on(`a`.`category_expense` = `b`.`id`)) union all select `a`.`date` AS `date`,'D' AS `cr_db`,`a`.`amount` AS `amount`,`b`.`name` AS `name`,`a`.`description` AS `description` from (`income` `a` join `income_categories` `b` on(`a`.`category_income` = `b`.`id`))) `c` order by `c`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `balances_month`
--

/*!50001 DROP TABLE IF EXISTS `balances_month`*/;
/*!50001 DROP VIEW IF EXISTS `balances_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `balances_month` AS select row_number() over ( order by `c`.`last_date`,`c`.`cr_db` desc) AS `id`,`c`.`last_date` AS `last_date`,`c`.`cr_db` AS `cr_db`,case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end AS `new_amount`,sum(case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end) over ( order by `c`.`last_date`,`c`.`cr_db` desc) AS `balances` from (select last_day(`a`.`date`) AS `last_date`,'C' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`expense` `a` join `expense_categories` `b` on(`a`.`category_expense` = `b`.`id`)) group by last_day(`a`.`date`),'C' union all select last_day(`a`.`date`) AS `last_date`,'D' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`income` `a` join `income_categories` `b` on(`a`.`category_income` = `b`.`id`)) group by last_day(`a`.`date`),'D') `c` order by row_number() over ( order by `c`.`last_date`,`c`.`cr_db` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `balances_year`
--

/*!50001 DROP TABLE IF EXISTS `balances_year`*/;
/*!50001 DROP VIEW IF EXISTS `balances_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `balances_year` AS select row_number() over ( order by `c`.`year`,`c`.`cr_db` desc) AS `id`,`c`.`year` AS `year`,`c`.`cr_db` AS `cr_db`,case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end AS `new_amount`,sum(case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end) over ( order by `c`.`year`,`c`.`cr_db` desc) AS `balances` from (select year(`a`.`date`) AS `year`,'C' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`expense` `a` join `expense_categories` `b` on(`a`.`category_expense` = `b`.`id`)) group by year(`a`.`date`),'C' union all select year(`a`.`date`) AS `year`,'D' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`income` `a` join `income_categories` `b` on(`a`.`category_income` = `b`.`id`)) group by year(`a`.`date`),'D') `c` order by row_number() over ( order by `c`.`year`,`c`.`cr_db` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 16:48:32
