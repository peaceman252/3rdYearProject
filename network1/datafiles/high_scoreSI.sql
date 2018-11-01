-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 27, 2014 at 11:51 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `game_maker`
--

-- --------------------------------------------------------

--
-- Table structure for table `high_score`
--

CREATE TABLE IF NOT EXISTS `high_score` (
  `lb_id` int(11) NOT NULL AUTO_INCREMENT,
  `lb_pname` text COLLATE utf8_unicode_ci NOT NULL,
  `lb_score` int(11) NOT NULL,
  `lb_date` text COLLATE utf8_unicode_ci NOT NULL,
  `lb_time` text COLLATE utf8_unicode_ci NOT NULL,
  `lb_uid` int(11) NOT NULL,
  `lb_gameid` int(25) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lb_id`),
  UNIQUE KEY `lb_uid` (`lb_uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=123 ;

--
-- Dumping data for table `high_score`
--

INSERT INTO `high_score` (`lb_id`, `lb_pname`, `lb_score`, `lb_date`, `lb_time`, `lb_uid`, `lb_gameid`) VALUES
(0, 'Mike', 188, '10/3/2013', '21:18 UTC', 306881,1),
(1, 'Sandy', 288, '10/3/2013', '21:17 UTC', 255881,1),
(2, 'Russel', 200, '10/3/2013', '21:17 UTC', 250601,1),
(3, 'Mark', 350, '10/3/2013', '21:15 UTC', 250623,1),
(4, 'Nocturne', 40, '10/3/2013', '21:18 UTC', 608741,1),
(5, 'FreeGadgets', 10, '10/3/2013', '21:19 UTC', 608745,1),
(6, 'NPT', 18, '10/3/2013', '21:20 UTC', 666666,1),
(7, 'Smarty', 58, '10/3/2013', '21:20 UTC', 985678,1),
(8, 'Fred', 83, '10/3/2013', '21:21 UTC', 123456,1),
(9, 'ugriffin', 101, '10/3/2013', '21:22 UTC', 478256,1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
