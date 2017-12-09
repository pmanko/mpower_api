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
-- Truncate table before insert `patients`
--

TRUNCATE TABLE `patients`;
--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `MRN`, `test_flag`, `phone1`, `phone2`, `mailing_address`, `study_participation_flag`, `user_type`, `consent_status`, `consent_date`, `consenter_id`, `consent_checked`, `hipaa_consent_checked`, `clinical_service`, `treatment_start_date`, `birthdate`, `gender`, `ethnicity`, `eligible_flag`, `study_group`, `secret_phrase`, `check_again_date`, `no_more_check_agains`, `alt_contact_name`, `alt_contact_relation`, `alt_contact_phone`, `alt_contact_email`, `t2a_subscale_id`, `t2b_subscale_id`, `off_study_status`, `off_study_reason`, `off_study_timestamp`, `declined_reason`, `72_hr_follow_up`, `farthestStepInIntervention`) VALUES
(982, 'ptesta', 0, '', NULL, NULL, 0, NULL, 'consented', NULL, NULL, 0, 0, NULL, NULL, '1976-07-04', 'female', '', NULL, 'Treatment', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'On study', NULL, NULL, NULL, 0, NULL),
(1009, '204061', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1948-07-08', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1023, '204066', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1948-07-08', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1026, '204063', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1948-07-08', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1028, '203041', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1940-08-27', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1025, '203042', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1940-07-30', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1030, '', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1031, '', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1032, '202896', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1952-05-19', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1034, '202584', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1940-11-07', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1035, '204061', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1948-07-08', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1036, '203942', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1948-07-08', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1037, '204056', 0, NULL, NULL, NULL, 0, NULL, 'usual care', NULL, NULL, 0, 0, 'MedOnc', NULL, '1948-07-08', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
