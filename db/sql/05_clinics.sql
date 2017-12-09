-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2017 at 02:01 PM
-- Server version: 5.5.58-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mpower_epicsandbox`
--

--
-- Truncate table before insert `clinics`
--

TRUNCATE TABLE `clinics`;
--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`id`, `site_id`, `name`, `friendly_name`, `support_name`, `state`, `irb_contact`, `support_email`, `support_phone`, `patient_status_email`, `one_usual_care_session`) VALUES
(1, 1, 'mpower', 'mPOWEr', 'mPOWEr Team', NULL, 'IRB', 'mpowerit@uw.edu', '(206) 598-1217', NULL, 0);
