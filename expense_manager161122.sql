-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2022 at 10:48 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expense_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `balances`
-- (See below for the actual view)
--
CREATE TABLE `balances` (
`id` bigint(21)
,`date` datetime
,`cr_db` varchar(1)
,`new_amount` bigint(12)
,`balances` decimal(33,0)
,`name` varchar(50)
,`description` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `balances_month`
-- (See below for the actual view)
--
CREATE TABLE `balances_month` (
`id` bigint(21)
,`last_date` date
,`cr_db` varchar(1)
,`new_amount` decimal(32,0)
,`balances` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `balances_year`
-- (See below for the actual view)
--
CREATE TABLE `balances_year` (
`id` bigint(21)
,`year` int(4)
,`cr_db` varchar(1)
,`new_amount` decimal(32,0)
,`balances` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `category_expense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `date`, `description`, `amount`, `category_expense`) VALUES
(2, '2022-11-06 12:33:00', 'Sushi Yay', 42000, 4),
(3, '2022-11-06 12:33:26', 'Rinso', 15000, 5),
(4, '2022-10-15 08:55:30', 'Sunlight', 12000, 5),
(5, '2022-10-15 09:02:44', 'Shihlin', 43000, 4),
(6, '2022-07-15 16:05:16', 'Tropicana Slim', 56000, 5),
(7, '2022-07-15 09:06:04', 'Burger Bros', 101000, 4),
(8, '2022-07-19 09:06:46', 'KFC', 56000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`) VALUES
(4, 'Makanan'),
(5, 'Kebutuhan Harian');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `category_income` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `date`, `description`, `amount`, `category_income`) VALUES
(1, '2022-11-23 01:00:00', 'Gaji Bulan November', 3000000, 1),
(2, '2022-11-23 00:00:00', 'Freelance Desain Undangan', 1000000, 2),
(6, '2022-07-08 09:07:52', 'Gaji Bulan July ', 3000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income_categories`
--

INSERT INTO `income_categories` (`id`, `name`) VALUES
(1, 'Gaji Bulanan'),
(2, 'Freelance'),
(3, 'Piutang');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(150) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `enabled`) VALUES
(7, 'user', '$2a$10$jwAowdNZGI/VH8wCB/2GaO20ElbbhWRLleUalSBp9Cr9.U.JgJx1e', 'user', 1);

-- --------------------------------------------------------

--
-- Structure for view `balances`
--
DROP TABLE IF EXISTS `balances`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `balances`  AS SELECT row_number() over ( order by `c`.`date`) AS `id`, `c`.`date` AS `date`, `c`.`cr_db` AS `cr_db`, CASE WHEN `c`.`cr_db` = 'D' THEN `c`.`amount` WHEN `c`.`cr_db` = 'C' THEN -`c`.`amount` END AS `new_amount`, sum(case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end) over ( order by `c`.`date`) AS `balances`, `c`.`name` AS `name`, `c`.`description` AS `description` FROM (select `a`.`date` AS `date`,'C' AS `cr_db`,`a`.`amount` AS `amount`,`b`.`name` AS `name`,`a`.`description` AS `description` from (`expense` `a` join `expense_categories` `b` on(`a`.`category_expense` = `b`.`id`)) union all select `a`.`date` AS `date`,'D' AS `cr_db`,`a`.`amount` AS `amount`,`b`.`name` AS `name`,`a`.`description` AS `description` from (`income` `a` join `income_categories` `b` on(`a`.`category_income` = `b`.`id`))) AS `c` ORDER BY `c`.`date` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `balances_month`
--
DROP TABLE IF EXISTS `balances_month`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `balances_month`  AS SELECT row_number() over ( order by `c`.`last_date`,`c`.`cr_db` desc) AS `id`, `c`.`last_date` AS `last_date`, `c`.`cr_db` AS `cr_db`, CASE WHEN `c`.`cr_db` = 'D' THEN `c`.`amount` WHEN `c`.`cr_db` = 'C' THEN -`c`.`amount` END AS `new_amount`, sum(case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end) over ( order by `c`.`last_date`,`c`.`cr_db` desc) AS `balances` FROM (select last_day(`a`.`date`) AS `last_date`,'C' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`expense` `a` join `expense_categories` `b` on(`a`.`category_expense` = `b`.`id`)) group by last_day(`a`.`date`),'C' union all select last_day(`a`.`date`) AS `last_date`,'D' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`income` `a` join `income_categories` `b` on(`a`.`category_income` = `b`.`id`)) group by last_day(`a`.`date`),'D') AS `c` ORDER BY row_number() over ( order by `c`.`last_date`,`c`.`cr_db` desc) ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `balances_year`
--
DROP TABLE IF EXISTS `balances_year`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `balances_year`  AS SELECT row_number() over ( order by `c`.`year`,`c`.`cr_db` desc) AS `id`, `c`.`year` AS `year`, `c`.`cr_db` AS `cr_db`, CASE WHEN `c`.`cr_db` = 'D' THEN `c`.`amount` WHEN `c`.`cr_db` = 'C' THEN -`c`.`amount` END AS `new_amount`, sum(case when `c`.`cr_db` = 'D' then `c`.`amount` when `c`.`cr_db` = 'C' then -`c`.`amount` end) over ( order by `c`.`year`,`c`.`cr_db` desc) AS `balances` FROM (select year(`a`.`date`) AS `year`,'C' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`expense` `a` join `expense_categories` `b` on(`a`.`category_expense` = `b`.`id`)) group by year(`a`.`date`),'C' union all select year(`a`.`date`) AS `year`,'D' AS `cr_db`,sum(`a`.`amount`) AS `amount` from (`income` `a` join `income_categories` `b` on(`a`.`category_income` = `b`.`id`)) group by year(`a`.`date`),'D') AS `c` ORDER BY row_number() over ( order by `c`.`year`,`c`.`cr_db` desc) ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_expense_categories_id_fk` (`category_expense`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_income_categories_id_fk` (`category_income`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_expense_categories_id_fk` FOREIGN KEY (`category_expense`) REFERENCES `expense_categories` (`id`);

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_income_categories_id_fk` FOREIGN KEY (`category_income`) REFERENCES `income_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
