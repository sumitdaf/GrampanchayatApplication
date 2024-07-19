-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema panchayatauto
--

CREATE DATABASE IF NOT EXISTS panchayatauto;
USE panchayatauto;

--
-- Definition of table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
CREATE TABLE `complaints` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `complaint` longblob NOT NULL,
  `compic` longblob NOT NULL,
  `time` varchar(45) NOT NULL,
  `uid` varchar(45) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `uwardno` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;


--
-- Definition of table `electricity_con`
--

DROP TABLE IF EXISTS `electricity_con`;
CREATE TABLE `electricity_con` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `idproof` longblob NOT NULL,
  `etype` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `statuss` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `billstatus` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `uid` varchar(45) NOT NULL,
  `uwardno` varchar(45) NOT NULL,
  `elcuniqueid` varchar(45) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electricity_con`
--

/*!40000 ALTER TABLE `electricity_con` DISABLE KEYS */;
/*!40000 ALTER TABLE `electricity_con` ENABLE KEYS */;


--
-- Definition of table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `expenses_spent` varchar(45) default '0',
  `expenses_balance` varchar(45) default '0',
  `expenses_recived` varchar(45) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenses`
--

/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` (`id`,`expenses_spent`,`expenses_balance`,`expenses_recived`) VALUES 
 (1,'0','0','0');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;


--
-- Definition of table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `date` varchar(45) NOT NULL,
  `stime` varchar(45) NOT NULL,
  `etime` varchar(45) NOT NULL,
  `mtype` varchar(45) NOT NULL,
  `areaname` longtext NOT NULL,
  `notmsg` longtext NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;


--
-- Definition of table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wardno` varchar(45) NOT NULL,
  `spentfor` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `mailid` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `voterid` varchar(45) NOT NULL,
  `adhar` varchar(45) NOT NULL,
  `wardno` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `statuss` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `ward_details`
--

DROP TABLE IF EXISTS `ward_details`;
CREATE TABLE `ward_details` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wardno` varchar(45) NOT NULL,
  `areaname` varchar(45) NOT NULL,
  `landmark` varchar(45) NOT NULL,
  `nofamilies` varchar(45) NOT NULL,
  `novoters` varchar(45) NOT NULL,
  `cname` varchar(45) NOT NULL,
  `cnumber` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `expenseall` varchar(45) default '500000',
  `exp_spent` varchar(45) default '0',
  `exp_bal` varchar(45) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ward_details`
--

/*!40000 ALTER TABLE `ward_details` DISABLE KEYS */;
INSERT INTO `ward_details` (`id`,`wardno`,`areaname`,`landmark`,`nofamilies`,`novoters`,`cname`,`cnumber`,`time`,`expenseall`,`exp_spent`,`exp_bal`) VALUES 
 (1,'1','Nehru Nagar','Near SP office','800','1100','Jayaprakash','9994745727','2022/05/10 14:17:29','500000','0','0');
/*!40000 ALTER TABLE `ward_details` ENABLE KEYS */;


--
-- Definition of table `water_con`
--

DROP TABLE IF EXISTS `water_con`;
CREATE TABLE `water_con` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `idproof` longblob NOT NULL,
  `address` varchar(45) NOT NULL,
  `statuss` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `billstatus` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `uid` varchar(45) NOT NULL,
  `uwardno` varchar(45) NOT NULL,
  `watuniqueid` varchar(45) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `water_con`
--

/*!40000 ALTER TABLE `water_con` DISABLE KEYS */;
/*!40000 ALTER TABLE `water_con` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
