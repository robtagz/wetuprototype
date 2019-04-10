-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2019 at 12:12 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotelprototype2`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotelreserve`
--

CREATE TABLE IF NOT EXISTS `hotelreserve` (
  `hotelid` int(20) NOT NULL AUTO_INCREMENT,
  `hotelname` varchar(20) DEFAULT NULL,
  `activities` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`hotelid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hotelreserve`
--

INSERT INTO `hotelreserve` (`hotelid`, `hotelname`, `activities`) VALUES
(1, 'oryx hotel', 'swimming'),
(2, 'serena hotel', 'nature walks');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
