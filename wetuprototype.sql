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
-- Database: `wetuprototype`
--

-- --------------------------------------------------------

--
-- Table structure for table `itinaccom`
--

CREATE TABLE IF NOT EXISTS `itinaccom` (
  `itinaccomid` int(20) NOT NULL AUTO_INCREMENT,
  `hotelname` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `basis` varchar(20) DEFAULT NULL,
  `bev` varchar(20) DEFAULT NULL,
  `deslayout` varchar(20) DEFAULT NULL,
  `nights` varchar(20) DEFAULT NULL,
  `itinsessid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`itinaccomid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `itinaccom`
--

INSERT INTO `itinaccom` (`itinaccomid`, `hotelname`, `location`, `basis`, `bev`, `deslayout`, `nights`, `itinsessid`) VALUES
(1, 'oryx hotel', 'nairobi', 'BedBreakfast', 'drink', 'day by day', '4', 'al1554888697309');

-- --------------------------------------------------------

--
-- Table structure for table `itinactivity`
--

CREATE TABLE IF NOT EXISTS `itinactivity` (
  `itinactivityid` int(20) NOT NULL AUTO_INCREMENT,
  `activityaccom` varchar(20) DEFAULT NULL,
  `activity` varchar(20) DEFAULT NULL,
  `activitydate` int(20) DEFAULT NULL,
  `activitymonth` int(20) DEFAULT NULL,
  `activityyear` int(20) DEFAULT NULL,
  `itinsessid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`itinactivityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `itinerary`
--

CREATE TABLE IF NOT EXISTS `itinerary` (
  `itinid` int(20) NOT NULL AUTO_INCREMENT,
  `itinname` varchar(20) DEFAULT NULL,
  `branding` varchar(20) DEFAULT NULL,
  `itintype` varchar(20) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `itinsessid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`itinid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `itinerary`
--

INSERT INTO `itinerary` (`itinid`, `itinname`, `branding`, `itintype`, `language`, `itinsessid`) VALUES
(1, 'east africa', 'Afrolink Adventures', 'Fully Guided', 'English', 'al1553682840167'),
(2, 'east africa', 'Afrolink Adventures', 'Fully Guided', 'English', 'al1553682840167'),
(3, 'east africa', 'Afrolink Adventures', 'Fully Guided', 'German', 'al1554888697309');

-- --------------------------------------------------------

--
-- Table structure for table `itinrouteplanner`
--

CREATE TABLE IF NOT EXISTS `itinrouteplanner` (
  `itinrouteplannerid` int(11) NOT NULL AUTO_INCREMENT,
  `plannerstart` varchar(20) DEFAULT NULL,
  `plannermode` varchar(20) DEFAULT NULL,
  `plannermodetype` varchar(20) DEFAULT NULL,
  `plannermodetheme` varchar(20) DEFAULT NULL,
  `plannerdate` int(20) DEFAULT NULL,
  `plannermonth` varchar(20) DEFAULT NULL,
  `planneryear` int(20) DEFAULT NULL,
  `plannerhour` int(20) DEFAULT NULL,
  `plannerminute` int(20) DEFAULT NULL,
  `plannerampm` varchar(20) DEFAULT NULL,
  `plannerend` varchar(20) DEFAULT NULL,
  `itinsessid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`itinrouteplannerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `itinrouteplanner`
--

INSERT INTO `itinrouteplanner` (`itinrouteplannerid`, `plannerstart`, `plannermode`, `plannermodetype`, `plannermodetheme`, `plannerdate`, `plannermonth`, `planneryear`, `plannerhour`, `plannerminute`, `plannerampm`, `plannerend`, `itinsessid`) VALUES
(1, NULL, NULL, '', '', 12, 'February', 2019, 7, 30, 'pm', NULL, 'al1553682840167'),
(2, NULL, NULL, '', '', 5, 'May', 2019, 4, 30, 'am', NULL, 'al1554888697309');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
