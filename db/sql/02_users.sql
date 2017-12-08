-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2017 at 01:59 PM
-- Server version: 5.5.58-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mpower_epicsandbox`
--

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `change_pw_flag`, `clinic_id`, `language`, `last4ssn`, `registered`) VALUES
(9, 'mcjustin', '', 'Justin', 'McReynolds', 'mcjustin@uw.edu', 0, 1, NULL, NULL, '2013-06-04 17:05:28'),
(122, 'ivanc', '', 'Ivan', 'Cvitkovic', 'ivanc@uw.edu', 0, 1, NULL, NULL, '2013-06-04 19:42:58'),
(198, 'lober', '', 'Bill', 'Lober', 'lober@uw.edu', 0, 1, NULL, NULL, NULL),
(518, 'hlevans', '', 'Heather', 'Evans', 'hlevans@uw.edu', 0, 1, NULL, NULL, '2013-11-01 00:00:00'),
(519, 'psanger', '', 'Patrick', 'Sanger', 'psanger@uw.edu', 0, 1, NULL, NULL, '2013-11-01 00:00:00'),
(522, 'andreah', '', 'Andrea', 'Hartzler', 'andreah@uw.edu', 0, 1, NULL, NULL, '2013-11-01 00:00:00'),
(523, 'smhan91', '', 'Sarah', 'Han', 'smhan91@uw.edu', 0, 1, NULL, NULL, '2013-11-01 00:00:00'),
(570, 'pbugni', '', 'Paul', 'Bugni', 'pbugni@uw.du', 0, 1, NULL, NULL, NULL),
(596, 'kthelps', '', 'Kristin', 'Helps', 'kthelps@uw.edu', 0, 1, NULL, NULL, NULL),
(649, 'bdo6', NULL, 'Brian', 'Do', 'bdo6@uw.edu', 0, 1, NULL, NULL, NULL),
(650, 'jbc', NULL, 'Julie', 'Cooper', 'jbc@uw.edu', 0, 1, NULL, NULL, NULL),
(701, 'giffordc', NULL, 'Gifford', 'Cheung', 'giffordc@uw.edu', 0, 1, NULL, NULL, NULL),
(828, 'clone', NULL, 'Amy', 'Chen', 'clone@uw.edu', 0, 1, NULL, NULL, NULL),
(829, 'clundell', NULL, 'Cole', 'Lundell', 'clundell@uw.edu', 0, 1, NULL, NULL, NULL),
(834, 'ahhyun01', NULL, 'Ahhyun', 'Cho', 'ahhyun01@uw.edu', 0, 1, NULL, 1234, '0000-00-00 00:00:00'),
(846, 'korywat', NULL, 'Kory', 'Watson', 'korywat@gmail.com', NULL, NULL, NULL, NULL, NULL),
(982, NULL, NULL, 'Patient', 'Testa', 'justin.emcee+ptesta@gmail.com', NULL, 1, NULL, 1234, NULL),
(1009, NULL, NULL, 'Theodore', 'UWMedONEMC', NULL, NULL, 1, NULL, NULL, NULL),
(1034, NULL, NULL, 'Maureen', 'Claims', NULL, NULL, 1, NULL, NULL, NULL),
(1026, NULL, NULL, 'Theodore', 'UWMedTWOMC', NULL, NULL, 1, NULL, NULL, NULL),
(1036, NULL, NULL, 'Theodore', 'NHTWOMC', NULL, NULL, 1, NULL, NULL, NULL),
(1027, 'pmanko', NULL, 'Piotr', 'Mankowski', 'pmanko@uw.edu', 0, 1, NULL, NULL, NULL),
(1028, NULL, NULL, 'Colin B', 'Cardiothoracic', NULL, NULL, 1, NULL, NULL, NULL),
(1023, NULL, NULL, 'Theodore', 'UWMedTHREEMC', NULL, NULL, 1, NULL, NULL, NULL),
(1032, NULL, NULL, 'Russ A', 'Gensurg', NULL, NULL, 1, NULL, NULL, NULL),
(1029, NULL, NULL, 'SICKKIDS2', 'Hyperspace User', NULL, NULL, 1, NULL, NULL, NULL),
(1024, NULL, NULL, 'UWMED3', 'Hyperspace User', NULL, NULL, 1, NULL, 1009, NULL),
(1025, NULL, NULL, 'Colin C', 'Cardiothoracic', NULL, NULL, 1, NULL, NULL, NULL),
(1030, NULL, NULL, 'epic patient TaHSSGqzhEllU4VPfX9TCBT-17RoxiZR-NXvR5t-61cgB', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(1031, NULL, NULL, 'T81lum-5p6QvDR7l6hv7lfE52bAbA2ylWBnv9CZEzNb0B', 'MyChart User', NULL, NULL, 1, NULL, NULL, NULL),
(1033, NULL, NULL, 'UWMED2', 'Hyperspace User', NULL, NULL, 1, NULL, 1009, NULL),
(1035, NULL, NULL, 'Theodore', 'UWMedONEMC', NULL, NULL, 1, NULL, NULL, NULL),
(1037, NULL, NULL, 'Theodore', 'DHONEMC', NULL, NULL, 1, NULL, NULL, NULL);
