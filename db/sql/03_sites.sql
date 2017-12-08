-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2017 at 02:02 PM
-- Server version: 5.5.58-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mpower_epicsandbox`
--

--
-- Truncate table before insert `sites`
--

TRUNCATE TABLE `sites`;
--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `name`, `friendly_name`, `timezone`, `research_staff_email_alias`, `research_staff_signature`, `new_aim_consent_mod_date`) VALUES
(2, 'DF/HCC', NULL, 'America/New_York', 'Barbara_Halpenny@DFCI.HARVARD.EDU', 'Barbara Halpenny, Project Director, The Phyllis F. Cantor Center; Research in Nursing and Patient Care Services', NULL),
(3, 'BID', 'Beth Israel Deaconess Medical Center', 'America/New_York', NULL, NULL, NULL),
(4, 'UVA', 'University of Virginia Health System', 'America/New_York', NULL, NULL, NULL),
(5, 'EH', 'Emory Healthcare', 'America/New_York', NULL, NULL, NULL),
(6, 'KPSC', 'Kaiser Permanente Southern California', 'America/Los_Angeles', NULL, NULL, NULL),
(7, 'HHS', 'Harris Health System', 'America/Los_Angeles', NULL, NULL, NULL),
(1, 'University of Washington', 'University of Washington', 'America/Los_Angeles', NULL, NULL, NULL);
